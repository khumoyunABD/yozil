import 'package:flutter/material.dart';
import 'package:yozil/presentation/presentation.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      navBarItem: NavBarItem.explore,
      childWidgetTitle: 'Explore',
      childWidget: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search services or businesses',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Location and Time Selectors
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 8),
                          Text('Where?'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8),
                          Text('When?'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Service Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildServiceChip('All', isSelected: true),
                    _buildServiceChip('Hair Salon'),
                    _buildServiceChip('Barbershop'),
                    _buildServiceChip('Nail Salon'),
                    _buildServiceChip('Skin Care'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Filters and Sort
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.tune),
                        SizedBox(width: 4),
                        Text('Filters'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Text('Sort by: Recommended'),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Special Offers Section
              const Text(
                'Special Offers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Special Offers Cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildOfferCard(
                      'JochyBarbe (The Prime Stylez)',
                      '612 Asylum Ave, Hartford, 06105',
                      '5.0',
                      '98 reviews',
                      '10',
                    ),
                    const SizedBox(width: 16),
                    _buildOfferCard(
                      'Jorge Barber',
                      '2502 N Main St Suite',
                      '4.8',
                      '221 reviews',
                      '15',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Results Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Results (76957)',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text('What affects the search results?'),
                    Icon(Icons.info_outline, size: 16),
                  ],
                ),
              ),

              // Service Type Chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildServiceTypeChip('Male Haircut'),
                  _buildServiceTypeChip('Haircut & Beard'),
                  _buildServiceTypeChip('Female Haircut'),
                  _buildServiceTypeChip("Kid's Haircut"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {},
      ),
    );
  }

  Widget _buildServiceTypeChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildOfferCard(
    String title,
    String address,
    String rating,
    String reviews,
    String discount,
  ) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.local_offer, color: Colors.blue[700], size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'SAVE UP TO $discount%',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Promoted',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
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
