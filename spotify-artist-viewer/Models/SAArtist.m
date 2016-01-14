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
		self.spotifyName = name;
		self.spotifyID = spotifyID;
		self.spotifyBiography = @"Bio not available.";
	}
	return self;
}

@end
