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
        // insert code here...
        NSLog(@"Hello, World!");
        Calculadora *myCalculator = [Calculadora new];
        NSNumber *result = [myCalculator operate:@5 yB:@4 withOperation:^NSNumber *(NSNumber *a, NSNumber *b) {
            return @(a.intValue + b.intValue);
        }];
        if(!result){
            printf("No se pudo realizar la operación");
        }else{
            printf("RES: %d\n",[result intValue]);
        }
        
        
    }
    return 0;
}
