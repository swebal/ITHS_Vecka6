//
//  ViewController.h
//  Vecka6
//
//  Created by Markus on 2019-02-05.
//  Copyright © 2019 The App Factory AB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITextView *dataTextView;
@property (weak, nonatomic) IBOutlet UITextView *searchResultTextView;

- (IBAction)textChanaged:(UITextField *)sender;
- (IBAction)returnPressed:(UITextField *)sender;

@end

