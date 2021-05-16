//
//  ViewController.h
//  IPTypePicker
//
//  Created by Eric Kampman on 5/15/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource>

@property UInt8 family;
@property (weak, nonatomic) IBOutlet UIPickerView *familyPicker;

@end

