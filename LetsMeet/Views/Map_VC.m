//
//  Map_VC.m
//  LetsMeet
//
//  Created by Polaris on 12/9/15.
//  Copyright (c) 2015 Anton. All rights reserved.
//

#import "Map_VC.h"
#import <MapKit/MapKit.h>
#import "Place.h"
#import "PlaceMark.h"

@interface Map_VC ()<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *locationMap;

@property (strong, nonatomic) IBOutlet UIButton *btnNavigate;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;

@end

@implementation Map_VC{
    
    NSArray *userLongitude, *userLatitude;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _locationMap.delegate = self;
    
    _btnNavigate.layer.cornerRadius = 10;
    _btnNavigate.clipsToBounds = YES;
    
    _btnBack.layer.cornerRadius = 10;
    _btnBack.clipsToBounds = YES;
    
    userLongitude = [NSArray arrayWithObjects:@"21.024217", @"21.027656", @"21.041094", @"21.026896", @"21.043048", @"21.039958", nil];
    
    userLatitude = [NSArray arrayWithObjects:@"52.237822", @"52.241395", @"52.244859", @"52.239057", @"52.236031", @"52.230801", nil];
}
-(void)viewWillAppear:(BOOL)animated{
    
    for (int i = 0; i < [userLatitude count]; i++) {
        
        Place *home = [[Place alloc] init];
        home.name = @"frined1";
        home.description = @"friend1";
        home.latitude = [[userLatitude objectAtIndex:i]  floatValue];
        home.longitude = [[userLongitude objectAtIndex:i] floatValue];
        PlaceMark* from = [[PlaceMark alloc] initWithPlace:home];

        from.isMain = 1;
        
        from.tag = i + 1;
        [_locationMap addAnnotation:from];

    }
    
    [self zoomMapViewToFitAnnotations:_locationMap animated:animated];

}

- (void)zoomMapViewToFitAnnotations:(MKMapView *)mapView animated:(BOOL)animated {
    
    NSArray *annotations = mapView.annotations;
    int count = (int)[mapView.annotations count];
    if ( count == 0) { return; } //bail if no annotations
    
    //convert NSArray of id <MKAnnotation> into an MKCoordinateRegion that can be used to set the map size
    //can't use NSArray with MKMapPoint because MKMapPoint is not an id
    
    MKMapPoint points[count]; //C array of MKMapPoint struct
    
    for( int i=0; i<count-1; i++ ) //load points C array by converting coordinates to points
    {
        CLLocationCoordinate2D coordinate = [(id <MKAnnotation>)[annotations objectAtIndex:i] coordinate];
        points[i] = MKMapPointForCoordinate(coordinate);
    }
    
    
    
    //create MKMapRect from array of MKMapPoint
    
    MKMapRect mapRect = [[MKPolygon polygonWithPoints:points count:count] boundingMapRect];
    //convert MKCoordinateRegion from MKMapRect
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(mapRect);
    
    //add padding so pins aren't scrunched on the edges
    region.span.latitudeDelta  *= ANNOTATION_REGION_PAD_FACTOR;
    region.span.longitudeDelta *= ANNOTATION_REGION_PAD_FACTOR;
    region.center.latitude = appController.user_current_latitude;
    region.center.longitude = appController.user_current_longitude;
    //but padding can't be bigger than the world
    if( region.span.latitudeDelta > MAX_DEGREES_ARC ) { region.span.latitudeDelta  = MAX_DEGREES_ARC; }
    if( region.span.longitudeDelta > MAX_DEGREES_ARC ){ region.span.longitudeDelta = MAX_DEGREES_ARC; }
    
    //and don't zoom in stupid-close on small samples
    if( region.span.latitudeDelta  < MINIMUM_ZOOM_ARC ) { region.span.latitudeDelta  = MINIMUM_ZOOM_ARC; }
    if( region.span.longitudeDelta < MINIMUM_ZOOM_ARC ) { region.span.longitudeDelta = MINIMUM_ZOOM_ARC; }
    //and if there is a sample of 1 we want the max zoom-in instead of max zoom-out
    if( count == 1 )
    {
        region.span.latitudeDelta = MINIMUM_ZOOM_ARC;
        region.span.longitudeDelta = MINIMUM_ZOOM_ARC;
    }
    [mapView setRegion:region animated:animated];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        map.showsUserLocation = YES;
        return nil;
    }
    MKAnnotationView *pin = (MKAnnotationView *) [self.locationMap dequeueReusableAnnotationViewWithIdentifier: @"Spot"];
    if (pin == nil){
        pin = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier: @"Spot"];
        
    } else{
        pin.annotation = annotation;
    }
    pin.canShowCallout = YES;
    pin.userInteractionEnabled = NO;
    PlaceMark *ann = (PlaceMark *)annotation;
    NSString *pinImageStr = [[NSString alloc] init];
    if (ann.isMain == 1) {
        pinImageStr = @"userpin";
    }
    pin.image = [UIImage imageNamed:pinImageStr];
//    pin.tag = ann.tag;
    
//    if (pin.tag > 0) {
//        
//        UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [disclosureButton setFrame:CGRectMake(0, 0, 10, 20)];
//        UIImage *btnImage = [UIImage imageNamed:@"arrow_on.png"];
//        [disclosureButton setImage:btnImage forState:normal];
//        pin.rightCalloutAccessoryView = disclosureButton;
//        
//        UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [imageButton setFrame:CGRectMake(0, 0, 40, 40)];
//        btnImage = [self.photoData objectAtIndex:(pin.tag - 1)];
//        [imageButton setImage:btnImage forState:normal];
//        pin.leftCalloutAccessoryView = imageButton;
//        
//    }
    //pin.pinColor = MKPinAnnotationColorRed;
    
    //pin.animatesDrop = NO;
    //    CGRect frame = CGRectMake(2, 2, 20, 20);
    //    UILabel *spot = [[UILabel alloc] initWithFrame:frame];
    //    [ spot setFont:[UIFont systemFontOfSize:10]];
    //    spot.textAlignment = NSTextAlignmentCenter;
    //    spot.textColor = [UIColor whiteColor];
    //    NSUInteger indexVal = [map.annotations indexOfObject:annotation];
    
    //    spot.text = [NSString stringWithFormat:@"%ld",indexVal+1];
    //
    //    [ pin addSubview:spot];
    
    return pin;
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView;
    
    for (annotationView in views) {
        
        // Don't pin drop if annotation is user location
        if ([annotationView.annotation isKindOfClass:[MKUserLocation class]]) {
            continue;
        }
        
        // Check if current annotation is inside visible map rect, else go to next one
        MKMapPoint point =  MKMapPointForCoordinate(annotationView.annotation.coordinate);
        if (!MKMapRectContainsPoint(_locationMap.visibleMapRect, point)) {
            continue;
        }
        
        CGRect endFrame = annotationView.frame;
        
        // Move annotation out of view
        annotationView.frame = CGRectMake(annotationView.frame.origin.x, annotationView.frame.origin.y - self.view.frame.size.height, annotationView.frame.size.width, annotationView.frame.size.height);
        
        // Animate drop
        [UIView animateWithDuration:0.4
                              delay:0.04*[views indexOfObject:annotationView]
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             annotationView.frame = endFrame;
                             
                             // Animate squash
                         }
                         completion:^(BOOL finished){
                             if (finished) {
                                 [UIView animateWithDuration:0.1
                                                  animations:^{
                                                      annotationView.transform = CGAffineTransformMakeScale(1.0, 0.8);
                                                      
                                                  }
                                                  completion:^(BOOL finished){
                                                      if (finished) {
                                                          [UIView animateWithDuration:0.1 animations:^{
                                                              annotationView.transform = CGAffineTransformIdentity;
                                                          }];
                                                      }
                                                  }];
                             }
                         }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
