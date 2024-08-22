import 'package:flutter/material.dart';
import '../../../models/country_model.dart';
import '../country_details_screen.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    super.key,
    required this.country,
  });

  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            country.flag,
            width: size.width * 0.15,
            height: size.height * 0.06,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(country.name),
        subtitle: Text(country.capital),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryDetails(country: country),
            ),
          );
        },
      ),
    );
  }
}
