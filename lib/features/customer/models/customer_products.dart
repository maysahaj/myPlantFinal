class DBProduct{
 /*  DBProduct._();
   DBProduct  dbProduct =  DBProduct._(); */
   String productId;
   String productName;
   String productImage;
   String productPrice;
   int productCount;

   DBProduct({this.productCount,
   this.productId,this.
   productImage,
   this.productName,
   this.productPrice
   });
    DBProduct.fromMap(Map<String,dynamic> map){
      this.productId = map['ProductId'];
      this.productName = map['ProductName'];
      this.productPrice = map['ProductPrice'];
      this.productImage = map['ProductImage'];
      this.productCount = map['productCount'];
    }
    toJson(){
      return {
        'ProductId':this.productId,
        'ProductName':this.productName,
        'ProductPrice':this.productPrice,
        'ProductImage':this.productImage,
        'productCount':this.productCount,


      };
  
    }



}