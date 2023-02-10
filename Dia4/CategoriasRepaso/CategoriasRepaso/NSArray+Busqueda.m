//
//  NSArray+Busqueda.m
//  CategoriasRepaso
//
//  Created by Aldo Navarrete on 10/02/23.
//

#import "NSArray+Busqueda.h"

@implementation NSArray (Busqueda)
-(void) busquedaLineal:(NSString *) elemento {
    for(int i=0 ; i < self.count ; i++){
        if([self[i] isEqualToString:elemento]){
            printf("Lo encontré en la posición %d al elemento %s\n", i, [elemento UTF8String]);
            return;
        }
    }
    printf("No encontre el elemento %s\n", [elemento UTF8String]);
}
@end
