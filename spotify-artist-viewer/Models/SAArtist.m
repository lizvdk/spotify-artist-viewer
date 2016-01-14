//
//  SAArtist.m
//  spotify-artist-viewer
//
//  Copyright (c) 2015 Intrepid. All rights reserved.
//

#import "SAArtist.h"

@implementation SAArtist

- (instancetype)init:(NSString *)name {
	self = [super init];
	if (self) {
		self.spotifyName = name;
	}
	return self;
}

@end
