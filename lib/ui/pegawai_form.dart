import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  _PegawaiFormState createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();

  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _fieldNip(),
                const SizedBox(height: 15),
                _fieldNama(),
                const SizedBox(height: 15),
                _fieldTanggalLahir(),
                const SizedBox(height: 15),
                _fieldNomorTelepon(),
                const SizedBox(height: 15),
                _fieldEmail(),
                const SizedBox(height: 15),
                _fieldPassword(),
                const SizedBox(height: 25),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==========================
  // FIELD INPUT
  // ==========================

  _fieldNip() {
    return TextFormField(
      controller: _nipCtrl,
      decoration: const InputDecoration(
        labelText: 'NIP',
        hintText: 'Masukkan NIP pegawai',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _fieldNama() {
    return TextFormField(
      controller: _namaCtrl,
      decoration: const InputDecoration(
        labelText: 'Nama Pegawai',
        hintText: 'Nama lengkap',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _fieldTanggalLahir() {
    return TextFormField(
      controller: _tanggalLahirCtrl,
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
      controller: _nomorTeleponCtrl,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: 'Nomor Telepon',
        hintText: '08xxxxxxxxxx',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _fieldEmail() {
    return TextFormField(
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'nama@contoh.com',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  _fieldPassword() {
    return TextFormField(
      controller: _passwordCtrl,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Minimal 6 karakter',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  // ==========================
  // TOMBOL SIMPAN
  // ==========================

  _tombolSimpan() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          Pegawai pegawai = Pegawai(
            nip: _nipCtrl.text,
            nama: _namaCtrl.text,
            tanggalLahir: _tanggalLahirCtrl.text,
            nomorTelepon: _nomorTeleponCtrl.text,
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
          );

          await PegawaiService().simpan(pegawai).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PegawaiDetail(pegawai: value),
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
