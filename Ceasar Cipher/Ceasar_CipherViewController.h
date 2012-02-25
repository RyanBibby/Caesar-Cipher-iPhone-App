//
//  Ceasar_CipherViewController.h
//  Ceasar Cipher
//
//  Created by Ryan Bibby on 16/10/2011.
//

#import <UIKit/UIKit.h>
#import "Ceasar_CipherModel.h"

@interface Ceasar_CipherViewController : UIViewController <UITextFieldDelegate>
@property (retain) Ceasar_CipherModel *model;
@property (retain) IBOutlet UISlider *slider;
@property (retain) IBOutlet UITextField *originalText;
@property (retain) IBOutlet UITextField *codedText;
@property (retain) IBOutlet UILabel *cipherLabel; 

-(IBAction)sliderMoved;
-(IBAction)originalChanged;
-(IBAction)codedChanged;
-(IBAction)update;

@end
