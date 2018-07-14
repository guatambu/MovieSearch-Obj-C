//
//  MGDMovieController.h
//  MovieSearch-Obj-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/14/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGDMovie.h"

@interface MGDMovieController : NSObject

#pragma GET movies via search term

+(void) fetchMoviesWithSearchTerm:(NSString *)searchTerm completion:(void(^)(NSArray *movies, NSError *error))completion;


#pragma GET movie poster image based on path

+(void) fetchMoviePosterImageWithPath:(NSString *)imagePath completion:(void(^)(UIImage *moviePoster, NSError *error))completion

@end
