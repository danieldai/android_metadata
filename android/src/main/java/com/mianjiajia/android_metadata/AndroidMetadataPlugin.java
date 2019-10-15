package com.mianjiajia.android_metadata;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * AndroidMetadataPlugin
 */
public class AndroidMetadataPlugin implements MethodCallHandler {
    private final Registrar mRegistrar;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "plugins.mianjiajia.com/android_metadata");
        channel.setMethodCallHandler(new AndroidMetadataPlugin(registrar));
    }

    private AndroidMetadataPlugin(Registrar registrar) {
        this.mRegistrar = registrar;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        try {
            Context context = mRegistrar.context();
            if (call.method.equals("getMetaDataAsMap")) {
                PackageManager pm = context.getPackageManager();

                ApplicationInfo appInfo = pm.getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA);

                Map<String, String> map = new HashMap<>();

                Set<String> ks = appInfo.metaData.keySet();
                for (String key : ks) {
                    map.put(key, String.valueOf(appInfo.metaData.getString(key)));
                }

                result.success(map);
            } else {
                result.notImplemented();
            }
        } catch (PackageManager.NameNotFoundException ex) {
            result.error("Name not found", ex.getMessage(), null);
        }
    }
}
