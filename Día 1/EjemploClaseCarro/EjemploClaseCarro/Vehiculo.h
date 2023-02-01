//
//  Vehiculo.h
//  EjemploClaseCarro
//
//  Created by Lugo, Diego and Aldo on 31/01/23.
//
#import <Foundation/Foundation.h>

@interface Vehiculo : NSObject {
    NSInteger numLlantas;
    NSString *matricula;
    int anio;
}
- (void) imprimirInfo;
- (void) setNumLlantas: (NSInteger) llantas yMatricula: (NSString *) unaMatricula yAnio: (int) unAnio;
- (int) anio;

+ (Vehiculo *) vehiculo;
@end
