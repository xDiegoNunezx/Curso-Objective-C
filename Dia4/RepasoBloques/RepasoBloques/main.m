//
//  main.m
//  RepasoBloques
//
//  Created by Aldo Navarrete on 10/02/23.
//

#import <Foundation/Foundation.h>
#import "Calculadora.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Calculadora *myCalculator = [Calculadora new];
        NSNumber * (^multiply)(NSNumber *, NSNumber *) = ^NSNumber * (NSNumber *a, NSNumber *b){
            NSNumber *res = [NSNumber numberWithDouble:(a.doubleValue * b.doubleValue)];
            return res;
        };
        NSNumber * (^add)(NSNumber *, NSNumber *) = ^NSNumber * (NSNumber *a, NSNumber *b){
            NSNumber *res = [NSNumber numberWithDouble:(a.doubleValue + b.doubleValue)];
            return res;
        };
        NSNumber * (^subtract)(NSNumber *, NSNumber *) = ^NSNumber * (NSNumber *a, NSNumber *b){
            NSNumber *res = [NSNumber numberWithDouble:(a.doubleValue - b.doubleValue)];
            return res;
        };
        NSNumber * (^divide)(NSNumber *, NSNumber *) = ^NSNumber * (NSNumber *a, NSNumber *b){
            if(b.intValue == 0){
                return nil;
            }
            NSNumber *res = [NSNumber numberWithDouble:(a.doubleValue / b.doubleValue)];
            return res;
        };
        
        NSNumber *resadd = [myCalculator operateA:@5 andB:@8 withOperation:add];
        NSNumber *ressubtract = [myCalculator operateA:@5 andB:@8 withOperation:subtract];
        NSNumber *resmultiply = [myCalculator operateA:@5 andB:@8 withOperation:multiply];
        NSNumber *resdivide = [myCalculator operateA:@5 andB:@12 withOperation:divide];
        
        // Imprimir suma
        printf("%d\n", [resadd intValue]);
        
        // Imprimir resta
        NSLog(@"%d", ressubtract.intValue);
        
        // Imprimir multiplicacion
        printf("%d\n", [resmultiply intValue]);
        
        
        //Imprimir division
        if(resdivide == nil){
            printf("!ERROR\n");
        }else{
            NSLog(@"%f", resdivide.doubleValue);
        }
        
        
        
        
    }
    return 0;
}
