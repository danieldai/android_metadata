#import "AndroidMetadataPlugin.h"
#import <android_metadata/android_metadata-Swift.h>

@implementation AndroidMetadataPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAndroidMetadataPlugin registerWithRegistrar:registrar];
}
@end
