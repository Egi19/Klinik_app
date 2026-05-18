import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pasien.dart';

class PasienService {
  // Ambil semua data pasien
  Future<List<Pasien>> listData() async { 
    try {
      // Use full base URL for pasien resource (this resource is in a different MockAPI account)
      final Response response = await ApiClient()
          .get('https://690829aab49bea95fbf28b58.mockapi.io/pasien');
      final List data = response.data as List;
      List<Pasien> result = data.map((json) => Pasien.fromJson(json)).toList();
      return result;
    } on DioException catch (e) {
      // Provide a clearer message for the UI
      final status = e.response?.statusCode;
      final serverMsg = e.response?.data ?? e.message;
      throw Exception('Failed to load pasien (status: $status) — $serverMsg');
    } catch (e) {
      throw Exception('Failed to load pasien — ${e.toString()}');
    }
  }

  // Simpan data pasien baru
  Future<Pasien> simpan(Pasien pasien) async {
    var data = pasien.toJson();
    final Response response = await ApiClient()
        .post('https://690829aab49bea95fbf28b58.mockapi.io/pasien', data);
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  // Ubah data pasien
  Future<Pasien> ubah(Pasien pasien, String id) async {
    var data = pasien.toJson();
    final Response response = await ApiClient()
        .put('https://690829aab49bea95fbf28b58.mockapi.io/pasien/$id', data);
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  // Ambil data pasien berdasarkan ID
  Future<Pasien> getById(String id) async {
    final Response response = await ApiClient()
        .get('https://690829aab49bea95fbf28b58.mockapi.io/pasien/$id');
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  // Hapus data pasien
  Future<Pasien> hapus(Pasien pasien) async {
    final Response response = await ApiClient().delete(
        'https://690829aab49bea95fbf28b58.mockapi.io/pasien/${pasien.id}');
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }
}
