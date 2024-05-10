import 'package:flutter/material.dart';
import 'package:plantea/constants.dart';
import 'package:plantea/models/models.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({Key? key, required this.plant}) : super(key: key);
  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              Text(
                plant.plantName,
                style: kPlantNameStyle.copyWith(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
