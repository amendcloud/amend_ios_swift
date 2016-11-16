//
//  GlobalFunction.h
//  CloudAmend
//
//  Created by admin on 27/09/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalFunction : NSObject



-(NSDictionary *) getDataFromPlist;
-(NSArray *) getKeysFromPlist;
-(NSDictionary *) getDictionary:(NSString *)key;
-(NSArray *) getArray:(NSString *)key;


@end
