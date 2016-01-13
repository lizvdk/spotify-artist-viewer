//
//  SASearchTableViewController.m
//  spotify-artist-viewer
//
//  Created by Liz Vanderkloot on 1/13/16.
//  Copyright © 2016 Intrepid. All rights reserved.
//

#import "SASearchTableViewController.h"

@interface SASearchTableViewController ()

@end

@implementation SASearchTableViewController {
	UISearchController *searchController;
	NSMutableArray *spotifyArtists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setUpSearchController];
	[self search];
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

- (void)search {
	[super viewDidLoad];
 
	NSURLSession *session = [NSURLSession sharedSession];
	NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://api.spotify.com/v1/search?q=david+bowie&type=artist"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
		NSLog(@"%@", json);
	}];
 
	[dataTask resume];
}

#pragma mark - SearchDelegate

-(void) updateSearchResultsForSearchController:(UISearchController *)searchController {
	// Search code
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
