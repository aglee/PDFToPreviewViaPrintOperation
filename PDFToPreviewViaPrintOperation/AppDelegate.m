//
//  AppDelegate.m
//  PDFToPreviewViaPrintOperation
//
//  Created by Andy Lee on 4/18/19.
//  Copyright © 2019 Andy Lee. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet NSTextView *viewToPreview;
@end

@implementation AppDelegate


#pragma mark - Action methods

- (IBAction)sendPDFToPreview:(id)sender
{
	NSPrintInfo *printInfo = [NSPrintInfo sharedPrintInfo];
	printInfo.jobDisposition = NSPrintPreviewJob;
	NSPrintOperation *printOperation =
		[NSPrintOperation printOperationWithView:self.viewToPreview
									   printInfo:printInfo];
	printOperation.showsPrintPanel = NO;

	// NOTE: runOperation is blocking. In real life, you should use
	// runOperationModalForWindow:delegate:didRunSelector:contextInfo:.
	[printOperation runOperation];
}

@end
