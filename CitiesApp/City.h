//
//  City.h
//  CitiesApp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property NSString *id;
@property NSString *name;
@property int population;

-(id)initWithName:(NSString *)name population:(int)pop; 
-(void)description; 
@end


