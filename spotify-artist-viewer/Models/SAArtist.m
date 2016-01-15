//
//  SAArtist.m
//  spotify-artist-viewer
//
//  Copyright (c) 2015 Intrepid. All rights reserved.
//

#import "SAArtist.h"

@implementation SAArtist

- (instancetype)init:(NSString *)name spotifyID:(NSString *)spotifyID {
	self = [super init];
	if (self) {
		_spotifyName = name;
		_spotifyID = spotifyID;
		_spotifyBiography = @"Bio not available.";
		_spotifyImageURL = @"http://thumbs.dreamstime.com/z/portrait-cute-dog-hat-7394863.jpg";
	}
	return self;
}

@end
