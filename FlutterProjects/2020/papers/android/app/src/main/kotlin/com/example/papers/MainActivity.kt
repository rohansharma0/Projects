package com.iamrohan.papers


import android.os.Bundle

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

import io.flutter.plugin.common.MethodChannel
import java.io.IOException
import android.app.WallpaperManager
import android.graphics.BitmapFactory
import java.io.File
import android.os.Build
import android.annotation.TargetApi
import android.content.Context
import io.flutter.Log

private const val CHANNEL = "com.iamrohan.papers/wallpaper"

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
//     }
//     override fun onCreate(savedInstanceState: Bundle?) {
//     super.onCreate(savedInstanceState)
//     GeneratedPluginRegistrant.registerWith(flutterEngine)

    MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == "setWallpaper") {
        val arguments = call.arguments as ArrayList<*>
        val setWallpaper = setWallpaper(arguments[0] as String, applicationContext, arguments[1] as Int)

        if (setWallpaper == 0) {
          result.success(setWallpaper)
        } else {
          result.error("UNAVAILABLE", "", null)
        }
      } else {
            result.notImplemented()
      }
    }
  }
  @TargetApi(Build.VERSION_CODES.ECLAIR)
  private fun setWallpaper(path: String, applicationContext: Context, wallpaperType: Int): Int {
    var setWallpaper = 1
    val bitmap = BitmapFactory.decodeFile(path)
    val wm: WallpaperManager? = WallpaperManager.getInstance(applicationContext)
    setWallpaper = try {
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
        wm?.setBitmap(bitmap, null, true, wallpaperType)
      }
      0
    } catch (e: IOException) {
      1
    }

    return setWallpaper
  }

}

    
