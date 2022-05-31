// import 'package:book/bloc/pagecontrollerbloc.dart';
// import 'package:book/screen/pages.dart';
// import 'package:book/screen/search_screen.dart';
// import 'package:book/theme/theme_provider.dart';
// import 'package:book/widget/custome_deawer.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<PageControlProvider>(
//           create: (context) => PageControlProvider(),
//           builder: (context, _) {
//             final providertheme = Provider.of<PageControlProvider>(context);
//             return MaterialApp(
//               themeMode: providertheme.themeMode,
//               theme: MyThemes.lightheme,
//               darkTheme: MyThemes.darkthem,
//               debugShowCheckedModeBanner: false,
//               home: const HomePage(),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       endDrawer: const CustomeDrawer(),
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {
//                 showSearch(context: context, delegate: SearchScreen());
//               },
//               icon: const Icon(Icons.search))
//         ],
//         title: const Text("app"),
//       ),
//       body: const PageScreen(),
//     );
//   }
// }
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset('assets/pdf/book.pdf', 'book.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOOK View',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Builder(
          builder: (BuildContext context) {
            return TextButton(
              child: const Text("Open Book"),
              onPressed: () {
                if (pathPDF.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(path: pathPDF),
                    ),
                  );
                }
              },
            );
          },
        )),
      ),
    );
  }
}

class PDFScreen extends StatefulWidget {
  final String path;

  const PDFScreen({Key key, this.path}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PDFView(
          fitEachPage: true,
          filePath: widget.path,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          defaultPage: currentPage,
          fitPolicy: FitPolicy.WIDTH,
          preventLinkNavigation: false,
          onRender: (_pages) {
            setState(() {
              pages = _pages;
              isReady = true;
            });
          },
          onError: (error) {
            setState(() {
              errorMessage = error.toString();
            });
          },
          onPageError: (page, error) {
            setState(() {
              errorMessage = '$page: ${error.toString()}';
            });
          },
          onViewCreated: (PDFViewController pdfViewController) {
            _controller.complete(pdfViewController);
          },
          onLinkHandler: (String uri) {
          },
          onPageChanged: (int page, int total) {
            setState(() {
              currentPage = page;
            });
          },
        ),
      ),
    );
  }
}
