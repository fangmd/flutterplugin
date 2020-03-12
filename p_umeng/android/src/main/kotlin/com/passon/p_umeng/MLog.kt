package com.passon.p_umeng

import android.util.Log

/**
 * Author: Created by fangmingdong on 2020-01-13-14:19
 * Description:
 */

fun logd(msg: String) {
    if (BuildConfig.DEBUG) {
        Log.d(C.TAG, msg)
    }
}