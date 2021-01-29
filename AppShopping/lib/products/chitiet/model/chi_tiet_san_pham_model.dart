/// code : 200
/// message : "Xử lý thành công"
/// data : {"product_id":33,"category_id":10,"category_parent_id":1,"sku":"sku1","name":"document file","price":12,"final_price":12,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/ca-hong-1-B1keE.jpg","images_url":["/uploads/images/product/ca-hong-1-B1keE.jpg"],"stock":1,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"related_products":[{"product_id":10,"category_id":10,"category_parent_id":0,"sku":"3045-W","name":"Công tắc báo khẩn","description":"description description","price":360000,"final_price":360000,"is_promotion":1,"percent_discount":17,"image":"/uploads/images/product/w480/8-cong-tac-bao-khan-3045-w-obcul.png","images_url":null,"stock":100,"display":1,"rating_score":4,"rating_count":1,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":15,"category_id":10,"category_parent_id":0,"sku":"VV602-PLUS","name":"Đầu dò chấn động","description":"description description","price":1550000,"final_price":12,"is_promotion":1,"percent_discount":100,"image":"/uploads/images/product/9-1-dau-do-chan-dong-may-atm-2-txdmj-xMfPi.jpg","images_url":null,"stock":100,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":33,"category_id":10,"category_parent_id":0,"sku":"sku1","name":"document file","price":12,"final_price":12,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/ca-hong-1-B1keE.jpg","images_url":null,"stock":1,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null}],"product_info_tabs":[{"type":"info","title":"Thông tin sản phẩm","value":"","attributes_product":[{"name":"1","value":"1"},{"name":"212","value":"12"},{"name":"12","value":"12"}],"documents_product":null,"attach_products":null},{"type":"accessories","title":"Phụ kiện chọn thêm","value":"","attributes_product":null,"documents_product":null,"attach_products":[{"product_id":11,"category_id":52,"category_parent_id":0,"sku":"2202AUL","name":"Công tắc từ cửa cuốn","price":450000,"final_price":450000,"is_promotion":1,"percent_discount":11,"image":"/uploads/images/product/w480/9-cong-tac-tu-cua-cuon-2202aul-G9DZw.png","images_url":null,"stock":0,"display":0,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":15,"category_id":10,"category_parent_id":0,"sku":"VV602-PLUS","name":"Đầu dò chấn động","price":1550000,"final_price":12,"is_promotion":1,"percent_discount":100,"image":"/uploads/images/product/9-1-dau-do-chan-dong-may-atm-2-txdmj-xMfPi.jpg","images_url":null,"stock":0,"display":0,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null}]}],"ratings":{"rating_count":0,"rating_score":0,"rating_5":0,"rating_4":0,"rating_3":0,"rating_2":0,"rating_1":0,"latest_rating":[]}}

class ChiTietSanPhamModel {
  int code;
  String message;
  Data data;

  ChiTietSanPhamModel({
      this.code, 
      this.message, 
      this.data});

  ChiTietSanPhamModel.fromJson(dynamic json) {
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

/// product_id : 33
/// category_id : 10
/// category_parent_id : 1
/// sku : "sku1"
/// name : "document file"
/// price : 12
/// final_price : 12
/// is_promotion : 0
/// percent_discount : 0
/// image : "/uploads/images/product/w480/ca-hong-1-B1keE.jpg"
/// images_url : ["/uploads/images/product/ca-hong-1-B1keE.jpg"]
/// stock : 1
/// display : 1
/// rating_score : 0
/// rating_count : 0
/// quantity : 0
/// related_products : [{"product_id":10,"category_id":10,"category_parent_id":0,"sku":"3045-W","name":"Công tắc báo khẩn","description":"description description","price":360000,"final_price":360000,"is_promotion":1,"percent_discount":17,"image":"/uploads/images/product/w480/8-cong-tac-bao-khan-3045-w-obcul.png","images_url":null,"stock":100,"display":1,"rating_score":4,"rating_count":1,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":15,"category_id":10,"category_parent_id":0,"sku":"VV602-PLUS","name":"Đầu dò chấn động","description":"description description","price":1550000,"final_price":12,"is_promotion":1,"percent_discount":100,"image":"/uploads/images/product/9-1-dau-do-chan-dong-may-atm-2-txdmj-xMfPi.jpg","images_url":null,"stock":100,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":33,"category_id":10,"category_parent_id":0,"sku":"sku1","name":"document file","price":12,"final_price":12,"is_promotion":0,"percent_discount":0,"image":"/uploads/images/product/w480/ca-hong-1-B1keE.jpg","images_url":null,"stock":1,"display":1,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null}]
/// product_info_tabs : [{"type":"info","title":"Thông tin sản phẩm","value":"","attributes_product":[{"name":"1","value":"1"},{"name":"212","value":"12"},{"name":"12","value":"12"}],"documents_product":null,"attach_products":null},{"type":"accessories","title":"Phụ kiện chọn thêm","value":"","attributes_product":null,"documents_product":null,"attach_products":[{"product_id":11,"category_id":52,"category_parent_id":0,"sku":"2202AUL","name":"Công tắc từ cửa cuốn","price":450000,"final_price":450000,"is_promotion":1,"percent_discount":11,"image":"/uploads/images/product/w480/9-cong-tac-tu-cua-cuon-2202aul-G9DZw.png","images_url":null,"stock":0,"display":0,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null},{"product_id":15,"category_id":10,"category_parent_id":0,"sku":"VV602-PLUS","name":"Đầu dò chấn động","price":1550000,"final_price":12,"is_promotion":1,"percent_discount":100,"image":"/uploads/images/product/9-1-dau-do-chan-dong-may-atm-2-txdmj-xMfPi.jpg","images_url":null,"stock":0,"display":0,"rating_score":0,"rating_count":0,"quantity":0,"warranty":0,"attach_product":null,"product_document":null}]}]
/// ratings : {"rating_count":0,"rating_score":0,"rating_5":0,"rating_4":0,"rating_3":0,"rating_2":0,"rating_1":0,"latest_rating":[]}

class Data {
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
  int ratingScore;
  int ratingCount;
  int quantity;
  List<Related_products> relatedProducts;
  List<Product_info_tabs> productInfoTabs;
  Ratings ratings;

  Data({
      this.productId, 
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
      this.relatedProducts, 
      this.productInfoTabs, 
      this.ratings});

  Data.fromJson(dynamic json) {
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
    imagesUrl = json["images_url"] != null ? json["images_url"].cast<String>() : [];
    stock = json["stock"];
    display = json["display"];
    ratingScore = json["rating_score"];
    ratingCount = json["rating_count"];
    quantity = json["quantity"];
    if (json["related_products"] != null) {
      relatedProducts = [];
      json["related_products"].forEach((v) {
        relatedProducts.add(Related_products.fromJson(v));
      });
    }
    if (json["product_info_tabs"] != null) {
      productInfoTabs = [];
      json["product_info_tabs"].forEach((v) {
        productInfoTabs.add(Product_info_tabs.fromJson(v));
      });
    }
    ratings = json["ratings"] != null ? Ratings.fromJson(json["ratings"]) : null;
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
    if (relatedProducts != null) {
      map["related_products"] = relatedProducts.map((v) => v.toJson()).toList();
    }
    if (productInfoTabs != null) {
      map["product_info_tabs"] = productInfoTabs.map((v) => v.toJson()).toList();
    }
    if (ratings != null) {
      map["ratings"] = ratings.toJson();
    }
    return map;
  }

}

/// rating_count : 0
/// rating_score : 0
/// rating_5 : 0
/// rating_4 : 0
/// rating_3 : 0
/// rating_2 : 0
/// rating_1 : 0
/// latest_rating : []

class Ratings {
  int ratingCount;
  int ratingScore;
  int rating5;
  int rating4;
  int rating3;
  int rating2;
  int rating1;
  List<dynamic> latestRating;

  Ratings({
      this.ratingCount, 
      this.ratingScore, 
      this.rating5, 
      this.rating4, 
      this.rating3, 
      this.rating2, 
      this.rating1, 
      this.latestRating});

  Ratings.fromJson(dynamic json) {
    ratingCount = json["rating_count"];
    ratingScore = json["rating_score"];
    rating5 = json["rating_5"];
    rating4 = json["rating_4"];
    rating3 = json["rating_3"];
    rating2 = json["rating_2"];
    rating1 = json["rating_1"];
    if (json["latest_rating"] != null) {
      latestRating = json["latest_rating"];
      // latestRating = [];
      // json["latest_rating"].forEach((v) {
      //   latestRating.add(dynamic.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["rating_count"] = ratingCount;
    map["rating_score"] = ratingScore;
    map["rating_5"] = rating5;
    map["rating_4"] = rating4;
    map["rating_3"] = rating3;
    map["rating_2"] = rating2;
    map["rating_1"] = rating1;
    if (latestRating != null) {
      map["latest_rating"] = latestRating.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "info"
/// title : "Thông tin sản phẩm"
/// value : ""
/// attributes_product : [{"name":"1","value":"1"},{"name":"212","value":"12"},{"name":"12","value":"12"}]
/// documents_product : null
/// attach_products : null

class Product_info_tabs {
  String type;
  String title;
  String value;
  List<Attributes_product> attributesProduct;
  dynamic documentsProduct;
  dynamic attachProducts;
  bool isShowDetail;


  Product_info_tabs({
      this.type, 
      this.title, 
      this.value, 
      this.attributesProduct, 
      this.documentsProduct, 
      this.attachProducts
  ,this.isShowDetail});

  Product_info_tabs.fromJson(dynamic json) {
    type = json["type"];
    title = json["title"];
    value = json["value"];
    if (json["attributes_product"] != null) {
      attributesProduct = [];
      json["attributes_product"].forEach((v) {
        attributesProduct.add(Attributes_product.fromJson(v));
      });
    }
    documentsProduct = json["documents_product"];
    attachProducts = json["attach_products"];
    isShowDetail=false;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    map["title"] = title;
    map["value"] = value;
    if (attributesProduct != null) {
      map["attributes_product"] = attributesProduct.map((v) => v.toJson()).toList();
    }
    map["documents_product"] = documentsProduct;
    map["attach_products"] = attachProducts;
    return map;
  }

}

/// name : "1"
/// value : "1"

class Attributes_product {
  String name;
  String value;

  Attributes_product({
      this.name, 
      this.value});

  Attributes_product.fromJson(dynamic json) {
    name = json["name"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["value"] = value;
    return map;
  }

}

/// product_id : 10
/// category_id : 10
/// category_parent_id : 0
/// sku : "3045-W"
/// name : "Công tắc báo khẩn"
/// description : "description description"
/// price : 360000
/// final_price : 360000
/// is_promotion : 1
/// percent_discount : 17
/// image : "/uploads/images/product/w480/8-cong-tac-bao-khan-3045-w-obcul.png"
/// images_url : null
/// stock : 100
/// display : 1
/// rating_score : 4
/// rating_count : 1
/// quantity : 0
/// warranty : 0
/// attach_product : null
/// product_document : null

class Related_products {
  int productId;
  int categoryId;
  int categoryParentId;
  String sku;
  String name;
  String description;
  int price;
  int finalPrice;
  int isPromotion;
  int percentDiscount;
  String image;
  dynamic imagesUrl;
  int stock;
  int display;
  int ratingScore;
  int ratingCount;
  int quantity;
  int warranty;
  dynamic attachProduct;
  dynamic productDocument;

  Related_products({
      this.productId, 
      this.categoryId, 
      this.categoryParentId, 
      this.sku, 
      this.name, 
      this.description, 
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

  Related_products.fromJson(dynamic json) {
    productId = json["product_id"];
    categoryId = json["category_id"];
    categoryParentId = json["category_parent_id"];
    sku = json["sku"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    finalPrice = json["final_price"];
    isPromotion = json["is_promotion"];
    percentDiscount = json["percent_discount"];
    image = json["image"];
    imagesUrl = json["images_url"];
    stock = json["stock"];
    display = json["display"];
    ratingScore = json["rating_score"];
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
    map["description"] = description;
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