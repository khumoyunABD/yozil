import 'package:flutter/material.dart';
import 'package:yozil/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      navBarItem: NavBarItem.home,
      childWidgetTitle: appName,
      childWidget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search services or businesses',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Category Circles
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  CategoryCircle(
                    imageUrl: 'assets/images/dental.jpg',
                    label: 'Dental &\nOrthodontics',
                  ),
                  CategoryCircle(
                    imageUrl: 'assets/images/health.jpg',
                    label: 'Health &\nFitness',
                  ),
                  CategoryCircle(
                    imageUrl: 'assets/images/professional.jpg',
                    label: 'Professional\nServices',
                  ),
                  CategoryCircle(
                    imageUrl: 'assets/images/other.jpg',
                    label: 'Other',
                  ),
                  CategoryCircle(
                    imageUrl: 'assets/images/hair.jpg',
                    label: 'Hair Salon',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Special Offers Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Special Offers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Special Offers Cards
            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  OfferCard(
                    imageUrl: 'assets/images/jochy.jpg',
                    title: 'JochyBarbe (The Prime Stylez)',
                    address: '612 Asylum Ave, Hartford, 06105',
                    rating: '5.0',
                    reviews: '98 reviews',
                    discount: '10',
                  ),
                  SizedBox(width: 16),
                  OfferCard(
                    imageUrl: 'assets/images/jorge.jpg',
                    title: 'Jorge Barber',
                    address: '2502 N Main St Suite',
                    rating: '4.8',
                    reviews: '221 reviews',
                    discount: '15',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Recommended Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CategoryCircle extends StatelessWidget {
  final String imageUrl;
  final String label;

  const CategoryCircle({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final String rating;
  final String reviews;
  final String discount;

  const OfferCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rating
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating ($reviews)',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.local_offer,
                            color: Colors.blue[700], size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'SAVE UP TO $discount%',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.thumb_up, size: 20),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // const Icon(Icons.check_circle,
                    //     color: Colors.grey, size: 16),
                    // const SizedBox(width: 4),
                    Text(
                      'Promoted',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.info_outline,
                        color: Colors.grey, size: 14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
