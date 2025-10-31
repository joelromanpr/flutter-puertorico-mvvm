
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
import 'package:flutter_puertorico_mvvm/core/di/locator.dart';

class NetworkSvg extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const NetworkSvg({super.key, required this.url, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: locator<Dio>().get(url).then((response) => response.data.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Icon(Icons.error, size: 50, color: Colors.red);
        } else {
          return SvgPicture.string(
            snapshot.data!,
            fit: fit,
          );
        }
      },
    );
  }
}
