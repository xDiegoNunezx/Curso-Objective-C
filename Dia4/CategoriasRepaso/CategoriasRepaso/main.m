//
//  main.m
//  CategoriasRepaso
//
//  Created by Aldo Navarrete on 10/02/23.
//

#import "NSArray+Busqueda.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arreglo = @[@"iPhone", @"Samsung",@"Huawei",@"Motorola",@"Xiaomi",@"Oppo",@"OnePlus"];
        [arreglo busquedaLineal:@"Redmi"]; // no lo encontre
        [arreglo busquedaLineal:@"Motorola"]; // lo encontre 3, al elemento Motorola
        
    }
    return 0;
}
