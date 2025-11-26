// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/icons/Apple.svg');

  /// File path: assets/icons/Google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/Google.svg');

  /// File path: assets/icons/Line.svg
  SvgGenImage get line => const SvgGenImage('assets/icons/Line.svg');

  /// File path: assets/icons/Vector.svg
  SvgGenImage get vector => const SvgGenImage('assets/icons/Vector.svg');

  /// File path: assets/icons/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/icons/calendar.svg');

  /// File path: assets/icons/camera.svg
  SvgGenImage get camera => const SvgGenImage('assets/icons/camera.svg');

  /// File path: assets/icons/document-download.svg
  SvgGenImage get documentDownload =>
      const SvgGenImage('assets/icons/document-download.svg');

  /// File path: assets/icons/messages-2.svg
  SvgGenImage get messages2 => const SvgGenImage('assets/icons/messages-2.svg');

  /// File path: assets/icons/profile-2user.svg
  SvgGenImage get profile2user =>
      const SvgGenImage('assets/icons/profile-2user.svg');

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// File path: assets/icons/verify.svg
  SvgGenImage get verify => const SvgGenImage('assets/icons/verify.svg');

  /// File path: assets/icons/wallet-money.svg
  SvgGenImage get walletMoney =>
      const SvgGenImage('assets/icons/wallet-money.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    apple,
    google,
    line,
    vector,
    calendar,
    camera,
    documentDownload,
    messages2,
    profile2user,
    profile,
    verify,
    walletMoney,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Online Support.png
  AssetGenImage get onlineSupport =>
      const AssetGenImage('assets/images/Online Support.png');

  /// File path: assets/images/loginimage.png
  AssetGenImage get loginimage =>
      const AssetGenImage('assets/images/loginimage.png');

  /// File path: assets/images/upcomeingsessionimage.png
  AssetGenImage get upcomeingsessionimage =>
      const AssetGenImage('assets/images/upcomeingsessionimage.png');

  /// File path: assets/images/v.png
  AssetGenImage get v => const AssetGenImage('assets/images/v.png');

  /// File path: assets/images/vendorseletionimage.png
  AssetGenImage get vendorseletionimage =>
      const AssetGenImage('assets/images/vendorseletionimage.png');

  /// File path: assets/images/w.png
  AssetGenImage get w => const AssetGenImage('assets/images/w.png');

  /// File path: assets/images/welcomeimage.png
  AssetGenImage get welcomeimage =>
      const AssetGenImage('assets/images/welcomeimage.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    onlineSupport,
    loginimage,
    upcomeingsessionimage,
    v,
    vendorseletionimage,
    w,
    welcomeimage,
  ];
}

class $AssetsLanguagesGen {
  const $AssetsLanguagesGen();

  /// File path: assets/languages/de.json
  String get de => 'assets/languages/de.json';

  /// File path: assets/languages/en.json
  String get en => 'assets/languages/en.json';

  /// File path: assets/languages/es.json
  String get es => 'assets/languages/es.json';

  /// File path: assets/languages/fr.json
  String get fr => 'assets/languages/fr.json';

  /// File path: assets/languages/it.json
  String get it => 'assets/languages/it.json';

  /// File path: assets/languages/ja.json
  String get ja => 'assets/languages/ja.json';

  /// File path: assets/languages/zh.json
  String get zh => 'assets/languages/zh.json';

  /// List of all assets
  List<String> get values => [de, en, es, fr, it, ja, zh];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLanguagesGen languages = $AssetsLanguagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
