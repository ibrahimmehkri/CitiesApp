//
//  City.m
//  CitiesApp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "City.h"

@implementation City

-(NSString *)description{
    return [NSString stringWithFormat:@"Name: %@, Population: %@", self.name, self.population]; 
}

@end
