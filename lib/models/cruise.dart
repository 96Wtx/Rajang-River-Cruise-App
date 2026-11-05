class CruiseModel {
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final double rating;

  const CruiseModel({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });
}

const CruiseModel defaultCruise = CruiseModel(
name: 'Rajang River Express Cruise',
location: 'Sibu Waterfront, Sarawak',
description: 'Experience the beauty of the Rajang River, Malaysia’s longest river.',
imageUrl: 'assets/rajangriver.jpg',
rating: 43,
);