#import "NSObject+DotnetString.h"


@implementation NSObject (DotnetString)

-(NSString*)dotnetString
{
    return [ self description ];
}

@end
