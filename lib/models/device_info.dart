import 'dart:convert';

abstract class DeviceInfo {
  String uniqueId();
}

class AndroidInfo extends DeviceInfo {
  String? platform;
  String? versionSecurityPatch;
  int? versionSdkInt;
  String? versionRelease;
  int? versionPreviewSdkInt;
  String? versionIncremental;
  String? versionCodename;
  String? versionBaseOS;
  String? board;
  String? bootloader;
  String? brand;
  String? device;
  String? display;
  String? fingerprint;
  String? hardware;
  String? host;
  String? id;
  String? manufacturer;
  String? model;
  String? product;
  List<String>? supported32BitAbis;
  List<String>? supported64BitAbis;
  List<String>? supportedAbis;
  String? tags;
  String? type;
  bool? isPhysicalDevice;
  String? androidId; // unique ID on Android
  List<String>? systemFeatures;

  AndroidInfo({
    this.platform,
    this.versionSecurityPatch,
    this.versionSdkInt,
    this.versionRelease,
    this.versionPreviewSdkInt,
    this.versionIncremental,
    this.versionCodename,
    this.versionBaseOS,
    this.board,
    this.bootloader,
    this.brand,
    this.device,
    this.display,
    this.fingerprint,
    this.hardware,
    this.host,
    this.id,
    this.manufacturer,
    this.model,
    this.product,
    this.supported32BitAbis,
    this.supported64BitAbis,
    this.supportedAbis,
    this.tags,
    this.type,
    this.isPhysicalDevice,
    this.androidId,
    this.systemFeatures,
  });

  AndroidInfo.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    versionSecurityPatch = json['version.securityPatch'];
    versionSdkInt = json['version.sdkInt'];
    versionRelease = json['version.release'];
    versionPreviewSdkInt = json['version.previewSdkInt'];
    versionIncremental = json['version.incremental'];
    versionCodename = json['version.codename'];
    versionBaseOS = json['version.baseOS'];
    board = json['board'];
    bootloader = json['bootloader'];
    brand = json['brand'];
    device = json['device'];
    display = json['display'];
    fingerprint = json['fingerprint'];
    hardware = json['hardware'];
    host = json['host'];
    id = json['id'];
    manufacturer = json['manufacturer'];
    model = json['model'];
    product = json['product'];
    supported32BitAbis = json['supported32BitAbis'].cast<String>();
    supported64BitAbis = json['supported64BitAbis'].cast<String>();
    supportedAbis = json['supportedAbis'].cast<String>();
    tags = json['tags'];
    type = json['type'];
    isPhysicalDevice = json['isPhysicalDevice'];
    androidId = json['androidId'];
    systemFeatures = json['systemFeatures'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['platform'] = platform;
    data['version.securityPatch'] = versionSecurityPatch;
    data['version.sdkInt'] = versionSdkInt;
    data['version.release'] = versionRelease;
    data['version.previewSdkInt'] = versionPreviewSdkInt;
    data['version.incremental'] = versionIncremental;
    data['version.codename'] = versionCodename;
    data['version.baseOS'] = versionBaseOS;
    data['board'] = board;
    data['bootloader'] = bootloader;
    data['brand'] = brand;
    data['device'] = device;
    data['display'] = display;
    data['fingerprint'] = fingerprint;
    data['hardware'] = hardware;
    data['host'] = host;
    data['id'] = id;
    data['manufacturer'] = manufacturer;
    data['model'] = model;
    data['product'] = product;
    data['supported32BitAbis'] = supported32BitAbis;
    data['supported64BitAbis'] = supported64BitAbis;
    data['supportedAbis'] = supportedAbis;
    data['tags'] = tags;
    data['type'] = type;
    data['isPhysicalDevice'] = isPhysicalDevice;
    data['androidId'] = androidId;
    data['systemFeatures'] = systemFeatures;
    return data;
  }

  @override
  String uniqueId() {
    return androidId!;
  }

  @override
  String toString() => jsonEncode(toJson());
}

class IOSInfo extends DeviceInfo {
  String? platform;
  String? name;
  String? systemName;
  String? systemVersion;
  String? model;
  String? localizedModel;
  String? identifierForVendor;
  bool? isPhysicalDevice;
  String? utsnameSysname;
  String? utsnameNodename;
  String? utsnameRelease;
  String? utsnameVersion;
  String? utsnameMachine;

  IOSInfo({
    this.platform,
    this.name,
    this.systemName,
    this.systemVersion,
    this.model,
    this.localizedModel,
    this.identifierForVendor,
    this.isPhysicalDevice,
    this.utsnameSysname,
    this.utsnameNodename,
    this.utsnameRelease,
    this.utsnameVersion,
    this.utsnameMachine,
  });

  IOSInfo.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    name = json['name'];
    systemName = json['systemName'];
    systemVersion = json['systemVersion'];
    model = json['model'];
    localizedModel = json['localizedModel'];
    identifierForVendor = json['identifierForVendor'];
    isPhysicalDevice = json['isPhysicalDevice'];
    utsnameSysname = json['utsname.sysname:'];
    utsnameNodename = json['utsname.nodename:'];
    utsnameRelease = json['utsname.release:'];
    utsnameVersion = json['utsname.version:'];
    utsnameMachine = json['utsname.machine:'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['platform'] = platform;
    data['name'] = name;
    data['systemName'] = systemName;
    data['systemVersion'] = systemVersion;
    data['model'] = model;
    data['localizedModel'] = localizedModel;
    data['identifierForVendor'] = identifierForVendor;
    data['isPhysicalDevice'] = isPhysicalDevice;
    data['utsname.sysname:'] = utsnameSysname;
    data['utsname.nodename:'] = utsnameNodename;
    data['utsname.release:'] = utsnameRelease;
    data['utsname.version:'] = utsnameVersion;
    data['utsname.machine:'] = utsnameMachine;
    return data;
  }

  @override
  String uniqueId() => identifierForVendor!;

  @override
  String toString() => jsonEncode(toJson());
}
