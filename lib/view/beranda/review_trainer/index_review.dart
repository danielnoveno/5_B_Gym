import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReadReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kembali',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Custom height for profile image
                    SizedBox(
                      height: 100, // Custom height for profile image
                      width: 50, // Custom width for profile image
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'images/home-image/personal-trainer/Trainer1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name section with custom font size
                          Text(
                            'Brandom Salim Tangan',
                            style: TextStyle(
                              fontSize: 16, // Custom font size
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '25 Tahun',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Description section
                          Text(
                            'Dengan 5 tahun pengalaman di industri kebugaran...',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Review List
            Expanded(
              child: ListView(
                children: [
                  _buildReviewCard(
                    username: "Pasha Gans",
                    review:
                        "I just tried this recipe and it was amazing! The instructions were clear and easy to follow, and the end result was delicious. I will definitely be making this again. Thanks for sharing!",
                    rating: 5,
                  ),
                  _buildReviewCard(
                    username: "Gery Jawa",
                    review:
                        "I just tried this recipe and it was amazing! The instructions were clear and easy to follow, and the end result was delicious. I will definitely be making this again. Thanks for sharing!",
                    rating: 5,
                  ),
                  _buildReviewCard(
                    username: "Ardi",
                    review:
                        "I just tried this recipe and it was amazing! The instructions were clear and easy to follow, and the end result was delicious. I will definitely be making this again. Thanks for sharing!",
                    rating: 5,
                  ),
                  _buildReviewCard(
                    username: "Herdi",
                    review:
                        "I just tried this recipe and it was amazing! The instructions were clear and easy to follow, and the end result was delicious. I will definitely be making this again. Thanks for sharing!",
                    rating: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  // Helper widget to build a single review card
  Widget _buildReviewCard({
    required String username,
    required String review,
    required int rating,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.black54),
                ),
                const SizedBox(width: 12),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(rating, (index) {
                return Icon(Icons.star, color: Colors.yellow[700], size: 16);
              }),
            ),
            const SizedBox(height: 8),
            Text(
              review,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
