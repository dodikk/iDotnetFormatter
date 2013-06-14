#import <SenTestingKit/SenTestingKit.h>

#import <ESDotnetFormatter/ESDotnetFormatter.h>

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

-(void)testOrderedParametersAreInserted
{
    NSString* result = nil;
    NSString* expected = nil;

    {
        expected = @"A quick fox jumps over a lazy dog";
        result = [ NSString stringWithDotnetFormat: @"A {0} fox {1} over a {2} dog"
                                              args: @[ @"quick", @"jumps", @"lazy" ] ];
        STAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
}

-(void)testNumbersAreSupported
{
    NSString* result = nil;
    NSString* expected = nil;
    
    {
        expected = @"A 42 fox 13 over a 666 dog";
        result = [ NSString stringWithDotnetFormat: @"A {0} fox {1} over a {2} dog"
                                              args: @[ @(42), @(13), @(666) ] ];
        STAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
}

-(void)testDatesAreNotSupported
{
    NSString* result = nil;
    NSDate* nowDate = [ NSDate new ];
    
    
    result = [ NSString stringWithDotnetFormat: @"A {0} fox {1} over a {2} dog"
                                          args: @[ @(42), @(13), nowDate ] ];
    STAssertNil( result, @"Dates are not supported" );
}

@end
