//
//  City.m
//  CitiesApp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "City.h"

@implementation City

-(id)initWithName:(NSString *)name population:(int)pop{
    self = [super init];
    if(self){
        self.name = name;
        self.population = pop;
        self.id = @"Required";
    }
    return self; 
}

-(void)description{
    NSLog(@"Name: %@, Population: %i", self.name, self.population); 
}

@end
