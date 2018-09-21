//
//  TableViewController.m
//  CitiesApp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "TableViewController.h"
#import "City.h"

@interface TableViewController ()

@property NSMutableArray *cities;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cities = [[NSMutableArray alloc]init];
    [self loadInitialData];
    
    NSURL *url = [NSURL URLWithString:@"http://cities.jonkri.se/"];
    

    
}

-(void)loadInitialData{
 
    City *item1 = [[City alloc]initWithName:@"Stockholm" population:1372565];
    City *item2 = [[City alloc]initWithName:@"Göteborg" population:549839];
    City *item3 = [[City alloc]initWithName:@"Malmö" population:280415];
    
    [self.cities addObject:item1];
    [self.cities addObject:item2];
    [self.cities addObject:item3];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"ListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    City *item = self.cities[indexPath.row];
    
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", item.population]; 
    
    return cell;
}

@end
