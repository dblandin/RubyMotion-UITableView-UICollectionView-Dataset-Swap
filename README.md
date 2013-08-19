# Swapping between different UITableView/UICollectionView datasets

I'm currently building a RubyMotion iPhone app. This app requires a user profile screen similar to one found in the Instagram iPhone app.

When viewing a profile, the user should be able to switch between a list and grid view of items within the same scrolling view. The containing view should resize appropriately to the content height of the active list or grid.

## Solutions

1. When the views share compatible data source protocols:
    - Swap out the data source
    - Call reloadData on the UITableView/UICollectionView

2. When the views __do not__ shared compatible data source protocols:
    - Remove the current view
    - Remove auto layout constraints for current view
    - Add the target subview
    - Add auto layout constraints for target subview

This example application demonstrates these two methods.

## Contributing

Any comments, suggestions, issues, or pull requests are welcome!
