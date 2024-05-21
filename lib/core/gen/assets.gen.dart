/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class $AssetsFontGen {
  const $AssetsFontGen();

  /// File path: assets/font/Roboto-Black.ttf
  String get robotoBlack => 'assets/font/Roboto-Black.ttf';

  /// File path: assets/font/Roboto-Bold.ttf
  String get robotoBold => 'assets/font/Roboto-Bold.ttf';

  /// File path: assets/font/Roboto-Light.ttf
  String get robotoLight => 'assets/font/Roboto-Light.ttf';

  /// File path: assets/font/Roboto-Medium.ttf
  String get robotoMedium => 'assets/font/Roboto-Medium.ttf';

  /// File path: assets/font/Roboto-Regular.ttf
  String get robotoRegular => 'assets/font/Roboto-Regular.ttf';

  /// List of all assets
  List<String> get values =>
      [robotoBlack, robotoBold, robotoLight, robotoMedium, robotoRegular];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/clear-sky.json
  AssetGenImage get clearSky =>
      const AssetGenImage('assets/lottie/clear_sky.json');

  /// File path: assets/icon/drizzle.json
  AssetGenImage get drizzle =>
      const AssetGenImage('assets/lottie/drizzle.json');

  /// File path: assets/icon/fog.json
  AssetGenImage get fog => const AssetGenImage('assets/lottie/fog.json');

  /// File path: assets/icon/partly-cloud.json
  AssetGenImage get partlyCloud =>
      const AssetGenImage('assets/lottie/partly_cloud.json');

  /// File path: assets/icon/rain.json
  AssetGenImage get rain => const AssetGenImage('assets/lottie/rain.json');

  /// File path: assets/icon/snow.json
  AssetGenImage get snow => const AssetGenImage('assets/lottie/snow.json');

  /// File path: assets/icon/storm.json
  AssetGenImage get storm => const AssetGenImage('assets/lottie/storm.json');

  /// List of all assets
  List<AssetGenImage> get values =>
      [clearSky, drizzle, fog, partlyCloud, rain, snow, storm];
}

class Assets {
  Assets._();

  static const $AssetsFontGen font = $AssetsFontGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  LottieBuilder image({
    Key? key,
    AssetBundle? bundle,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    Animation<double>? controller,
    bool repeat = true,
    bool reverse = false,
    bool animate = true,
    Duration? duration,
    LottieDelegates? delegates,
    bool addRepaintBoundary = true,
    FrameRate? frameRate,
    String? package,
  }) {
    return Lottie.asset(
      _assetName,
      key: key,
      bundle: bundle,
      controller: controller,
      repeat: repeat,
      reverse: reverse,
      animate: animate,
      delegates: delegates,
      addRepaintBoundary: addRepaintBoundary,
      frameRate: frameRate,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
