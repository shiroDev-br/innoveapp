import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void storeCache(String key, Uint8List response) {
  final cache = DefaultCacheManager();

  cache.putFile(key, response);
}

Future<Map<String, dynamic>?> fetchData(String key) async {
  final cache = DefaultCacheManager();
  final file = await cache.getFileFromCache(key);

  if (file != null && file.file.existsSync()) {
    final jsonData = await file.file.readAsString();
    final data = jsonDecode(jsonData) as Map<String, dynamic>;
    return data;
  }

  return null;
}

Future<void> checkLogin(BuildContext context) async {
  final tokenData = await fetchData('token');

  if (!context.mounted) return;
  final currentRoute = ModalRoute.of(context)?.settings.name;

  final isTokenValid = tokenData != null && tokenData['access_token'] != null;

  if (currentRoute == '/' && isTokenValid) {
    if (!context.mounted) return;
    Navigator.of(context).pushReplacementNamed('/home');
  } else if (currentRoute != '/' && !isTokenValid) {
    if (!context.mounted) return;
    Navigator.of(context).pushReplacementNamed('/');
  }
}

Future<void> deleteFile(String key) async {
  final cache = DefaultCacheManager();

  cache.removeFile(key);
}
