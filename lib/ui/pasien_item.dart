import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  final VoidCallback? onDelete;

  const PasienItem({super.key, required this.pasien, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasienDetail(pasien: pasien),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade200,
          child: const Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          pasien.nama,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("No. RM: ${pasien.nomorRm}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete, // 🔹 Jalankan callback hapus
        ),
      ),
    );
  }
}
