#import "PhotoGridViewController.h"

@interface PhotoGridViewController ()
@end

@implementation PhotoGridViewController

- (id)initWithCoder:(NSCoder *)decoder
{
  self = [super initWithCoder:decoder];
  if (self) [self configureViewController];
  return self;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
  self = [super initWithNibName:nibName bundle:nibBundle];
  if (self) [self configureViewController];
  return self;
}

- (void)configureViewController
{
}

- (void)awakeFromNib
{
  [self.view addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:nil];
  [self.view addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
  NSLog(@"%@ %@: %@ changed to %@", [self class], NSStringFromSelector(_cmd), keyPath, [change valueForKey:@"NSKeyValueChangeNewKey"]);
}

- (void)dealloc
{
  [self.view removeObserver:self forKeyPath:@"frame"];
  [self.view removeObserver:self forKeyPath:@"transform"];
}

@end
