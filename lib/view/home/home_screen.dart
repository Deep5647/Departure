import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/detail_provider.dart';
import 'detailpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    DataProvider themeProvider = Provider.of<DataProvider>(context);

    DataProvider dataProvider = Provider.of<DataProvider>(context);
    DataProvider themeProviderFalse =
    Provider.of<DataProvider>(context, listen: false);
    DataProvider langProvider = Provider.of<DataProvider>(context);
    DataProvider langProviderFalse =
    Provider.of<DataProvider>(context, listen: false);
    dataProvider.getGeetaData();
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Bhagavad Geeta'),
        backgroundColor: Colors.orange,
        centerTitle: true,
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
                langProvider.changeTheme();
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
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4/3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          children: dataProvider.newData.map(
                (e) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Detail_page(geeta: e);
                      },
                    ),
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Card(

                    margin: const EdgeInsets.all(5),
                    shadowColor: Colors.orangeAccent,
                    surfaceTintColor: Colors.orangeAccent,
                    elevation: 10,
                    child: Column(

                      children: [
                        Container(
                          color: Colors.yellow,
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(e.chapterNumber.toString()),
                            ),
                            title: (langProvider.isLangModel.isLang == false)
                                ? Text(e.nameMeaning)
                                : Text(e.name),
                            subtitle: Text(e.nameTranslation),
                          ),
                        ),
                        Container(
                          height: 190,
                          width: double.infinity,
                          child:  Image.asset(
                            'assets/img/Geeta.jpg',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
