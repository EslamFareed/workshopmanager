abstract class ManageWorkshopSource {
  Future<Map<String, dynamic>> activeWorkshops(
    String id, {
    required String method,
  });
}
