//
//  Calculadora.m
//  RepasoBloques
//
//  Created by Aldo Navarrete on 10/02/23.
//
#import "Calculadora.h"

@implementation Calculadora

- (NSNumber *) operate:(NSNumber *)a
                  yB:(NSNumber *)b
         withOperation:(NSNumber * (^)(NSNumber *, NSNumber *)) operation {
    
    NSNumber *result = operation(a,b);
    if(result != nil){
        return result;
    }
    return nil;
}

@end


