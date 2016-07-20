//
//  AddressBook.h
//  addressbook2
//
//  Created by Ming-Han Chang on 2016/4/3.
//  Copyright © 2016年 Ming-Han Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "addresscard.h"

@interface AddressBook : NSObject
@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;

-(instancetype) initWithName: (NSString *) name;
-(void) addCard: (AddressCard *) theCard;
-(void) removeCard: (AddressCard *) theCard;
-(NSUInteger) entries;
-(void) list;
-(AddressCard *) lookup: (NSString *) theName;
-(NSIndexSet *) lookupAll: (NSString *) theName;
-(void) sort;
@end
