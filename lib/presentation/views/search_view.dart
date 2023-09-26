import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/components/search_field.dart';
import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchBarController = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _list = [];
  final _debouncer = Debouncer(milliseconds: 600);
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
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            toolbarHeight: 80,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: SizedBox(),
            ),
            leading: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 30),
              curve: Curves.ease,
              duration: const Duration(milliseconds: 700),
              builder: (context, value, child) {
                return Container(
                  width: 50,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Transform.translate(
                    offset: Offset(value, 0),
                    child: child,
                  ),
                );
              },
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
            title: Row(
              children: [
                Flexible(
                  child: SearchField(
                    isEnabled: true,
                    hintText: "",
                    onChanged: (value) => _debouncer.run(() {
                      _handleSearchBarChanged(value);
                    }),
                  ),
                ),
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AnimatedList(
            key: _listKey,
            initialItemCount: 0,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return _buildItem(_list[index].toString(), animation);
            },
          ),
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
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppAssets.deployedCode,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.heading5("Macbook pro M2"),
                    const SizedBox(
                      height: 5,
                    ),
                    AppText.medium("#676476476476746 . Paris -> Moroco")
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
