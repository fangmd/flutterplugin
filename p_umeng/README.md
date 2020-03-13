# p_umeng

测试中

flutter & umeng


# Android


## 测试

1. 事件记录测试通过

```Dart
PUmeng.onEvent("MyEvent2", label: "MyLabel2");
```

2. 页面统计不确定有没有问题




## 混淆规则

```
-keep class com.umeng.** {*;}
-keepclassmembers class * {
   public <init> (org.json.JSONObject);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep public class [您的应用包名].R$*{
public static final int *;
}
```



# iOS

