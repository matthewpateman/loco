//
//  ViewController.m
//  LocoQuizz
//
//  Created by Matthew Pateman on 02/02/2013.
//  Copyright (c) 2013 Matthew Pateman. All rights reserved.
//

#import "ViewController.h"
#import "GameViewController.h"

@interface ViewController ()

@property CLLocationManager *locationManager;
@property CLLocationCoordinate2D myCoordinate;
@property IBOutlet UIButton *startGameButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [self.locationManager setDelegate:self];
    [self.locationManager startUpdatingLocation];
    [self.startGameButton setEnabled:YES];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *lastLocation = [locations lastObject];
    self.myCoordinate = [lastLocation coordinate];
    NSLog(@"location: %f, %f", self.myCoordinate.latitude, self.myCoordinate.longitude);
    [self.locationManager stopUpdatingLocation];
    NSLog(@"Finished updating location.");
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"Going into game!");
    GameViewController *gameVC = segue.destinationViewController;
    [gameVC setUserLocation:self.myCoordinate];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
