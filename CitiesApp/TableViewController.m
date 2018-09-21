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
@property NSMutableArray *testData;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.cities = [[NSMutableArray alloc]init];
    
    [self loadInitialData];
    
    [self startLoad];

}
-(void)startLoad{
    NSURL *url = [NSURL URLWithString:@"http://cities.jonkri.se/"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
   
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if(data != nil){
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            for(NSDictionary *city in json){
                City *createdCity = [[City alloc]init];
                createdCity.ID = city[@"id"];
                createdCity.name = city[@"name"];
                createdCity.population = city[@"population"];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.cities addObject:createdCity];
                    [self.tableView reloadData];
                });
            }
        }
    }];
    
    [task resume];
}

-(void)loadInitialData{
    City *city1 = [[City alloc]init];

    city1.name = @"Gotham City";

    city1.population = @150000;
    
    [self.cities addObject:city1];
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

    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", item.population];
    
    return cell;
}

@end
