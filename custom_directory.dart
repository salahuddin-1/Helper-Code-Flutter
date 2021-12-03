// PACKAGES
  // path_provider: 
  // permission_handler: 




static createCustomDirectory() async {
    // GET the permission status
    var status = await Permission.storage.status;

    // Ask for permission
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    // PATH
    String path = "/storage/emulated/0/Neosoft_Training_Tasks";

    // Creates a Directory with specifeid path
    await Directory(path).create();

    // CHECK if path exists
    final exists = await Directory(path).exists();

    print(exists);
}