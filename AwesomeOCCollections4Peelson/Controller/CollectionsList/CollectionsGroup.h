//
//  MainPageContactGroup.h
//  AwesomeOCCollections4Peelson
//
//  Created by Peelson on 2019/10/22.
//  Copyright © 2019 Peelson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionsGroup : NSObject

@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, copy) NSMutableArray *collections;

- (CollectionsGroup *)initWithGroupName:(NSString *)groupName andCollections:(NSMutableArray *)collections;

+ (CollectionsGroup *)initWithGroupName:(NSString *)groupName andCollections:(NSMutableArray *)collections;
@end

NS_ASSUME_NONNULL_END
