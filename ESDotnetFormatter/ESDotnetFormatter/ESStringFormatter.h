#import <Foundation/Foundation.h>

@protocol ESStringFormatter <NSObject>

-(NSString*)formatString:( NSString* )string
               usingArgs:( NSArray* )args;

@end
