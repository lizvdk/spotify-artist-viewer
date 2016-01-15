//
//  SAArtist.h
//  spotify-artist-viewer
//
//  Copyright (c) 2015 Intrepid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAArtist : NSObject

- (instancetype)init:(NSString*)name spotifyID:(NSString *)spotifyID;

@property NSString *spotifyName;
@property NSString *spotifyID;
@property NSString *spotifyBiography;
@property NSString *spotifyImageURL;

@end
