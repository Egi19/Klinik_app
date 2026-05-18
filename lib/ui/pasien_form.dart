import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';
import 'pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  _PasienFormState createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();

  final _rmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _fieldNomorRM(),
                const SizedBox(height: 15),
                _fieldNama(),
                const SizedBox(height: 15),
                _fieldTanggalLahir(),
                const SizedBox(height: 15),
                _fieldNomorTelepon(),
                const SizedBox(height: 15),
                _fieldAlamat(),
                const SizedBox(height: 25),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fieldNomorRM() {
    return TextFormField(
      controller: _rmCtrl,
      decoration: const InputDecoration(
        labelText: 'Nomor RM',
        hintText: 'Masukkan nomor RM',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _fieldNama() {
    return TextFormField(
      controller: _namaCtrl,
      decoration: const InputDecoration(
        labelText: 'Nama',
        hintText: 'Nama lengkap',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _fieldTanggalLahir() {
    return TextFormField(
      controller: _tglLahirCtrl,
      decoration: const InputDecoration(
        labelText: 'Tanggal Lahir (YYYY-MM-DD)',
        hintText: '2025-01-31',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _fieldNomorTelepon() {
    return TextFormField(
      controller: _telpCtrl,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: 'Nomor Telepon',
        hintText: '08xxxxxxxx',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _fieldAlamat() {
    return TextFormField(
      controller: _alamatCtrl,
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      decoration: const InputDecoration(
        labelText: 'Alamat',
        hintText: 'Alamat lengkap',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _tombolSimpan() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          Pasien pasien = Pasien(
            nomorRm: _rmCtrl.text,
            nama: _namaCtrl.text,
            tanggalLahir: _tglLahirCtrl.text,
            nomorTelepon: _telpCtrl.text,
            alamat: _alamatCtrl.text,
          );

          await PasienService().simpan(pasien).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PasienDetail(pasien: value),
              ),
            );
          });
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('Simpan', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
