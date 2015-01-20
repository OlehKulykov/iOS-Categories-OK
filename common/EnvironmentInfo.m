/*
 *   Copyright (c) 2012 - 2015 Kulykov Oleh <nonamedemail@gmail.com>
 *
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *   of this software and associated documentation files (the "Software"), to deal
 *   in the Software without restriction, including without limitation the rights
 *   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *   copies of the Software, and to permit persons to whom the Software is
 *   furnished to do so, subject to the following conditions:
 *
 *   The above copyright notice and this permission notice shall be included in
 *   all copies or substantial portions of the Software.
 *
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *   THE SOFTWARE.
 */


#import "EnvironmentInfo.h"

BOOL isEnvironmentInfoIpad()
{
#ifdef UI_USER_INTERFACE_IDIOM
	const BOOL isIp = ((UI_USER_INTERFACE_IDIOM()) == UIUserInterfaceIdiomPad);
	return isIp;
#else
	return NO;
#endif
}

BOOL isEnvironmentInfoRetinaDisplay()
{
	UIScreen * screen = [UIScreen mainScreen];
	if ([screen respondsToSelector:@selector(scale)]) 
	{
		const CGFloat scale = [screen scale];
		return (scale > 1.0f);
	}
	return NO;
}

BOOL isEnvironmentInfoIPhone4Inch()
{
	if (!isEnvironmentInfoIpad()) 
	{
		const CGFloat screenSizeHeight = [[UIScreen mainScreen] bounds].size.height;
		const int screenHeight = (int)truncf(screenSizeHeight);
		const int result = screenHeight % 568;
		return (result == 0);
	}
	return NO;
}

BOOL isEnvironmentInfoIOS7OrUpper()
{
	const BOOL is7 = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) ? YES : NO;
	return is7;
}

BOOL isEnvironmentInfoHorizontalInteraceOrientation(const UIInterfaceOrientation orientation)
{
	return ((orientation==UIInterfaceOrientationLandscapeLeft)||(orientation==UIInterfaceOrientationLandscapeRight)||
			(orientation==UIDeviceOrientationLandscapeRight)||(orientation==UIDeviceOrientationLandscapeLeft));
}

BOOL isEnvironmentInfoHorizontalCurrentInteraceOrientation()
{
	const UIInterfaceOrientation statusbar = [[UIApplication sharedApplication] statusBarOrientation];
	const UIDeviceOrientation device = [[UIDevice currentDevice] orientation];
	UIInterfaceOrientation orientation = (UIInterfaceOrientation)0;
	if ((device == UIDeviceOrientationUnknown) || (device == UIDeviceOrientationFaceUp) || (device == UIDeviceOrientationFaceDown)) 
	{
		orientation = statusbar;
	}
	else
	{
		if (((int64_t)statusbar) != ((int64_t)device)) 
		{
			assert(0);
		}
		else
		{
			orientation = statusbar;
		}
	}
	return isEnvironmentInfoHorizontalInteraceOrientation(orientation);
}


