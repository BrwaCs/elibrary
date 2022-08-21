import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class View extends StatefulWidget {
final url;
final pdfname;
View({this.url, this.pdfname});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
PdfViewerController? _pdfViewerController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  title:Text(
    
    widget.pdfname,style: TextStyle(
      
    fontSize: 18,
    fontWeight:FontWeight.w500, 
    
  ),
  ),
),
body:
SfPdfViewer.network(
      widget.url,
      controller: _pdfViewerController,
    ),
    );
  }
} 
