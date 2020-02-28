package com.passon.p_install

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.io.File


/** PInstallPlugin */
public class PInstallPlugin : FlutterPlugin, MethodCallHandler {

    private var app: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "p_install")
        val plugin = PInstallPlugin()
        plugin.app = flutterPluginBinding.applicationContext
        channel.setMethodCallHandler(plugin)
    }

    companion object {
        private const val FILE_PATH = "filePath"

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "p_install")
            val plugin = PInstallPlugin()
            plugin.app = registrar.activity().application
            channel.setMethodCallHandler(plugin)
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "install") {
            val filePath = call.argument<String>(FILE_PATH)
            install(result, filePath)
        } else {
            result.notImplemented()
        }
    }

    private fun install(@NonNull result: Result, filePath: String?) {
        if (filePath == null || filePath.isBlank()) {
            result.error("error", "filePath is null or empty", "")
        }

        if (app == null) {
            result.error("error", "app is null", "")
        }

        installCore(filePath)

        result.success("success")
    }

    private fun installCore(filePath: String?) {
        val file = File(filePath)
        val appId = app!!.packageName

        Log.d("p_install", "$filePath $appId ${file.exists()} ${file.path}")

        val intent = Intent(Intent.ACTION_VIEW)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            val uri: Uri = FileProvider.getUriForFile(app!!, "$appId.fileProvider.install", file)
            intent.setDataAndType(uri, "application/vnd.android.package-archive")

            //兼容8.0
//            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//                val hasInstallPermission: Boolean = app!!.packageManager.canRequestPackageInstalls()
//                if (!hasInstallPermission) {
//                    startInstallPermissionSettingActivity()
//                    return
//                }
//            }
        } else {
            intent.setDataAndType(Uri.fromFile(file), "application/vnd.android.package-archive")
        }

        app!!.startActivity(intent)
    }

    /**
     * Android8.0 跳转到设置-允许安装未知来源-页面
     * 需要 允许安装未知来源 权限
     * 不需要这个，系统会自动引导用户去设置(已确认: 小米，原生)
     */
//    @RequiresApi(api = Build.VERSION_CODES.O)
//    private fun startInstallPermissionSettingActivity() {
//        //后面跟上包名，可以直接跳转到对应APP的未知来源权限设置界面。使用startActivityForResult 是为了在关闭设置界面之后，获取用户的操作结果，然后根据结果做其他处理
//        val intent = Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:" + app!!.packageName))
//        startActivityForResult(intent, 1)
//    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        app = null
    }
}
