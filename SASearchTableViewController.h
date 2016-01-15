//
//  SASearchTableViewController.h
//  spotify-artist-viewer
//
//  Created by Liz Vanderkloot on 1/13/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SASearchTableViewController : UITableViewController

@property (nonatomic) UISearchController *searchController;
@property (nonatomic) NSMutableArray *spotifyArtists;

@end
