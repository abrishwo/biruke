# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.messaging.FirebaseMessagingService { *; }

# AdMob
-keep class com.google.android.gms.ads.** { *; }
-keep class com.google.ads.** { *; }
-keep public class com.google.ads.mediation.** { *; }
-keep public class com.google.android.gms.ads.mediation.admob.AdMobAdapter { *; }
-keep public class com.google.ads.mediation.admob.AdMobAdapter { *; }

# If you're using Gson
-keepattributes Signature
-keepattributes *Annotation*

# General
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
-keep class * {
    @com.google.firebase.database.Exclude *;
    @com.google.firebase.database.ThrowOnExtraProperties *;
}

# For Flutter plugins
-keep class * extends java.lang.annotation.Annotation { *; }
-keep class * { @org.jetbrains.annotations.NotNull *; }
-keep class * { @androidx.annotation.Keep *; }
-keep @androidx.annotation.Keep class * { *; }
-keepclasseswithmembers class * { @androidx.annotation.Keep <fields>; }
-keepclasseswithmembers class * { @androidx.annotation.Keep <methods>; }
