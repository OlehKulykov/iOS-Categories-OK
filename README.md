# iOS-Categories-OK


## Functionality
----------------
### Foundation
* ####NSArray
 * ```BOOL NSArrayIsEmpty(NSArray * array)``` or ```+ (BOOL) isEmpty:(NSArray *)array``` Check is array has no objects or nil.
 * ```BOOL NSArrayIsNotEmpty(NSArray * array)``` or ```+ (BOOL) isNotEmpty:(NSArray *)array``` Check is array has objects and not nil.
 * ```id NSArrayObjectAtIndex(NSArray * array, const NSUInteger index)``` or ```+ (id) array:(NSArray *)array objectAtIndex:(NSUInteger)index``` Get array object at index. Return object or nil if array empty or index dosn't exists.
 * ```+ (NSUInteger) array:(NSArray *)array previousIndexFrom:(NSUInteger)index``` Get array previous index from started index. Return previous array index from started or NSNotFound on error.
 * ```+ (NSUInteger) array:(NSArray *)array nextIndexFrom:(NSUInteger)index``` Get array next index from started index. Return next array index from started or NSNotFound on error.
* ####NSData
* ####NSDictionary
* ####NSString
### UI
* #### UIColor
* #### UIImage
* #### UIImageView
* #### UITableView
* #### UIView
* #### UIWebView
### Common
* #### CGRect
* #### Custom Math
* #### Environment Info
* #### JSON Object Converter
* #### Mach Time
### Derived
* #### Anchor Point Rotatable UIView
* #### Notification Manager
* #### Storage Base & Storage Item
* #### UIView Subviews Stored Properties


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