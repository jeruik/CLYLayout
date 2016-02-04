// dock竖屏时的宽度
extern const CGFloat HMDockPW;
// dock横屏时的宽度
extern const CGFloat HMDockLW;

// 屏幕竖屏时的宽度
extern const CGFloat HMScreenPW;
// 屏幕横屏时的宽度
extern const CGFloat HMScreenLW;

extern  NSString *const HMTabBarDidSelectNotification;
extern  NSString *const HMTabBarSelectIndex;
extern  NSString *const btntitleName;

#define Lanscape ([UIScreen mainScreen].bounds.size.width == HMScreenLW)
#define Portrait ([UIScreen mainScreen].bounds.size.width == HMScreenPW)

#define HMColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HMRandomColor HMColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))