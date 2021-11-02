import 'package:flutter_app/model/model_wisata.dart';

class DataWisata {
  //set data
  static var itemWisata = [
    ModelWisata(
        nama: "pasar terapung",
        alamat:
            "banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin",
        gambar: "wisata1.jpeg",
        web:
            "https://www.mytrip.co.id/article/5-fakta-pasar-terapung-banjarmasin-nggak-kalah-dari-thailand"),
    ModelWisata(
        nama: "loksado",
        alamat: "kandangan",
        gambar: "wisata2.jpeg",
        web: "https://id.wikipedia.org/wiki/Loksado,_Hulu_Sungai_Selatan"),
    ModelWisata(
        nama: "kalampayan ",
        alamat: "martapura",
        gambar: "wisata3.jpeg",
        web: "https://id.wikipedia.org/wiki/Muhammad_Arsyad_al-Banjari"),
    ModelWisata(
        nama: "pulau bekantan",
        alamat: "banjarmasin",
        gambar: "wisata4.jpeg",
        web: "https://id.wikipedia.org/wiki/Bekantan"),
    ModelWisata(
        nama: "taman permana",
        alamat: "pelaihari",
        gambar: "wisata5.jpeg",
        web:
            "https://banjarmasin.tribunnews.com/2021/05/18/wisata-kalsel-taman-permana-pelaihari-langganan-jadi-tempat-prawedding"),
    ModelWisata(
        nama: "pasar terapung",
        alamat:
            "banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin",
        gambar: "wisata1.jpeg",
        web:
            "https://www.mytrip.co.id/article/5-fakta-pasar-terapung-banjarmasin-nggak-kalah-dari-thailand"),
    ModelWisata(
        nama: "loksado",
        alamat: "kandangan",
        gambar: "wisata2.jpeg",
        web: "https://id.wikipedia.org/wiki/Loksado,_Hulu_Sungai_Selatan"),
    ModelWisata(
        nama: "kalampayan ",
        alamat: "martapura",
        gambar: "wisata3.jpeg",
        web: "https://id.wikipedia.org/wiki/Muhammad_Arsyad_al-Banjari"),
    ModelWisata(
        nama: "pulau bekantan",
        alamat: "banjarmasin",
        gambar: "wisata4.jpeg",
        web: "https://id.wikipedia.org/wiki/Bekantan"),
    ModelWisata(
        nama: "taman permana",
        alamat: "pelaihari",
        gambar: "wisata5.jpeg",
        web:
            "https://banjarmasin.tribunnews.com/2021/05/18/wisata-kalsel-taman-permana-pelaihari-langganan-jadi-tempat-prawedding"),
    ModelWisata(
        nama: "pasar terapung",
        alamat:
            "banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin banjarmasin",
        gambar: "wisata1.jpeg",
        web:
            "https://www.mytrip.co.id/article/5-fakta-pasar-terapung-banjarmasin-nggak-kalah-dari-thailand"),
    ModelWisata(
        nama: "loksado",
        alamat: "kandangan",
        gambar: "wisata2.jpeg",
        web: "https://id.wikipedia.org/wiki/Loksado,_Hulu_Sungai_Selatan"),
    ModelWisata(
        nama: "kalampayan ",
        alamat: "martapura",
        gambar: "wisata3.jpeg",
        web: "https://id.wikipedia.org/wiki/Muhammad_Arsyad_al-Banjari"),
    ModelWisata(
        nama: "pulau bekantan",
        alamat: "banjarmasin",
        gambar: "wisata4.jpeg",
        web: "https://id.wikipedia.org/wiki/Bekantan"),
    ModelWisata(
        nama: "taman permana",
        alamat: "pelaihari",
        gambar: "wisata5.jpeg",
        web:
            "https://banjarmasin.tribunnews.com/2021/05/18/wisata-kalsel-taman-permana-pelaihari-langganan-jadi-tempat-prawedding"),
  ];
  //get all data
  static var itemCount = itemWisata.length;

  //getdata by index
  static ModelWisata getItemWisata(int index) {
    return itemWisata[index];
  }
}
