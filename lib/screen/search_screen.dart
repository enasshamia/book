
import 'package:book/bloc/pagecontrollerbloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class searchScreen extends SearchDelegate {
  
   @override
  List<Widget> buildActions(BuildContext context) {
   return[ Icon(Icons.clear),];
  }

  @override
  Widget buildLeading(BuildContext context) {
   return IconButton(onPressed: () {
     close(context , null);
   }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return(Container());
  }

  @override
  Widget buildSuggestions(BuildContext context) {

  final suggestion = Provider.of<PageControlProvider>(context).pageList.where((element) => element.content.contains(query)).toList();    ;
        return  Container(
          child:Consumer<PageControlProvider>(
    builder: (context, provider, widget) {
      return Column(
children: [
   Expanded(
            child:  Container(
                     child:   PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: provider.pageController,
                              onPageChanged: provider.onPageChanged,
                              itemCount: provider.pageList.length,
                              itemBuilder: (ctx, i)  {
                             return 
                                RichText(
                          text: TextSpan(
                              text: suggestion[i]
                                  .content
                                  .substring(0, query.length),
                              style:const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700),
                              children: [
                                TextSpan(
                                  text: provider.pageList[i]
                                      .content
                                      ,
                                  style:const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                )
                              ]),
                        );
                              },
                            ),
                   ),
          )
],
      );
    }
    
          )
     ,
        );

  }
}
 