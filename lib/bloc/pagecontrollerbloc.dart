import 'package:book/constant.dart';
import 'package:book/logic/dynamicsize.dart';
import 'package:book/logic/splittedbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page {
  final String content;
  final String pageNumber;
  

  Page({
     this.pageNumber,
     this.content,
  });


  
  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(pageNumber: json['pageNumber'], content: json['content']);
  }
}

class PageControlProvider extends ChangeNotifier {
 int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);
  onPageChanged(int index) {
    
      currentPage = index;
      print(currentPage);
  notifyListeners();
  }
final pageList = [
  Page(
   pageNumber: "1" ,
   content:'''
المقـدمة :
الحمد لله ، اللهّم لك الحمد كله ، ولك المُلكُ كلُه ، وبيدك الخيُر كلُه ، وإليك يُرجع الفضل كلُه ، علانيته وسـره ، فَأَهْلٌ أنت أن تُحمد ، إنك على كل شيءٍ قدير .
اللهّم ربنا لك الحمد بما خلقتنا ، ورزقتنا ، وهديتنا ، وعلَّمتنا ، وأنقذتنا ، وفرَّجْتَ عنا . لك الحمـد بالإيمان ، ولك الحمد بالإسلام ، ولك الحمد بالقرآن ، ولك الحمد ، بالأهل ، والمال ، والمعافاة ، فلك الحمد على ذلك حمداً كثيراً . لك الحمد بكل نعمة أنعمت بها علينا في قديم ، أو حديث ، أو سِرٍّ أو علانية ، لك الحمد حتى ترضى ، ولك الحمد إذا رضيت .
الحمدُ لله مجيب دعاء المضطرين ، وكاشف الضرّ عن البائسين ، كاشف الكُربات ، رب الأرض والسماوات ، الشافي فلا شفاءَ إلا شفاؤه ،
'''  ),
  Page(
   pageNumber: "2" ,
   content:'''
  الحمد لله الذي وَعَدَ من أطاعه جنات عدن تجري من تحتها الأنهار ، فيها ما لا عين رأت ، ولا أُذن سمعت ، ولا خطر على قلب بشر.
الحمدُ لله حمد الشاكرين ، وأدعوه أن يرحم أمة نبينا محمد ( ويرزقهم الصبر في الشدة ، حتى تقوى عزائمهم . ويرزقهم الصبر في الرخاء ، حتى يسلكوا طريق الله القويم ، فيشكروا خالقهم الذي آزرهم في الشدة والرخاء . وسبحان ربي القائل في محكم كتابه ( وَلَنَجْزِيَنَّ الَّذِينَ صَبَرُواْ أَجْرَهُم بِأَحْسَنِ مَا كَانُواْ يَعْمَلُونَ ( (1). والقائل : ( فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُواْ لِي وَلاَ تَكْفُرُونِ ( (2) .
وأُصلِّي وأسُلم على سيدنا محمد ( إمام الصابرين الشاكرين ، الذي تحمَّل أذى المشركين فنادى ربه بنداءِ اليقين والخوف من رب العالمين " اللهم إني أشكو إليك ضَعْفَ قُوَّتي ، وقِلَّة حيلتي ، وهواني على الناس ، يا أرحم الراحمين ، أنت رب المُسْتَضْعَفِين ، وأنت ربي ، إن لم يكن بك عليَّ غضبٌ فلا أُباليِ ...... " . 

'''  ),

Page(pageNumber: "3" , 
content : '''
 الطبراني 
فعلى الرغم من الأذى الذي لَحِقَ بالرسول الكريم ( إلا أن الله كان شاغله الأول .
أما بعد :
فهذا كتاب : " آدَابُ الُدعَاءِ المُسْتجَابِ مِنَ السُنَّةِ والكِتَابِ " الذي طالما ما دَعَوْتُ الله أن يمدنى بعونه وتوفيقه حتى أتم هذا العمل ، فكانت الاستجابة الإلهية العظيمة . وكان هذا الكتاب المتواضع الذي بين يدي القارئ الكريم . وهو محاولة جادة وصادقة لإرشاد القارئ للأدعية المأثورة ، والدعوات المأخوذة من الكتاب والسنة ، قمت بجمعها ، وترتيبها ، وتنسيقها  ليسهل الانتفاع بها ، والإفادة منها . 
والحقيقة التي لا أستطيع أن أنكرها أنه عندما فكرتُ في الكتابة في هذا الموضوع ، أخذُتُ أُسائل نفسي ، هل أستطيع أن أكتب في آداب الدعاء من الكتاب والسُنَّة ؟ لأنني قبل ذلك كنت أكتب في الأدب والمكتبات ، ولي مؤلفات في ذلك . في بداية الأمر شعرتُ بصعوبة الخوض في آيات القرآن الكريم ، وأحاديث الرسول ( وبعظم ذلك الأمر على نفسي ، ثم قلتُ بعد تردد كثير دام شهوراً ، إنني سأُعالج الموضوع في كتابي من الناحية الموضوعية فقط ، وما أكثر من أقدم على هذا الموضوع قديماً وحديثاً .
لكن السبب الرئيس الذي دفعني لاختيار هذا الموضوع بالذات ، هو حلاوة العيش مع الدعاء القرآني والدعاء النبوي . 


'''
)
];



  DynamicSize _dynamicSize = DynamicSizeImpl();
  SplittedText _splittedText = SplittedTextImpl();
  Size _size;
  List<String> _splittedTextList = [];
  List<String> get splittedTextList => _splittedTextList;
int index ;
  getSizeFromBloc(GlobalKey pagekey) {
    _size = _dynamicSize.getSize(pagekey);
    print(_size);
  }

  getSplittedTextFromBloc(TextStyle textStyle) {
    _splittedTextList =
        _splittedText.getSplittedText(_size, textStyle, kSmapleText);
  }

  void changeState(int currentIndex) {
  index = currentIndex ;
  notifyListeners();
  }

  
   ThemeMode themeMode = ThemeMode.dark ;
  bool get isDarkMode => themeMode ==ThemeMode.dark ;
  void togglemode (bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light ;
    notifyListeners();
  }

   double custFontSize = 10;

  void increaseFontSize() async{
      custFontSize+=1;
    notifyListeners();
  }

  void decreaseFontSize() async{
      custFontSize-=1;
    notifyListeners();
  }
}