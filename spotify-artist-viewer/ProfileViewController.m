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

@end

@implementation ProfileViewController {
//	SAArtist *spotifyArtist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = _spotifyArtist.spotifyName;
	NSLog(@"%@", _spotifyArtist);
	_artistNameLabel.text = _spotifyArtist.spotifyName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
