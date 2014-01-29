# iOS-Categories-OK


## Functionality
----------------

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

* **Custom Math**

* **Environment Info**

* **JSON Object Converter**

* **Mach Time**

### Derived

* **Anchor Point Rotatable UIView**

* **Notification Manager**

* **Storage Base & Storage Item**

* **UIView Subviews Stored Properties**


## Installation
---------------

1. Clone this repository:
```sh
git clone https://github.com/OlehKulykov/iOS-Categories-OK.git
```
2. Go to framework folder:
```sh
cd iOS-Categories-OK/framework
```
3. Execute build framework script:
```sh
./build_ios_static.sh
```


## Linking framework with your project
--------------------------------------

1. Select required target
2. Select "**Build Phases**"
3. Press "**Add item**" button
4. Press "**Add Other...**" button
5. Locate "**iOSCategoriesOKSDK.framework**" and click "**Open**". As a result framework will be added to the list
6. Add **framework header** file to project **precompile header**
7. Add to "**Other Linker Flags**" next two flags: **-ObjC** **-all_load**

> **TIP:**
> 
>  This framework **required** linking standard iOS library called **libz.dylib**. Link this library with your project as described above.

![Screenshots with linking staps](https://raw.github.com/OlehKulykov/iOS-Categories-OK/master/README/linking_framework.jpg)

## Additional Dependencies
--------------------------

1. Standard iOS library **libz.dylib**