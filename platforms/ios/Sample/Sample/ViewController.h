// platforms/ios/Sample/Sample/ViewController.h

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField* input;
@property (strong, nonatomic) IBOutlet UILabel* result;

- (IBAction) touchedButton:(id)sender;

@end
