// ignore_for_file: public_member_api_docs, sort_constructors_first
class HistoryIndicatorItemModel {
  final String name;
  final int number;
  HistoryIndicatorItemModel({
    required this.name,
    required this.number,
  });
}

final List<HistoryIndicatorItemModel> shipmentHistoryTabs = [
  HistoryIndicatorItemModel(name: "All", number: 10),
  HistoryIndicatorItemModel(name: "Completed", number: 5),
  HistoryIndicatorItemModel(name: "In Progress", number: 2),
  HistoryIndicatorItemModel(name: "Pending order", number: 5),
  HistoryIndicatorItemModel(name: "Cancelled", number: 4),
];
