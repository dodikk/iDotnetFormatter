#import <XCTest/XCTest.h>

#import <ESDotnetFormatter/ESDotnetFormatter.h>

@interface ESDotnetFormatterTests : XCTestCase
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
        XCTAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
    
    {
        expected = @"Hotel of California";
        result = [ NSString stringWithDotnetFormat: @"Hotel of California"
                                              args: @[ @"One", @"Two", @(3) ] ];
        XCTAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
}

-(void)testOrderedParametersAreInserted
{
    NSString* result = nil;
    NSString* expected = nil;

    {
        expected = @"A quick brown fox jumps over a lazy dog";
        result = [ NSString stringWithDotnetFormat: @"A {0} brown fox {1} over a {2} dog"
                                              args: @[ @"quick", @"jumps", @"lazy" ] ];
        XCTAssertEqualObjects( result, expected, @"unused params must be ignored" );
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
        XCTAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
}

-(void)testDatesAreNotSupported
{
    NSString* result = nil;
    NSDate* nowDate = [ NSDate new ];
    
    
    result = [ NSString stringWithDotnetFormat: @"A {0} fox {1} over a {2} dog"
                                          args: @[ @(42), @(13), nowDate ] ];
    XCTAssertNil( result, @"Dates are not supported" );
}

-(void)testReordering
{
    NSString* result = nil;
    NSString* expected = nil;
    
    {
        expected = @"A quick brown dog jumps over a lazy fox";
        result = [ NSString stringWithDotnetFormat: @"A quick brown {1} jumps over a lazy {0}"
                                              args: @[ @"fox", @"dog" ] ];
        XCTAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
    
}

-(void)testMultipleOccurences
{
    NSString* result = nil;
    NSString* expected = nil;
    
    {
        expected = @"A quick brown dog jumps over a lazy dog";
        result = [ NSString stringWithDotnetFormat: @"A quick brown {1} jumps over a lazy {1}"
                                              args: @[ @"fox", @"dog" ] ];
        XCTAssertEqualObjects( result, expected, @"unused params must be ignored" );
    }
    
}


@end
