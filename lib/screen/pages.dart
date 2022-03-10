
import 'package:book/bloc/pagecontrollerbloc.dart';
import 'package:book/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageScreen extends StatefulWidget {

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:  Consumer<PageControlProvider>(
    builder: (context, provider, widget) {
      return 

Column(
        children: [
           Expanded(
             child: Container(
                     child:   PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: provider.pageController,
                              onPageChanged: provider.onPageChanged,
                              itemCount: provider.pageList.length,
                              itemBuilder: (ctx, i)  {
                             return   Container(
                                  height: 300,
                                  child: Text(provider.pageList[i].content , style: TextStyle(fontSize: provider.custFontSize),) );
                              },
                            ),
                   ),
           ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
           IconButton(
                  icon: Icon(Icons.first_page),
                  onPressed: () {
                    provider.pageController.animateToPage(0,
                        duration: kDuration, curve: kCurve);
                  }),
              IconButton(
                icon: Icon(Icons.navigate_before),
                onPressed: () {
                  provider.pageController.previousPage(
                      duration: kDuration, curve: kCurve);
                },
              ),
              Text(
             " ${provider.pageList.length  } / ${  provider.currentPage + 1}"
              ),
              IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {
                  provider.pageController.nextPage(duration: kDuration, curve: kCurve);
                },
              ),
              IconButton(
                icon: Icon(Icons.last_page),
                onPressed: () {
                   provider.pageController.animateToPage(  provider.pageList.length,
                      duration: kDuration, curve: kCurve);
                },
              ),
        ],)
        ],
      );
    }
      )
    );
  }


}
