# Flutter Connectivity Checker

Aplikasi ini adalah proyek Flutter yang menggunakan `flutter_bloc` dan `connectivity_plus` untuk memantau status koneksi internet secara real-time di setiap halaman aplikasi.

## ✨ Fitur

- Memantau konektivitas internet menggunakan `connectivity_plus`
- Menampilkan pop-up ketika tidak ada koneksi internet
- Menggunakan `flutter_bloc` untuk manajemen state
- Pop-up tidak bisa ditutup sampai koneksi kembali

## 🛠️ Teknologi yang Digunakan

- **Flutter** (Dart)
- **flutter\_bloc 9.0.0**
- **connectivity\_plus 6.1.3**

## 🚀 Cara Menjalankan Proyek

1. Clone repositori ini:
   ```sh
   git clone https://github.com/faizdamar1/flutter_connectivity_checker
   cd flutter_connectivity_checker
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Jalankan aplikasi:
   ```sh
   flutter run
   ```

## 🛠️ Mengatasi Masalah

### 1. Error NDK Version

Jika mendapatkan error terkait NDK Version, tambahkan ini ke `android/app/build.gradle.kts`:

```kotlin
android {
    ndkVersion = "27.0.12077973"
}
```

### 2. WillPopScope Deprecated

Ganti `WillPopScope` dengan `PopScope` untuk mendukung fitur **Android predictive back**.

## 📜 Lisensi

Proyek ini menggunakan lisensi MIT.

---

Dibuat dengan ❤️ oleh Faiz Damar.

