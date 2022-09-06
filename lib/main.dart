import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF7F7F7),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            elevation: 1,
          )
        ),

      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final FloatingSearchBarController controller = FloatingSearchBarController();
  final _items = [
    "b1.png",
    "b2.jpg",
    "b3.jpg",
    "b4.jpg",
    "b5.jpg",
    "b6.jpg",
    "b1.png",
    "b2.jpg",
    "b3.jpg",
    "b4.jpg",
    "b5.jpg",
    "b6.jpg",
  ];

  final _listViewImages = [
    "lv1.jpg",
    "lv2.jpg",
    "lv3.jpg",
    "lv4.jpg",
    "lv5.jpg",
  ];

  final _listViewNames = [
    "Dogu Ekspresinde Cinayet - Bir Hercule Poirot Hikayesi ",
    "Seninle Baslamadı",
    "Harry Potter: Film Dehlizi Kitap 2: Diagon Yolu",
    "Gün Isıgının Tadı",
    "Küçük İsler Büyük Özgürlükler",
  ];

  final _listViewAuthors = [
    "Agatha Christie",
    "Mark Wolynn",
    "Jody Revenson",
    "Ewald Arenz",
    "Mert Başaran",
  ];

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 58,
            width: MediaQuery.of(context).size.width,
            child: FloatingSearchBar(
              elevation: 1,
              actions: const [Icon(Icons.qr_code_scanner_outlined,color: Colors.grey,) ,Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.mic_none_outlined,color: Colors.grey,),
              ),],
              leadingActions: const [Icon(Icons.search_outlined,color: Colors.grey,)],
              controller: controller,
              hint: '  Kitap, Müzik, Hobi, Oyuncak Ara...',
              builder: (context, _) {
                return Container();
              },
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                child: Container(
                  color: Colors.white,
                  height: 195,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    itemCount: _items.length,
                    controller: _pageController,
                    itemBuilder: (BuildContext context, int index){
                      return Image(
                        image: AssetImage("assets/${_items[index]}"),
                      );
                    },
                    onPageChanged: (int index){
                      _currentPageNotifier.value = index;
                    },
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 10.0,
                child: CirclePageIndicator(
                  itemCount: _items.length,
                  currentPageNotifier: _currentPageNotifier,
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
                child: Container(
                  color: const Color(0xfffe0000),
                  height: 40,
                  width: 193.5,
                  child: const Center(
                    child: Text("Oyuncaklar", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: const Color(0xff0080ff),
                  height: 40,
                  width: 193.5,
                  child: const Center(
                    child: Text("Elektronik", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),

          Container(
            color: Colors.white,
            height: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: const [
                      Text("Öne Çıkan Kitaplar",style: TextStyle(color: Color(0xff6f6f6f), fontSize: 18, fontFamily: "Publica"),),
                      Padding(
                        padding: EdgeInsets.only(left: 135.0),
                        child: Text("Tümünü Göster",style: TextStyle(color: Color(0xff36486e), fontSize: 16, fontFamily: "Texta"),),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 6),
                    itemBuilder: (BuildContext context, int index) {
                      return buildRow(index);
                    }, separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 8);
                  }, itemCount: 5,

                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/logo.jpg', height: 32, alignment: FractionalOffset.center),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right : 12.0),
            child: Icon(Icons.notifications_none_outlined),
          ),
        ],
        leading: const Center(
          child: Image(
            image: AssetImage('assets/menu.jpg'),
            width: 36,
            height: 36,
            fit: BoxFit.contain,
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.blue,),
          label: "Ana Sayfa",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_important_outline),
          label: "Kategoriler",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.remove_red_eye_outlined),
          label: "Keşfet",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: "Sepet",
          backgroundColor: Colors.white,
        ),
      ]),
    );
  }
  Widget buildRow(int index) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 6.0, bottom: 6.0),
          child: Image(image: AssetImage("assets/${_listViewImages[index]}"),height: 150,width: 100,),
        ),

        SizedBox(
          width: 100,
          height: 37,
          child: Text(_listViewNames[index],textAlign: TextAlign.center, maxLines: 2,style: const TextStyle(fontSize: 15, fontFamily: "Neuzeit"),)),

        SizedBox(
          width: 100,
          height: 15,
          child: Text(_listViewAuthors[index], textAlign: TextAlign.center, maxLines: 1,style: const TextStyle(fontSize: 12,fontStyle: FontStyle.italic),),
        )
      ],
  );

}


