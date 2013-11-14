/*
 *   Copyright 2012 - 2013 Kulykov Oleh
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSData (DataZIPCompression)

/**
 @brief Get zip compressed data with compression ratio.
 @detailed Need to add dependecy of the zlib library.
 @param compressionRatio Float compression ratio value in range [0.0f; 1.0f].
 @return Zip compressed data or nil on error or data is empty.
 */
- (NSData *) zipCompressedDataWithRatio:(CGFloat)compressionRatio;


/**
 @brief Get zip decompressed data if this data is zip compressed.
 @detailed Need to add dependecy of the zlib library.
 @return Decompressed data or nil on error or data is not zip compressed.
 */
- (NSData *) zipDecompressedData;


/**
 @brief Get zip compressed data with compression ratio.
 @detailed Need to add dependecy of the zlib library.
 @param dataToCompress The data for compress.
 @param compressionRatio Float compression ratio value in range [0.0f; 1.0f].
 @return Zip compressed data or nil on error or dataToCompress is empty.
 */
+ (NSData *) zipCompressData:(NSData *) dataToCompress withRatio:(CGFloat)compressionRatio;


/**
 @brief Get zip decompressed data.
 @detailed Need to add dependecy of the zlib library.
 @param zipData Zip compressed data.
 @return Decompressed data or nil on error or data is not zip compressed.
 */
+ (NSData *) zipDecompressData:(NSData *) zipData;

@end


@interface NSData (MainBundle)


/**
 @brief Get bundled file data by file path.
 @detailed Need to add dependecy of the zlib library.
 @param filePath The path of the bundled file.
 @return File data of nil if not found.
 */
- (NSData *) dataFromBunbledFilePath:(NSString *) filePath;

@end


