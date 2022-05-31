import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({Key key}) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  PDFDocument document;
  bool isLoading = false;

  Future<void> loadFileFromAssets() async {
    document = await PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf');
    debugPrint(document.filePath);
  }

  @override
  void initState() {
    super.initState();
    loadFileFromAssets();
  }

  @override
  Widget build(BuildContext context) {
    return document == null
        ? const Text("data")
        : PDFViewer(document: document ?? PDFDocument());
    // return isLoading
    //     ? const CircularProgressIndicator()
    //     : PDFViewer(document: document);
    //  FutureBuilder<void>(
    //     future: loadFileFromAssets(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         debugPrint(snapshot.error);
    //         return const CircularProgressIndicator();
    //       } else if (snapshot.hasData) {
    //         return const CircularProgressIndicator();
    //       }
    //       return PDFViewer(document: document);
    //     });
    // Directionality(
    //     textDirection: TextDirection.rtl,
    //     child: Consumer<PageControlProvider>(builder: (context, provider, widget) {
    //       return Column(
    //         children: [
    //           Expanded(
    //             child: PageView.builder(
    //               scrollDirection: Axis.horizontal,
    //               controller: provider.pageController,
    //               onPageChanged: provider.onPageChanged,
    //               itemCount: provider.pageList.length,
    //               itemBuilder: (ctx, i) {
    //                 return SizedBox(
    //                     height: 300,
    //                     child: Text(
    //                       provider.pageList[i].content,
    //                       style: TextStyle(fontSize: provider.custFontSize),
    //                     ));
    //               },
    //             ),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               IconButton(
    //                   icon: const Icon(Icons.first_page),
    //                   onPressed: () {
    //                     provider.pageController.animateToPage(0,
    //                         duration: kDuration, curve: kCurve);
    //                   }),
    //               IconButton(
    //                 icon: const Icon(Icons.navigate_before),
    //                 onPressed: () {
    //                   provider.pageController
    //                       .previousPage(duration: kDuration, curve: kCurve);
    //                 },
    //               ),
    //               Text(
    //                   " ${provider.pageList.length} / ${provider.currentPage + 1}"),
    //               IconButton(
    //                 icon: const Icon(Icons.navigate_next),
    //                 onPressed: () {
    //                   provider.pageController
    //                       .nextPage(duration: kDuration, curve: kCurve);
    //                 },
    //               ),
    //               IconButton(
    //                 icon: const Icon(Icons.last_page),
    //                 onPressed: () {
    //                   provider.pageController.animateToPage(
    //                       provider.pageList.length,
    //                       duration: kDuration,
    //                       curve: kCurve);
    //                 },
    //               ),
    //             ],
    //           )
    //         ],
    //       );
    //     }));
  
  }
}
