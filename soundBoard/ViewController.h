//
//  ViewController.h
//  soundBoard
//
//  Created by Music2 on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>
{
    NSMutableArray *players;
}
@property (nonatomic, retain) NSMutableArray *players;

-(IBAction)buttonPressed:(id)sender;
-(IBAction)displayAbout;
-(IBAction)playYoutube;

@end
