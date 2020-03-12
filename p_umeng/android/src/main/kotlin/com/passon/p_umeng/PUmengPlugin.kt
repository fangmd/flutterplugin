package com.passon.p_umeng

import android.util.Log
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar

/** PUmengPlugin */
public class PUmengPlugin : FlutterPlugin {
    private val methodCallHandlerImpl: MethodCallHandlerImpl = MethodCallHandlerImpl()

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "p_umeng")
        channel.setMethodCallHandler(methodCallHandlerImpl)
        methodCallHandlerImpl.mContext = flutterPluginBinding.applicationContext
        Log.d(C.TAG, "init Application")
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "p_umeng")
            val ponePlugin = PUmengPlugin()
            channel.setMethodCallHandler(ponePlugin.methodCallHandlerImpl)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        methodCallHandlerImpl.mContext = null
    }
}
