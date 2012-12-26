

#ifndef __CGRECT_ADDITIONS_H__
#define __CGRECT_ADDITIONS_H__

#import <CoreGraphics/CoreGraphics.h>


CG_INLINE CGRect CGRectSetTopRightOrigin(const CGRect rectangle,
										 const CGFloat topRightX,
										 const CGFloat topRightY)
{
	return CGRectMake(topRightX - rectangle.size.width,
					  topRightY,
					  rectangle.size.width,
					  rectangle.size.height);
}


CG_INLINE CGRect CGRectSetTopRightOriginPoint(const CGRect rectangle,
											  const CGPoint topRight)
{
	return CGRectMake(topRight.x - rectangle.size.width,
					  topRight.y,
					  rectangle.size.width,
					  rectangle.size.height);
}


CG_INLINE CGRect CGRectSetBottomRightOrigin(const CGRect rectangle,
											const CGFloat bottomRightX,
											const CGFloat bottomRightY)
{
	return CGRectMake(bottomRightX - rectangle.size.width,
					  bottomRightY - rectangle.size.height,
					  rectangle.size.width,
					  rectangle.size.height);
}


CG_INLINE CGRect CGRectSetBottomRightOriginPoint(const CGRect rectangle,
												 const CGPoint bottomRight)
{
	return CGRectMake(bottomRight.x - rectangle.size.width,
					  bottomRight.y - rectangle.size.height,
					  rectangle.size.width,
					  rectangle.size.height);
}


CG_INLINE CGRect CGRectSetBottomLeftOrigin(const CGRect rectangle,
										   const CGFloat bottomLeftX,
										   const CGFloat bottomLeftY)
{
	return CGRectMake(bottomLeftX,
					  bottomLeftY - rectangle.size.height,
					  rectangle.size.width,
					  rectangle.size.height);
}


CG_INLINE CGRect CGRectSetBottomLeftOriginPoint(const CGRect rectangle,
												const CGPoint bottomLeft)
{
	return CGRectMake(bottomLeft.x,
					  bottomLeft.y - rectangle.size.height,
					  rectangle.size.width,
					  rectangle.size.height);
}

CG_INLINE CGRect CGRectSetCenter(const CGRect rectangle,
								 const CGFloat centerX,
								 const CGFloat centerY)
{
	return CGRectMake(centerX - rectangle.size.width / 2.0f,
					  centerY - rectangle.size.height / 2.0f,
					  rectangle.size.width,
					  rectangle.size.height);
}


CG_INLINE CGRect CGRectSetCenterPoint(const CGRect rectangle,
									  const CGPoint center)
{
	return CGRectMake(center.x - rectangle.size.width / 2.0f,
					  center.y - rectangle.size.height / 2.0f,
					  rectangle.size.width,
					  rectangle.size.height);
}


CG_INLINE CGPoint CGRectGetCenter(const CGRect rectangle)
{
	return CGPointMake(rectangle.size.width / 2.0f,
					   rectangle.size.height / 2.0f);
}

#endif /* __CGRECT_ADDITIONS_H__ */