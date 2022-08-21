import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';



class Downloade{
  Future downloadFile({required String link, String? filename} )async{

await FileDownloader.downloadFile(
    url:link,
    name: filename,

    onDownloadCompleted: (String path) {
      Get.snackbar("File downloaded to path:", "${path}");
    },
    onDownloadError: (String error) {
      print('DOWNLOAD ERROR: $error');
      Get.snackbar("DOWNLOAD ERROR:", "${error}");
    }
    
    
    );

  
}
}