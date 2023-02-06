#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#pragma mark Datos primitivos en ObjC
        //id
        id numero = [NSNumber numberWithInt:56];
        NSLog(@"%@",numero);

        //BOOL (YES/NO)
        BOOL siono = YES;
        if(siono){
            NSLog(@"Sí");
        } else {
            NSLog(@"No");
        }

        //nil
        numero = nil;
        NSLog(@"%@",numero);
        
#pragma mark Clase NSNumber
        NSNumber *A = [NSNumber numberWithBool:NO];
        NSNumber *B = [NSNumber numberWithChar:'z'];
        NSNumber *C = [NSNumber numberWithUnsignedChar:255];
        NSNumber *D = [NSNumber numberWithShort:32767];
        NSNumber *E = [NSNumber numberWithUnsignedShort:65535];
        NSNumber *F = [NSNumber numberWithInt:2147483647];
        NSNumber *G = [NSNumber numberWithUnsignedInt:4294967295];
        NSNumber *H = [NSNumber numberWithLong:9223372036854775807];
        NSNumber *I = [NSNumber numberWithUnsignedLong:1844674407370955161];
        NSNumber *J = [NSNumber numberWithFloat:26.99f];
        NSNumber *K = [NSNumber numberWithDouble:26.99];

        //U para unsigned, L para long, F para float
        NSNumber *L = @NO;
        NSNumber *M = @'z';
        NSNumber *N = @2147483647;
        NSNumber *O = @4294967295U;
        NSNumber *P = @9223372036854775807L;
        NSNumber *Q = @26.99F;
        NSNumber *R = @26.99;
        
        double x = 24.0;
        NSNumber *result = @(x * .15);
        
        NSLog(@"%.2f", [result doubleValue]);
        
        //Casteo
        NSNumber *comoInt = [NSNumber numberWithInt:42];
        float comoFloat = [comoInt floatValue];
        NSLog(@"%.2f", comoFloat);
        
        NSString *comoString = [comoInt stringValue];
        NSLog(@"%@", comoString);
  
        // Comparar dos números
        NSNumber *anInt = @27;
        NSNumber *sameInt = @27U;
        
        // Comparacion de direcciones
        if (anInt == sameInt) {
            NSLog(@"Son los mismos objetos");
        }
        
        // Comparacion de valores
        if ([anInt isEqualToNumber:sameInt]) {
            NSLog(@"Tienen el mismo valor");
        }
        
        // Función compare
        // La función compare devuelve 3 tipos de valores:
        // NSOrderedAscending en caso de que el primer
        // argumento sea menor que el segundo,
        // NSOrderedSame, en caso de que sean iguales y
        // NSOrderedDescending en caso que el primer
        // argumento sea mayor al segundo.
        
        
        NSNumber *anInt2 = @27;
        NSNumber *anotherInt = @42;
        NSComparisonResult res = [anInt2 compare:anotherInt];
        if (res == NSOrderedAscending) {
            NSLog(@"27 < 42");
        } else if (res == NSOrderedSame) {
            NSLog(@"27 == 42");
        } else if (res == NSOrderedDescending) {
            NSLog(@"27 > 42");
        }

#pragma mark Clase NSString
        NSString *make = @"Porsche";
        NSString *model = @"911";
        int year = 1968;
        
        //Método String with format
        NSString *message = [NSString stringWithFormat: @"That’s a %@ %@ from %d!", make, model, year];
        NSLog(@"%@", message);
        
        //Método length y characterAtIndex
        for (int i=0; i<[make length]; i++) {
            char letter = [make characterAtIndex:i];
            NSLog(@"%d: %c", i, letter);
        }
        
        //Método hasPrefix, hasSuffix, isEqualToString
        NSString *car = @"Porsche Boxster";
        if ([car isEqualToString: @"Porsche Boxster"]){
            NSLog(@"El carro es un Porsche Boxster");
        }
        if ([car hasPrefix: @"Porsche"]){
            NSLog(@"El carro comienza con Porsche");
        }
        if ([car hasSuffix: @"Carrera"]) {
            NSLog(@"El carro termina en Carrera");
        }

#pragma mark NSArray
        NSArray *arr = [NSArray arrayWithObjects: @"Colombia", @100,@"Lenguajes", nil];
        
        //arr[0] = @"Hola";
        
        for(int i = 0; i < [arr count]; i++) {
            NSLog(@"posicion %d = %@ ", i, arr[i]);
        }
        
        NSMutableArray *arr2 = [NSMutableArray new];
        [arr2 addObject:@"Hola"];
        [arr2 addObject:@"Como"];
        [arr2 addObject:@"estás?"];
        
        for(int i = 0; i < [arr2 count]; i++) {
            //NSLog(@"posicion %d = %@ ", i, arr2[i]);
            printf("posicion %d = %s\n", i, [arr2[i] UTF8String]);
        }
        
        [arr2 removeObject:@"Hola"];
        [arr2 removeObjectAtIndex:0];
        
        for(int i = 0; i < [arr2 count]; i++) {
            printf("posicion %d = %s\n", i, [arr2[i] UTF8String]);
        }
        
        NSMutableArray *arr3 = [NSMutableArray arrayWithObjects:@"estás?", nil];
        
        if([arr2 isEqualToArray:arr3]){
            NSLog(@"Son el mismo!");
        }
#pragma mark NSSet
        NSSet *americanMakes = [NSSet setWithObjects:@"Chrysler", @"Ford",@"General Motors", nil];
        NSArray *japaneseMakes = @[@"Honda", @"Mazda", @"Mitsubishi", @"Honda"];
        NSSet *uniqueMakes = [NSSet setWithArray:japaneseMakes];
        
        if([uniqueMakes containsObject:@"Mazda"]) {
            NSLog(@"Contiene Mazda");
        }
        
        NSMutableSet *mutableSet = [americanMakes mutableCopy];
        [mutableSet removeObject:@"Ford"];
        [mutableSet addObject:@"Tesla"];
        americanMakes = [mutableSet copy];
        
        NSLog(@"%@",americanMakes);
        
        NSSet *allMakes = [americanMakes setByAddingObjectsFromSet:uniqueMakes];
        NSLog(@"%@",allMakes);

#pragma mark NSDictionary
        // Valores y claves como argumentos
        NSDictionary *inventory = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithInt:13],@"Mercedes-Benz SLK250",
                                   [NSNumber numberWithInt:22],@"Mercedes-Benz E350",
                                   [NSNumber numberWithInt:19],@"BMW M3 Coupe",
                                   [NSNumber numberWithInt:16],@"BMW X6",nil];
        // Valores y claves como arreglos
        NSArray *models = @[@"Mercedes-Benz SLK250",
                            @"Mercedes-Benz E350",
                            @"BMW M3 Coupe",
                            @"BMW X6"];
        
        NSArray *stock = @[[NSNumber numberWithInt:13],
                           [NSNumber numberWithInt:22],
                           [NSNumber numberWithInt:19],
                           [NSNumber numberWithInt:16]];
        
        inventory = [NSDictionary dictionaryWithObjects:stock forKeys:models];
        NSLog(@"%@", inventory);
        
        NSLog(@"%@", [inventory objectForKey:@"Mercedes-Benz E350"]);
        NSLog(@"%@", [inventory allKeysForObject:@22]);
        
        for(id key in inventory){
            NSLog(@"Hay %@ %@",[inventory objectForKey:key],key);
        }

    }
    return 0;
}
