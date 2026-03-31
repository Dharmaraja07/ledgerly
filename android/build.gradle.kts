import com.android.build.gradle.BaseExtension

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Plugins like isar_flutter_libs may ship compileSdk < 31; resource merging then fails
// (e.g. android:attr/lStar) when dependencies reference API 31+ attributes.
subprojects {
    afterEvaluate {
        extensions.findByType<BaseExtension>()?.apply {
            val current =
                compileSdkVersion?.removePrefix("android-")?.toIntOrNull() ?: 0
            if (current < 31) {
                compileSdkVersion(31)
            }
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
