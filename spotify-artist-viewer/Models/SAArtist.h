//
//  SAArtist.h
//  spotify-artist-viewer
//
//  Copyright (c) 2015 Intrepid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAArtist : NSObject

- (instancetype)init:(NSDictionary*)json;

@property NSString *spotifyName;
@property NSString *spotifyID;
@property NSString *spotifyBiography;
// TODO: spotifyImage property

@end
