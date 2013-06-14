#import "ESDotnetStringFormatter.h"

#import "NSObject+DotnetString.h"

@implementation ESDotnetStringFormatter

-(NSString*)formatString:( NSString* )string
               usingArgs:( NSArray* )args
{
    NSMutableString* result = [ string mutableCopy ];

    NSUInteger argsCount = [ args count ];
    for ( NSUInteger i = 0; i < argsCount; ++i )
    {
        // @adk - this is not an invariant. Do not extract
        NSRange allString = { 0, [ result length ] };
        NSString* argFormat = [ NSString stringWithFormat: @"{%d}", i ];

        NSObject* currentArg = args[i];
        NSString* argValue = [ currentArg dotnetString ];

        [ result replaceOccurrencesOfString: argFormat
                                 withString: argValue
                                    options: NSLiteralSearch
                                      range: allString ];
    }



    return result;
}

@end
