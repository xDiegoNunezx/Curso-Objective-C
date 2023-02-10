//
//  main.m
//  CategoriasRepaso
//
//  Created by Aldo Navarrete on 10/02/23.
//

#import <Foundation/Foundation.h>
#import "NSArray+Ordenamiento.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arreglo = @[@"iPhone", @"Samsung",@"Huawei",@"Motorola",@"Xiaomi",@"Oppo",@"OnePlus"];
        [arreglo busquedaLineal:@"Redmi"];
        
    }
    return 0;
}
