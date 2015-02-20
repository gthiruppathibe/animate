//
//  ViewController.m
//  CoreAnimationL
//
//  Created by Thiruppathi Gandhi on 20/02/15.
//  Copyright (c) 2015 Source bits. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic,strong) CALayer *dogLayer;
@property (nonatomic,strong) CALayer *boneLayer;
 
@end

@implementation ViewController

@synthesize dogLayer = _dogLayer;
@synthesize boneLayer = _boneLayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view.layer addSublayer:self.dogLayer];
    [self.view.layer addSublayer:self.boneLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CALayer*)dogLayer {
    if (!_dogLayer) {
        _dogLayer = [[CALayer alloc] init];
        _dogLayer.bounds = CGRectMake(0,0, 20, 20);
        _dogLayer.position = CGPointMake(160, 160);
        _dogLayer.zPosition = 0;
        _dogLayer.backgroundColor = [[UIColor clearColor] CGColor];
        
        UIImage *dogImage = [ViewController imageWithColor:[UIColor redColor]];
        struct CGImage *image = [dogImage CGImage];
        _dogLayer.contents = (__bridge id)image;
        _dogLayer.contentsRect = CGRectMake(-0.1, -0.1, 1.2, 1.4);
        _dogLayer.contentsGravity = kCAGravityResizeAspect;
        
    }
    return _dogLayer;
}



- (CALayer*)boneLayer {
    if (!_boneLayer) {
        _boneLayer = [[CALayer alloc] init];
        _boneLayer.bounds = CGRectMake(0,0, 20, 20);
        _boneLayer.position = CGPointMake(200, 200);
        _boneLayer.zPosition = 0;
        _boneLayer.backgroundColor = [[UIColor clearColor] CGColor];
        
        UIImage *dogImage = [ViewController imageWithColor:[UIColor greenColor]];
        struct CGImage *image = [dogImage CGImage];
        _boneLayer.contents = (__bridge id)image;
        _boneLayer.contentsRect = CGRectMake(-0.1, -0.1, 1.2, 1.4);
        _boneLayer.contentsGravity = kCAGravityResizeAspect;
        
    }
    return _boneLayer;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint curPos = [touch locationInView:self.view];
    
    CABasicAnimation *dogAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [dogAnimation setFromValue:[NSValue valueWithCGPoint:[[self.dogLayer presentationLayer] position]]];
    [dogAnimation setToValue:[NSValue valueWithCGPoint:curPos]];
    [dogAnimation setDuration:1.0];
    
    [self.dogLayer setPosition:curPos];
    [self.dogLayer addAnimation:dogAnimation forKey:@"dogAnimation"];
    [self.boneLayer setPosition:CGPointMake(curPos.x - 3,curPos.y- 3)];
    
}
                             
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
