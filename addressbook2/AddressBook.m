//
//  AddressBook.m
//  addressbook2
//
//  Created by Ming-Han Chang on 2016/4/3.
//  Copyright © 2016年 Ming-Han Chang. All rights reserved.
//

#import "AddressBook.h"
#import "addresscard.h"

@implementation AddressBook
@synthesize bookName, book;

//set up the AddressBook's name and an empty book
-(instancetype) initWithName: (NSString *) name
{
    self = [super init];
    if (self)
    {
        bookName =[NSString stringWithString: name];
        book = [NSMutableArray array];
    }
    return self;
}

-(instancetype) init
{
    return [self initWithName: @"NoName"];
}

-(void) addCard: (AddressCard *) theCard
{
    [book addObject: theCard];
}

-(void) removeCard: (AddressCard *) theCard
{
    [book removeObjectIdenticalTo: theCard];
}

-(NSUInteger) entries
{
    return  [book count];
}

-(void) list
{
    NSLog(@"=====Contents of: %@ ======", bookName);
    for (AddressCard *thisCard in book)
       NSLog(@"%-20s    %-32s", [thisCard.name UTF8String], [thisCard.email UTF8String]);
/*    [self enumerateObjectsUsingBlock: ^(AddressCard *thisCard, NSUInteger idx, BOOL *stop){
        NSLog(@"%-20s   %-32s", [thisCard.name UTF8String], [thisCard.email UTF8String]);
  */
        NSLog(@"===========================");
    //    }

  //   ];
}

-(AddressCard *) lookup: (NSString *) theName
{
    //method 1
/*    for (AddressCard *nextCard in book)
        if ([nextCard.name caseInsensitiveCompare: theName] == NSOrderedSame)
            return nextCard;
        
        return nil;
*/
    //method 2 (NSIndexSet)
     NSUInteger result = [book indexOfObjectPassingTest:
                          ^(id obj, NSUInteger idx, BOOL *stop)
                          {
                              if ( [[obj name] caseInsensitiveCompare: theName] == NSOrderedSame )
                                  return YES;
                              else
                                  return NO; //keep looking
                          }];
    //see if we found a match
    if (result!= NSNotFound) //there should only be one elemnt
        return book[result];
    else
        return nil;
}

-(NSIndexSet *) lookupAll: (NSString *) theName
{
    NSIndexSet *result = [book indexOfObjectPassingTest:
                          ^(id obj, NSUInteger idx, BOOL *stop)
    {
        if ([[obj name] caseInsensitiveCompare: theName] == NSOrderedSame)
            return  YES; //found a match, keep going
        else
            return NO;
                          }];
    //return the result
    return result;
}

-(void) sort
{
    // using selector
   // [book sortUsingSelector: @selector(compareNames:)];
    
    //using block
    [book sortUsingComparator: ^(id obj1, id obj2){
        return [[obj1 name] compare: [obj2 name]];
    } ];
}
@end


