//
//  ViewController.m
//  iWeather
//
//  Created by Nguyen Thanh Duc on 10/15/15.
//  Copyright © 2015 Duc Nguyen. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *celcius;


@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    quotes = @[@"Di mot ngay dang hoc mot sang khon", @"Uong nuoc nho nguon", @"Cong cha nhu nui thai son", @"Nghia me nhu nuoc trong nguon chay ra",@"Sinh ra ngheo khong co toi Chet vi ngheo moi la toi"];
    
    locations = @[@"Hai Ba Trung, HaNoi", @"Xin Feng, Taiwan",@"New York, USA"];
    
    photoFiles = @[@"windy", @"thunder", @"sunny", @"rain"];
    
    _celcius.text = @"C";
   

}
- (IBAction)updateWeather:(id)sender {
    int locationIndex = arc4random_uniform((int)locations.count);
    self.location.text = locations[locationIndex];
    int quoteIndex = arc4random_uniform((int)quotes.count);
    self.quote.text = quotes[quoteIndex];
    int photoIndex = arc4random_uniform((int)photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:(photoFiles[photoIndex])];
    NSString* string = [NSString stringWithFormat:@"%2.1f",[self getTemperature]];
    [self.temperature setTitle: string forState: UIControlStateNormal];
}
- (float) getTemperature{
    return 15.0 + arc4random_uniform(16) + (float)arc4random() /(float) INT32_MAX;

}


- (IBAction)Taptemperature:(id)sender
{
    if ([_celcius.text  isEqual: @"C"]) {
        _celcius.text = @"F";
    }
    else {
        _celcius.text = @"C";
    }
    
    NSString* string1 = [NSString stringWithFormat:@"%2.1f",[self touchTemperature]];
    [self.temperature setTitle: string1 forState:UIControlStateNormal];

}
- (float) touchTemperature
{
        return 20.0 + arc4random_uniform(16) + (float)arc4random() /(float) INT32_MAX;
    
}
@end
