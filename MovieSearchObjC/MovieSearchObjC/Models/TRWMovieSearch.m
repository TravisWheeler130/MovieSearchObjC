//
//  TRWMovieSearch.m
//  MovieSearchObjC
//
//  Created by Travis Wheeler on 10/11/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import "TRWMovieSearch.h"

static NSString * const titleKey = @"title";
static NSString * const ratingKey = @"vote_average";
static NSString * const overviewKey = @"overview";


@implementation TRWMovieSearch

- (TRWMovieSearch *)initWithTitle:(NSString *)title overview:(NSString *)overview rating:(NSNumber *)rating
{
    self = [super init];
    if (self)
    {
        _title = title;
        _overview = overview;
        _rating = rating;
    }
    return self;
}

@end

@implementation TRWMovieSearch (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[titleKey];
    NSNumber *rating = dictionary[ratingKey];
    NSString *overview = dictionary[overviewKey];
    return [self initWithTitle:title
                      overview:overview
                        rating:rating];
}

@end
