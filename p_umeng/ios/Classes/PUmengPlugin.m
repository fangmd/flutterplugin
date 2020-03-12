#import "PUmengPlugin.h"
#import <UMAnalytics/MobClick.h>
#import <UMCommon/UMCommon.h>

@implementation PUmengPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"p_umeng"
            binaryMessenger:[registrar messenger]];
  PUmengPlugin* instance = [[PUmengPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"init" isEqualToString:call.method]) {
        //初始化
        [self init:call result:result];
        result(nil);
    } else if ([@"setLogEnabled" isEqualToString:call.method]) {
        [self setLogEnabled:call result:result];
        result(nil);
    } else if ([@"onEvent" isEqualToString:call.method]) {
        //事件埋点
        [self event:call result:result];
        result(nil);
    } else if ([@"onPageStart" isEqualToString:call.method]){
        //统计页面时间-开始
        [self beginLogPageView:call result:result];
        result(nil);
    } else if ([@"onPageEnd" isEqualToString:call.method]){
        //统计页面时间-结束
        [self endLogPageView:call result:result];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)init:(FlutterMethodCall*)call result:(FlutterResult)result {
    [MobClick setScenarioType:E_UM_NORMAL];

    NSNumber* encrypt = call.arguments[@"encrypt"];
    if (encrypt) {
        [UMConfigure setEncryptEnabled:[encrypt boolValue]];
    }

    NSString* channel = call.arguments[@"channel"] ?: @"App Store";

    NSString* appKey = call.arguments[@"key"] ?: @"";

    [UMConfigure initWithAppkey:appKey channel:channel];
}

- (void)setLogEnabled:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSNumber* logEnable = call.arguments[@"logEnable"];
    if (logEnable) {
        [UMConfigure setLogEnabled:[logEnable boolValue]];
    }
}

- (void)event:(FlutterMethodCall*)call result:(FlutterResult)result {
    if (call.arguments[@"label"]){
        [MobClick event:call.arguments[@"eventId"] label:call.arguments[@"label"]];
    }else{
        [MobClick event:call.arguments[@"eventId"]];
    }
}

- (void)beginLogPageView:(FlutterMethodCall*)call result:(FlutterResult)result {
    [MobClick beginLogPageView:call.arguments[@"name"] ?: @""];
}

- (void)endLogPageView:(FlutterMethodCall*)call result:(FlutterResult)result {
    [MobClick endLogPageView:call.arguments[@"name"] ?: @""];
}

@end
