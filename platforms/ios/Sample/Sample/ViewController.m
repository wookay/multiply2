// platforms/ios/Sample/Sample/ViewController.m

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _input.placeholder = @"숫자를 입력하시오";
    _input.keyboardType = UIKeyboardTypeNumberPad;
    _input.font = [UIFont fontWithName:@"Helvetica" size:26];
    [_input becomeFirstResponder];
}

- (IBAction) touchedButton:(id)sender {
    int num = _input.text.intValue;
    _result.text = [NSString stringWithFormat:@"%d x 2 = %d", num, num * 2];
    NSLog(@"input: %d", num);
}

@end
