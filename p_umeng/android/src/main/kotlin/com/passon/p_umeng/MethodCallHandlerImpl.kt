package com.passon.p_umeng

import android.content.Context
import android.text.TextUtils
import androidx.annotation.NonNull
import com.umeng.analytics.MobclickAgent
import com.umeng.commonsdk.UMConfigure
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


/**
 * Author: Created by fangmingdong on 2020-01-13-13:06
 * Description:
 */
public final class MethodCallHandlerImpl : MethodChannel.MethodCallHandler {

    var mContext: Context? = null

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "init") {
            init(call, result)
        } else if (call.method == "setLogEnabled") {
            setLogEnabled(call, result)
        } else if (call.method == "onPageStart") {
            onPageStart(call, result)
        } else if (call.method == "onPageEnd") {
            onPageEnd(call, result)
        } else if (call.method == "onEvent") {
            onEvent(call, result)
        } else if (call.method == "reportError") {
//            MobclickAgent.reportError(mContext, "Parameter Error");
        } else {
            result.notImplemented()
        }
    }

    private fun setLogEnabled(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        val arg = call.argument<Boolean>("flag") ?: false
        UMConfigure.setLogEnabled(arg)
        result.success(null)
    }

    private fun init(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        val key = call.argument<String>("key")
        val channel = call.argument<String>("channel")
        val deviceType = call.argument<Int>("deviceType") ?: UMConfigure.DEVICE_TYPE_PHONE
        val pushSecret = call.argument<String>("pushSecret")
        logd("init: $key $channel")
        UMConfigure.init(mContext, key, channel, deviceType, pushSecret)
        MobclickAgent.setPageCollectionMode(MobclickAgent.PageMode.AUTO)
        result.success(null)
    }

    private fun onPageStart(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        val arg = call.argument<String>("name")
        logd("onPageStart: $arg")
        if (TextUtils.isEmpty(arg)) {
            result.error(ErrorCode.ARGUMENT_ERROR, "onResume arg should be String", "")
            return
        }
        MobclickAgent.onPageStart(arg)
        result.success(null)
    }


    private fun onPageEnd(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        val arg = call.argument<String>("name")
        logd("onPageEnd: $arg")
        if (TextUtils.isEmpty(arg)) {
            result.error(ErrorCode.ARGUMENT_ERROR, "onResume arg should be String", "")
            return
        }
        MobclickAgent.onPageEnd(arg)
        result.success(null)
    }

    private fun onEvent(call: MethodCall, result: MethodChannel.Result) {
        val eventId = call.argument<String>("eventId")
        val label = call.argument<String>("label")
        logd("onEvent: $eventId")
        MobclickAgent.onEvent(mContext, eventId, label)
        result.success(null)
    }

}