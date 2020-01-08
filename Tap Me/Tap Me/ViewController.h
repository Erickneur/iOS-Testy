//
//  ViewController.h
//  Tap Me
//
//  Created by Erick Dávila on 12/26/19.
//  Copyright © 2019 Erick Dávila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController {
    IBOutlet UILabel * scoreLabel;
    IBOutlet UILabel * timerLabel;
    IBOutlet UIButton * playButton;
    
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
    // Add these AVAudioPlayer objects!
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;
}

- (IBAction) buttonPressed;

@end

