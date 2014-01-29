iOS-Categories-OK
===


Installation
---
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


Linking framework with your project
---
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

Additional Dependencies
---
1. Standard iOS library **libz.dylib**