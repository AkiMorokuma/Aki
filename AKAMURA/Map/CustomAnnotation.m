//
//  CustomAnnotation.m
//  Map ver2
//
//  Created by araki kenta on 2013/09/19.
//  Copyright (c) 2013年 araki kenta. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

@synthesize coordinate;
@synthesize annotationTitle;
@synthesize annotationSubtitle;

- (NSString *)title {
    return annotationTitle;
}

- (NSString *)subtitle {
    return annotationSubtitle;
}

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle subtitle:(NSString *)_annotationSubtitle {
    coordinate = _coordinate;
    self.annotationTitle = _annotationTitle;
    self.annotationSubtitle = _annotationSubtitle;
    return self;
}

@end
