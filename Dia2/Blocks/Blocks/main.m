//
//  main.m
//  Blocks
//
//  Created by Aldo Navarrete on 03/02/23.
//

#import <Foundation/Foundation.h>

@interface Tester : NSObject

@property (nonatomic, copy) void (^block)(id, NSUInteger, BOOL *);

- (void) runTest;
- (void) doSomethingWithBlock: (void (^)(id, NSUInteger, BOOL *)) block;
- (void) funcionAsincrona;
@end

@implementation Tester

- (void) runTest {
    [self doSomethingWithBlock: ^(id obj, NSUInteger idx, BOOL *stop){
        NSLog(@"%@", obj);
        NSLog(@"Finalizado!");
    }];
}

- (void) doSomethingWithBlock: (void (^)(id, NSUInteger, BOOL *)) block {
    self.block = block;
    [self performSelectorOnMainThread:@selector(funcionAsincrona) withObject:nil waitUntilDone:YES];
}
- (void) funcionAsincrona {
    BOOL stop;
    self.block(@"COD3", 0, &stop);
}

@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block int unEntero = 10;
        
        // testBlock retorne nada y que reciba
        void (^testBlock)(void) = ^{
            NSLog(@"%d", unEntero);
            unEntero++;
            NSLog(@"%d", unEntero);
        };
        
        testBlock();
        
        // myBlock id, NSUInteger, BOOL *, void retorno.
        void (^myBlock) (id, NSUInteger idx, BOOL *stop) = ^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"Videojuego: %@", (NSString *) obj);
            
        };
        BOOL stop;
        myBlock(@"God of War", 0, &stop);
        
        // Pasarle un bloque a un metodo
        NSArray *videojuegos = @[@"God of War", @"OverWatch", @"COD",@"Halo"];
        [videojuegos enumerateObjectsUsingBlock:myBlock];
        
        // Inline form - forma linea
        [videojuegos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"Videojuego 🎮: %@",(NSString *) obj);
        }];
    
        
        // Probar bloques 'asíncrono'
        Tester *tester = [Tester new]; // [[Tester alloc] init]
        [tester runTest];
        
    }
    return 0;
}
