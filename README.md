iOS-Categories-OK
==================


Installation
==========
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
==========
1. Select required target
2. Select "Build Phases"
3. Press "Add item" button
4. Press "Add Other..." button
5. Locate "iOSCategoriesOKSDK.framework" and click "Open"
5.1 As a result framework will be added to the list
6. Add framework header file to project precompile header



