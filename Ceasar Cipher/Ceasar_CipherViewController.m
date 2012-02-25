//
//  Ceasar_CipherViewController.m
//  Ceasar Cipher
//
//  Created by Ryan Bibby on 16/10/2011.
//

#import "Ceasar_CipherViewController.h"
#import "Ceasar_CipherModel.h"

@implementation Ceasar_CipherViewController
@synthesize model, slider, cipherLabel, originalText, codedText;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Ran when the view loads. Initial setup
- (void)viewDidLoad
{  
    [super viewDidLoad];
    model = [[Ceasar_CipherModel alloc] init];
    model.decodeMode = NO;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



//Method called when slider is moved. Updates the cipher key value in the model, and the label in the view
-(IBAction)sliderMoved{
	model.cipherKey = (int)slider.value;
	self.cipherLabel.text = [NSString stringWithFormat:@"Cipher Key: %d", model.cipherKey];
        [self update];
}

//Called whenever the orginal message box is changed. Provides live decoding.
-(IBAction)originalChanged{
        model.decodeMode = NO;
        model.originalMessage = originalText.text; 
        [self update];
}

//Called whenever the coded message box is changed. Provides live decoding.
-(IBAction)codedChanged{
	model.decodeMode = YES;
	model.codedMessage = codedText.text;
	[self update];
}
//Updates the view based on the model, and calls the encrypt/decrypt actions
-(IBAction)update{
	self.slider.value = model.cipherKey;
	
	if (model.decodeMode) {
		[model decrypt];
		self.originalText.text = model.originalMessage;
	}else {
		[model encrypt];
		self.codedText.text = model.codedMessage;
	}
}

//Makes the keyboard go away when enter is pressed
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//Deallocates the retained objects
-(void)dealloc {
    [model release];
    [super dealloc];
}
@end
