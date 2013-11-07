#import "ESDotnetStringFormatter.h"

#import "NSObject+DotnetString.h"

@implementation ESDotnetStringFormatter

-(BOOL)argsContainDates:( NSArray* )args
{
    Class dateClass = [ NSDate class ];
    NSUInteger dateIndex = [ args indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop)
    {
        if ( [ obj isKindOfClass: dateClass ] )
        {
            *stop = YES;
            return YES;
        }
        
        return NO;
    } ];
    BOOL isNoDates = ( NSNotFound == dateIndex );
    return !isNoDates;
}

-(NSString*)formatString:( NSString* )string
               usingArgs:( NSArray* )args
{
    if ( nil == args )
    {
        return string;
    }
    
    BOOL argsHaveDates = [ self argsContainDates: args ];
    if ( argsHaveDates )
    {
        return nil;
    }

    
    NSMutableString* result = [ string mutableCopy ];

    NSUInteger argsCount = [ args count ];
    for ( NSUInteger i = 0; i < argsCount; ++i )
    {
        // @adk - this is not an invariant. Do not extract
        NSRange allString = { 0, [ result length ] };
        NSString* argFormat = [ NSString stringWithFormat: @"{%lu}", static_cast<unsigned long>(i) ];

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
