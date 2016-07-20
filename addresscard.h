//
//  addresscard.h
//  addressbook2
//
//  Created by Ming-Han Chang on 2016/4/3.
//  Copyright © 2016年 Ming-Han Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject
@property (copy, nonatomic) NSString *name, *email;
-(void) setName:(NSString *) theName andEmail: (NSString *) theEmail;
-(void) print;
-(NSComparisonResult) compareNames: (id) element;
@end
