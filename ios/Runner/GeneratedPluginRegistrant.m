//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<audioplayers_darwin/AudioplayersDarwinPlugin.h>)
#import <audioplayers_darwin/AudioplayersDarwinPlugin.h>
#else
@import audioplayers_darwin;
#endif

#if __has_include(<awesome_notifications/AwesomeNotificationsPlugin.h>)
#import <awesome_notifications/AwesomeNotificationsPlugin.h>
#else
@import awesome_notifications;
#endif

#if __has_include(<flutter_callkit_incoming/FlutterCallkitIncomingPlugin.h>)
#import <flutter_callkit_incoming/FlutterCallkitIncomingPlugin.h>
#else
@import flutter_callkit_incoming;
#endif

#if __has_include(<flutter_logs/FlutterLogsPlugin.h>)
#import <flutter_logs/FlutterLogsPlugin.h>
#else
@import flutter_logs;
#endif

#if __has_include(<flutter_phone_direct_caller/FlutterPhoneDirectCallerPlugin.h>)
#import <flutter_phone_direct_caller/FlutterPhoneDirectCallerPlugin.h>
#else
@import flutter_phone_direct_caller;
#endif

#if __has_include(<flutter_vibrate/VibratePlugin.h>)
#import <flutter_vibrate/VibratePlugin.h>
#else
@import flutter_vibrate;
#endif

#if __has_include(<image_picker_ios/FLTImagePickerPlugin.h>)
#import <image_picker_ios/FLTImagePickerPlugin.h>
#else
@import image_picker_ios;
#endif

#if __has_include(<native_device_orientation/NativeDeviceOrientationPlugin.h>)
#import <native_device_orientation/NativeDeviceOrientationPlugin.h>
#else
@import native_device_orientation;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

#if __has_include(<permission_handler_apple/PermissionHandlerPlugin.h>)
#import <permission_handler_apple/PermissionHandlerPlugin.h>
#else
@import permission_handler_apple;
#endif

#if __has_include(<sqflite/SqflitePlugin.h>)
#import <sqflite/SqflitePlugin.h>
#else
@import sqflite;
#endif

#if __has_include(<wakelock/WakelockPlugin.h>)
#import <wakelock/WakelockPlugin.h>
#else
@import wakelock;
#endif

#if __has_include(<zego_express_engine/ZegoExpressEnginePlugin.h>)
#import <zego_express_engine/ZegoExpressEnginePlugin.h>
#else
@import zego_express_engine;
#endif

#if __has_include(<zego_zim/ZegoZimPlugin.h>)
#import <zego_zim/ZegoZimPlugin.h>
#else
@import zego_zim;
#endif

#if __has_include(<zego_zpns/ZegoZpnsPlugin.h>)
#import <zego_zpns/ZegoZpnsPlugin.h>
#else
@import zego_zpns;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AudioplayersDarwinPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioplayersDarwinPlugin"]];
  [AwesomeNotificationsPlugin registerWithRegistrar:[registry registrarForPlugin:@"AwesomeNotificationsPlugin"]];
  [FlutterCallkitIncomingPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterCallkitIncomingPlugin"]];
  [FlutterLogsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterLogsPlugin"]];
  [FlutterPhoneDirectCallerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterPhoneDirectCallerPlugin"]];
  [VibratePlugin registerWithRegistrar:[registry registrarForPlugin:@"VibratePlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [NativeDeviceOrientationPlugin registerWithRegistrar:[registry registrarForPlugin:@"NativeDeviceOrientationPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
  [WakelockPlugin registerWithRegistrar:[registry registrarForPlugin:@"WakelockPlugin"]];
  [ZegoExpressEnginePlugin registerWithRegistrar:[registry registrarForPlugin:@"ZegoExpressEnginePlugin"]];
  [ZegoZimPlugin registerWithRegistrar:[registry registrarForPlugin:@"ZegoZimPlugin"]];
  [ZegoZpnsPlugin registerWithRegistrar:[registry registrarForPlugin:@"ZegoZpnsPlugin"]];
}

@end
