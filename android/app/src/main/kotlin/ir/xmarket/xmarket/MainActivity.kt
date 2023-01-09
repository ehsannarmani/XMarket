package ir.xmarket.xmarket

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL = "ir.xmarket.channel"
    private var deepLink:String? = null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor,CHANNEL).setMethodCallHandler{call,res->
            if (call.method == "deeplink"){
                res.success(deepLink)
            }
        }
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        if (intent.data != null){
            val data = intent.data.toString()
            val split = data.split("/")
            val prk = split.last()
            deepLink = prk
        }
    }
}
