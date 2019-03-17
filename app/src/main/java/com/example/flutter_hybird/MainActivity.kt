package com.example.flutter_hybird

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.FrameLayout
import io.flutter.facade.Flutter

const val ROUTE_FIRST = "r1"

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val flutterView = Flutter.createView(this, lifecycle, ROUTE_FIRST)
        val layout =
            FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT)
        setContentView(flutterView, layout)
    }
}
