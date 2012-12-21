

#import "UITableView+FullContentHeight.h"

@implementation UITableView(FullContentHeight)

static CGFloat tableViewContentHeight(UITableView * tableView)
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
	return tableViewContentHeight(self);
}


@end
