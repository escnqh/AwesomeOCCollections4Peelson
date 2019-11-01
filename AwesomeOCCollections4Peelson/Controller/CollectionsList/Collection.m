//
//  MainPageContact.m
//  AwesomeOCCollections4Peelson
//
//  Created by Peelson on 2019/10/22.
//  Copyright © 2019 Peelson. All rights reserved.
//

#import "Collection.h"

@implementation Collection

- (Collection *)initWithTitle:(NSString *)title andSummary:(NSString *)summary {
    if (self = [super init]) {
        self.title = title;
        self.summary = summary;
    }
    return self;
}

- (NSString *)getTitle {
    return self.title;
}

- (NSString *)getSummary {
    return self.summary;
}

+ (Collection *)initWithTitle:(NSString *)title andSummary:(NSString *)summary {
    Collection *collection = [[Collection alloc] initWithTitle:title andSummary:summary];
    return collection;
}

@end
