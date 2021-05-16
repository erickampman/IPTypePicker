# IPTypePicker
Objective-C UIPickerView with an interesting way to wire up the mappings among indices, values, and strings.

I was brushing up on my objective-c skills and in trying to wire up a UIPickerView elegantly 
I ran into the problems of how to map NSArray indices, the displayed UIPickerView text, 
and the values that the text represents. 

Fundamentally NSArrays are inconvenient because the contained items are objects. 
NSDictionaries are inconvenient because they are unordered. 

What I would normally do in C code would be to create arrays of name-value pairs, and
then a bit of an API to get the mappings from index -> string, and all the other pernutataions. 

In this case it looked to me like NSValue objects would save the day, and I found some interesting
code in Apple's documentation for extending NSValue to cover my own struct types. 

C literal initializers have to be located at the point of definition, so that makes for a challenge 
when one wants to create an NSArray of NSValue of MyStructType and define all the values "at once". 
However, because of improvements to C literal initialzer syntax one can do the following:

(AFFamily){ .name = @"IPv6", .family = AF_INET6 }

This specifies the struct type (AFFamily) and the struct's values. From here it's a simple matter 
to do this in Objective-C to bind an NSArray<NSValue> to a property:

	families = [NSArray arrayWithObjects:[NSValue valuewithAFFamily:(AFFamily){ .name = @"IPv4", .family = AF_INET }],
					     [NSValue valuewithAFFamily:(AFFamily){ .name = @"IPv6", .family = AF_INET6 }],
					     nil];
                      
This works well. Look at ViewController::viewDidLoad for how this is wired up to a UIPickerView. 

