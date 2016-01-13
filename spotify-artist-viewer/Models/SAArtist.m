//
//  SAArtist.m
//  spotify-artist-viewer
//
//  Copyright (c) 2015 Intrepid. All rights reserved.
//

#import "SAArtist.h"

@implementation SAArtist

- (instancetype)init:(NSDictionary *)json {
	self = [super init];
	if (self) {
		self.spotifyName = json;
	}
	return self;
}

@end
