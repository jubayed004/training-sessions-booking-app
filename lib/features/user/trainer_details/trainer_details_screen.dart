
import 'package:flutter/material.dart';

class TrainerDetailsScreen extends StatefulWidget {
  const TrainerDetailsScreen({super.key});

  @override
  State<TrainerDetailsScreen> createState() => _TrainerDetailsScreenState();
}

class _TrainerDetailsScreenState extends State<TrainerDetailsScreen> {
  int selectedDateIndex = 1;
  String selectedTime = '11:00';

  final List<Map<String, dynamic>> dates = [
    {'day': '18', 'weekday': 'Mon'},
    {'day': '19', 'weekday': 'Tue'},
    {'day': '20', 'weekday': 'Wed'},
    {'day': '21', 'weekday': 'Thu'},
    {'day': '22', 'weekday': 'Fri'},

    {'day': '23', 'weekday': 'Sat'},
    {'day': '24', 'weekday': 'Sun'},
  ];

  final List<String> times = ['11:00', '12:00', '2:00 p.m', '4:00 p.m'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image Section
            Stack(
              children: [
                Container(
                  height: 280,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=800',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(),
                      ...List.generate(
                        4,
                            (index) => Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(left: 6),
                          decoration: BoxDecoration(
                            color: index == 0 ? Colors.white : Colors.white.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Profile Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Ann Smith, 26',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              '4.9',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Yoga • Stretching • Pilates',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Fast Facts
                  const Text(
                    'Fast facts',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 18, color: Colors.grey[600]),
                      const SizedBox(width: 6),
                      Text(
                        'Los Angeles, CA - Within 15+4 Folds',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 18, color: Colors.grey[600]),
                      const SizedBox(width: 6),
                      Text(
                        '5 years',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // About Me
                  const Text(
                    'About me',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'I help my clients improve through, mobility and balance. My focus is on holistic training and sustainable results. See More',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Availability Preview
                  const Text(
                    'Availability preview',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Date Selector
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dates.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedDateIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDateIndex = index;
                            });
                          },
                          child: Container(
                            width: 48,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF00BFA5) : Colors.white,
                              border: Border.all(
                                color: isSelected ? const Color(0xFF00BFA5) : Colors.grey[300]!,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dates[index]['weekday'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected ? Colors.white : Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  dates[index]['day'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Time Selector
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: times.map((time) {
                      final isSelected = selectedTime == time;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF00BFA5) : Colors.white,
                            border: Border.all(
                              color: isSelected ? const Color(0xFF00BFA5) : Colors.grey[300]!,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            time,
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Cancellation Policy
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, size: 18, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Cancellation Policy',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        Text(
                          'Cancel anytime before 24hrs. No penalty. No refunds',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Pricing Options
                  const Text(
                    'Pricing options:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildPricingOption('Trial lesson', '\$0.00'),
                  _buildPricingOption('1x session', '\$30.00'),
                  _buildPricingOption('5x session', '\$100.00'),
                  _buildPricingOption('10x session', '\$180.00'),

                  const SizedBox(height: 16),

                  // Book Now Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00BFA5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Book now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Reviews Section
                  Row(
                    children: [
                      const Text(
                        'Reviews (23)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              '5.0',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Review Card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: const NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200',
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Ann Smith',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: const [
                                  Text(
                                    '5.0',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.star, color: Colors.amber, size: 12),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Amet ipsum dolor id erat consectetur. Euis et accumsan mollis. Proin et pretium mauris ultrs ut is in not elit',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // View All Reviews
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all reviews',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF00BFA5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingOption(String title, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF00BFA5),
            ),
          ),
        ],
      ),
    );
  }
}