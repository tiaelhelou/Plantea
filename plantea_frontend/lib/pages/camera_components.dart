// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/api.dart';
import 'package:plantea/constants.dart';
import 'package:plantea/models/models.dart';
import 'package:plantea/camera_screens/image_preview.dart';
import 'package:plantea/services/providers.dart';
import 'package:provider/provider.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        await Provider.of<IdentificationProvider>(context, listen: false)
            .pickImage();
      }),
      child: Container(
        width: double.infinity,
        height: Provider.of<IdentificationProvider>(context).plants.isEmpty
            ? MediaQuery.of(context).size.height / 1.6
            : MediaQuery.of(context).size.height / 2.6,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 4, color: kPrimaryColor),
        ),
        child: Provider.of<IdentificationProvider>(context).isImageSet
            ? Center(
                child: Image(
                height: double.infinity,
                image: FileImage(
                    Provider.of<IdentificationProvider>(context, listen: false)
                        .image),
                fit: BoxFit.cover,
                width: double.infinity,
              ))
            : const Center(child: Icon(FontAwesomeIcons.images)),
      ),
    );
  }
}

class IdentificationButton extends StatelessWidget {
  const IdentificationButton({super.key});

  void buttonTriggered(BuildContext context) {
    if (Provider.of<IdentificationProvider>(context, listen: false).state ==
        IdentificationState.noimage) {
      Provider.of<IdentificationProvider>(context, listen: false).pickImage();
    } else if (Provider.of<IdentificationProvider>(context, listen: false)
            .state ==
        IdentificationState.image) {
      Provider.of<IdentificationProvider>(context, listen: false).identify();
    } else {
      Provider.of<IdentificationProvider>(context, listen: false).pickImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          buttonTriggered(context);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: 22, horizontal: MediaQuery.of(context).size.width / 3),
          child: Material(
            elevation: 6,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
                child:
                    Provider.of<IdentificationProvider>(context).buttonLabel),
          ),
        ));
  }
}

class PlantNameWidget extends StatelessWidget {
  const PlantNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.black.withOpacity(0.05)),
      child: Center(
          child: Text(
        Provider.of<IdentificationProvider>(context).isImageSet
            ? (Provider.of<IdentificationProvider>(context).name)
            : 'Capture image',
        style: kPlantNameStyle,
      )),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      width: MediaQuery.of(context).size.width / 3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            icon,
            color: Colors.black,
            size: 22,
          )
        ],
      ),
    );
  }
}

class SuggestionsWidget extends StatefulWidget {
  const SuggestionsWidget({super.key});

  @override
  State<SuggestionsWidget> createState() => _SuggestionsWidgetState();
}

class _SuggestionsWidgetState extends State<SuggestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<IdentificationProvider>(context).plants.isNotEmpty
        ? Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                elevation: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Provider.of<IdentificationProvider>(context,
                                  listen: false)
                              .plants
                              .isEmpty
                          ? 0
                          : Provider.of<IdentificationProvider>(context,
                                  listen: false)
                              .plants
                              .length,
                      itemBuilder: (context, index) {
                        List<Plant> plants =
                            Provider.of<IdentificationProvider>(context).plants;

                        return PlantSuggestionWidget(plant: plants[index]);
                      }),
                ),
              ),
            ),
          )
        : const SizedBox(
            height: 2,
          );
  }
}

class PlantSuggestionWidget extends StatefulWidget {
  const PlantSuggestionWidget({Key? key, required this.plant})
      : super(key: key);

  final Plant plant;

  @override
  State<PlantSuggestionWidget> createState() => _PlantSuggestionWidgetState();
}

class _PlantSuggestionWidgetState extends State<PlantSuggestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 2, color: kPrimaryColor),
          color: Colors.white10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      ImagePreviewPage(url: widget.plant.imagePath))));
          Api.insertImage();
        },
        child: Stack(children: [
          Image(
            image: NetworkImage(widget.plant.imagePath),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 3,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.plant.plantName,
                  style: const TextStyle(fontSize: 18, fontFamily: 'Sriracha'),
                ),
              ),
              Text(
                '${widget.plant.probability.toStringAsFixed(3)}%',
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
