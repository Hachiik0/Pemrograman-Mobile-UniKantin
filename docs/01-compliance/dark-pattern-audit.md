# R5 — Audit Dark Pattern UniKantin

**Penanggung Jawab:** Muhammad Faiz Rabbany (2300016083)

## Daftar Pola yang Diaudit

| No | Pola (Dark Pattern) | Pertanyaan Uji | Risiko pada UniKantin | Harapan di UniKantin | Req ID |
|---|---|---|---|---|---|
| 1 | **Pre-selected options** | Apakah ada opsi (ukuran porsi, topping tambahan, pesanan berulang) yang sudah terpilih secara otomatis tanpa tindakan pengguna? | Mahasiswa dikenakan biaya tambahan karena opsi yang aktif otomatis (misal: tambahan porsi besar atau topping premium). | Tidak ada opsi tambahan berbayar yang terpilih secara default. Semua pilihan tambahan memerlukan tindakan eksplisit dari pengguna. | UX-03 |
| 2 | **Trick questions** | Apakah ada pertanyaan atau label tombol yang membingungkan sehingga pengguna melakukan tindakan yang tidak diinginkan? | Tombol konfirmasi dan pembatalan memiliki label yang ambigu, misalnya "Yakin tidak ingin membatalkan?" yang membingungkan. | Label tombol menggunakan bahasa yang jelas dan lugas: "Konfirmasi Pesanan", "Batalkan", "Kembali". Tidak ada negasi ganda pada label. | UX-04 |
| 3 | **Roach motel** | Apakah mudah membuat pesanan tetapi sulit atau tidak jelas cara membatalkannya? | Mahasiswa tidak menemukan cara membatalkan pesanan sebelum dikonfirmasi penjual, atau proses pembatalan memerlukan langkah yang berlebihan. | Pesanan yang belum dikonfirmasi dapat dibatalkan dengan satu ketukan. Status pembatalan ditampilkan dengan jelas. Proses penghapusan akun juga mudah ditemukan. | UX-05 |
| 4 | **Confirmshaming** | Apakah ada teks yang mempermalukan pengguna saat menolak sesuatu (misal: "Tidak, saya tidak suka diskon")? | Teks penolakan notifikasi atau promosi menggunakan kata-kata yang membuat pengguna merasa bersalah jika menolak. | Pilihan menolak menggunakan bahasa netral: "Tidak, terima kasih" atau "Lewati". Tidak ada manipulasi emosional dalam pilihan pengguna. | UX-06 |
| 5 | **Privacy zuckering** | Apakah pengguna diarahkan untuk membagikan lebih banyak data dari yang diperlukan? | Aplikasi meminta akses ke kontak, kamera, atau lokasi yang tidak relevan dengan pemesanan makanan. Atau data pesanan dibagikan ke pihak ketiga tanpa sepengetahuan pengguna. | Hanya meminta permission yang benar-benar diperlukan. Tidak ada fitur berbagi data ke pihak ketiga tanpa persetujuan eksplisit. Kebijakan privasi menjelaskan data yang dikumpulkan dengan transparan. | PRV-01 |
| 6 | **Hidden costs** | Apakah biaya tambahan (pajak, biaya layanan, biaya pengiriman) tersembunyi hingga tahap akhir checkout? | Total harga yang ditampilkan saat memilih menu berbeda dengan total akhir karena ada biaya tersembunyi. | Total harga ditampilkan secara jelas di setiap tahap pemesanan. Jika ada biaya tambahan, ditampilkan sebelum konfirmasi akhir. | UX-07 |
| 7 | **Misdirection** | Apakah desain visual mengarahkan perhatian pengguna dari informasi penting ke elemen yang kurang relevan? | Tombol "Bayar Sekarang" dibuat sangat mencolok sementara detail total harga atau syarat dibuat kecil dan sulit dibaca. | Informasi harga dan detail pesanan ditampilkan dengan ukuran yang proporsional dan mudah dibaca. Tombol aksi utama dan informasi penting memiliki hierarki visual yang seimbang. | UX-08 |

## Prinsip Desain UniKantin

1. Tidak ada opsi berbayar yang aktif secara otomatis.
2. Total harga selalu ditampilkan dengan jelas sebelum konfirmasi.
3. Pengguna mengetahui status pesanannya secara real-time.
4. Proses pembatalan pesanan (sebelum dikonfirmasi) mudah dan transparan.
5. Kebijakan privasi mudah ditemukan dari menu pengaturan.
6. Label tombol menggunakan bahasa Indonesia yang jelas dan tanpa manipulasi.
7. Permission perangkat diminta hanya yang diperlukan.

## Catatan

Audit ini bersifat preventif karena fitur UI belum diimplementasikan pada M01. Prinsip-prinsip di atas menjadi panduan desain untuk milestone implementasi UI.
