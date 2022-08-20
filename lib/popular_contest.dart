import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularContest extends StatefulWidget {
  const PopularContest({Key? key}) : super(key: key);

  @override
  State<PopularContest> createState() => _PopularContestState();
}

class _PopularContestState extends State<PopularContest> {
  List popular = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popular.json")
        .then((value) {
      setState(() {
        popular = json.decode(value);
        //print(imgs);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff69c5df),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < popular.length; i++)
                      Container(
                        height: 240,
                        margin: const EdgeInsets.only(bottom: 30),
                        child: GestureDetector(
                            onTap: () => Get.toNamed("/detail/", arguments: {
                                  'title': popular[i]['title'].toString(),
                                  'text': popular[i]['text'].toString(),
                                  'info': popular[i]['info'].toString(),
                                  'name': popular[i]['name'].toString(),
                                  'time': popular[i]['time'].toString(),
                                  'img': popular[i]['img'].toString(),
                                  'prize': popular[i]['prize'].toString(),
                                }),
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              height: 220,
                              width: MediaQuery.of(context).size.width - 20,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: i.isEven
                                      ? const Color(0xFF69c5df)
                                      : const Color(0xFF9294cc)),
                              child: Column(
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      Text(
                                        popular[i]['title'],
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Expanded(child: Container())
                                    ],
                                  )),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      popular[i]['text'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFFb8eefc),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                                  Row(children: [
                                    for (int i = 0; i < 4; i++)
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage(popular[i]['img']),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                  ]),
                                ],
                              ),
                            )),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
