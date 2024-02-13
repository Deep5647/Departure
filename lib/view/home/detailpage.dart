
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_api_app/models/data_modal.dart';
import 'package:quotes_api_app/provider/detail_provider.dart';

class Detail_page extends StatelessWidget {


  DataModal geeta;
  Detail_page({super.key, required this.geeta});

  @override
  Widget build(BuildContext context) {
    DataProvider themeProvider = Provider.of<DataProvider>(context);
    DataProvider langProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,

        elevation: 15,
        centerTitle: true,
        title: (langProvider.isLangModel.isLang == false)
            ? Text(geeta.nameMeaning)
            : Text(geeta.name), 
        actions: [
          SizedBox(
            height: 70,
            width: 70,
            child: IconButton(
              onPressed: () {
                langProvider.changeLang();
            
              },
              icon: (langProvider.isLangModel.isLang == false)
                  ? Image(
                color: (themeProvider.themeModel.isLight == false)
                    ? Colors.white
                    : Colors.black,
                image: const AssetImage(
                  'assets/img/hindi.png',
                ),
              )
                  : Image(
                color: (themeProvider.themeModel.isLight == false)
                    ? Colors.white
                    : Colors.black,
                image: const AssetImage(
                  'assets/img/en.png',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
              width: 50,
              child: IconButton(
                onPressed: () {
                  themeProvider.changeTheme();
                },
                icon: (themeProvider.themeModel.isLight == false)
                    ? const Icon(
                  Icons.light_mode,
                )
                    : const Icon(
                  Icons.dark_mode,
                ),
              ),
          ),
        ],
      ),
      body: Container(
        color: Colors.yellowAccent,
        child: SingleChildScrollView(
          child: SizedBox(

            // height: double.maxFinite,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(15.0),
                   child: Image.asset(
                     'assets/img/Geeta.jpg',

                     fit: BoxFit.fill,
                   ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.orangeAccent,
                          padding: const EdgeInsets.all(17),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (langProvider.isLangModel.isLang == false)
                                    ? 'Chapter No. : ${geeta.chapterNumber}'
                                    : 'अध्याय संख्या. : ${geeta.chapterNumber}',


                                style: const TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                (langProvider.isLangModel.isLang == false)
                                    ? 'Chapter Name : ${geeta.nameMeaning}'
                                    : 'अध्याय का नाम : ${geeta.name}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orangeAccent
                          ),
                          alignment: Alignment.topLeft,
                          child: (langProvider.isLangModel.isLang == false)
                              ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              geeta.chapterSummary,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )
                              : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              geeta.chapterSummaryHindi,
                              style: const TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
