// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Lorem Ipsum is simply dummy text of the printing 1`
  String get welcome_title_1 {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing 1',
      name: 'welcome_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard 1`
  String get welcome_context_1 {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard 1',
      name: 'welcome_context_1',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing 2`
  String get welcome_title_2 {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing 2',
      name: 'welcome_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard 2`
  String get welcome_context_2 {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard 2',
      name: 'welcome_context_2',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing 3`
  String get welcome_title_3 {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing 3',
      name: 'welcome_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard 3`
  String get welcome_context_3 {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard 3',
      name: 'welcome_context_3',
      desc: '',
      args: [],
    );
  }

  /// `Пропустить`
  String get skip {
    return Intl.message(
      'Пропустить',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Далее`
  String get next {
    return Intl.message(
      'Далее',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Начать`
  String get start {
    return Intl.message(
      'Начать',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get sign_in {
    return Intl.message(
      'Войти',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Вход`
  String get login_signIn {
    return Intl.message(
      'Вход',
      name: 'login_signIn',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get login_numberPhone {
    return Intl.message(
      'Номер телефона',
      name: 'login_numberPhone',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get register_name {
    return Intl.message(
      'Имя',
      name: 'register_name',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get register_surname {
    return Intl.message(
      'Фамилия',
      name: 'register_surname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get register_email {
    return Intl.message(
      'Email',
      name: 'register_email',
      desc: '',
      args: [],
    );
  }

  /// `Придумайте пароль`
  String get register_password {
    return Intl.message(
      'Придумайте пароль',
      name: 'register_password',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Соц. сети`
  String get register_social {
    return Intl.message(
      'Соц. сети',
      name: 'register_social',
      desc: '',
      args: [],
    );
  }

  /// `@ivanov12`
  String get register_social_ {
    return Intl.message(
      '@ivanov12',
      name: 'register_social_',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get continue_ {
    return Intl.message(
      'Продолжить',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `или`
  String get or {
    return Intl.message(
      'или',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `У вас еще нет аккаунта?`
  String get not_account {
    return Intl.message(
      'У вас еще нет аккаунта?',
      name: 'not_account',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get register {
    return Intl.message(
      'Зарегистрироваться',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить с {name}`
  String continue_in(String name) {
    return Intl.message(
      'Продолжить с $name',
      name: 'continue_in',
      desc: '',
      args: [name],
    );
  }

  /// `Для того, чтобы продолжить, введите 4-х значный код, который мы прислали на номер +{phone}`
  String confirm_code(String phone) {
    return Intl.message(
      'Для того, чтобы продолжить, введите 4-х значный код, который мы прислали на номер +$phone',
      name: 'confirm_code',
      desc: '',
      args: [phone],
    );
  }

  /// `У вас уже есть аккаунт?`
  String get account {
    return Intl.message(
      'У вас уже есть аккаунт?',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Неверный код`
  String get error_code {
    return Intl.message(
      'Неверный код',
      name: 'error_code',
      desc: '',
      args: [],
    );
  }

  /// `Курсы`
  String get bottomBar_item1 {
    return Intl.message(
      'Курсы',
      name: 'bottomBar_item1',
      desc: '',
      args: [],
    );
  }

  /// `Уроки`
  String get bottomBar_item2 {
    return Intl.message(
      'Уроки',
      name: 'bottomBar_item2',
      desc: '',
      args: [],
    );
  }

  /// `Тесты`
  String get bottomBar_item3 {
    return Intl.message(
      'Тесты',
      name: 'bottomBar_item3',
      desc: '',
      args: [],
    );
  }

  /// `Новости`
  String get bottomBar_item4 {
    return Intl.message(
      'Новости',
      name: 'bottomBar_item4',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get bottomBar_item5 {
    return Intl.message(
      'Профиль',
      name: 'bottomBar_item5',
      desc: '',
      args: [],
    );
  }

  /// `Уроки`
  String get course_section_1 {
    return Intl.message(
      'Уроки',
      name: 'course_section_1',
      desc: '',
      args: [],
    );
  }

  /// `Комбо`
  String get course_section_2 {
    return Intl.message(
      'Комбо',
      name: 'course_section_2',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Вы пока не записаны на курсы. Перейдите  на страницу курсов и запишитесь на нужные.`
  String get lessons_empty {
    return Intl.message(
      'Вы пока не записаны на курсы. Перейдите  на страницу курсов и запишитесь на нужные.',
      name: 'lessons_empty',
      desc: '',
      args: [],
    );
  }

  /// `От {name} {surname}`
  String lesson_from(String name, String surname) {
    return Intl.message(
      'От $name $surname',
      name: 'lesson_from',
      desc: '',
      args: [name, surname],
    );
  }

  /// `с. назад`
  String get second_ago {
    return Intl.message(
      'с. назад',
      name: 'second_ago',
      desc: '',
      args: [],
    );
  }

  /// `м. назад`
  String get minute_ago {
    return Intl.message(
      'м. назад',
      name: 'minute_ago',
      desc: '',
      args: [],
    );
  }

  /// `ч. назад`
  String get hour_ago {
    return Intl.message(
      'ч. назад',
      name: 'hour_ago',
      desc: '',
      args: [],
    );
  }

  /// `д. назад`
  String get day_ago {
    return Intl.message(
      'д. назад',
      name: 'day_ago',
      desc: '',
      args: [],
    );
  }

  /// `Политика конфиденциальности`
  String get profile_item1 {
    return Intl.message(
      'Политика конфиденциальности',
      name: 'profile_item1',
      desc: '',
      args: [],
    );
  }

  /// `Пользовательское соглашение`
  String get profile_item2 {
    return Intl.message(
      'Пользовательское соглашение',
      name: 'profile_item2',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get exit {
    return Intl.message(
      'Выйти',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Тесты`
  String get test_section_1 {
    return Intl.message(
      'Тесты',
      name: 'test_section_1',
      desc: '',
      args: [],
    );
  }

  /// `Результаты`
  String get test_section_2 {
    return Intl.message(
      'Результаты',
      name: 'test_section_2',
      desc: '',
      args: [],
    );
  }

  /// `Текущие тестирования`
  String get test_current {
    return Intl.message(
      'Текущие тестирования',
      name: 'test_current',
      desc: '',
      args: [],
    );
  }

  /// `Результатов нет`
  String get test_result_not_found {
    return Intl.message(
      'Результатов нет',
      name: 'test_result_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
