@class PhotoGridViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (PhotoGridViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(PhotoGridViewController *)viewController;

@end
