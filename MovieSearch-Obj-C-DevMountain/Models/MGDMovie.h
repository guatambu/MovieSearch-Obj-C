//
//  MGDMovie.h
//  MovieSearch-Obj-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/14/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDMovie : NSObject

#pragma properties

// The cell for a movie includes the title of the movie.
@property (nonatomic, readonly)NSString *title;
// The cell for a movie includes the rating (1-10) for the movie.
@property (nonatomic, readonly)NSNumber *rating;
// The cell for a movie includes a short description of the movie.
@property (nonatomic, readonly)NSString *movieDescription;
// Add a poster image for the movie to the table view cell.
@property (nonatomic, readonly)NSString *posterImagePath;


#pragma initializers

// fundamental Movie object initializer
-(instancetype)initWithTitle:(NSString *)title
                      rating:(NSNumber *)rating
            movieDescription:(NSString *)movieDescription
              posterImagePath:(NSString *)posterImagePath;

// initializer via JSON dictionary
-(instancetype)initWithJSONDictionary:(NSDictionary *)dictionary;

@end










































