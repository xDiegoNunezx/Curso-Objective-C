//
//  ViewController.h
//  Calculadora
//
//  Created by Aldo Navarrete on 04/02/23.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, operation){
    Ninguna = -1,
    Suma,
    Resta,
    Multiplicacion,
    Division
};

@interface ViewController : UIViewController{
    BOOL _bFirstDigitFilled;
}
#pragma Properties
@property (nonatomic) NSNumber *numberA;
@property (nonatomic) NSNumber *numberB;
@property (nonatomic) operation currOperation;

#pragma Outlets
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

#pragma IBActions y Métodos
- (NSNumber *)multiply:(NSNumber *) a andB: (NSNumber *) b;
- (NSNumber *)divide:(NSNumber *) a andB: (NSNumber *) b;
- (NSNumber *)add:(NSNumber *) a andB: (NSNumber *) b;
- (NSNumber *)makeOperation:(NSNumber *)a secondNumber:(NSNumber *) b withOperation:(NSNumber * (^)(NSNumber *, NSNumber *)) operation;
- (IBAction)numberButtonPressed:(UIButton *)sender;
- (IBAction)acButtonPressed:(UIButton *)sender;
- (IBAction)operationButtonPressed:(UIButton *)sender;
- (IBAction)equalButtonPressed:(UIButton *)sender;
@end

