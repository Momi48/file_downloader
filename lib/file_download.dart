import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Downloader extends StatefulWidget {
  const Downloader({super.key});

  @override
  State<Downloader> createState() => _DownloaderState();
}

class _DownloaderState extends State<Downloader> {
  TextEditingController urlController = TextEditingController();
  
  TextEditingController fileName = TextEditingController();
  double? laoding;
  NotificationType notification = NotificationType.all;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Downloader'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           TextFormField(
            controller: urlController,
            decoration: InputDecoration(
              hintText: 'Past Down a Url to Download ',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(onPressed: (){
                setState(() {
                  urlController.clear();
                });
               
              }, icon: const Icon(Icons.clear),
              )
              
            ),
           ),
          const SizedBox(height: 10,),
        laoding != null ? const Center(child:  CircularProgressIndicator.adaptive()) :   Container(
            height: 40,
            width: 100,
            color: Colors.green,
           
            child:GestureDetector(
              onTap: (){
               FileDownloader.downloadFile(
                          url: urlController.text.trim(),
                          notificationType: notification,
                          onProgress: (name, progress) {
                            setState(() {
                              laoding = progress;
                            });
                            print('File name is $name');
                            print('Video is Downloading: $progress%');

                          },
                          onDownloadCompleted: (value) {
                            
                            
                            setState(() {
                              laoding = null;
                            });
                            print('VIdeo Location $value');
                          });
                
              //  onProgress: (String? name,double? path){
              //   setState(() {
              //     name = fileName.toString();
              //     path = null;
              //   });
              //   print('File Path is $path');
              //  },
              //  onDownloadCompleted: (String completion){
              //   print('DOnwloaded Completed $completion');
              //  },
              //  onDownloadError: (String error){
              //   print('Download Errror $error');
              //  }
               
               
              },
              child: const Center(child:  Text('Download'))),
          )
          ],
        ),
      ),
    );
  }
  
}