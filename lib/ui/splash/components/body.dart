import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() =>
      _BodyState(); //state itu perubahan dari dalam widget
}

class _BodyState extends State<Body> {
  int currentPage = 0; //salah satu penampung variable list itu index dimuali dari 0
  PageController _pageController = PageController();
  // List<String> product = List.generate(
  //   10, (index) => "Product ${index + 1 }"
  //   );

  // Dasar pengambilan data API.
  List<Map<String, String>> splashData = [
    {
      "text": "Uncompromising Quality. Endless Adventure.",
      "image": "assets/images/s1.png"
    },
    {
      "text": "Innovative. Durable. Ready for Every Terrain.",
      "image": "assets/images/s2.png"
    },
    {
      "text": "Step Outside. Explore the Wild.",
      "image": "assets/images/s3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(//Buat text sama image
              flex: 3, //kasih jarak 3 kolom dan 3 row
              //biar ngikutin layar biar gak ada blank spot
              child: SizedBox(
                  width: double.infinity, //infinity itu tak terbatas yang akan membawa object ke tengah dengan kordinat 0.0
                  child: PageView.builder( //pageview buat handle page activity slide2 nya || Builder tuh buat bangun datanya
                    controller: _pageController, //buat controlling page || Buat ganti page
                      onPageChanged: (value){ //jika kita butuh untuk mewakili int bisa pake 'value'.
                      //initial state method for StatefullWidget behavior
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                          text: splashData[index]["text"]!,
                          image: splashData[index]["image"]!))),
            ),

            Expanded(//buat dots indicator || Ekspanded buat mengisi ruang yang kosong
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //mainAxisAligment 
              children:
                List.generate( //buat ngasilin dots sesuai dengan panjangn data yang ada(SplashData).
                  splashData.length,
                  (index) => _dotsIndicator(index: index)) //method extention || Index buat mulai dari 0
              
              )
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity, // widht nya ke tengah dengan titik kordinat 0.
                child: ElevatedButton( //elevated paling cocok buat ini dan dia ini belom di styling jadi kita bisa styling.
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    if (currentPage == splashData.length - 1) { //- 1 biar datanya berkurang 1 (Karna kan datanya cuma 3 sdkngn index itu dari 0 biar gak jadi 4 jadi dikurangin 1.)
                      // Kode yang digunakan untuk navigasi halaman.
                      //length banyaknya data atau panjangnya data
                      // Push untuk menggantikan halaman yang lain.
                      Navigator.push( //kode yang digunakan untuk berpindah antara halaman.
                        context, MaterialPageRoute( //context itu represent dari current page.
                          builder: (context) => LoginPage())); //represent out curent page

                    } else {
                      _pageController.animateToPage(
                        currentPage + 1,
                        duration: animationDuration,
                        curve: Curves.ease //untuk jenis animasinya
                      );
                    }
                  }, 
                child: Text(
                  currentPage == splashData.length - 1 ? "Start" : "Next",
                  style: const TextStyle(
                    color: Colors.white
                  ),
                )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// kode untuk logika dots indikator.
  AnimatedContainer _dotsIndicator({required int index}) { //kalo mau nambah required maka kasih {}
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? primaryColor : secondaryColor, //index untuk menandatakan array kbrp yg aktif
      ),
      width: currentPage == index ? 20 : 10, //kalo dia indexnya sama dengan current page maka dia bakal jadi 20 panjangnya kayak ngeaktifin
      height: 10,
      duration: animationDuration,
    );
  }
}



// Catatan Chika

// => _methodName -> Method Extration
// => MethodName -> Widget Extract (Untuk memisah widget dari logic)
//_BodyState -> Class
// Map itu ada key value {}
// List itu yang isinya ()
// List itu cara mendapatkan data lebih dari 1
// List di Akses dengan index
// PageView untuk geser2
//Safe area biar dia gak numpuk sama status bar dan control bar
