import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/search_bar_widget.dart';
import 'package:movemate/presentation/widgets/search_result_item_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchBarController = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                color: Colors.purple,
                child: SearchBarWidget(
                  controller: _searchBarController,
                  onChanged: _handleSearchBarChanged,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 20),
                child: AnimatedList(
                  key: _listKey,
                  itemBuilder: (context, index, animation) {
                    return const SearchResultItemWidget();
                  },
                ),
                // child: Column(
                //   children: [
                //     ...List.generate(
                //       5,
                //       (index) => Padding(
                //         padding: const EdgeInsets.only(bottom: 20),
                //         child: Row(
                //           children: [
                //             Container(
                //               height: 35,
                //               width: 35,
                //               decoration: const BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Colors.blue,
                //               ),
                //             ),
                //             const SizedBox(
                //               width: 10,
                //             ),
                //             const Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text("Veniam cillum nisi esse "),
                //                 Text(
                //                   "Voluptate minim proident laborum irure est. ",
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSearchBarChanged(String value) {
    //  TODO: Populate the list with animation
  }
}
