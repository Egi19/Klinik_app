class Pasien {
  int? id;
  String nomorRm;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String alamat;

  Pasien({
    this.id,
    required this.nomorRm,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.alamat,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) {
    int? parsedId;
    final rawId = json['id'];
    if (rawId != null) {
      if (rawId is int) {
        parsedId = rawId;
      } else {
        parsedId = int.tryParse(rawId.toString());
      }
    }

    return Pasien(
      id: parsedId,
      nomorRm: json['nomor_rm'],
      nama: json['nama'],
      tanggalLahir: json['tanggal_lahir'],
      nomorTelepon: json['nomor_telepon'],
      alamat: json['alamat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nomor_rm': nomorRm,
      'nama': nama,
      'tanggal_lahir': tanggalLahir,
      'nomor_telepon': nomorTelepon,
      'alamat': alamat,
    };
  }
}
