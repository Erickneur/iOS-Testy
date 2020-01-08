//
//  ViewController.m
//  Tap Me
//
//  Created by Erick Dávila on 12/26/19.
//  Copyright © 2019 Erick Dávila. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (nonatomic,strong)AVAudioPlayer *buttonBeep;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    
    [self setupGame];
}

- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type {
  // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
  NSURL *url = [NSURL fileURLWithPath:path];

  // 2
  NSError *error;

  // 3
  AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];

  // 4
  if (!audioPlayer) {
    NSLog(@"%@",[error description]);
  }

  // 5
  return audioPlayer;
}


- (IBAction)buttonPressed {
    //scoreLabel.text = [NSString stringWithFormat:@"Pressed"];
    count++;
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%i", (int)count];
    [buttonBeep play];
}

- (void)setupGame {
    // 1
    seconds = 30;
    count = 0;
    
    // 2
    timerLabel.text = [NSString stringWithFormat:@"Time: %li", (long)seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%li", (long)count];
    
    // 3
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
    
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
}

- (void)subtractTime {
    // 1
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",(long)seconds];
    
    [secondBeep play];
    
    // 2
    if (seconds == 0) {
        [timer invalidate];

        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Time is up!"
            message:[NSString stringWithFormat:@"You scored %i points", (int)count]
            preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Play again" style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {[self setupGame];}];
        
        UIAlertAction* defaultActionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {self->playButton.enabled = NO;}];

        [alert addAction:defaultAction];
        [alert addAction:defaultActionCancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


@end
