class DemoModel {
  int? postId;
  int? productId;
  String? productName;
  String? packageName;
  String? subCategoriesName;
  String? subCategoryCh;
  String? categoryName;
  String? pricePerKg;
  String? locations;
  String? createdBy;
  String? createdDate;
  String? lastUpdate;
  String? sellerName;
  String? sellerProfilePicture;
  String? sellerPhoneNumber;
  String? sellerCountryCode;
  String? subscription;
  List<Images>? images;
  String? comments;
  String? totalComment;
  List<StateCity>? stateCity;
  String? usersLiked;

  DemoModel(
      {this.postId,
        this.productId,
        this.productName,
        this.packageName,
        this.subCategoriesName,
        this.subCategoryCh,
        this.categoryName,
        this.pricePerKg,
        this.locations,
        this.createdBy,
        this.createdDate,
        this.lastUpdate,
        this.sellerName,
        this.sellerProfilePicture,
        this.sellerPhoneNumber,
        this.sellerCountryCode,
        this.subscription,
        this.images,
        this.comments,
        this.totalComment,
        this.stateCity,
        this.usersLiked});

  DemoModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    productId = json['productId'];
    productName = json['productName'];
    packageName = json['packageName'];
    subCategoriesName = json['sub_categories_name'];
    subCategoryCh = json['sub_category_ch'];
    categoryName = json['category_name'];
    pricePerKg = json['pricePerKg'];
    locations = json['locations'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    lastUpdate = json['lastUpdate'];
    sellerName = json['sellerName'];
    sellerProfilePicture = json['sellerProfilePicture'];
    sellerPhoneNumber = json['sellerPhoneNumber'];
    sellerCountryCode = json['sellerCountryCode'];
    subscription = json['subscription'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    comments = json['comments'];
    totalComment = json['totalComment'];
    if (json['stateCity'] != null) {
      stateCity = <StateCity>[];
      json['stateCity'].forEach((v) {
        stateCity!.add(StateCity.fromJson(v));
      });
    }
    usersLiked = json['usersLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['packageName'] = this.packageName;
    data['sub_categories_name'] = this.subCategoriesName;
    data['sub_category_ch'] = this.subCategoryCh;
    data['category_name'] = this.categoryName;
    data['pricePerKg'] = this.pricePerKg;
    data['locations'] = this.locations;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['lastUpdate'] = this.lastUpdate;
    data['sellerName'] = this.sellerName;
    data['sellerProfilePicture'] = this.sellerProfilePicture;
    data['sellerPhoneNumber'] = this.sellerPhoneNumber;
    data['sellerCountryCode'] = this.sellerCountryCode;
    data['subscription'] = this.subscription;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['totalComment'] = this.totalComment;
    if (this.stateCity != null) {
      data['stateCity'] = this.stateCity!.map((v) => v.toJson()).toList();
    }
    data['usersLiked'] = this.usersLiked;
    return data;
  }
}

class Images {
  int? imageId;
  String? imagePath;

  Images({this.imageId, this.imagePath});

  Images.fromJson(Map<String, dynamic> json) {
    imageId = json['imageId'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageId'] = this.imageId;
    data['imagePath'] = this.imagePath;
    return data;
  }
}

class StateCity {
  int? marketId;
  String? marketName;
  String? city;

  StateCity({this.marketId, this.marketName, this.city});

  StateCity.fromJson(Map<String, dynamic> json) {
    marketId = json['marketId'];
    marketName = json['marketName'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marketId'] = this.marketId;
    data['marketName'] = this.marketName;
    data['city'] = this.city;
    return data;
  }
}
