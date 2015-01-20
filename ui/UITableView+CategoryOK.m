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


#import "UITableView+CategoryOK.h"


@implementation UITableView(FullContentHeight)

static CGFloat __UITableViewGetFullContentHeight(UITableView * tableView)
{
	if ([tableView dataSource] == nil) return 0.0f;
	
	CGFloat height = 0.0f;
	id dataSource = [tableView dataSource];
	if ([dataSource respondsToSelector:@selector(tableView: heightForRowAtIndexPath:)])
	{
		const NSInteger sectionsCount = [dataSource numberOfSectionsInTableView:tableView];
		for (NSInteger section = 0; section < sectionsCount; section++)
		{
			const NSInteger rowsCount = [dataSource tableView:tableView numberOfRowsInSection:section];
			for (NSInteger row = 0; row < rowsCount; row++)
			{
				height += [dataSource tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
			}
		}
	}
	return height;
}

- (CGFloat) fullContentHeight
{
	return __UITableViewGetFullContentHeight(self);
}


@end

