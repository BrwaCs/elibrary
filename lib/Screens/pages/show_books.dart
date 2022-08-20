import 'package:auto_size_text/auto_size_text.dart';
import 'package:elibrary/Screens/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class ShowBooks extends StatelessWidget {
ShowBooks({Key? key, required this.bookname, required this.authername, required this.image, required this.description, required this.PdfFile}) : super(key: key);
final String bookname;
final String authername;
final String image;
final String description;
final String PdfFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          bookname,
          style: TextStyle(
            fontSize:24,
            fontWeight:FontWeight.normal,
            color:Colors.black
          )
          ),
          centerTitle: true,    
      
    // black line of the bottom AppBar
bottom: PreferredSize(
      // ignore: sort_child_properties_last
      child: Container(
         color: Colors.black,
         height: 1.0,
      ),
      preferredSize: Size.fromHeight(1.5)
      ),
      iconTheme: IconThemeData(color:Theme.of(context).primaryColor),
      ),
body: SingleChildScrollView(
  child:   Column(
  
    children: [
  
      Container(
  
        height: 450,
  
        width: double.infinity,
  
        child: Image.network(image),
  
      ),
  
      Padding(
  
        padding: const EdgeInsets.only(left:18.0,right: 18,top: 10,bottom: 10),
  
        child: Row(
  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
          
  
          children: [
  
            Text(bookname,
  
            style: TextStyle(
  
              fontWeight: FontWeight.w400,
  
              fontSize: 18
  
            ),),
  
               Text(authername,
  
            style: TextStyle(
  
              fontWeight: FontWeight.w400,
  
              fontSize: 16
  
            ),),
  
          ],
  
        ),
  
      ),
  
      Padding(
  
        padding: const EdgeInsets.all(8.0),
  
        child: Row(
  
          mainAxisAlignment: MainAxisAlignment.center,
  
          children: [
  
         SizedBox(
  
                width: 330,
  
                height: 150,
  
                child: AutoSizeText(
  
                  description,
  
                  style: TextStyle(fontSize: 16,
  
                  height: 1.25
  
                  ),
  
                  textAlign: TextAlign.center,
  
                  maxLines: 9,
                ),
  
              ),
              
          ],
  
        ),
  
      ),

    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Color.fromARGB(255, 30, 212, 0),
          height: 42,
          width: 209,
          child: ElevatedButton(onPressed: (){
            Get.to(()=>View(pdfname:bookname ,url: PdfFile,));
  
          },
         
           child: Text("Read",
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w500
           ),
           )),
        )
      ],
    ),
    SizedBox(height: 34,),
     Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 42,
          width: 209,
          child: ElevatedButton(onPressed: (){},
           style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(Color.fromARGB(255, 30, 212, 0),),
          ),
           child: Text("Downloade",
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w500
           ),
           )),
        )
      ],
    ),
    SizedBox(height: 34,),
     Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 42,
          width: 209,
          child: ElevatedButton(onPressed: (){},
           style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(Color.fromARGB(255, 223, 214, 7),),
          ),
           child: Text("Review",
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w500
           ),
           )),
        )
      ],
    ),
    SizedBox(height: 30,)
  
    ],
  
  ),
),
    );
    
  }



}

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
void initState() {
  _pdfViewerController = PdfViewerController();
  super.initState();
}

late OverlayEntry _overlayEntry;

void _showContextMenu(BuildContext context,PdfTextSelectionChangedDetails details) {
  final OverlayState? _overlayState = Overlay.of(context);
  _overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: details.globalSelectedRegion!.center.dy - 55,
      left: details.globalSelectedRegion?.bottomLeft.dx,
      child:
      RaisedButton(child: Text('Copy',style: TextStyle(fontSize: 17)),onPressed: (){
        Clipboard.setData(ClipboardData(text: details.selectedText));
        _pdfViewerController?.clearSelection();
      },color: Colors.white,elevation: 10,),
    ),
  );
  _overlayState?.insert(_overlayEntry);
}

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
      onTextSelectionChanged:
          (PdfTextSelectionChangedDetails details) {
        if (details.selectedText == null && _overlayEntry != null) {
          _overlayEntry.remove();
          _overlayEntry = null as OverlayEntry;
        } else if (details.selectedText != null && _overlayEntry == null) {
          _showContextMenu(context, details);
        }
      },
      controller: _pdfViewerController,
    ),
    );
  }
} 


