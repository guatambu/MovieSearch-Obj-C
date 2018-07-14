//
//  MGDMovieController.m
//  MovieSearch-Obj-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/14/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDMovieController.h"
#import "MGDMovie.h"
#import <UIKit/UIKit.h>

#pragma local properties

// example URL for TMDB search with "star wars" search term
// https://api.themoviedb.org/3/search/movie?api_key=9d2b65148c48ec092a601516a168a71b&language=en-US&query=star%20wars&page=1&include_adult=false

// example URL formovie poster image fetch
// https://image.tmdb.org/t/p/w500/btTdmkgIvOi0FFip1sPuZI2oQG6.jpg

static NSString *baseURLAsString = @"https://api.themoviedb.org/3/search/movie";
static NSString *apiKey = @"api_key";
static NSString *apiValue = @"9d2b65148c48ec092a601516a168a71b";
static NSString *languageKey = @"language";
static NSString *languageValue = @"en-US";
static NSString *queryKey = @"query";
static NSString *pageKey = @"page";
static NSString *pageValue = @"1";
static NSString *includeAdultKey = @"include_adult";
static NSString *includeAdultValue = @"false";

static NSString *imageBaseURLAsString = @"http://image.tmdb.org/t/p/w500/";

#pragma implementation

@implementation MGDMovieController

#pragma search term URL builder function

+(NSURL *)buildURLWithSearchTerm:(NSString *)searchTerm
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:apiKey value:apiValue];
    NSURLQueryItem *languageQueryItem = [NSURLQueryItem queryItemWithName:languageKey value:languageValue];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:queryKey value:searchTerm];
    NSURLQueryItem *pageQueryItem = [NSURLQueryItem queryItemWithName:pageKey value:pageValue];
    NSURLQueryItem *includeAdultQueryItem = [NSURLQueryItem queryItemWithName:includeAdultKey value:includeAdultValue];
    
    components.queryItems = [NSArray arrayWithObjects:apiQueryItem, languageQueryItem, queryItem, pageQueryItem, includeAdultQueryItem, nil];
    
    NSURL *searchTermURL = components.URL;
    
    return searchTermURL;
}


#pragma image URL builder function

+(NSURL *)buildImageURLWithPath:(NSString *)path
{
    NSURL *imageBaseURL = [NSURL URLWithString:imageBaseURLAsString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:imageBaseURL resolvingAgainstBaseURL:true];
    
    components.path = path;
    
    NSURL *imageURL = components.URL;
    
    return imageURL;
}


#pragma GET movie object from TMDB API

+(void)fetchMoviesWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray *, NSError *))completion
{
    NSURL *searchURL = [MGDMovieController buildURLWithSearchTerm:searchTerm];
    
    [[NSURLSession sharedSession]dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"There was an error > MGDMovieController line 80: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"There was no data > MGDMovieController line 90: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSDictionary *movieResultsDictionaries = jsonDictionary[@"results"];
        
        NSMutableArray *movies = [NSMutableArray array];
        
        for (NSDictionary *movieResult in movieResultsDictionaries) {
            MGDMovie *newMovie = [[MGDMovie alloc] initWithJSONDictionary:movieResult];
            [movies addObject:newMovie];
        }
        
        completion(movies, nil);
        
    }].resume;
}


#pragma GET movie image data from TMDB API

+(void) fetchMoviePosterImageWithPath:(NSString *)imagePath completion:(void(^)(UIImage *moviePoster, NSError *error))completion
{
    
    NSURL *imageURL = [MGDMovieController buildImageURLWithPath:imagePath];
    
    [[NSURLSession sharedSession]dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error > MGDMovieController line 120: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"There was no data > MGDMovieController line 126: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        UIImage *moviePoster = [UIImage imageWithData:data];
        
        completion(moviePoster, nil);
        
    }].resume;
}

@end










































