//
//  TRWMovieSearchController.h
//  MovieSearchObjC
//
//  Created by Travis Wheeler on 10/11/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRWMovieSearch.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRWMovieSearchController : NSObject

@property (nonatomic, copy) NSArray<TRWMovieSearch *> * movies;

+(instancetype) sharedController;

-(void)fetchMovies:(void (^)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
