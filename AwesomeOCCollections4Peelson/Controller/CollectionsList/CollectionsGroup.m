//
//  MainPageContactGroup.m
//  AwesomeOCCollections4Peelson
//
//  Created by Peelson on 2019/10/22.
//  Copyright © 2019 Peelson. All rights reserved.
//

#import "CollectionsGroup.h"

@implementation CollectionsGroup

- (CollectionsGroup *)initWithGroupName:(NSString *)groupName andCollections:(nonnull NSMutableArray *)collections{
    if (self = [super init]) {
        self.groupName = groupName;
        self.collections = collections;
    }
    return self;
}

+ (CollectionsGroup *)initWithGroupName:(NSString *)groupName andCollections:(nonnull NSMutableArray *)collections{
    return [[CollectionsGroup alloc]initWithGroupName:groupName andCollections:collections];
}

@end
