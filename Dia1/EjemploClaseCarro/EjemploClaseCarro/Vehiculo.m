//
//  Vehiculo.m
//  EjemploClaseCarro
//
//  Created by Lugo, Diego and Aldo on 31/01/23.
//
#import "Vehiculo.h"

@implementation Vehiculo

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    anio = 1990; // valor por default Vehiculo *bocho = [[Vehiculo alloc] init] = [Vehiculo new
    return self;
}

- (void) imprimirInfo {
    printf("Información carro:\n");
    printf("Año: %d\n", anio);
    printf("Llantas: %ld\n", (long)numLlantas);
    printf("Matricula: %s\n", [matricula UTF8String]);
}

- (void)setNumLlantas:(NSInteger)llantas yMatricula:(NSString *)unaMatricula yAnio:(int)unAnio {
    numLlantas = llantas;
    matricula = unaMatricula;
    anio = unAnio;
}

- (int) anio {
    return anio;
}

+ (Vehiculo *) vehiculo {
    return [[Vehiculo alloc] init];
}

@end
