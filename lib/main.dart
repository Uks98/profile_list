import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = ["회사원", "화가", "음악가", "보드선수", "대학생"];
  var imageList = [
    "images/man1.png",
    "images/man2.png",
    "images/man3.png",
    "images/man4.png",
    "images/man5.png"
  ];
  void showPopup(context, title, image, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
                    onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("나가기"))
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.6;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "프로필",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            var description = [
              "안녕하세요 저는 ${titleList[index]}입니다.",
              "안녕하세요 저는 ${titleList[index]}입니다.",
              "안녕하세요 저는 ${titleList[index]}입니다.",
              "안녕하세요 저는 ${titleList[index]}입니다.",
              "안녕하세요 저는 ${titleList[index]}입니다.",
            ];
            return GestureDetector(
              onTap: () {
                showPopup(context, titleList[index], imageList[index],
                    description[index]);
              },
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(imageList[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              titleList[index],
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: width,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  description[index],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[500]),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
