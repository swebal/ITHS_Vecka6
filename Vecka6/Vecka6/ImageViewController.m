//
//  ImageViewController.m
//  Vecka6
//
//  Created by Markus on 2019-02-05.
//  Copyright © 2019 The App Factory AB. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Jag vill att en image picker skall öppnas om jag trycker var som helst i vyn
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    [self.view addGestureRecognizer:tap];
    
    
    // När användaren har valt en bild, så skall den visas i hela vyn
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"img"];
    if (data) {
        UIImage *image = [UIImage imageWithData:data];
        [self showImage:image];
    }
}

- (void)showImage:(UIImage *)image {
    UIImageView *imageView = [self.view viewWithTag:100];
    if (!imageView) {
        imageView = [UIImageView new];
        imageView.tag = 100;
        imageView.frame = self.view.bounds;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:imageView];
    }
    imageView.image = image;
}

- (void)didTap:(UITapGestureRecognizer *)recognizer {
    NSLog(@"Did tap!");
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *pickedImage = info[UIImagePickerControllerOriginalImage];
    [self showImage:pickedImage];
    [picker dismissViewControllerAnimated:true completion:nil];
    // Save image?
    NSData *imgData = UIImagePNGRepresentation(pickedImage);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:imgData forKey:@"img"];
}

@end
