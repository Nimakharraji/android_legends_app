plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // ۱. شناسه‌ی اپلیکیشن را منحصر‌به‌فرد کن (مثلاً com.freeiran.mlbbdrafter)
    namespace = "com.freeiran.ml_drafter" 
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // ۲. این آیدی باید در کل پلی‌استور تک باشد
        applicationId = "com.freeiran.ml_drafter" 
        
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // ۳. فعال‌سازی R8 برای حذف کدهای اضافه و کاهش چشمگیر حجم اپلیکیشن
            isMinifyEnabled = true
            
            // ۴. حذف منابع (تصاویر و فایل‌های) استفاده نشده در پروژه
            isShrinkResources = true
            
            // تنظیمات استاندارد پروگارد
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )

            // ۵. برای انتشار نهایی باید کلید امضا (Keystore) بسازی و اینجا ست کنی
            signingConfig = signingConfigs.getByName("debug") 
        }
    }

    // برای پلی‌استور نیازی به useLegacyPackaging نیست چون App Bundle خودش بهینه است
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
}

flutter {
    source = "../.."
}