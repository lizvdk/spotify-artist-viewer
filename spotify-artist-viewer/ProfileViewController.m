//
//  ProfileViewController.m
//  spotify-artist-viewer
//
//  Created by Liz Vanderkloot on 1/14/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

#import "ProfileViewController.h"
#import "SAArtist.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UIImageView *artistImageView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.edgesForExtendedLayout = UIRectEdgeNone;
	self.title = _spotifyArtist.spotifyName;
	
	[self search:_spotifyArtist.spotifyID];
}

- (void)search:(NSString*)query {
	NSString *enEndpoint = [NSString stringWithFormat:@"https://developer.echonest.com/api/v4/artist/biographies?api_key=QKSXKY1V55I8HRTJK&id=spotify:artist:%@&format=json&results=1&start=0&license=cc-by-sa", query];
	
	NSURLSession *session = [NSURLSession sharedSession];
	NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:enEndpoint] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

		self.spotifyArtist.spotifyBiography = json[@"response"][@"biographies"][0][@"text"];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[self updateBio];
		});
	}];
 
	[dataTask resume];
	
}

- (void)updateBio {
	self.bioTextView.text = self.spotifyArtist.spotifyBiography;
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		
		NSString *ImageURL = self.spotifyArtist.spotifyImageURL;
		NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
		self.artistImageView.image = [UIImage imageWithData:imageData];
	});
}

@end
