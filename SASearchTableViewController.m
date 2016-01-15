//
//  SASearchTableViewController.m
//  spotify-artist-viewer
//
//  Created by Liz Vanderkloot on 1/13/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

#import "SASearchTableViewController.h"
#import "SAArtist.h"
#import "SAArtistTableViewCell.h"
#import "ProfileViewController.h"

@interface SASearchTableViewController ()

- (void)search:(NSString *)query;

@end

@implementation SASearchTableViewController {
	UISearchController *searchController;
	NSMutableArray *spotifyArtists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.tableView registerClass: [SAArtistTableViewCell class] forCellReuseIdentifier:@"artistCell"];
	spotifyArtists = [[NSMutableArray alloc] init];

	[self setUpSearchController];
	self.title = @"Spotify Artist Viewer";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Search

-(void) setUpSearchController {
	// Search controller
	searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
	searchController.searchResultsUpdater = self;
	searchController.dimsBackgroundDuringPresentation = NO;
	searchController.searchBar.delegate = self;
	
	// Add the search bar
	self.tableView.tableHeaderView = searchController.searchBar;
	self.definesPresentationContext = YES;
	[searchController.searchBar sizeToFit];
}

- (void)search:(NSString*)query {
	NSString *spotifyEndpoint = [NSString stringWithFormat:@"https://api.spotify.com/v1/search?q=%@&type=artist", query];
	NSURLSession *session = [NSURLSession sharedSession];
	NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:spotifyEndpoint] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		
		if (data != nil) {
			NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
			
			// Decode JSON and create SAArtist objects
			NSArray *artists = json[@"artists"][@"items"];
			NSMutableArray *tmp = [NSMutableArray array];
			for (int i = 0; i < [artists count]; ++i) {
				[tmp addObject:[[SAArtist alloc] init:artists[i][@"name"] spotifyID:artists[i][@"id"]]];
			}
			
			// Reload view with the new data
			[spotifyArtists removeAllObjects];
			[spotifyArtists addObjectsFromArray:tmp];
			[self.tableView reloadData];
		}

	}];
 
	[dataTask resume];
	
	
}

#pragma mark - SearchDelegate

-(void) updateSearchResultsForSearchController:(UISearchController *)searchController {
	NSString *query = searchController.searchBar.text;
	if (query.length != 0) { // I know this is wrong but somehow it works.
		[self search:query];
	};
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [spotifyArtists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    
	SAArtist *artist = [spotifyArtists objectAtIndex:indexPath.row];
	cell.textLabel.text = artist.spotifyName;
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ProfileViewController *profileViewController = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
	
    // Pass the selected object to the new view controller.
	profileViewController.spotifyArtist = [spotifyArtists objectAtIndex:indexPath.row];

	// Push the view controller.
    [self.navigationController pushViewController:profileViewController animated:YES];
}

@end
