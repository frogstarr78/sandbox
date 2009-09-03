#import "Fraction.h" 
#import <stdio.h>

@implementation Fraction 
-(void) print { 
    printf( "%i/%i", numerator, denominator );
} 
-(void) setNumerator: (int) n { 
    numerator = n;
} 
-(void) setDenominator: (int) d {
    denominator = d;
} 
-(void) setNumerator: (int) n andDenominator: (int) d {
    numerator = n;
    denominator = d; 
}
-(int) denominator {
    return denominator;
} 
-(int) numerator {
    return numerator;
} 
@end
