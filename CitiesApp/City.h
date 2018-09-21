//
//  City.h
//  CitiesApp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property NSString *ID;
@property NSString *name;
@property NSNumber *population;

-(NSString *)description; 
@end


