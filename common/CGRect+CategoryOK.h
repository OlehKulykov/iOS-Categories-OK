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


#ifndef __CGRECT_CATEGORY_OK_H__
#define __CGRECT_CATEGORY_OK_H__

#import "iOS_Categories_OK_CommonHeader.h"


/**
 @brief Sets top right origin of the rectangle.
 @param rectangle The target rectanle.
 @param topRightX The top right X coordinate of the updated rectange.
 @param topRightY The top right Y coordinate of the updated rectange.
 @return The new updated rectange.
 */ 
IOS_CATEGORIES_INLINE CGRect CGRectSetTopRightOrigin(const CGRect rectangle,
													 const CGFloat topRightX,
													 const CGFloat topRightY)
{
	return CGRectMake(topRightX - rectangle.size.width,
					  topRightY,
					  rectangle.size.width,
					  rectangle.size.height);
}


/**
 @brief Sets top right origin of the rectangle.
 @param rectangle The target rectanle.
 @param topRight The top right coordinates of the updated rectange.
 @return The new updated rectange.
 */ 
IOS_CATEGORIES_INLINE CGRect CGRectSetTopRightOriginPoint(const CGRect rectangle,
														  const CGPoint topRight)
{
	return CGRectMake(topRight.x - rectangle.size.width,
					  topRight.y,
					  rectangle.size.width,
					  rectangle.size.height);
}


/**
 @brief Sets bottom right origin of the rectangle.
 @param rectangle The target rectanle.
 @param bottomRightX The bottom right X coordinate of the updated rectange.
 @param bottomRightY The bottom right Y coordinate of the updated rectange.
 @return The new updated rectange.
 */ 
IOS_CATEGORIES_INLINE CGRect CGRectSetBottomRightOrigin(const CGRect rectangle,
														const CGFloat bottomRightX,
														const CGFloat bottomRightY)
{
	return CGRectMake(bottomRightX - rectangle.size.width,
					  bottomRightY - rectangle.size.height,
					  rectangle.size.width,
					  rectangle.size.height);
}


/**
 @brief Sets bottom right origin of the rectangle.
 @param rectangle The target rectanle.
 @param bottomRight The bottom right coordinates of the updated rectange.
 @return The new updated rectange.
 */ 
IOS_CATEGORIES_INLINE CGRect CGRectSetBottomRightOriginPoint(const CGRect rectangle,
															 const CGPoint bottomRight)
{
	return CGRectMake(bottomRight.x - rectangle.size.width,
					  bottomRight.y - rectangle.size.height,
					  rectangle.size.width,
					  rectangle.size.height);
}


/**
 @brief Sets bottom left origin of the rectangle.
 @param rectangle The target rectanle.
 @param bottomLeftX The bottom left X coordinate of the updated rectange.
 @param bottomLeftY The bottom left Y coordinate of the updated rectange.
 @return The new updated rectange.
 */ 
IOS_CATEGORIES_INLINE CGRect CGRectSetBottomLeftOrigin(const CGRect rectangle,
													   const CGFloat bottomLeftX,
													   const CGFloat bottomLeftY)
{
	return CGRectMake(bottomLeftX,
					  bottomLeftY - rectangle.size.height,
					  rectangle.size.width,
					  rectangle.size.height);
}


/**
 @brief Sets bottom left origin of the rectangle.
 @param rectangle The target rectanle.
 @param bottomLeft The bottom left coordinates of the updated rectange.
 @return The new updated rectange.
 */ 
IOS_CATEGORIES_INLINE CGRect CGRectSetBottomLeftOriginPoint(const CGRect rectangle,
															const CGPoint bottomLeft)
{
	return CGRectMake(bottomLeft.x,
					  bottomLeft.y - rectangle.size.height,
					  rectangle.size.width,
					  rectangle.size.height);
}


/**
 @brief Sets center of the rectangle.
 @param rectangle The target rectanle.
 @param centerX The center X coordinate of the updated rectange.
 @param centerY The center Y coordinate of the updated rectange.
 @return The new updated rectange.
 */ 
IOS_CATEGORIES_INLINE CGRect CGRectSetCenter(const CGRect rectangle,
											 const CGFloat centerX,
											 const CGFloat centerY)
{
	return CGRectMake(centerX - rectangle.size.width / 2.0f,
					  centerY - rectangle.size.height / 2.0f,
					  rectangle.size.width,
					  rectangle.size.height);
}


/**
 @brief Sets center of the rectangle.
 @param rectangle The target rectanle.
 @param center The center coordinates of the updated rectange.
 @return The new updated rectange.
 */ 
IOS_CATEGORIES_INLINE CGRect CGRectSetCenterPoint(const CGRect rectangle,
												  const CGPoint center)
{
	return CGRectMake(center.x - rectangle.size.width / 2.0f,
					  center.y - rectangle.size.height / 2.0f,
					  rectangle.size.width,
					  rectangle.size.height);
}


/**
 @brief Get center of the rectangle.
 @param rectangle The target rectanle.
 @return The center point of the rectange.
 */ 
IOS_CATEGORIES_INLINE CGPoint CGRectGetCenter(const CGRect rectangle)
{
	return CGPointMake(rectangle.size.width / 2.0f,
					   rectangle.size.height / 2.0f);
}


#endif /* __CGRECT_CATEGORY_OK_H__ */

