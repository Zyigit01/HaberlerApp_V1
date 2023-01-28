import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../modals/haber_modals.dart';

class Haberler extends StatefulWidget {
  Haberler({Key? key}) : super(key: key);

  @override
  State<Haberler> createState() => _HaberlerState();
}

class _HaberlerState extends State<Haberler> {
  List<HaberModal> haberler = [];
  @override
  void initState() {
    //widget ilk çalışıtığında çalışan methot.
    super.initState();
    _HaberleriGetir();
  }

/////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Haber Uygulaması Created  by Zyigit01"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: _HaberleriGetir(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    //başarılı
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          var _haber = snapshot.data![index];
                          return Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                //resim
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          _haber.image!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      //color: Colors.amber,
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          _haber.name!,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              _launchUrl(
                                                  Uri.parse(_haber.url!));
                                            },
                                            child: Text("Habere Git"))
                                      ],
                                    ),
                                    //kitap bigi yeri
                                  ),
                                )
                              ],
                            ),
                          ));
                        }));
                  } else if (snapshot.hasError) {
                    //hata mesajı
                    return Text("hata var");
                  } else
                    return Center(child: CircularProgressIndicator());
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<HaberModal>> _HaberleriGetir() async {
    String _url =
        "https://api.collectapi.com/news/getNews?country=tr&tag=general";
    String _apikey = " api giriniz";//Boş bırakılan yere https://api.collectapi.com/news sitesinden kayıt olup aldığınız apikeyi yapıştırın.
    var cevap = await Dio()
        .get(_url, options: Options(headers: {"Authorization": _apikey}));
    if (cevap.statusCode == 200) {
      var veri = cevap.data as Map;
      print(veri["result"]);
      var liste =
          (veri["result"] as List).map((e) => HaberModal.fromJson(e)).toList();
      haberler = liste;
      return Future.value(liste);
    } else
      return Future.value([]);
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}

/////////////////////////////////////////////

