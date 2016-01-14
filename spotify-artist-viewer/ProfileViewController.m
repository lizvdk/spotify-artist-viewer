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

@end

@implementation ProfileViewController {
//	SAArtist *spotifyArtist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = _spotifyArtist.spotifyName;
//	[self search:_spotifyArtist.spotifyID];
	[self search:@"ARH6W4X1187B99274F"];

	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)search:(NSString*)query {
	NSString *enEndpoint = [NSString stringWithFormat:@"https://developer.echonest.com/api/v4/artist/biographies?api_key=QKSXKY1V55I8HRTJK&id=%@&format=json&results=1&start=0&license=cc-by-sa", query];
	
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
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
