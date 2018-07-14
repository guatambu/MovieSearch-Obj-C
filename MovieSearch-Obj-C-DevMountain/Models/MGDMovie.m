//
//  MGDMovie.m
//  MovieSearch-Obj-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/14/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDMovie.h"


@implementation MGDMovie

#pragma initializers

// https://api.themoviedb.org/3/search/movie?api_key=9d2b65148c48ec092a601516a168a71b&language=en-US&query=star%20wars&page=1&include_adult=false

// fundamental Movie object initializer
-(instancetype)initWithTitle:(NSString *)title
                      rating:(NSNumber *)rating
            movieDescription:(NSString *)movieDescription
              posterImagePath:(NSString *)posterImagePath
{
    self = [super init];
    if (self) {
        _title = title;
        _rating = rating;
        _movieDescription = movieDescription;
        _posterImagePath = posterImagePath;
    }
    return self;
}

// initializer via JSON dictionary
-(instancetype)initWithJSONDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[[MGDMovie title]];
    NSNumber *rating = dictionary[[MGDMovie rating]];
    NSString *movieDescription = dictionary[[MGDMovie movieDescription]];
    NSString *posterImagePath = dictionary[[MGDMovie posterImagePath]];
    
    return [self initWithTitle:title
                        rating:rating
              movieDescription:movieDescription
               posterImagePath:posterImagePath];
}

+ (NSString *)title
{
    return @"title";
}

+ (NSString *)rating
{
    return @"vote_average";
}

+ (NSString *)movieDescription
{
    return @"overview";
}

+ (NSString *)posterImagePath
{
    return @"poster_path";
}









































@end
