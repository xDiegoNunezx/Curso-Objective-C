//
//  ViewController.m
//  Calculadora
//
//  Created by Aldo Navarrete on 04/02/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _numberA = nil;
    _numberB = nil;
    _resultLabel.text = @"0";
    _bFirstDigitFilled = NO;
    _currOperation = Ninguna;
}
- (NSNumber *)multiply:(NSNumber *)a andB:(NSNumber *)b {
    return @(a.doubleValue * b.doubleValue);
}
-(NSNumber *)add:(NSNumber *)a andB:(NSNumber *)b{
    return @(a.doubleValue + b.doubleValue);
}

-(NSNumber *)divide:(NSNumber *)a andB:(NSNumber *)b{
    // División entre cero.
    if([b doubleValue] == 0){
        return nil;
    }
    return @(a.doubleValue / b.doubleValue);
}

- (NSNumber *)makeOperation:(NSNumber *)a secondNumber:(NSNumber *) b withOperation:(NSNumber *(^)(NSNumber *, NSNumber *))operation {
    NSNumber *num = operation(a,b);
    if(num == nil){
        _resultLabel.text = @"ERROR";
    }
    return num;
}

- (IBAction)equalButtonPressed:(UIButton *)sender {
    // Guarda el número B
    NSNumberFormatter *f = [NSNumberFormatter new];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *numberFromLabelText = [f numberFromString:_resultLabel.text];
    _numberB = numberFromLabelText;
    
    printf("%d %d\n", _numberA.intValue, _numberB.intValue);
    
    // Caso 1: _numberB es nulo
    if(_numberB == nil){
        _numberB = _numberA;
    }
    
    NSNumber *result = nil;
    
    switch (_currOperation) {
        case Suma:
            result = [self add:_numberA andB:_numberB];
            break;
        case Resta:
            result = [self add:_numberA andB:@(_numberB.intValue * -1)];
            break;
        case Multiplicacion:
            result = [self multiply:_numberA andB:_numberB];
            break;
        case Division:
            result = [self divide:_numberA andB:_numberB];
            break;
        default:
            break;
    }
    
    if (result == nil){
        _resultLabel.text = @"!ERROR";
        return;
    }
    
    _resultLabel.text = [result stringValue];
    _bFirstDigitFilled = NO;
}

- (IBAction)operationButtonPressed:(UIButton *)sender {
    _bFirstDigitFilled = NO;
    // Guarda el número en A
    NSNumberFormatter *f = [NSNumberFormatter new];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *numberFromLabelText = [f numberFromString:_resultLabel.text];
    _numberA = numberFromLabelText;
    
    NSString *operationString = sender.titleLabel.text;
    printf("%s", [operationString UTF8String]);
    
    if([operationString isEqualToString:@"+"]){
        _currOperation = Suma;
        return;
    }
    if([operationString isEqualToString:@"÷"]){
        _currOperation = Division;
        return;
    }
    if([operationString isEqualToString:@"×"]){
        _currOperation = Multiplicacion;
        return;
    }
    if([operationString isEqualToString:@"-"]){
        _currOperation = Resta;
        return;
    }
    
}

- (IBAction)acButtonPressed:(UIButton *)sender {
    _resultLabel.text = @"0";
    _numberA = nil;
    _numberB = nil;
    _currOperation = Ninguna;
    _bFirstDigitFilled = NO;
}

- (IBAction)numberButtonPressed:(UIButton *)sender {
    
    if([_resultLabel.text isEqualToString:@"!ERROR"]){
        _resultLabel.text = @"0";
    }
    if(_currOperation != Ninguna && !_bFirstDigitFilled){
        _resultLabel.text = sender.titleLabel.text;
        _bFirstDigitFilled = YES;
        return;
    }
    
    NSMutableString *stringLabelText = [[NSMutableString alloc] initWithString:_resultLabel.text];
    [stringLabelText appendString:sender.titleLabel.text];
    
    //Convertir result label de string a NSNumber
    NSNumberFormatter *f = [NSNumberFormatter new];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *numberFromLabelText = [f numberFromString:stringLabelText];

    //Asignar ese NSNumber como String al Label
    _resultLabel.text = [numberFromLabelText stringValue];
    
}


@end
