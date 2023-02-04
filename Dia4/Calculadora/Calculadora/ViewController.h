//
//  ViewController.h
//  Calculadora
//
//  Created by Aldo Navarrete on 04/02/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

-(IBAction)numberButtonPressed:(id)sender;

@end

