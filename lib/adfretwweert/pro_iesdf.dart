import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void lauchUrlJHSk(BuildContext context, String kmfkgm) async {
  final Uri asdfrt = Uri.parse(kmfkgm);
  if (!await launchUrl(asdfrt)) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $asdfrt'),
      ),
    );
  }
}
