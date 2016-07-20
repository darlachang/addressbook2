//
//  main.m
//  addressbook2
//
//  Created by Ming-Han Chang on 2016/4/3.
//  Copyright © 2016年 Ming-Han Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "addresscard.h"
#import "AddressBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *aName = @"Darla Chang";
        NSString *aEmail = @"darlamhc@gmail.com";
        NSString *bName = @"Elon Musk";
        NSString *bEmail = @"musk@tesla.com";
        NSString *cName = @"MingHan Chang";
        NSString *cEmail = @"sweetteaoh@gmail.com";
        
        AddressCard *card1 = [[AddressCard alloc] init];
        AddressCard *card2 = [[AddressCard alloc] init];
        AddressCard *card3 = [[AddressCard alloc] init];
        AddressCard *myCard;
        //set up a new address book
        AddressBook *myBook = [[AddressBook alloc] initWithName: @"Darla's Address Book"];
        
        NSLog(@"Entries in address book after creation: %li", [myBook entries]);
        
        //set up 2 address cards
        [card1 setName: aName andEmail:aEmail];
        [card2 setName: bName andEmail:bEmail];
        [card3 setName: cName andEmail:cEmail];
        //[card1 print];
        //[card2 print];
        
        //add the cards to the address book
        [myBook addCard: card1];
        [myBook addCard: card2];
        [myBook addCard: card3];
        
        NSLog(@"Entries in address book after adding cards: %li", [myBook entries]);
        
        //list all the entries in the book now
        [myBook list];
        
        //Look up a person by name
        NSLog(@"MingHan Chang");
        myCard = [myBook lookup: @"MingHan Chang"];
        if (myCard != nil)
            [myCard print];
        else
            NSLog(@"Not found");
        
        //remove the entry from the phone book
        [myBook removeCard: myCard];
        [myBook list];
        
        //sort it and list it again
        [myBook sort];
        [myBook list];
     
        CGPoint myPoint;
        NSValue *pointObj;
        NSMutableArray *touchPoints = [NSMutableArray array];
        
        myPoint.x = 100;
        myPoint.y = 200;
        pointObj = [NSValue valueWithPoint: myPoint];
        [touchPoints addObject: pointObj];
        myPoint = [[touchPoints lastObject] pointValue];
    }
    return 0;
}
