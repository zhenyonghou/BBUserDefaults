# BBUserDefaults

使用苹果提供的NSUserDefaults类可方便的存取用户信息数据，然而，App往往支持多个用户间
切换，当NSUserDefaults遇到多用户切换，解决起来就稍稍不那么完美。

BBUserDefaults解决了NSUserDefaults的这点不足,BBUserDefaults为每个用户在Document
目录里建一个以UserId命名的目录，将用户信息文件以plist格式存放在该目录下。

BBUserDefaults与NSUserDefaults数据存取接口相似。

BBUserDefaults与NSUserDefaults的不同：

1）去除了几个冗余接口

2）增加了- (void)setUserId:(NSNumber*)userId接口
