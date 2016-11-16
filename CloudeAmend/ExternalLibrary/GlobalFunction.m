//
//  GlobalFunction.m
//  CloudAmend
//
//  Created by admin on 27/09/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

#import "GlobalFunction.h"

@implementation GlobalFunction


-(NSDictionary *) getDataFromPlist{
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CloudAmend" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    return dict;
}



-(NSArray *) getKeysFromPlist{
    NSDictionary *dict = [self getDataFromPlist];
    NSMutableArray *tableDataArray = [[NSMutableArray alloc] init];
    for (NSString* key in dict) {
        [tableDataArray addObject:key];
    }
    return tableDataArray;
}



-(NSDictionary *) getDictionary : (NSString *)key{
    NSDictionary *dict = [[self getDataFromPlist] mutableCopy];
  
    
    return dict[key];
}

-(NSArray *) getArray:(NSString *)key{

     NSDictionary *dict = [[self getDataFromPlist] mutableCopy];
    NSArray *keyValue =dict[key];
    
    return dict[key];
}



@end
