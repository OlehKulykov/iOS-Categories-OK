rm -rf iOSCategoriesOKSDK.framework
rm -f *.a

xcodebuild -configuration Release -project iOSCategoriesOKSDK.xcodeproj -target iOSCategoriesOKSDK -arch i386 -sdk iphonesimulator OBJROOT=obj SYMROOT=sym clean build
xcodebuild -configuration Release -project ../thirdpartylibs/webp.xcodeproj -target webp -arch i386 -sdk iphonesimulator OBJROOT=../framework/obj SYMROOT=../framework/sym clean build
cd obj
find . -type f -iregex '.*\.o$' | xargs -I @ ar -q -v ../all-i386.a @
cd ..
rm -rf obj
rm -rf sym

xcodebuild -configuration Release -project iOSCategoriesOKSDK.xcodeproj -target iOSCategoriesOKSDK -arch armv7 -sdk iphoneos OBJROOT=obj SYMROOT=sym clean build
xcodebuild -configuration Release -project ../thirdpartylibs/webp.xcodeproj -target webp -arch armv7 -sdk iphoneos OBJROOT=../framework/obj SYMROOT=../framework/sym clean build
cd obj
find . -type f -iregex '.*\.o$' | xargs -I @ ar -q -v ../all-armv7.a @
cd ..
rm -rf obj
rm -rf sym

xcodebuild -configuration Release -project iOSCategoriesOKSDK.xcodeproj -target iOSCategoriesOKSDK -arch armv7s -sdk iphoneos OBJROOT=obj SYMROOT=sym clean build
xcodebuild -configuration Release -project ../thirdpartylibs/webp.xcodeproj -target webp -arch armv7s -sdk iphoneos OBJROOT=../framework/obj SYMROOT=../framework/sym clean build
cd obj
find . -type f -iregex '.*\.o$' | xargs -I @ ar -q -v ../all-armv7s.a @
cd ..
rm -rf obj
rm -rf sym

xcodebuild -configuration Release -project iOSCategoriesOKSDK.xcodeproj -target iOSCategoriesOKSDK -arch arm64 -sdk iphoneos OBJROOT=obj SYMROOT=sym IPHONEOS_DEPLOYMENT_TARGET=7.0.0 clean build
xcodebuild -configuration Release -project ../thirdpartylibs/webp.xcodeproj -target webp -arch arm64 -sdk iphoneos OBJROOT=../framework/obj SYMROOT=../framework/sym IPHONEOS_DEPLOYMENT_TARGET=7.0.0 clean build
cd obj
find . -type f -iregex '.*\.o$' | xargs -I @ ar -q -v ../all-arm64.a @
cd ..
rm -rf obj
rm -rf sym


lipo -create all-i386.a all-armv7.a all-armv7s.a all-arm64.a -output all.a
rm -f all-i386.a
rm -f all-armv7.a
rm -f all-armv7s.a
rm -f all-arm64.a


rm -rf iOSCategoriesOKSDK.framework
mkdir -p iOSCategoriesOKSDK.framework/Versions/A/Headers

mkdir -p iOSCategoriesOKSDK.framework/Versions/A/Headers/common
mkdir -p iOSCategoriesOKSDK.framework/Versions/A/Headers/derived
mkdir -p iOSCategoriesOKSDK.framework/Versions/A/Headers/foundation
mkdir -p iOSCategoriesOKSDK.framework/Versions/A/Headers/net
mkdir -p iOSCategoriesOKSDK.framework/Versions/A/Headers/ui

cp ../common/*.h iOSCategoriesOKSDK.framework/Versions/A/Headers/common/
cp ../derived/*.h iOSCategoriesOKSDK.framework/Versions/A/Headers/derived/
cp ../foundation/*.h iOSCategoriesOKSDK.framework/Versions/A/Headers/foundation/
cp ../net/*.h iOSCategoriesOKSDK.framework/Versions/A/Headers/net/
cp ../ui/*.h iOSCategoriesOKSDK.framework/Versions/A/Headers/ui/

mv iOSCategoriesOKSDK.framework/Versions/A/Headers/common/iOSCategoriesOKSDK.h iOSCategoriesOKSDK.framework/Versions/A/Headers/iOSCategoriesOKSDK.h

mkdir -p iOSCategoriesOKSDK.framework/Versions/A/Resources
cp all.a iOSCategoriesOKSDK
cp iOSCategoriesOKSDK iOSCategoriesOKSDK.framework/Versions/A

ln -s A iOSCategoriesOKSDK.framework/Versions/Current
ln -s Versions/Current/Headers iOSCategoriesOKSDK.framework/Headers
ln -s Versions/Current/Resources iOSCategoriesOKSDK.framework/Resources
ln -s Versions/Current/iOSCategoriesOKSDK iOSCategoriesOKSDK.framework/iOSCategoriesOKSDK

rm -f iOSCategoriesOKSDK
rm -f all.a
