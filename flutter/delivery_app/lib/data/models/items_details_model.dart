import 'package:equatable/equatable.dart';
import '../../core/constants/app_api_links.dart';

class ItemsDetailsModel extends Equatable {
  const ItemsDetailsModel({
    required this.itemsId,
    required this.itemsPriceAfterDiscount,
    required this.noItem,
    required this.itemsName,
    required this.itemsPrice,
    required this.itemsImage,
    required this.isFavorite,
    required this.itemsNameAr,
    required this.itemsActive,
    required this.categoriesId,
    required this.itemsQuantity,
    required this.itemsDiscount,
    required this.itemsCategory,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.itemsDescription,
    required this.itemsCreationTime,
    required this.itemsDescriptionAr,
    required this.categoriesCreationTime,
  });

  factory ItemsDetailsModel.fromJson(Map<String, dynamic> jsonData) =>
      ItemsDetailsModel(
        noItem: jsonData["no_item"],
        itemsId: jsonData["items_id"],
        itemsName: jsonData["items_name"],
        itemsPriceAfterDiscount:
            double.parse(jsonData["items_price"].toString()) -
            (double.parse(jsonData["items_discount"].toString()) /
                100 *
                double.parse(jsonData["items_price"].toString())),
        itemsActive: jsonData["items_active"],
        itemsNameAr: jsonData["items_name_ar"],
        categoriesId: jsonData["categories_id"],
        itemsCategory: jsonData["items_category"],
        isFavorite: jsonData["is_favorite"] == 1,
        categoriesName: jsonData["categories_name"],
        itemsDescription: jsonData["items_description"],
        categoriesNameAr: jsonData["categories_name_ar"],
        itemsCreationTime: jsonData["items_creation_time"],
        itemsDescriptionAr: jsonData["items_description_ar"],
        categoriesCreationTime: jsonData["categories_creation_time"],
        itemsPrice: double.parse(jsonData["items_price"].toString()),
        itemsQuantity: double.parse(jsonData["items_quantity"].toString()),
        itemsDiscount: double.parse(jsonData["items_discount"].toString()),
        itemsImage: "${AppApiLinks.kItemsImages}/${jsonData["items_image"]}",
      );

  final bool isFavorite;
  final String itemsImage;
  final String itemsName, itemsNameAr;
  final String categoriesName, categoriesNameAr;
  final String itemsDescription, itemsDescriptionAr;
  final double itemsQuantity,
      itemsPrice,
      itemsDiscount,
      itemsPriceAfterDiscount;
  final String itemsCreationTime, categoriesCreationTime;
  final int itemsId, itemsActive, categoriesId, itemsCategory, noItem;

  ItemsDetailsModel copyWith({
    bool? isFavorite,
    String? itemsImage,
    double? itemsPriceAfterDiscount,
    String? itemsName,
    String? itemsNameAr,
    String? categoriesName,
    String? categoriesNameAr,
    String? itemsDescription,
    String? itemsDescriptionAr,
    double? itemsQuantity,
    double? itemsPrice,
    double? itemsDiscount,
    String? itemsCreationTime,
    String? categoriesCreationTime,
    int? itemsId,
    int? itemsActive,
    int? categoriesId,
    int? itemsCategory,
    int? noItem,
  }) => ItemsDetailsModel(
    noItem: noItem ?? this.noItem,
    itemsPriceAfterDiscount:
        itemsPriceAfterDiscount ?? this.itemsPriceAfterDiscount,
    itemsId: itemsId ?? this.itemsId,
    itemsName: itemsName ?? this.itemsName,
    itemsPrice: itemsPrice ?? this.itemsPrice,
    itemsImage: itemsImage ?? this.itemsImage,
    isFavorite: isFavorite ?? this.isFavorite,
    itemsNameAr: itemsNameAr ?? this.itemsNameAr,
    itemsActive: itemsActive ?? this.itemsActive,
    categoriesId: categoriesId ?? this.categoriesId,
    itemsQuantity: itemsQuantity ?? this.itemsQuantity,
    itemsDiscount: itemsDiscount ?? this.itemsDiscount,
    itemsCategory: itemsCategory ?? this.itemsCategory,
    categoriesName: categoriesName ?? this.categoriesName,
    categoriesNameAr: categoriesNameAr ?? this.categoriesNameAr,
    itemsDescription: itemsDescription ?? this.itemsDescription,
    itemsCreationTime: itemsCreationTime ?? this.itemsCreationTime,
    itemsDescriptionAr: itemsDescriptionAr ?? this.itemsDescriptionAr,
    categoriesCreationTime:
        categoriesCreationTime ?? this.categoriesCreationTime,
  );

  @override
  List<Object?> get props => [
    noItem,
    itemsId,
    itemsName,
    itemsImage,
    isFavorite,
    itemsPrice,
    itemsNameAr,
    itemsActive,
    categoriesId,
    itemsQuantity,
    itemsDiscount,
    itemsCategory,
    categoriesName,
    itemsDescription,
    categoriesNameAr,
    itemsCreationTime,
    itemsDescriptionAr,
    categoriesCreationTime,
    itemsPriceAfterDiscount,
  ];
}
