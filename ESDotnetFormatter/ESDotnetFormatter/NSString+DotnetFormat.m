#import "NSString+DotnetFormat.h"

#import "ESDotnetStringFormatter.h"

@implementation NSString (DotnetFormat)

-(id)initWithDotnetFormat:( NSString* )format
                     args:( NSArray* )args
{
    return [ [ self class ] stringWithDotnetFormat: format
                                              args: args ];
}

+(NSString*)stringWithDotnetFormat:( NSString* )format
                              args:( NSArray* )args
{
    ESDotnetStringFormatter* formatter = [ ESDotnetStringFormatter new ];
    return [ formatter formatString: format
                          usingArgs: args ];
}

@end
