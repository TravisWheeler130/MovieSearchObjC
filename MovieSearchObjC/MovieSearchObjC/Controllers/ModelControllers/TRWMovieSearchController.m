//
//  TRWMovieSearchController.m
//  MovieSearchObjC
//
//  Created by Travis Wheeler on 10/11/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import "TRWMovieSearchController.h"

static NSString * const kBaseURLString = @"https://api.themoviedb.org/3/search/movie?api_key=";
static NSString * const kAPIKey = @"1319e8ab1587c2053ec061ec97482f2f";
static NSString * const kSearchName = @"&query=Star+Trek";

// https://api.themoviedb.org/3/search/movie?api_key=1319e8ab1587c2053ec061ec97482f2f&query=Star+Trek

@implementation TRWMovieSearchController

+ (instancetype)sharedController
{
    static TRWMovieSearchController * sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[TRWMovieSearchController alloc] init];
    });
    return sharedController;
}

- (void)fetchMovies:(void (^)(BOOL))completion
{
    NSURL * baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL * apiURL = [baseURL URLByAppendingPathComponent:kAPIKey];
    NSURL * searchFinalURL = [apiURL URLByAppendingPathComponent:kSearchName];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchFinalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"Long Error: %@\nSmall Error: %@", error.description, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"Error with fetching movie data");
            completion(false);
            return;
        }
       
        if (data)
        {
        NSArray *arrayOfMovieDictionaries = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error][@"results"];
            
            if (arrayOfMovieDictionaries == nil)
            {
                NSLog(@"Error: Dictionary didn't work: %@", error);
                return;
            }
            
            NSMutableArray *movieArray = [[NSMutableArray alloc] init];
            for (NSDictionary * movieDictionary in arrayOfMovieDictionaries)
            {
                TRWMovieSearch * movie = [[TRWMovieSearch alloc] initWithDictionary:movieDictionary];
                [movieArray addObject:movie];
            }
            completion(movieArray);
        }
        
    }]resume];
}

@end

