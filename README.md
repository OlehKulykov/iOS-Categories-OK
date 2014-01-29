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
* **UIImage**
* **UIImageView**
* **UITableView**
* **UIView**
* **UIWebView**
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

![](https://raw.github.com/OlehKulykov/iOS-Categories-OK/master/README/linking_framework.jpg)

## Additional Dependencies
--------------------------
1. Standard iOS library **libz.dylib**