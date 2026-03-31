plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.ledgerly"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true

    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.ledgerly"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}



flutter {
    source = "../.."
}

// Icon font subsetting (tree shaking) can be killed with exit -9 (SIGKILL) on some hosts.
// `tasks.withType<FlutterTask>()` often matches nothing: the plugin comes from `includeBuild`,
// so the task type class may not equal the one referenced here. Configure by task name instead.
afterEvaluate {
    tasks.configureEach {
        if (!name.startsWith("compileFlutterBuild")) return@configureEach
        try {
            val setter =
                javaClass.methods.firstOrNull { m ->
                    m.name == "setTreeShakeIcons" && m.parameterCount == 1
                }
            setter?.invoke(this, false)
        } catch (_: Exception) {
            // Ignore if task API changes.
        }
    }
}
