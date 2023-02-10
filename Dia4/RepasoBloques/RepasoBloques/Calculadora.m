//
//  Calculadora.m
//  RepasoBloques
//
//  Created by Aldo Navarrete on 10/02/23.
//
#import "Calculadora.h"

@implementation Calculadora

- (NSNumber *) operateA:(NSNumber *)a
                  andB:(NSNumber *)b
         withOperation:(NSNumber * (^)(NSNumber *, NSNumber *)) operation {
    NSNumber *result = operation(a,b);
    if(result == nil){
        return nil;
    }
    return result;
}

@end


