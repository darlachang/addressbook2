//
//  addresscard.m
//  addressbook2
//
//  Created by Ming-Han Chang on 2016/4/3.
//  Copyright © 2016年 Ming-Han Chang. All rights reserved.
//

#import "addresscard.h"

@implementation AddressCard
@synthesize name, email;

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail
{
    self.name = theName;
    self.email = theEmail;
}

-(void) print
{
    NSLog(@"=========================");
    NSLog(@"|                       |");
    NSLog(@"| %-31s |", [name UTF8String]);
    NSLog(@"| %-31s |", [email UTF8String]);
    NSLog(@"|                       |");
    NSLog(@"|                       |");
    NSLog(@"|                       |");
    NSLog(@"|    O            O     |");
    NSLog(@"=========================");
}

//compare the two names from the specified address cards
-(NSComparisonResult) compareNames: (id) element
{
    //ascending
    return [name compare:[element name]];
    //descending
    //return [[element name] compare:name];
}
@end
