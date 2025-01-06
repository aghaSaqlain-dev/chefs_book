import 'package:flutter/material.dart';
import 'dart:math' as math;

class ChefProfile extends StatefulWidget {
  final int imagePosition;
  final String name;
  final String email;
  final String specialties;
  final String experienceYears;
  final String currentRole;
  final String location;
  final String restaurantName;
  final String restaurantLocation;
  final String restaurantWebsite;
  final Color cardColor;

  ChefProfile({
    required this.imagePosition,
    required this.name,
    required this.email,
    required this.specialties,
    required this.experienceYears,
    required this.currentRole,
    required this.location,
    required this.restaurantName,
    required this.restaurantLocation,
    required this.restaurantWebsite,
    required this.cardColor,
  });

  @override
  _ChefProfileState createState() => _ChefProfileState();
}

class _ChefProfileState extends State<ChefProfile>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: widget.cardColor,
        elevation: 4,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutQuad,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: widget.imagePosition % 2 == 0
                      ? _buildRowContent(imageOnLeft: true)
                      : _buildRowContent(imageOnLeft: false),
                ),
                if (isExpanded) SizedBox(height: 16),
                if (isExpanded) _buildDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRowContent({required bool imageOnLeft}) {
    return imageOnLeft
        ? [
            _buildImage(),
            SizedBox(width: 16),
            _buildName(),
          ]
        : [
            _buildName(),
            SizedBox(width: 16),
            _buildImage(),
          ];
  }

  Widget _buildImage() {
    return Container(
      width: 160,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(17.0),
        border: Border.all(
          color: Colors.grey[700]!,
          width: 2.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(
          'https://unsplash.com/photos/this-is-the-sign-youve-been-looking-for-neon-signage-ukzHlkoz1IE',
          fit: BoxFit.cover,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Icon(
              Icons.image,
              size: 40,
              color: Colors.grey[700],
            );
          },
        ),
      ),
    );
  }

  Widget _buildName() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          if (!isExpanded)
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  ' ${widget.email}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            _buildDetailText('Specialty:', widget.specialties, 24),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildDetailText(
                  'Experience:', '${widget.experienceYears}', 17),
            ),
            SizedBox(width: 16),
            Expanded(
                child:
                    _buildDetailText('Current Role:', widget.currentRole, 17)),
          ],
        ),
        SizedBox(height: 8),
        _buildDetailText('Restaurants:', widget.restaurantName, 30),
        _buildDetailText('Location:', widget.restaurantLocation, 24),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                _buildDetailText('Email:', widget.email, 14),
                _buildDetailText('Website:', widget.restaurantWebsite, 14),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailText(String label, String value, double textSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize - 5,
            color: Colors.grey,
          ),
          children: [
            TextSpan(
              text: value ?? 'value not found',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: textSize,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
