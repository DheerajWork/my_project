class DetailsModel {
  int? addressId;
  String? userId;
  String? name;
  String? phoneNo;
  String? alternatePhoneno;
  String? zipcode;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? createdAt;

  DetailsModel(
      {this.addressId,
        this.userId,
        this.name,
        this.phoneNo,
        this.alternatePhoneno,
        this.zipcode,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.state,
        this.createdAt});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    userId = json['user_id'];
    name = json['name'];
    phoneNo = json['phone_no'];
    alternatePhoneno = json['alternate_phoneno'];
    zipcode = json['zipcode'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    city = json['city'];
    state = json['state'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['phone_no'] = this.phoneNo;
    data['alternate_phoneno'] = this.alternatePhoneno;
    data['zipcode'] = this.zipcode;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    return data;
  }
}