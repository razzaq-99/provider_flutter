import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Screens/favorite/favorite_app.dart';

import '../../Providerrr/favourite_provider/favorite_provider.dart';

class SelectedFavorite extends StatefulWidget {
  const SelectedFavorite({Key? key}) : super(key: key);

  @override
  State<SelectedFavorite> createState() => _SelectedFavoriteState();
}

class _SelectedFavoriteState extends State<SelectedFavorite> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavouriteProvider>(context);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Your selected Item",
          style: TextStyle(fontSize: 22),
        )),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteApp()));
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
                itemCount: favoriteProvider.selectedItem.length,
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
