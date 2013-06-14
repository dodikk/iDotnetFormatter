#import <Foundation/Foundation.h>

@interface NSString (DotnetFormat)

-(id)initWithDotnetFormat:( NSString* )format
                     args:( NSArray* )args;

+(NSString*)stringWithDotnetFormat:( NSString* )format
                              args:( NSArray* )args;

@end
