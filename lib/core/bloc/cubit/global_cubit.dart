import 'package:chef_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/cache/cache_helper.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  // Separate keys for sign-up and sign-in forms
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signinKey = GlobalKey<FormState>();

  // bool isArabic = false;
  String languageCode = 'en';
  void changeLanguage(codeLang) async {
    emit(ChangeLanguageLoading());
    // isArabic = !isArabic;
    languageCode = codeLang;
    await sl<CacheHelper>().cacheLanguage(codeLang);
    emit(ChangeLanguageSuccess());
  }

  void getCachedLanguage() async {
    emit(ChangeLanguageLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    languageCode = cachedLang;
    emit(ChangeLanguageSuccess());

  }
}
