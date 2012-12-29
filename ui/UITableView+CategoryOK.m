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


#import "UITableView+CategoryOK.h"

#ifndef NO_UITableViewFullContentHeight_CATEGORY_OK

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

#endif
