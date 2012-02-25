//
//  Ceasar_CipherModel.m
//  Ceasar Cipher
//
//  Created by Ryan Bibby on 16/10/2011.
//

#import "Ceasar_CipherModel.h"

//Constants
#define DEVISOR 26
#define LOWER_CASE_OFFSET 97
#define UPPER_CASE_OFFSET 65
#define DEFAULT_CIPHER_VALUE 1

@implementation Ceasar_CipherModel
@synthesize originalMessage, codedMessage, cipherKey, decodeMode;


/*
*  Sets cipherKey to default value when object is instantiated
*/
- (id)init
{
	return [self initWithCipherKey:DEFAULT_CIPHER_VALUE];
}

/*
*  Sets cipherKey to specific value when object is instantiated
*/
-(id)initWithCipherKey:(int)key {
	self = [super init];
	if (self) {
		self.cipherKey = key;
	}
	return self;
}

/* 
*  Encrypts the original message and stores it to codedMessage
*/
-(void) encrypt {
	int size = [originalMessage length];
	unichar message[size];
	for (int i = 0; i < [originalMessage length]; i++){   
		char character = [originalMessage characterAtIndex:i];
        message[i] = [self encryptChar : character]; 
	}
	codedMessage = [[NSString alloc] initWithCharacters:message length:size]; 
}

/* 
 *  Decrypts the coded message and stores it to originalMessage
 */
-(void) decrypt {
    int size = [codedMessage length];
	unichar message[size];
	for (int i = 0; i < [codedMessage length]; i++){ 
        char character = [codedMessage characterAtIndex:i];
		message[i] = [self decryptChar : character]; 
	}
	originalMessage = [[NSString alloc] initWithCharacters:message length:size]; 	
}

/* 
*  Encrypts a character using the formular Ek(x) = (x+k) mod 26
*  The offsets are to bring the unicode in line with their posistion in the alphabet
*/
-(unichar) encryptChar:(unichar) character {
   
    unichar shiftedChar = character + cipherKey;
    
    //If character is lowercase a..z
    if ((character > 96)&&(character<123)){
        return ((shiftedChar-LOWER_CASE_OFFSET)%DEVISOR)+LOWER_CASE_OFFSET;
    }
    //Else if character is captital A..Z
    else if ((character > 64)&&(character<91)){
        return ((shiftedChar-UPPER_CASE_OFFSET)%DEVISOR)+UPPER_CASE_OFFSET;
    }
    //Else do not encrypt character
    else {
        return character;
    }
}

/* 
 *  Decrypts a character using the formular Dk(x) = (x-k) mod 26
 *  The offsets are to bring the unicode in line with their posistion in the alphabet
 *  To make the % function work properly 26 needs to be added when the first term is negative
 */
-(unichar) decryptChar:(unichar) character {
   
    unichar shiftedChar = character - cipherKey;
    
    //If character is lowercase a..z and the value for the adjusted char is postive
    if ((character > 96)&&(character<123)&&((shiftedChar-LOWER_CASE_OFFSET) >= 0)){
        return ((shiftedChar-LOWER_CASE_OFFSET)%DEVISOR)+LOWER_CASE_OFFSET;
    }
    //Else if character if character is lowercase a..z and negatvie
    else if ((character > 96)&&(character<123)) {
       return ((shiftedChar-LOWER_CASE_OFFSET+DEVISOR)%DEVISOR)+LOWER_CASE_OFFSET;
    }
    //Else if character is uppercase A..Z and the value for the adjusted char is postive
    else if ((character > 64)&&(character<91)&&((shiftedChar-LOWER_CASE_OFFSET) >= 0)) {
        return ((shiftedChar-UPPER_CASE_OFFSET)%DEVISOR)+UPPER_CASE_OFFSET;
    }
    //Else if character is uppercase A..Z and the value for the adjusted char is negative
    else if ((character > 64)&&(character<91)) {
        return ((shiftedChar-UPPER_CASE_OFFSET+DEVISOR)%DEVISOR)+UPPER_CASE_OFFSET;
    }
    //Else do not encrypt character    
    else {
        return character;
    }
}

-(void)dealloc {
    [originalMessage release];
    [codedMessage release];
    [super dealloc];
}
@end
