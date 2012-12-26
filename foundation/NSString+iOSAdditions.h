/*
 *   Copyright 2012 Kulykov Oleh
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
#import "Foundation+iOSAdditionsConfig.h"

#ifndef NO_NSStringContaines__IOSADDITIONS__

@interface NSString (Containes)

- (BOOL) isContainesSubstring:(NSString *)subString;

@end

#endif


#ifndef NO_NSStringSpecialHTMLCharacters__IOSADDITIONS__

@interface NSString (SpecialHTMLCharacters)


- (NSString *) stringByDecodeSpecialHTMLCharacters;

- (NSString *) stringByEncodeSpecialHTMLCharacters;


@end

#endif
