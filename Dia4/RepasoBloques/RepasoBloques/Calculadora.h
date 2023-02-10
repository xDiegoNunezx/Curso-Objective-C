//
//  Calculadora.h
//  RepasoBloques
//
//  Created by Aldo Navarrete on 10/02/23.
//
#import <Foundation/Foundation.h>

@interface Calculadora : NSObject

- (NSNumber *) operateA:(NSNumber *)a
                  andB:(NSNumber *)b
         withOperation:(NSNumber * (^)(NSNumber *, NSNumber *)) operation;

@end
