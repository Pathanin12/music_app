
class Album {
  String name;
  String imageURL;
  String title;
  Album(this.name, this.imageURL,this.title);
}

class listAlbum{
  static List<Album> getAlbum() {
    return <Album>[
      Album(
        'Slot Machine',
        'https://s.isanook.com/jo/0/rp/r/w728/ya0xa0m1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL2pvLzAvdWQvNDgwLzI0MDM2MzcvMzgyMzgxNjFfMTAxNTU0NTg1MTc3MjU5ODhfNDQuanBn.jpg',
        'ฟังเพลินๆ'
      ),
      Album(
        'YUNGOHM',
        'https://s.isanook.com/jo/0/rp/r/w300/ya0xa0m1w0/aHR0cHM6Ly9qb294LWNtcy1pbWFnZS0xMjUxMzE2MTYxLmZpbGUubXlxY2xvdWQuY29tLzIwMjEvMTEvMDgvODlmNGQxNzctMjA1OC00YTZhLWFjY2MtNmNmYTJkNmUwMjM4LmpwZy8xMDAw.jpg',
        'ขวัญใจวัยรุ่น'
      ),
      Album(
        'ไผ่พงศธร',
        'https://pbs.twimg.com/profile_images/1140690206535761920/zUSJbycK_400x400.jpg',
        'หนุ่มลูกทุ่ง'
      ),
      Album(
        'หนุ่ม กะลา',
        'https://news.mthai.com/app/uploads/2018/03/12-03-18-6.jpg',
        'ฟังเพราะๆในร้านเหล้า'
      ),
      Album(
        'Big Ass',
        'https://thestandard.co/wp-content/uploads/2018/03/UPDATE-%E0%B8%A1%E0%B8%B1%E0%B8%99%E0%B9%80%E0%B8%88%E0%B9%87%E0%B8%9A%E0%B8%9B%E0%B8%A7%E0%B8%94%E0%B8%A1%E0%B8%B2%E0%B8%81-%E0%B8%81%E0%B8%9A-Big-Ass-%E0%B9%80%E0%B8%9C%E0%B8%A2%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%A3%E0%B8%B9%E0%B9%89%E0%B8%AA%E0%B8%B6%E0%B8%81%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%87%E0%B8%A7%E0%B8%87%E0%B8%96%E0%B8%B9%E0%B8%81%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B8%A2%E0%B8%88%E0%B8%B1%E0%B8%9A-%E0%B8%A5%E0%B8%B0%E0%B9%80%E0%B8%A1%E0%B8%B4%E0%B8%94%E0%B8%A5%E0%B8%B4%E0%B8%82%E0%B8%AA%E0%B8%B4%E0%B8%97%E0%B8%98%E0%B8%B4%E0%B9%8C%E0%B9%80%E0%B8%9E%E0%B8%A5%E0%B8%87-%E0%B8%81%E0%B9%88%E0%B8%AD%E0%B8%99%E0%B8%95%E0%B8%B2%E0%B8%A2_c.jpg',
        'อกหัก'
      ),

    ];
  }
}
