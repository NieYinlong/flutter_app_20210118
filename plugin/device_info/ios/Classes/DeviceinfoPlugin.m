#import "DeviceinfoPlugin.h"

@implementation DeviceinfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"deviceinfo"
            binaryMessenger:[registrar messenger]];
  DeviceinfoPlugin* instance = [[DeviceinfoPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getSystemVersion" isEqualToString:call.method]) {
    result([[UIDevice currentDevice] systemVersion]);
  }
  else if([@"getBatteryLevel" isEqualToString:call.method]) {
      float level = [[UIDevice currentDevice] batteryLevel];
      result([NSString stringWithFormat:@"%f", level]);
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
