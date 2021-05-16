//
//  ViewController.m
//  IPTypePicker
//
//  Created by Eric Kampman on 5/15/21.
//

#import "ViewController.h"
#import "NSValue+AFFamily.h"

#import <Network/Network.h>

@interface ViewController () {
	NSArray<NSValue*> *families;
}
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	families = [NSArray arrayWithObjects:[NSValue valuewithAFFamily:(AFFamily){ .name = @"IPv4", .family = AF_INET }],
										 [NSValue valuewithAFFamily:(AFFamily){ .name = @"IPv6", .family = AF_INET6 }],
										  nil];
	
	self.family = AF_INET;
	[self.familyPicker selectRow:0 inComponent:0 animated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
	return 1;	// # of columns
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [families count];
}

- (NSString*)pickerView:(nonnull UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [families[row] afFamilyValue].name;
}

- (void)pickerView:(nonnull UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	self.family = [families[row] afFamilyValue].family;
	NSLog(@"Family set to %d", self.family);
}

@end
