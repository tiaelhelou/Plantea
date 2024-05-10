import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:plantea/pages/camera_components.dart';
import 'package:plantea/constants.dart';
import 'package:plantea/services/providers.dart';
import 'package:provider/provider.dart';

class camera extends StatefulWidget {
  const camera({super.key});

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [],
      ),
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: kPrimaryColor,
        ),
        inAsyncCall: Provider.of<IdentificationProvider>(context).isLoading,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PlantNameWidget(),
              const CameraWidget(),
              Provider.of<IdentificationProvider>(context).state ==
                      IdentificationState.identified
                  ? const SizedBox()
                  : const IdentificationButton(),
              const SuggestionsWidget(),
              Provider.of<IdentificationProvider>(context).state ==
                      IdentificationState.identified
                  ? const IdentificationButton()
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
