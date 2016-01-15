//
//  spotify_artist_viewerTests.m
//  spotify-artist-viewerTests
//
//  Created by Ying Quan Tan on 6/8/15.
//  Copyright (c) 2015 Intrepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SAArtist.h"

@interface spotify_artist_viewerTests : XCTestCase

@end

@implementation spotify_artist_viewerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testInitSAArtist {
	SAArtist *testArtist = [[SAArtist alloc] init:@"Test Name" spotifyID:@"1a2b3c"];
	XCTAssertEqual(testArtist.spotifyName, @"Test Name");
	XCTAssertEqual(testArtist.spotifyID, @"1a2b3c");
	XCTAssert([testArtist.spotifyBiography isEqualToString:@"Bio not available."]);
	XCTAssert(testArtist.spotifyImageURL, @"http://thumbs.dreamstime.com/z/portrait-cute-dog-hat-7394863.jpg");

}

@end
