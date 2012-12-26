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


#ifndef __COMMON_IOSADDITIONSPRECOMPILED_H__
#define __COMMON_IOSADDITIONSPRECOMPILED_H__o


#if !defined(__has_feature)
#define __has_feature(feature) 0
#endif

#if __has_feature(objc_arc)

#define SAFE_RELEASE(o) o=nil;

#define SAFE_RETAIN(to,from) to=from;

#define SAFE_AUTORELEASE(o) o;


#else


#define SAFE_RELEASE(o) [o release];o=nil;

#define SAFE_RETAIN(to,from) [to release];to=[from retain];

#define SAFE_AUTORELEASE(o) [o autorelease];


#endif


#endif
