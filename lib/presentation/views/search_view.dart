import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/search_bar_widget.dart';

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
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              color: Colors.purple,
              child: SearchBarWidget(
                controller: _searchBarController,
                onChanged: _handleSearchBarChanged,
              ),
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: 0,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return _buildItem(_list[index].toString(), animation);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSearchBarChanged(String value) {
    //  TODO: Populate the list with animation
    _list.clear();
    _onModelReady();
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(
            item,
          ),
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
