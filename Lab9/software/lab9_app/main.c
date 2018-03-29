/************************************************************************
Lab 9 Nios Software

Dong Kai Wang, Fall 2017
Christine Chen, Fall 2013

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "aes.h"

// Pointer to base address of AES module, make sure it matches Qsys
volatile unsigned int * AES_PTR = (unsigned int *) 0x00000040;

// Execution mode: 0 for testing, 1 for benchmarking
int run_mode = 0;

const int Nr = 10;
const int Nb = 4;
const int Nk = 4;

/** charToHex
 *  Convert a single character to the 4-bit value it represents.
 *  
 *  Input: a character c (e.g. 'A')
 *  Output: converted 4-bit value (e.g. 0xA)
 */
char charToHex(char c)
{
	char hex = c;

	if (hex >= '0' && hex <= '9')
		hex -= '0';
	else if (hex >= 'A' && hex <= 'F')
	{
		hex -= 'A';
		hex += 10;
	}
	else if (hex >= 'a' && hex <= 'f')
	{
		hex -= 'a';
		hex += 10;
	}
	return hex;
}

/** charsToHex
 *  Convert two characters to byte value it represents.
 *  Inputs must be 0-9, A-F, or a-f.
 *  
 *  Input: two characters c1 and c2 (e.g. 'A' and '7')
 *  Output: converted byte value (e.g. 0xA7)
 */
char charsToHex(char c1, char c2)
{
	char hex1 = charToHex(c1);
	char hex2 = charToHex(c2);
	return (hex1 << 4) + hex2;
}

/** AddRoundKey
 *
 */
void AddRoundKey(unsigned char * state, unsigned char * key_schedule) {
	int i;
	for (i = 0; i < 16; i++) {
		state[i] = state[i] ^ key_schedule[i];
	}
}

/** SubBytes
 *
 */
void SubBytes(unsigned char* state){
	int i;
	for (i = 0; i < 16; i++) {
		state[i] = aes_sbox[(uint)state[i]];
	}
}

/** ShiftRows
 *
 */
void ShiftRows(uchar* state){
	unsigned char temp[2];

	temp[0] = state[1];
	state[1] = state[5];
	state[5] = state[9];
	state[9] = state[13];
	state[13] = temp[0];

	temp[0] = state[2];
	temp[1] = state[6];
	state[2] = state[10];
	state[6] = state[14];
	state[10] = temp[0];
	state[14] = temp[1];

	temp[0] = state[15];
	state[15] = state[11];
	state[11] = state[7];
	state[7] = state[3];
	state[3] = temp[0];
}

/** MixColumns
 *
 */
void MixColumns(uchar* state){
	uchar temp[16];
	int i;
	for(i = 0; i < 16; i++){
		temp[i] = state[i];
	}
	for(i = 0; i < 4; i++){
		state[4*i] = gf_mul[temp[i*4]][0] ^ gf_mul[temp[i*4+1]][1] ^ temp[i*4+2] ^ temp[i*4+3];
		state[4*i+1] = temp[i*4] ^ gf_mul[temp[i*4+1]][0] ^ gf_mul[temp[i*4+2]][1] ^ temp[i*4+3];
		state[4*i+2] = temp[i*4] ^ temp[i*4+1] ^ gf_mul[temp[i*4+2]][0] ^ gf_mul[temp[i*4+3]][1];
		state[4*i+3] = gf_mul[temp[i*4]][1] ^ temp[i*4+1] ^ temp[i*4+2] ^ gf_mul[temp[i*4+3]][0];
	}
}

/** KeyExpansion
 *
 */
void KeyExpansion(unsigned char* key, unsigned char* key_schedule) {
	unsigned char temp[4];
	int i,j,k;
	for (i = 0; i < 4; i++) {
		for (j = 0; j < 4; j++){
			key_schedule[4*i+j] = key[4*i+3-j];
		}
	}
	for (i = 4; i < 44; i++){
		for (j = 0; j < 4; j++){
			temp[j] = key_schedule[4*(i-1)+j];
		}
		if(i % Nk == 0){
			//Rotate Word
			uchar temp2 = temp[0];
			temp[0] = temp[1];
			temp[1] = temp[2];
			temp[2] = temp[3];
			temp[3] = temp2;
			//Sub Word
			for(k = 0; k < 4; k++){
				temp[k] = aes_sbox[(uint)temp[k]];
			}

			temp[0] = temp[0] ^ (Rcon[i/Nk] >> 24);
		}
		for(k = 0; k < 4; k++) {
			key_schedule[4*i+k] = temp[k] ^ key_schedule[4*(i-4)+k];
		}
	}

}

/** encrypt
 *  Perform AES encryption in software.
 *
 *  Input: msg_ascii - Pointer to 32x 8-bit char array that contains the input message in ASCII format
 *         key_ascii - Pointer to 32x 8-bit char array that contains the input key in ASCII format
 *  Output:  msg_enc - Pointer to 4x 32-bit int array that contains the encrypted message
 *               key - Pointer to 4x 32-bit int array that contains the input key
 */
void encrypt(unsigned char * msg_ascii, unsigned char * key_ascii, unsigned int * msg_enc, unsigned int * key)
{
	uchar state[16];
	uchar key_schedule[176];
	int i;
	for (i = 0; i < 16; i++){
		state[i] = (uchar)charsToHex((char)msg_ascii[2*i],(char)msg_ascii[(2*i)+1]);
	}

	for (i = 0; i < 4; i++){
		key[i] = (((uint)charsToHex((char)key_ascii[8*i],(char)key_ascii[8*i+1]) << 24) + (charsToHex((char)key_ascii[8*i+2],(char)key_ascii[8*i+3]) << 16) +
				 (charsToHex((char)key_ascii[8*i+4],(char)key_ascii[8*i+5]) << 8) + (charsToHex((char)key_ascii[8*i+6],(char)key_ascii[8*i+7])));
		printf("key: %08x\n", key[i]);
	}

	//printf("before Key Expansion\n");
	KeyExpansion((uchar*)key, key_schedule);
	//printf("before AddRoundKey\n");
	AddRoundKey(state, key_schedule);

	for (i = 0; i < 9; i++) {
		SubBytes(state);
		ShiftRows(state);
		MixColumns(state);
		AddRoundKey(state, key_schedule+16*(i+1));
	}

	SubBytes(state);
	ShiftRows(state);
	AddRoundKey(state, key_schedule+160);

	for (i = 0; i < 4; i++) {
		msg_enc[i] = state[4*i] << 24^state[4*i + 1] << 16^state[4*i + 2] << 8^state[4*i+3];
	}
}

/** decrypt
 *  Perform AES decryption in hardware.
 *
 *  Input:  msg_enc - Pointer to 4x 32-bit int array that contains the encrypted message
 *              key - Pointer to 4x 32-bit int array that contains the input key
 *  Output: msg_dec - Pointer to 4x 32-bit int array that contains the decrypted message
 */
void decrypt(unsigned int * msg_enc, unsigned int * msg_dec, unsigned int * key)
{
	AES_PTR[0] = key[0];
	AES_PTR[1] = key[1];
	AES_PTR[2] = key[2];
	AES_PTR[3] = key[3];
	AES_PTR[4] = msg_enc[0];
	AES_PTR[5] = msg_enc[1];
	AES_PTR[6] = msg_enc[2];
	AES_PTR[7] = msg_enc[3];
}

/** main
 *  Allows the user to enter the message, key, and select execution mode
 *
 */
int main()
{
	// Input Message and Key as 32x 8-bit ASCII Characters ([33] is for NULL terminator)
	unsigned char msg_ascii[33];
	unsigned char key_ascii[33];
	// Key, Encrypted Message, and Decrypted Message in 4x 32-bit Format to facilitate Read/Write to Hardware
	unsigned int key[4];
	unsigned int msg_enc[4];
	unsigned int msg_dec[4];

	printf("Select execution mode: 0 for testing, 1 for benchmarking: ");
	scanf("%d", &run_mode);

	if (run_mode == 0) {
		// Continuously Perform Encryption and Decryption
		while (1) {
			int i = 0;
			printf("\nEnter Message:\n");
			scanf("%s", msg_ascii);
			printf("\n");
			printf("\nEnter Key:\n");
			scanf("%s", key_ascii);
			printf("\n");
			encrypt(msg_ascii, key_ascii, msg_enc, key);
			printf("\nEncrpted message is: \n");
			for(i = 0; i < 4; i++){
				printf("%08x", msg_enc[i]);
			}
			printf("\n");
			decrypt(msg_enc, msg_dec, key);
			printf("\nDecrypted message is: \n");
			for(i = 0; i < 4; i++){
				printf("%08x", msg_dec[i]);
			}
			printf("\n");
		}
	}
	else {
		// Run the Benchmark
		int i = 0;
		int size_KB = 2;
		// Choose a random Plaintext and Key
		for (i = 0; i < 32; i++) {
			msg_ascii[i] = 'a';
			key_ascii[i] = 'b';
		}
		// Run Encryption
		clock_t begin = clock();
		for (i = 0; i < size_KB * 64; i++)
			encrypt(msg_ascii, key_ascii, msg_enc, key);
		clock_t end = clock();
		double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		double speed = size_KB / time_spent;
		printf("Software Encryption Speed: %f KB/s \n", speed);
		// Run Decryption
		begin = clock();
		for (i = 0; i < size_KB * 64; i++)
			decrypt(msg_enc, msg_dec, key);
		end = clock();
		time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
		speed = size_KB / time_spent;
		printf("Hardware Encryption Speed: %f KB/s \n", speed);
	}
	return 0;
}