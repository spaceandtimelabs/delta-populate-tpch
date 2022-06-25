import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    kotlin("jvm") version "1.6.21"
}

group = "io.spaceandtime"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(kotlin("test"))
    implementation("io.delta:delta-core_2.12:1.2.1")
    implementation("org.apache.spark:spark-sql_2.12:3.2.1")
    implementation("com.github.doyaaaaaken:kotlin-csv-jvm:1.3.0")
}

tasks.test {
    useJUnitPlatform()
}

tasks.withType<KotlinCompile> {
    kotlinOptions.jvmTarget = "1.8"
}