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

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        _numberA = nil;
        _numberB = nil;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSNumber *)multiply:(NSNumber *)a andB:(NSNumber *)b {
    return @(a.doubleValue * b.doubleValue);
}
-(NSNumber *)add:(NSNumber *)a andB:(NSNumber *)b{
    return @(a.doubleValue * b.doubleValue);
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
    return operation(a,b);
}

- (IBAction)equalButtonPressed:(UIButton *)sender {
    // Caso 1: _numberB es nulo
    if(_numberB == nil){
        _numberB = _numberA;
    }
    NSNumber * (^oper)(NSNumber *, NSNumber *);
    
    switch (_currOperation) {
        case Suma:
            [self add:_numberA andB:_numberB];
            break;
        case Resta:
            [self add:_numberA andB:_numberB];
        case Multiplicacion:
            [self multiply:<#(NSNumber *)#> andB:<#(NSNumber *)#>]
        default:
            break;
    }
    [self makeOperation:_numberA secondNumber:_numberB withOperation:<#^NSNumber *(NSNumber *, NSNumber *)operation#>]
}

- (IBAction)operationButtonPressed:(UIButton *)sender {
    NSString *operationString = sender.titleLabel.text;
    if([operationString isEqualToString:@"+"]){
        _currOperation = Suma;
        return;
    }
    if([operationString isEqualToString:@"÷"]){
        _currOperation = Division;
        return;
    }
    if([operationString isEqualToString:@"x"]){
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
}

- (IBAction)numberButtonPressed:(UIButton *)sender {
    NSString *stringLabelText = sender.titleLabel.text;
    _resultLabel.text = [_resultLabel.text stringByAppendingString:stringLabelText];
    
    NSNumberFormatter *f = [NSNumberFormatter new];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *numberFromLabelText = [f numberFromString:_resultLabel.text];
    
    // Caso 1: Primer número no está lleno:
    _numberA = @(_resultLabel.text.intValue);
    printf("%d\n", _numberA.intValue);
    _resultLabel.text = [_numberA stringValue];
    return;
    
    // Caso 2: Segundo número no está lleno:
    if(_numberB == nil){
        _numberB = numberFromLabelText;
        return;
    }
    
    printf("%f %f\n",_numberA.doubleValue,_numberB.doubleValue);
}


@end
