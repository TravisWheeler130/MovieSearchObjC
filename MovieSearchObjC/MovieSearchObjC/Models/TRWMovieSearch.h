//
//  TRWMovieSearch.h
//  MovieSearchObjC
//
//  Created by Travis Wheeler on 10/11/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRWMovieSearch : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *overview;
@property (nonatomic, readonly, copy) NSNumber *rating;

- (TRWMovieSearch *)initWithtitle:(NSString *)title
                         overview:(NSString *)overview
                           rating:(NSNumber *)rating;

@end

@interface TRWMovieSearch (JSONConvertable)

-(instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
