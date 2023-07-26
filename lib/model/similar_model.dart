class SimilarProductModel{
  final String image;
  final String pName;
  final String quantity;
  final String price;
  final String discount;
  final String off;
  int count;
  SimilarProductModel(
      {
        required this.count,
        required this.image,
      required this.pName,
      required this.quantity,
      required this.price,
      required this.discount,
      required this.off});
}