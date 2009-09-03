#import <Foundation/NSObject.h> 

@interface Fraction: NSObject { 
    int numerator; 
    int denominator;
} 
-(void) print; 
-(void) setNumerator: (int) d; 
-(void) setDenominator: (int) d; 
-(void) setNumerator: (int) n andDenominator;
-(int) numerator; 
-(int) denominator; 
@end
