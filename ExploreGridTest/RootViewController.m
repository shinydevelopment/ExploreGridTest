#import "RootViewController.h"
#import "ModelController.h"
#import "PhotoGridViewController.h"

@interface RootViewController ()
@property (readonly, strong, nonatomic) ModelController *modelController;
@end

@implementation RootViewController

@synthesize modelController = _modelController;

- (void)viewDidLoad
{
  [super viewDidLoad];

  // Configure the page view controller and add it as a child view controller.
  self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
  self.pageViewController.delegate = self;
  self.pageViewController.dataSource = self.modelController;

  PhotoGridViewController *controller = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
  [self.pageViewController setViewControllers:@[ controller ] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

  [self addChildViewController:self.pageViewController];

  CGFloat pageFrameWidth = 1020; CGFloat pageFrameHeight = 690;
  CGFloat pageFrameX = (self.view.bounds.size.width - pageFrameWidth) / 2;
  CGFloat pageFrameY = (((self.view.bounds.size.height - self.toolbar.bounds.size.height) - pageFrameHeight) / 2) + self.toolbar.bounds.size.height;
  self.pageViewController.view.frame = CGRectMake(pageFrameX, pageFrameY, pageFrameWidth, pageFrameHeight);
  [self.view addSubview:self.pageViewController.view];

  [self.pageViewController didMoveToParentViewController:self];
  NSLog(@"%@", self.view.subviews);
}

- (ModelController *)modelController
{
  // Return the model controller object, creating it if necessary.
  // In more complex implementations, the model controller may be passed to the view controller.
  if (!_modelController) {
    _modelController = [[ModelController alloc] init];
  }
  return _modelController;
}

@end
