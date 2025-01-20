import 'package:chefs_book/screens/chef_recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final String profilePictureUrl;
  final int worldRank;
  final String phone;
  const ChefProfile(
      {super.key,
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
      required this.profilePictureUrl,
      required this.worldRank,
      required this.phone});
  //phone, world rank,rating

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
          widget.profilePictureUrl,
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
    return Flexible(
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
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.medal,
                color: Colors.amber, // Gold-like color
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                widget.worldRank.toString(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          if (!isExpanded)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                Flexible(
                  child: Text(
                    ' ${widget.email}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.visible,
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
        Row(
          children: [
            Text('world rank ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            SizedBox(height: 8),
            FaIcon(
              FontAwesomeIcons.medal,
              color: Colors.amber, // Gold-like color
              size: 20,
            ),
            Text(' ${widget.worldRank.toString()}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: _buildDetailText('Specialty:', widget.specialties, 24),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child:
                  _buildDetailText('Experience:', widget.experienceYears, 19),
            ),
            SizedBox(width: 16),
            Flexible(
              child: _buildDetailText('Current Role:', widget.currentRole, 19),
            ),
          ],
        ),
        SizedBox(height: 8),
        _buildDetailText('Restaurants:', widget.restaurantName, 30),
        _buildDetailText('Location:', widget.restaurantLocation, 24),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChefRecipeScreen(
                        chefId: widget.email, chefName: widget.name);
                  }));
                },
                child: Text(
                  'recipes',
                  style: TextStyle(color: Colors.amber, fontSize: 18),
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailText('phone :', widget.phone, 14),
                  _buildDetailText('Email :', widget.email, 14),
                  _buildDetailText('Website :', widget.restaurantWebsite, 14),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildDetailText(String label, String value, double textSize) {
    bool isSelectable = label.toLowerCase() == 'website :' ||
        label.toLowerCase() == 'email :' ||
        label.toLowerCase() == 'phone :';
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize - 3,
            color: Colors.grey,
          ),
          children: [
            isSelectable
                ? WidgetSpan(
                    child: SelectableText(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: textSize,
                        color: Colors.white,
                      ),
                    ),
                  )
                : TextSpan(
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
