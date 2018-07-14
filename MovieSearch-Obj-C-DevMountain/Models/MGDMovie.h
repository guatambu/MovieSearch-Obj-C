//
//  MGDMovie.h
//  MovieSearch-Obj-C-DevMountain
//
//  Created by Michel Guatambu Davis on 7/14/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDMovie : NSObject

// The cell for a movie includes the title of the movie.
@property (nonatomic, readonly)NSString *title;
// The cell for a movie includes the rating (1-10) for the movie.
@property (nonatomic, readonly)NSNumber *rating;
// The cell for a movie includes a short description of the movie.
@property (nonatomic, readonly)NSString *movieDescription;
// Add a poster image for the movie to the table view cell.
@property (nonatomic, readonly)NSString *posterImageURL;

// fundamental Movie object initializer
+(instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating movieDescription:(NSString *)movieDescription posterImageURL:(NSString *)posterImageURL;

// initializer via JSON dictionary
+(instancetype)initWithJSONDictionary:(NSDictionary *)dictionary;

@end
