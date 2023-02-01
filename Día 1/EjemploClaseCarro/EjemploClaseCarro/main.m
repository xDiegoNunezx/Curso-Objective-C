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
        
        Vehiculo *ferrari = [[Vehiculo alloc] init];
        NSLog(@"%d",[ferrari anio]);
        Vehiculo *bochido = [Vehiculo vehiculo];
        
        // Usar setters y getters
        [bochido setNumLlantas:3 yMatricula:@"737-SAW" yAnio:2001];
        [ferrari setNumLlantas:4 yMatricula:@"666-DIN" yAnio:2021];
        
        // Info
        [bochido imprimirInfo];
        [ferrari imprimirInfo];
        
    }
    return 0;
}
