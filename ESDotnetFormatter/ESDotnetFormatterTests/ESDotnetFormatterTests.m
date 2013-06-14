#import <SenTestingKit/SenTestingKit.h>

#import <ESDotnetFormatter/ESDotnetFormatter.h>
//#import "ESStringFormatter.h"
//#import "ESDotnetStringFormatter.h"

@interface ESDotnetFormatterTests : SenTestCase
@end

@implementation ESDotnetFormatterTests

-(void)testParametersAreIgnoredWhenThereAreNoFormatMarkers
{
    NSString* result = nil;
    NSString* expected = nil;
    
    {
        expected = @"hello world";
        result = [ NSString stringWithDotnetFormat: @"hello world"
                                              args: nil ];
        STAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
    
    {
        expected = @"Hotel of California";
        result = [ NSString stringWithDotnetFormat: @"Hotel of California"
                                              args: @[ @"One", @"Two", @(3) ] ];
        STAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
}

@end
