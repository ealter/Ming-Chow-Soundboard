//
//  ViewController.m
//  soundBoard
//
//  Created by Music2 on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize players;

-(IBAction)displayAbout
{
    NSString *aboutText = @"This app is a Ming Chow soundboard\n"
                            "Author: Eliot Alter\n"
                            "Version: 0.1";
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"About" message:aboutText delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [view show];
}

-(IBAction)playYoutube
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://m.youtube.com/watch?desktop_uri=%2Fwatch%3Fv%3DXZ5TajZYW6Y&amp;v=XZ5TajZYW6Y&amp;gl=US"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)buttonPressed:(id)sender
{
    UIButton* theButton = sender;
    int soundNum = theButton.tag;
    for(AVAudioPlayer *sound in players)
    {
        if([sound isPlaying])
        {
            [sound pause];
            [sound setCurrentTime:0];
        }
    }
    AVAudioPlayer *sound = [players objectAtIndex:soundNum];
    [sound play];
    NSLog(@"Playing sound %d", soundNum);
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int numSounds = 16;
        
    NSMutableArray* soundPlayers = [NSMutableArray arrayWithCapacity:numSounds];
    for(int i=0; i<numSounds; i++)
    {
        NSString *soundName = [NSString stringWithFormat:@"sound-%d", i];
        NSString* soundFilePath = [[NSBundle mainBundle] pathForResource:soundName ofType:@"mp3"];
        assert(soundFilePath);
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
        AVAudioPlayer* p = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        
        [p prepareToPlay];
        [p setDelegate:self];
        [soundPlayers addObject:p];
    }
    self.players = soundPlayers;
}

- (void)viewDidUnload
{
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
    return YES;
}

@end
