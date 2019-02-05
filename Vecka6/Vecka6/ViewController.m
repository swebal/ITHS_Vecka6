//
//  ViewController.m
//  Vecka6
//
//  Created by Markus on 2019-02-05.
//  Copyright © 2019 The App Factory AB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *strings;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.strings = [NSMutableArray new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textChanaged:(UITextField *)sender {
    // Söka bland mina strängar och visa vilka som innehåller delar av söksträngen och visa dessa i min textvy "searchResultTextView"
    NSMutableString *mstring = [NSMutableString new];
    for (NSString *string in _strings) {
        if ([string.lowercaseString containsString:sender.text.lowercaseString]) {
            [mstring appendFormat:@"%@\n", string];
        }
    }
    _searchResultTextView.text = mstring;
}

- (IBAction)returnPressed:(UITextField *)sender {
    // Lägga till strängen bland mina strängar och visa hela "databasen" i textvyn "dataTextView"
    if (![_strings containsObject:sender.text]) {
        [_strings addObject:sender.text];
    }
    NSMutableString *mstring = [NSMutableString new];
    for (NSString *string in _strings) {
        [mstring appendFormat:@"%@\n", string];
    }
    _dataTextView.text = mstring;
}

@end

