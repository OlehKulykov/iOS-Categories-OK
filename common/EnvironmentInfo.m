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


