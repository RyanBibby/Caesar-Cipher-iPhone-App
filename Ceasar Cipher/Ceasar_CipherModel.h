//
//  Ceasar_CipherModel.h
//  Ceasar Cipher
//
//  Created by Ryan Bibby on 16/10/2011.
//

#import <Foundation/Foundation.h>

@interface Ceasar_CipherModel : NSObject
@property (retain) NSString *originalMessage;
@property (retain) NSString *codedMessage;
@property (assign) int cipherKey;
@property (assign) BOOL decodeMode;

-(void)encrypt;
-(void)decrypt;
-(id)initWithCipherKey:(int)key;
-(unichar) encryptChar:(unichar) character;
-(unichar) decryptChar:(unichar) character;
@end
