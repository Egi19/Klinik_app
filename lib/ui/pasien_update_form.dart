import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nomorRMController;
  late TextEditingController namaController;
  late TextEditingController tanggalLahirController;
  late TextEditingController nomorTeleponController;
  late TextEditingController alamatController;

  @override
  void initState() {
    super.initState();

    nomorRMController = TextEditingController(text: widget.pasien.nomorRm);
    namaController = TextEditingController(text: widget.pasien.nama);
    tanggalLahirController =
        TextEditingController(text: widget.pasien.tanggalLahir);
    nomorTeleponController =
        TextEditingController(text: widget.pasien.nomorTelepon);
    alamatController = TextEditingController(text: widget.pasien.alamat);
  }

  @override
  void dispose() {
    nomorRMController.dispose();
    namaController.dispose();
    tanggalLahirController.dispose();
    nomorTeleponController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  void updateData() {
    if (_formKey.currentState!.validate()) {
      final updated = Pasien(
        id: widget.pasien.id,
        nomorRm: nomorRMController.text,
        nama: namaController.text,
        tanggalLahir: tanggalLahirController.text,
        nomorTelepon: nomorTeleponController.text,
        alamat: alamatController.text,
      );

      Navigator.pop(context, updated);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Data Pasien")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nomorRMController,
                decoration: const InputDecoration(labelText: "Nomor RM"),
                validator: (value) =>
                    value!.isEmpty ? "Nomor RM tidak boleh kosong" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (value) =>
                    value!.isEmpty ? "Nama tidak boleh kosong" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: tanggalLahirController,
                decoration: const InputDecoration(labelText: "Tanggal Lahir"),
                validator: (value) =>
                    value!.isEmpty ? "Tanggal lahir tidak boleh kosong" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: nomorTeleponController,
                decoration: const InputDecoration(labelText: "Nomor Telepon"),
                validator: (value) =>
                    value!.isEmpty ? "Nomor telepon tidak boleh kosong" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(labelText: "Alamat"),
                validator: (value) =>
                    value!.isEmpty ? "Alamat tidak boleh kosong" : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: updateData,
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
