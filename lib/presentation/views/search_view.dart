import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchBarController = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _list = [];
  @override
  void initState() {
    super.initState();
    _onModelReady();
  }

  _onModelReady() async {
    if (mounted) {
      for (var i = 0; i < 5; i++) {
        await Future.delayed(const Duration(milliseconds: 100));
        _addItem();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          toolbarHeight: 110,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Container(
            height: 54,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
        body: AnimatedList(
          key: _listKey,
          initialItemCount: 0,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return _buildItem(_list[index].toString(), animation);
          },
        ),
      ),
    );
  }

  _handleSearchBarChanged(String value) async {
    _list.clear();
    _listKey.currentState?.removeAllItems(
      (context, animation) => const SizedBox(),
    );
    await Future.delayed(const Duration(milliseconds: 100));
    _onModelReady();
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SlideTransition(
      // sizeFactor: animation,
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.heading5("Laborum proident reprehenderit amet"),
                    const SizedBox(
                      height: 5,
                    ),
                    AppText.medium(
                        "Culpa sit adipisicing sunt est tempor sunt aute")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  void _addItem() {
    final int index = _list.length;
    _list.insert(index, index);
    _listKey.currentState?.insertItem(index);
  }

  void _removeItem() {
    final int index = _list.length - 1;
    _listKey.currentState
        ?.removeItem(index, (context, animation) => Container());

    /// what I'm supposed to do here
    _list.removeAt(index);
  }
}
