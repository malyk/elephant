//
//  FirstViewController.m
//  elephant
//
//  Created by Michael Abner on 2/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
@synthesize segment;
@synthesize memoriesList;
@synthesize memoriesCalendar;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    memoriesList.dataSource = memoriesList;
    memoriesList.delegate   = memoriesList;
    memories = [self loadMemories];
    memoriesList.memories = memories;
}

- (void)viewDidUnload
{
    [self setSegment:nil];
    [self setSegment:nil];
    [self setMemoriesList:nil];
    [self setMemoriesCalendar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)segmentDidChange:(id)sender {
     segment = (UISegmentedControl *) sender;
    if (segment.selectedSegmentIndex == 0) {
        [memoriesList setHidden:NO];
        [memoriesCalendar setHidden:YES];
    }
    else {
        [memoriesList setHidden:YES];
        [memoriesCalendar setHidden:NO];
    }
}

-(NSMutableArray *)loadMemories {
    memories = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        NSString *title = [[NSString alloc] initWithFormat:@"Memory #%i", i];
        NSString *date  = [[NSString alloc] initWithFormat:@"2012-01-0%i", i];
        [item setObject:title forKey:@"title"];
        [item setObject:date forKey:@"date"];
        [memories addObject:item];
    }
    return memories;
}

@end
