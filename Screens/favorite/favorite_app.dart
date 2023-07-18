import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Screens/favorite/selected_favorite.dart';

import '../../Providerrr/favourite_provider/favorite_provider.dart';

class FavoriteApp extends StatefulWidget {
  const FavoriteApp({Key? key}) : super(key: key);

  @override
  State<FavoriteApp> createState() => _FavoriteAppState();
}

class _FavoriteAppState extends State<FavoriteApp> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    // final favoriteProvider = Provider.of<FavouriteProvider>(context,listen: true);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Favorite App",
          style: TextStyle(fontSize: 22),
        )),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectedFavorite()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text("item : " + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
