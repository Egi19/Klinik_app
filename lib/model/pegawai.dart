class Pegawai {
  int? id;
  String nip;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String email;
  String password;

  Pegawai({
    this.id,
    required this.nip,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.email,
    required this.password,
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) {
    // Ensure id is parsed as int when API returns a string like "1"
    int? parsedId;
    final rawId = json['id'];
    if (rawId != null) {
      if (rawId is int) {
        parsedId = rawId;
      } else {
        parsedId = int.tryParse(rawId.toString());
      }
    }

    return Pegawai(
      id: parsedId,
      nip: json['nip'],
      nama: json['nama'],
      tanggalLahir: json['tanggal_lahir'],
      nomorTelepon: json['nomor_telepon'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nip': nip,
      'nama': nama,
      'tanggal_lahir': tanggalLahir,
      'nomor_telepon': nomorTelepon,
      'email': email,
      'password': password,
    };
  }
}
