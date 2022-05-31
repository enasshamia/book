
import 'package:book/bloc/pagecontrollerbloc.dart';
import 'package:book/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextPageView extends StatefulWidget {
  const TextPageView({Key key}) : super(key: key);

  @override
  _TextPageViewState createState() => _TextPageViewState();
}

class _TextPageViewState extends State<TextPageView> {
  final GlobalKey pageKey = GlobalKey();
  final PageController _pageController = PageController();
  final TextStyle _textStyle = const TextStyle(fontSize: 20);

  @override
  void initState() {
    super.initState();
    final controlBloc = Provider.of<PageControlProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controlBloc.getSizeFromBloc(pageKey);
      controlBloc.getSplittedTextFromBloc(_textStyle);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final controlBloc = Provider.of<PageControlProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Expanded(
            child: Container(
              key: pageKey,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (val) {
                    controlBloc.changeState(val);
                  },
                  itemCount: controlBloc.splittedTextList.length,
                  itemBuilder: (context, index) {
                    return Text(
                      controlBloc.splittedTextList[index],
                      style: TextStyle(fontSize: controlBloc.custFontSize),
                    );
                  }),
            ),
          ),
        _pageControll()
        ],
      ),
    );
  }

  Widget _pageControll() {
      return Consumer<PageControlProvider>(
    builder: (context, provider, widget) {
     
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: const Icon(Icons.first_page),
              onPressed: () {
                _pageController.animateToPage(0,
                    duration: kDuration, curve: kCurve);
              }),
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              _pageController.previousPage(
                  duration: kDuration, curve: kCurve);
            },
          ),
          Text(
           provider.splittedTextList.length.toString(),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              _pageController.nextPage(duration: kDuration, curve: kCurve);
            },
          ),
          IconButton(
            icon: const Icon(Icons.last_page),
            onPressed: () {
              _pageController.animateToPage(  provider.splittedTextList.length,
                  duration: kDuration, curve: kCurve);
            },
          ),
        ],
      );
      },
    );
  }
}