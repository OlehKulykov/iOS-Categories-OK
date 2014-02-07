iOS-Categories-OK
=================


Installation
------------

1. Clone this repository.
2. Go to **framework** folder.
3. Execute build script.
```sh
git clone https://github.com/OlehKulykov/iOS-Categories-OK.git
cd iOS-Categories-OK/framework
./build_ios_static.sh
```


Linking framework with your project
-----------------------------------

1. Select required target
2. Select "**Build Phases**"
3. Press "**Add item**" button
4. Press "**Add Other...**" button
5. Locate "**iOSCategoriesOKSDK.framework**" and click "**Open**". As a result framework will be added to the list
6. Import **framework header** file to project **precompile header**
7. Add to "**Other Linker Flags**" next two flags: **-ObjC** **-all_load**

> **TIP:**
> 
>  This framework **required** linking standard iOS library called **libz.dylib**. Link this library with your project as described above.


Additional Dependencies
-----------------------

1. Standard iOS library **libz.dylib**


License
-------
Apache License
Version 2.0, January 2004
http://www.apache.org/licenses/


Functionality
-------------

### Foundation

* **NSArray**
 * ```BOOL NSArrayIsEmpty(NSArray * array)``` or ```+ (BOOL) isEmpty:(NSArray *)array``` Check is array has no objects or nil.
 * ```BOOL NSArrayIsNotEmpty(NSArray * array)``` or ```+ (BOOL) isNotEmpty:(NSArray *)array``` Check is array has objects and not nil.
 * ```id NSArrayObjectAtIndex(NSArray * array, const NSUInteger index)``` or ```+ (id) array:(NSArray *)array objectAtIndex:(NSUInteger)index``` Get array object at index. Return object or nil if array empty or index dosn't exists.
 * ```+ (NSUInteger) array:(NSArray *)array previousIndexFrom:(NSUInteger)index``` Get array previous index from started index. Return previous array index from started or NSNotFound on error.
 * ```+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index``` Get array next index from started index. Return next array index from started or NSNotFound on error.

* **NSData**
 * ```- (NSData *) zipCompressedDataWithRatio:(CGFloat)compressionRatio``` Get zip compressed data with compression ratio.
 * ```- (NSData *) zipDecompressedData``` Get zip decompressed data if this data is zip compressed.
 * ```+ (NSData *) zipCompressData:(NSData *) dataToCompress withRatio:(CGFloat)compressionRatio``` Get zip compressed data with compression ratio.
 * ```+ (NSData *) zipDecompressData:(NSData *) zipData``` Get zip decompressed data.
 * ```- (NSData *) dataFromBunbledFilePath:(NSString *) filePath``` Get bundled file data by file path.

* **NSDictionary**
 * ```- (NSData *) propertyListData``` Get text XML property list file data. Return property list file data as XML version 1.0.
 * ```- (NSData *) binaryPropertyListData``` Get binary property list file data.
 * ```+ (NSDictionary *) dictionaryWithPropertyListData:(NSData *) plistData``` Get dictionary from property list file data, XML or binary.
 * ```+ (NSData *) propertyListDataWithDictionary:(NSDictionary *) dictionary``` Get text XML property list file data from dictionary.
 * ```+ (NSData *) binaryPropertyListDataWithDictionary:(NSDictionary *) dictionary``` Get binary property list file data from dictionary.
 * ```- (NSNumber *) numberForKey:(id) aKey```  Number object or nil if finded object is not number or nil.
 * ```- (NSString *) stringForKey:(id) aKey``` String object or nil if finded object is not string or nil.
 * ```- (NSArray *) arrayForKey:(id) aKey``` Array object or nil if finded object is not array or nil.
 * ```- (NSDictionary *) dictionaryForKey:(id) aKey``` Dictionary object or nil if finded object is not dictionary or nil.

* **NSString**
 * ```BOOL NSStringIsEmpty(NSString * stringToTest)``` or ```+ (BOOL) isEmpty:(NSString *)stringToTest``` Check string is empty. YES if nil or length is 0, othervice NO.
 * ```BOOL NSStringIsNotEmpty(NSString * stringToTest)``` or ```+ (BOOL) isNotEmpty:(NSString *)stringToTest``` Check string is not empty. YES string has character and not nil, othervice NO.
 * ```BOOL NSStringIsFilePathExists(NSString * pathForTest)``` or ```+ (BOOL) isFilePathExists:(NSString *) pathForTest``` Check file path exists. YES path exists and not directory, othervice NO.
 * ```BOOL NSStringIsDirPathExists(NSString * pathForTest)``` or ```+ (BOOL) isDirPathExists:(NSString *) pathForTest``` Check directory path exists. YES path exists and is directory, othervice NO.
 * ```- (BOOL) isContainesSubstring:(NSString *)subString``` Check string containes not empty substring using case insensitive search. 
 * ```+ (NSString *) userDocumentPath``` Returns current user documents path.
 * ```+ (NSString *) userCachePath``` Returns current user cache path.
 * ```+ (NSString *) tempFileFullPath``` Returns temporary file path in users documents directory.
 * ```+ (NSString *) storageDirFullPathForClass:(Class) targetClass``` Existed path based on user document path with read/write permissions. 
 * ```+ (NSString *) uniqFileFullPathInDirectory:(NSString *) directoryPath``` Generates uniq file path in directory. Return string with nonexisted uniq file path in directory.

### UI

* **UIColor**
 * ```RGBAByteColor```  Structure for holding color RGBA components. Each RGBA component stored as 8 bit unsigned integer at the same time as 4 dimension array of the 8 bit components and one single unsigned 32 bit integer.
 * ```BOOL RGBAByteColorsIsEqual(const RGBAByteColor c1, const RGBAByteColor c2)``` Compare two color structures by them 32 bit unsigned integer representation.
 * ```RGBAByteColor RGBAByteColorMakeWithRGBBytes(const uint8_t red, const uint8_t green, const uint8_t blue)``` Create color structure from RGB components.
 * ```RGBAByteColor RGBAByteColorMakeWithRGBABytes(const uint8_t red, const uint8_t green, const uint8_t blue, const uint8_t alpha) ``` Create color structure from RGBA components.
 * ```RGBAByteColor RGBAByteColorMakeWithRGB(const float red, const float green, const float blue)``` Create color structure from RGB components.
 * ``` RGBAByteColor RGBAByteColorMakeWithRGBA(const float red, const float green, const float blue, const float alpha)``` Create color structure from RGBA components.
 * ``` UIColor * UIColorMakeWithRGB(uint8_t red, uint8_t green, uint8_t blue)``` Create color object from RGB components.
 * ```UIColor * UIColorMakeWithRGBA(uint8_t red, uint8_t green, uint8_t blue, uint8_t alpha)``` Create color object from RGBA components.
 * ```UIColor * UIColorMakeWithHEX(NSString * hexString)``` Create color object from HEX string. HEX string with format: @"FF00FF" or @"#FF00FF". Case is ignored.
 * ```- (RGBAByteColor) colorGetRGBAByteColor``` Get 8 bit unsigned integer RGBA structure.

* **UIImage**
 * ```+ (id) imageWithWebPData:(NSData *) data``` Creates image object from Google WebP image data.
 * ```+ (id) imageWithWebPData:(NSData *) data scale:(CGFloat) scale``` Creates image object from Google WebP image data scaled to size.
 * ```+ (id) imageWithContentsOfWebPFile:(NSString *) path``` Creates image object from Google WebP image data loaded from path.
 * ```+ (BOOL) isWebPData:(NSData *) data``` Check is data WebP image file.
 * ```- (NSData *) losslessWebPRepresentation``` Lossless encoding image to WebP image file data. 
 * ```- (NSData *) lossyWebPRepresentationWithCompressionQuality:(CGFloat) compressionQuality``` Lossy encoding image to WebP image file data with quality.
 * ```+ (NSData *) losslessWebPRepresentationOfImage:(UIImage *) image``` Lossless encoding image to WebP image file data.
 * ```+ (NSData *) lossyWebPRepresentation:(UIImage *) image withCompressionQuality:(CGFloat) compressionQuality``` Lossy encoding image to WebP image file data with quality.
 * ```+ (UIImage *) imageWithColor:(UIColor *) color andSize:(CGSize) size``` Creates and return opaque image filled with specific color.
 * ```+ (UIImage *) imageWithColor:(UIColor *) color size:(CGSize) size andOpaque:(BOOL) opaque``` Creates and return image filled with specific color. 

* **UIImageView**
 * ```- (NSThread *) loadFromURL:(NSURL *)url useActivityIndicator:(BOOL)isUseActivityIndicator activityIndicatorColor:(UIColor *)activityIndicatorColor withTarget:(id)target onStartSelector:(SEL)onStartSelector onDoneSelector:(SEL)onDoneSelector``` Loads image from URL in separate thread.

* **UITableView**
 * ```- (CGFloat) fullContentHeight``` Height of the table view content even if some cells is not visible or 0.0f if there is no data source.

* **UIView**
 * ```- (void) setBackgroundImage:(UIImage *)backgroundImage``` Set background image to the view layer using setContents. Image scales to content.
 * ```x```, ```y```, ```width```, ```height``` View read/write properties for the frame components.
 * ```- (id) subviewWithClass:(Class) svClass``` Subiew with reqired class type.

* **UIWebView**
 * ```- (CGSize) contentSize``` Web view content size.

### Common

* **CGRect**
 * ```CGRect CGRectSetTopRightOrigin(const CGRect rectangle, const CGFloat topRightX, const CGFloat topRightY)``` and ```CGRect CGRectSetTopRightOriginPoint(const CGRect rectangle, const CGPoint topRight)``` Sets top right origin of the rectangle.
 * ```CGRect CGRectSetBottomRightOrigin(const CGRect rectangle, const CGFloat bottomRightX, const CGFloat bottomRightY)``` and ```CGRectSetBottomRightOriginPoint(const CGRect rectangle, const CGPoint bottomRight)``` Sets bottom right origin of the rectangle.
 * ```CGRect CGRectSetBottomLeftOrigin(const CGRect rectangle, const CGFloat bottomLeftX, const CGFloat bottomLeftY)``` and ```CGRect CGRectSetBottomLeftOriginPoint(const CGRect rectangle, const CGPoint bottomLeft)``` Sets bottom left origin of the rectangle.
 * CGRect CGRectSetCenter(const CGRect rectangle, const CGFloat centerX, const CGFloat centerY)``` and ```CGRect CGRectSetCenterPoint(const CGRect rectangle, const CGPoint center)``` Sets center of the rectangle.
 * ``` CGPoint CGRectGetCenter(const CGRect rectangle)``` Get center of the rectangle.

* **Custom Math**
 * ```#define MATH_RADIAN``` Radian value is: 180.0 devided by PI value.
 * ```#define MATH_180_DIV_PI``` 180 devided by PI value: 180/PI.
 * ```#define MATH_PI_DIV_180``` PI devided by 180 value: PI/180.
 * ```#define DEG_TO_RAD(a)``` Converts degree to radian angle.
 * ```#define RAD_TO_DEG(a)``` Converts radian to degree angle.
 * ```CGFloat DistanceBetweenFloatValues(const CGFloat firstValue, const CGFloat secondValue)``` Returns distance between two float values.
 * ```CGFloat AngleBetweenPoints(const CGPoint first, const CGPoint second)``` Returns angle between two points.

* **Environment Info**
 * ```BOOL isEnvironmentInfoHorizontalInteraceOrientation(const UIInterfaceOrientation orientation)``` Checks for horizontal orientation.
 * ```BOOL isEnvironmentInfoHorizontalCurrentInteraceOrientation()```  Checks current interface orientation horizontal.
 * ```BOOL isEnvironmentInfoIpad()``` Checks user interface idiom is iPad.
 * ```BOOL isEnvironmentInfoIOS7OrUpper()``` Checks version of the operating system equal or greater than 7.0.
 * ```BOOL isEnvironmentInfoIPhone4Inch()``` Checks for execution on the iPhone 4 inch.
 * ```BOOL isEnvironmentInfoRetinaDisplay()``` Checks screen for Retina.

* **JSON Object Converter**
 * ```+ (NSInteger) toInteger:(id) object``` Integer value if object not nil and have type as NSNumber or NSString, othervice 0.
 * ```+ (NSUInteger) toUInteger:(id) object``` Unsigned integer value if object not nil and have type as NSNumber or NSString, othervice 0.
 * ```+ (int64_t) toInt64:(id) object``` Integer 64 bit value if object not nil and have type as NSNumber or NSString, othervice 0.
 * ```+ (uint64_t) toUInt64:(id) object``` Unsigned integer 64 bit value if object not nil and have type as NSNumber or NSString, othervice 0.
 * ```+ (CGFloat) toFloat:(id) object``` Float value if object not nil and have type as NSNumber or NSString, othervice 0.0.
 * ```+ (double_t) toDouble:(id) object``` Double value if object not nil and have type as NSNumber or NSString, othervice 0.0.
 * ```+ (BOOL) toBoolean:(id) object``` Boolean value if object not nil and have type as NSNumber or NSString, othervice NO. In case if type is NSString trying compare with string "true".
 * ```+ (NSString *) toString:(id) object``` NSString value if object have type NSString, othervice nil.
 * ```+ (NSString *) toNonEmptyString:(id) object``` NSString value if have type NSString and it's lenght greater then zero, othervice nil.
 * ```+ (NSDictionary *) toDictionary:(id) object``` NSDictionary value if object have type NSDictionary or NSMutableDictionary, othervice nil.
 * ```+ (NSArray *) toArray:(id) object``` NSArray value if object have type NSArray or NSMutableArray, othervice nil.
 * ```+ (NSDate *) toDate:(id) object``` NSDate value if object have type NSString and date format satisfies next predefined formats:("yyyy-MM-dd'T'HH:mm:sszzzz", "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd'T'HH:mm:ssTZD", "yyyy-MM-dd"), othervice nil.

* **Mach Time**
 * ```+ (NSTimeInterval) currentTime``` Time interval in seconds from application start.
 * ```+ (uint64_t) machAbsoluteTime``` Unsigned integer of the mach counter.

### Derived

* **Anchor Point Rotatable UIView**
 * ```- (void) rotateByAngle:(CGFloat)radianAngle withAnchorPoint:(CGPoint)anchorPoint``` Rotates view using radian angle arround anchor point.


### Screenshots with linking process steps

![Screenshots with linking process steps](https://raw.github.com/OlehKulykov/iOS-Categories-OK/master/README/linking_framework.jpg)

