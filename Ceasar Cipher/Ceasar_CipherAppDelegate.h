//
//  Ceasar_CipherAppDelegate.h
//  Ceasar Cipher
//
//  Created by Ryan Bibby on 16/10/2011.
//

#import <UIKit/UIKit.h>

@class Ceasar_CipherViewController;

@interface Ceasar_CipherAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Ceasar_CipherViewController *viewController;

@end
