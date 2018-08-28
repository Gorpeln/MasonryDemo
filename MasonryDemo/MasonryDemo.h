

#define RANDOMCOLOR  [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


#define BOUNDS_WIDTH [UIScreen mainScreen].bounds.size.width
#define BOUNDS_HEIGHT [UIScreen mainScreen].bounds.size.height
#define MARGIN 7.5



#define DEBUGLOG 1

#ifdef DEBUGLOG
#       define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#       define DLog(...)
#endif

#define EncodeFormDic(dic,key) [dic[key]isKindOfClass:[NSString class]] ? dic[key] :([dic[key] isKindOfClass:[NSNumber class]] ? [dic[key] stringValue]:@"")

