/// code : 200
/// message : "Xử lý thành công"
/// data : {"products":[{"product_id":35,"category_id":14,"category_parent_id":2,"sku":"df343","name":"San pham test 2","price":0,"final_price":0,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/logo-tnt-security-vuong1024-x-1024-iW1um.png","images_url":["/uploads/images/product/logo-tnt-security-vuong1024-x-1024-iW1um.png"],"stock":100,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":8,"category_id":14,"category_parent_id":2,"sku":"DRC-40K","name":"Camera chuông cửa","description":"description description","price":1260000,"final_price":1260000,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/6-camera-chuong-cua-drc-40k-Gs6I7.png","images_url":["/uploads/images/product/6-camera-chuong-cua-drc-40k-Gs6I7.png"],"stock":100,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":7,"category_id":15,"category_parent_id":2,"sku":"DS-2CE56F7T-IT3Z","name":"Camera bán cầu 3MP, chống ngược sáng","description":"description description3 3 3","price":1800000,"final_price":1800000,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/5-camera-ban-cau-nguoc-sang-8vtnS.png","images_url":["/uploads/images/product/5-camera-ban-cau-nguoc-sang-8vtnS.png"],"stock":100,"display":1,"rating_score":3.9,"rating_count":12,"quantity":0,"warranty":0,"attach_product":null,"product_document":null}]}

class DanhSachSanPhanModel {
  int code;
  String message;
  Data data;

  DanhSachSanPhanModel({this.code, this.message, this.data});

  DanhSachSanPhanModel.fromJson(dynamic json) {
    code = json["code"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["message"] = message;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }
}

/// products : [{"product_id":35,"category_id":14,"category_parent_id":2,"sku":"df343","name":"San pham test 2","price":0,"final_price":0,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/logo-tnt-security-vuong1024-x-1024-iW1um.png","images_url":["/uploads/images/product/logo-tnt-security-vuong1024-x-1024-iW1um.png"],"stock":100,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":8,"category_id":14,"category_parent_id":2,"sku":"DRC-40K","name":"Camera chuông cửa","description":"description description","price":1260000,"final_price":1260000,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/6-camera-chuong-cua-drc-40k-Gs6I7.png","images_url":["/uploads/images/product/6-camera-chuong-cua-drc-40k-Gs6I7.png"],"stock":100,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":7,"category_id":15,"category_parent_id":2,"sku":"DS-2CE56F7T-IT3Z","name":"Camera bán cầu 3MP, chống ngược sáng","description":"description description3 3 3","price":1800000,"final_price":1800000,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/5-camera-ban-cau-nguoc-sang-8vtnS.png","images_url":["/uploads/images/product/5-camera-ban-cau-nguoc-sang-8vtnS.png"],"stock":100,"display":1,"rating_score":3.9,"rating_count":12,"quantity":0,"warranty":0,"attach_product":null,"product_document":null}]

class Data {
  List<Products> products;

  Data({this.products});

  Data.fromJson(dynamic json) {
    if (json["products"] != null) {
      products = [];
      json["products"].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (products != null) {
      map["products"] = products.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// product_id : 35
/// category_id : 14
/// category_parent_id : 2
/// sku : "df343"
/// name : "San pham test 2"
/// price : 0
/// final_price : 0
/// is_promotion : 0
/// percent_discount : 0
/// image : "/uploads/images/product/w480/logo-tnt-security-vuong1024-x-1024-iW1um.png"
/// images_url : ["/uploads/images/product/logo-tnt-security-vuong1024-x-1024-iW1um.png"]
/// stock : 100
/// display : 1
/// rating_score : 0
/// rating_count : 0
/// quantity : 0
/// warranty : 0
/// attach_product : null
/// product_document : null

class Products {
  int productId;
  int categoryId;
  int categoryParentId;
  String sku;
  String name;
  int price;
  int finalPrice;
  int isPromotion;
  int percentDiscount;
  String image;
  List<String> imagesUrl;
  int stock;
  int display;
  double ratingScore;
  int ratingCount;
  int quantity;
  int warranty;
  dynamic attachProduct;
  dynamic productDocument;

  Products(
      {this.productId,
      this.categoryId,
      this.categoryParentId,
      this.sku,
      this.name,
      this.price,
      this.finalPrice,
      this.isPromotion,
      this.percentDiscount,
      this.image,
      this.imagesUrl,
      this.stock,
      this.display,
      this.ratingScore,
      this.ratingCount,
      this.quantity,
      this.warranty,
      this.attachProduct,
      this.productDocument});

  Products.fromJson(dynamic json) {
    productId = json["product_id"];
    categoryId = json["category_id"];
    categoryParentId = json["category_parent_id"];
    sku = json["sku"];
    name = json["name"];
    price = json["price"];
    finalPrice = json["final_price"];
    isPromotion = json["is_promotion"];
    percentDiscount = json["percent_discount"];
    image = json["image"];
    imagesUrl =
        json["images_url"] != null ? json["images_url"].cast<String>() : [];
    stock = json["stock"];
    display = json["display"];
    ratingScore = json["rating_score"]*1.0;
    ratingCount = json["rating_count"];
    quantity = json["quantity"];
    warranty = json["warranty"];
    attachProduct = json["attach_product"];
    productDocument = json["product_document"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["product_id"] = productId;
    map["category_id"] = categoryId;
    map["category_parent_id"] = categoryParentId;
    map["sku"] = sku;
    map["name"] = name;
    map["price"] = price;
    map["final_price"] = finalPrice;
    map["is_promotion"] = isPromotion;
    map["percent_discount"] = percentDiscount;
    map["image"] = image;
    map["images_url"] = imagesUrl;
    map["stock"] = stock;
    map["display"] = display;
    map["rating_score"] = ratingScore;
    map["rating_count"] = ratingCount;
    map["quantity"] = quantity;
    map["warranty"] = warranty;
    map["attach_product"] = attachProduct;
    map["product_document"] = productDocument;
    return map;
  }
}
