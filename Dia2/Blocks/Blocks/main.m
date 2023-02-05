//
//  main.m
//  Blocks
//
//  Created by Aldo Navarrete on 03/02/23.
//

#import <Foundation/Foundation.h>




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Bienvenido a blocks!");

        // Ejemplo 1
        int anInteger = 42;
        void (^testBlock)(void) = ^{
            NSLog(@"Integer is: %i", anInteger);
        };
        anInteger = 84;
        testBlock();

        // Ejemplo 2
        __block int aSecondInteger = 42;
        void (^testBlock2)(void) = ^{
           NSLog(@"Integer is: %i", aSecondInteger);
           
        };
        aSecondInteger = 84;
        testBlock2();
        
    }
    return 0;
}
