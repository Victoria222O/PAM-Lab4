class Wine {
  final String title;
  final String imageAsset;
  final String price;
  final int criticsScore;
  final bool isAvailable;
  final bool isAdded;

  Wine({
    required this.title,
    required this.imageAsset,
    required this.price,
    required this.criticsScore,
    this.isAvailable = true,
    this.isAdded = false,
  });
}
