//
//  CustomAnnotationView.m
//  Map ver2
//
//  Created by araki kenta on 2013/09/19.
//  Copyright (c) 2013年 araki kenta. All rights reserved.
//

#import "CustomAnnotationView.h"
#import "CustomAnnotation.h"

@implementation CustomAnnotationView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    //[super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    //self.image = [UIImage imageNamed:@"hikouki.gif"]; //ピン画像変更
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
