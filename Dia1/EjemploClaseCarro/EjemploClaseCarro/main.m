//
//  main.m
//  EjemploClaseCarro
//
//  Created by Lugo, Diego and Aldo on 31/01/23.
//

#import <Foundation/Foundation.h>
#import "Vehiculo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Vehiculo
        
        Vehiculo *ferrari = [Vehiculo new];
        NSLog(@"%d",[ferrari anio]);
        Vehiculo *bochido = [Vehiculo vehiculo];
        // anio bocho = 1990
        
        // Usar setters y getters
        [bochido setNumLlantas:4 yMatricula:@"822-MAS" yAnio:1992];
        
        
        // Info
        [bochido imprimirInfo];
        [ferrari imprimirInfo];
        
    }
    return 0;
}
