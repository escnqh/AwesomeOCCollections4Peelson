//
//  MainPageContact.h
//  AwesomeOCCollections4Peelson
//
//  Created by Peelson on 2019/10/22.
//  Copyright © 2019 Peelson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^OnClickListener)(void);

@interface Collection : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) OnClickListener onClickListener;

- (Collection *)initWithTitle:(NSString *)title andSummary:(NSString *)summary;

- (NSString *)getTitle;
- (NSString *)getSummary;

+ (Collection *)initWithTitle:(NSString *)title andSummary:(NSString *)summary;
@end

NS_ASSUME_NONNULL_END
