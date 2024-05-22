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

  /// `ЖОҒАРЫ ЖЕТІСТІКТЕР`
  String get welcome_title_1 {
    return Intl.message(
      'ЖОҒАРЫ ЖЕТІСТІКТЕР',
      name: 'welcome_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Қосымша уақыт бөліп, дұрыс дайындық жасауға жоғары жетістіктерге жол ашады.`
  String get welcome_context_1 {
    return Intl.message(
      'Қосымша уақыт бөліп, дұрыс дайындық жасауға жоғары жетістіктерге жол ашады.',
      name: 'welcome_context_1',
      desc: '',
      args: [],
    );
  }

  /// `ТАҚЫРЫПТАРДЫ ТҮСІНУГЕ ЫҢҒАЙЛЫ МҮМКІНДІК`
  String get welcome_title_2 {
    return Intl.message(
      'ТАҚЫРЫПТАРДЫ ТҮСІНУГЕ ЫҢҒАЙЛЫ МҮМКІНДІК',
      name: 'welcome_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Тегін немесе ақылы сабақтарды өз қалауыңызға қарай көрсеңіз болады.`
  String get welcome_context_2 {
    return Intl.message(
      'Тегін немесе ақылы сабақтарды өз қалауыңызға қарай көрсеңіз болады.',
      name: 'welcome_context_2',
      desc: '',
      args: [],
    );
  }

  /// `СӘТТІЛІК`
  String get welcome_title_3 {
    return Intl.message(
      'СӘТТІЛІК',
      name: 'welcome_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Биік шыңды тек қана алдыға жүруге ұмтылатын жандар бағындыра алады.`
  String get welcome_context_3 {
    return Intl.message(
      'Биік шыңды тек қана алдыға жүруге ұмтылатын жандар бағындыра алады.',
      name: 'welcome_context_3',
      desc: '',
      args: [],
    );
  }

  /// `Өткізу`
  String get skip {
    return Intl.message(
      'Өткізу',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Әрі қарай`
  String get next {
    return Intl.message(
      'Әрі қарай',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Бастау`
  String get start {
    return Intl.message(
      'Бастау',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Кіру`
  String get sign_in {
    return Intl.message(
      'Кіру',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Кіру`
  String get login_signIn {
    return Intl.message(
      'Кіру',
      name: 'login_signIn',
      desc: '',
      args: [],
    );
  }

  /// `Телефон нөмірі`
  String get login_numberPhone {
    return Intl.message(
      'Телефон нөмірі',
      name: 'login_numberPhone',
      desc: '',
      args: [],
    );
  }

  /// `Аты`
  String get register_name {
    return Intl.message(
      'Аты',
      name: 'register_name',
      desc: '',
      args: [],
    );
  }

  /// `Тегі`
  String get register_surname {
    return Intl.message(
      'Тегі',
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

  /// `Пароль`
  String get register_password {
    return Intl.message(
      'Пароль',
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

  /// `Жалғастыру`
  String get continue_ {
    return Intl.message(
      'Жалғастыру',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `немесе`
  String get or {
    return Intl.message(
      'немесе',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Сіз әлі тіркелмегенсізбе?`
  String get not_account {
    return Intl.message(
      'Сіз әлі тіркелмегенсізбе?',
      name: 'not_account',
      desc: '',
      args: [],
    );
  }

  /// `Тіркелу`
  String get register {
    return Intl.message(
      'Тіркелу',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Жалғастыру {name}`
  String continue_in(String name) {
    return Intl.message(
      'Жалғастыру $name',
      name: 'continue_in',
      desc: '',
      args: [name],
    );
  }

  /// `Жалғастыру үшін нөмірге біз жіберген 4 таңбалы кодты енгізіңіз +{phone}`
  String confirm_code(String phone) {
    return Intl.message(
      'Жалғастыру үшін нөмірге біз жіберген 4 таңбалы кодты енгізіңіз +$phone',
      name: 'confirm_code',
      desc: '',
      args: [phone],
    );
  }

  /// `Мен тіркелген аккаунт бар`
  String get account {
    return Intl.message(
      'Мен тіркелген аккаунт бар',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Қате`
  String get error {
    return Intl.message(
      'Қате',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Қате код`
  String get error_code {
    return Intl.message(
      'Қате код',
      name: 'error_code',
      desc: '',
      args: [],
    );
  }

  /// `Курстар`
  String get bottomBar_item1 {
    return Intl.message(
      'Курстар',
      name: 'bottomBar_item1',
      desc: '',
      args: [],
    );
  }

  /// `Сабақтар`
  String get bottomBar_item2 {
    return Intl.message(
      'Сабақтар',
      name: 'bottomBar_item2',
      desc: '',
      args: [],
    );
  }

  /// `Тест`
  String get bottomBar_item3 {
    return Intl.message(
      'Тест',
      name: 'bottomBar_item3',
      desc: '',
      args: [],
    );
  }

  /// `Жаңалықтар`
  String get bottomBar_item4 {
    return Intl.message(
      'Жаңалықтар',
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

  /// `Сабақтар`
  String get course_section_1 {
    return Intl.message(
      'Сабақтар',
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

  /// `Іздеу`
  String get search {
    return Intl.message(
      'Іздеу',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Сіз әлі курстарға тіркелген жоқсыз. Курстар бетіне өтіп, қажетті курстарға жазылыңыз.`
  String get lessons_empty {
    return Intl.message(
      'Сіз әлі курстарға тіркелген жоқсыз. Курстар бетіне өтіп, қажетті курстарға жазылыңыз.',
      name: 'lessons_empty',
      desc: '',
      args: [],
    );
  }

  /// `Тіркелуші: {name} {surname}`
  String lesson_from(String name, String surname) {
    return Intl.message(
      'Тіркелуші: $name $surname',
      name: 'lesson_from',
      desc: '',
      args: [name, surname],
    );
  }

  /// `сек. бұрын`
  String get second_ago {
    return Intl.message(
      'сек. бұрын',
      name: 'second_ago',
      desc: '',
      args: [],
    );
  }

  /// `мин. бұрын`
  String get minute_ago {
    return Intl.message(
      'мин. бұрын',
      name: 'minute_ago',
      desc: '',
      args: [],
    );
  }

  /// `сағ. бұрын`
  String get hour_ago {
    return Intl.message(
      'сағ. бұрын',
      name: 'hour_ago',
      desc: '',
      args: [],
    );
  }

  /// `күн. бұрын`
  String get day_ago {
    return Intl.message(
      'күн. бұрын',
      name: 'day_ago',
      desc: '',
      args: [],
    );
  }

  /// `Құпиялылық саясаты`
  String get profile_item1 {
    return Intl.message(
      'Құпиялылық саясаты',
      name: 'profile_item1',
      desc: '',
      args: [],
    );
  }

  /// `Қолдану ережелері`
  String get profile_item2 {
    return Intl.message(
      'Қолдану ережелері',
      name: 'profile_item2',
      desc: '',
      args: [],
    );
  }

  /// `Шығу`
  String get exit {
    return Intl.message(
      'Шығу',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Тест`
  String get test_section_1 {
    return Intl.message(
      'Тест',
      name: 'test_section_1',
      desc: '',
      args: [],
    );
  }

  /// `Нәтижелер`
  String get test_section_2 {
    return Intl.message(
      'Нәтижелер',
      name: 'test_section_2',
      desc: '',
      args: [],
    );
  }

  /// `Ағымдағы тестілеу`
  String get test_current {
    return Intl.message(
      'Ағымдағы тестілеу',
      name: 'test_current',
      desc: '',
      args: [],
    );
  }

  /// `Нәтижелер жоқ`
  String get test_result_not_found {
    return Intl.message(
      'Нәтижелер жоқ',
      name: 'test_result_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Артқа`
  String get back {
    return Intl.message(
      'Артқа',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Сақтау`
  String get save {
    return Intl.message(
      'Сақтау',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Барлық тапсырмалар`
  String get all_learnd {
    return Intl.message(
      'Барлық тапсырмалар',
      name: 'all_learnd',
      desc: '',
      args: [],
    );
  }

  /// `Сұрақтардың жалпы саны`
  String get count_answers {
    return Intl.message(
      'Сұрақтардың жалпы саны',
      name: 'count_answers',
      desc: '',
      args: [],
    );
  }

  /// `Тестілеуді бастаңыз`
  String get start_test {
    return Intl.message(
      'Тестілеуді бастаңыз',
      name: 'start_test',
      desc: '',
      args: [],
    );
  }

  /// `Аяқтау`
  String get end {
    return Intl.message(
      'Аяқтау',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Нәтиже`
  String get res {
    return Intl.message(
      'Нәтиже',
      name: 'res',
      desc: '',
      args: [],
    );
  }

  /// `Алдымен жауапты таңдаңыз`
  String get error_test {
    return Intl.message(
      'Алдымен жауапты таңдаңыз',
      name: 'error_test',
      desc: '',
      args: [],
    );
  }

  /// `Сынақтан кем дегенде 60% өту керек`
  String get error_bad_test {
    return Intl.message(
      'Сынақтан кем дегенде 60% өту керек',
      name: 'error_bad_test',
      desc: '',
      args: [],
    );
  }

  /// `Қайта оту`
  String get retest {
    return Intl.message(
      'Қайта оту',
      name: 'retest',
      desc: '',
      args: [],
    );
  }

  /// `Өткен материалды қарап шығу`
  String get lesson_error {
    return Intl.message(
      'Өткен материалды қарап шығу',
      name: 'lesson_error',
      desc: '',
      args: [],
    );
  }

  /// `Қол жеткізу үшін курсты сатып алыңыз`
  String get course_error {
    return Intl.message(
      'Қол жеткізу үшін курсты сатып алыңыз',
      name: 'course_error',
      desc: '',
      args: [],
    );
  }

  /// `Бұл жерде оқитын сабақтарыңыз бойынша тесттер алынады`
  String get tests_not_fount {
    return Intl.message(
      'Бұл жерде оқитын сабақтарыңыз бойынша тесттер алынады',
      name: 'tests_not_fount',
      desc: '',
      args: [],
    );
  }

  /// `Сіздің текст нәтижелеріңіз осында болады.`
  String get tests_res_not_found {
    return Intl.message(
      'Сіздің текст нәтижелеріңіз осында болады.',
      name: 'tests_res_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Курс қосу`
  String get add_course {
    return Intl.message(
      'Курс қосу',
      name: 'add_course',
      desc: '',
      args: [],
    );
  }

  /// `Сабақ қосу`
  String get add_lesson {
    return Intl.message(
      'Сабақ қосу',
      name: 'add_lesson',
      desc: '',
      args: [],
    );
  }

  /// `Тақырып қосу`
  String get add_theme {
    return Intl.message(
      'Тақырып қосу',
      name: 'add_theme',
      desc: '',
      args: [],
    );
  }

  /// `+ видео`
  String get add_video {
    return Intl.message(
      '+ видео',
      name: 'add_video',
      desc: '',
      args: [],
    );
  }

  /// `+ тест`
  String get add_test {
    return Intl.message(
      '+ тест',
      name: 'add_test',
      desc: '',
      args: [],
    );
  }

  /// `Жаңалық қосу`
  String get add_new {
    return Intl.message(
      'Жаңалық қосу',
      name: 'add_new',
      desc: '',
      args: [],
    );
  }

  /// `Сұрақ қосыңыз`
  String get add_question {
    return Intl.message(
      'Сұрақ қосыңыз',
      name: 'add_question',
      desc: '',
      args: [],
    );
  }

  /// `Жауап таңдалмаған !`
  String get test_quest_error {
    return Intl.message(
      'Жауап таңдалмаған !',
      name: 'test_quest_error',
      desc: '',
      args: [],
    );
  }

  /// `Сұрақ бос болуы мүмкін емес`
  String get test_quest_error_2 {
    return Intl.message(
      'Сұрақ бос болуы мүмкін емес',
      name: 'test_quest_error_2',
      desc: '',
      args: [],
    );
  }

  /// `Жауап бос болуы мүмкін емес`
  String get test_quest_error_3 {
    return Intl.message(
      'Жауап бос болуы мүмкін емес',
      name: 'test_quest_error_3',
      desc: '',
      args: [],
    );
  }

  /// `Комбо қосыңыз`
  String get add_combo {
    return Intl.message(
      'Комбо қосыңыз',
      name: 'add_combo',
      desc: '',
      args: [],
    );
  }

  /// `Тақырыпты енгізіңіз`
  String get enter_name {
    return Intl.message(
      'Тақырыпты енгізіңіз',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Сипаттама енгізіңіз`
  String get enter_desc {
    return Intl.message(
      'Сипаттама енгізіңіз',
      name: 'enter_desc',
      desc: '',
      args: [],
    );
  }

  /// `Қолжетімді YouTube бейнесіне сілтеме енгізіңіз`
  String get enter_video_url {
    return Intl.message(
      'Қолжетімді YouTube бейнесіне сілтеме енгізіңіз',
      name: 'enter_video_url',
      desc: '',
      args: [],
    );
  }

  /// `Сипаттама`
  String get desc {
    return Intl.message(
      'Сипаттама',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Аты`
  String get name {
    return Intl.message(
      'Аты',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Жасау`
  String get crate {
    return Intl.message(
      'Жасау',
      name: 'crate',
      desc: '',
      args: [],
    );
  }

  /// `Өңдеу үшін админстраторға хабарласыңыз`
  String get edit_course {
    return Intl.message(
      'Өңдеу үшін админстраторға хабарласыңыз',
      name: 'edit_course',
      desc: '',
      args: [],
    );
  }

  /// `Суретті таңдау(міндетті түрде)`
  String get enter_image {
    return Intl.message(
      'Суретті таңдау(міндетті түрде)',
      name: 'enter_image',
      desc: '',
      args: [],
    );
  }

  /// `Суретті өзгерту`
  String get edit_photo {
    return Intl.message(
      'Суретті өзгерту',
      name: 'edit_photo',
      desc: '',
      args: [],
    );
  }

  /// `Тақырыпқа қатысты бейнелер мен тесттерді қосыңыз`
  String get add_test_and_video {
    return Intl.message(
      'Тақырыпқа қатысты бейнелер мен тесттерді қосыңыз',
      name: 'add_test_and_video',
      desc: '',
      args: [],
    );
  }

  /// `Жылжыту үшін нұсқауды нысанда ұстаңыз`
  String get drag {
    return Intl.message(
      'Жылжыту үшін нұсқауды нысанда ұстаңыз',
      name: 'drag',
      desc: '',
      args: [],
    );
  }

  /// `Сұрақ мәтінін енгізіңіз`
  String get test_text {
    return Intl.message(
      'Сұрақ мәтінін енгізіңіз',
      name: 'test_text',
      desc: '',
      args: [],
    );
  }

  /// `Сұрақ мәтіні`
  String get test_test_ {
    return Intl.message(
      'Сұрақ мәтіні',
      name: 'test_test_',
      desc: '',
      args: [],
    );
  }

  /// `Жауап варианттарын енгізу`
  String get test_answer {
    return Intl.message(
      'Жауап варианттарын енгізу',
      name: 'test_answer',
      desc: '',
      args: [],
    );
  }

  /// `Қосу`
  String get test_answer_ {
    return Intl.message(
      'Қосу',
      name: 'test_answer_',
      desc: '',
      args: [],
    );
  }

  /// `Жауап варианты`
  String get answer {
    return Intl.message(
      'Жауап варианты',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `Дұрыс вариантты таңдаңыз`
  String get test_true_answers {
    return Intl.message(
      'Дұрыс вариантты таңдаңыз',
      name: 'test_true_answers',
      desc: '',
      args: [],
    );
  }

  /// `Болдырмау`
  String get cansel {
    return Intl.message(
      'Болдырмау',
      name: 'cansel',
      desc: '',
      args: [],
    );
  }

  /// `Пайдаланушылар`
  String get users {
    return Intl.message(
      'Пайдаланушылар',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Нөмір бойынша іздеу`
  String get search_by_number {
    return Intl.message(
      'Нөмір бойынша іздеу',
      name: 'search_by_number',
      desc: '',
      args: [],
    );
  }

  /// `Қолжетімді курстар`
  String get user_courses {
    return Intl.message(
      'Қолжетімді курстар',
      name: 'user_courses',
      desc: '',
      args: [],
    );
  }

  /// `Предоставить доступ к курсу`
  String get user_add_course {
    return Intl.message(
      'Предоставить доступ к курсу',
      name: 'user_add_course',
      desc: '',
      args: [],
    );
  }

  /// `Забрать доступ к курсу`
  String get user_delete_course {
    return Intl.message(
      'Забрать доступ к курсу',
      name: 'user_delete_course',
      desc: '',
      args: [],
    );
  }

  /// `Қолжетімді курс жок`
  String get courses_not_found {
    return Intl.message(
      'Қолжетімді курс жок',
      name: 'courses_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Курсты таңдау`
  String get enter_course {
    return Intl.message(
      'Курсты таңдау',
      name: 'enter_course',
      desc: '',
      args: [],
    );
  }

  /// `Есептік жазбаны жою`
  String get delete_account {
    return Intl.message(
      'Есептік жазбаны жою',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'kk'),
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
