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

  /// `Создатель: {name} {surname}`
  String lesson_from(String name, String surname) {
    return Intl.message(
      'Создатель: $name $surname',
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

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Все задания`
  String get all_learnd {
    return Intl.message(
      'Все задания',
      name: 'all_learnd',
      desc: '',
      args: [],
    );
  }

  /// `Общее количество вопросов`
  String get count_answers {
    return Intl.message(
      'Общее количество вопросов',
      name: 'count_answers',
      desc: '',
      args: [],
    );
  }

  /// `Начать тестирование`
  String get start_test {
    return Intl.message(
      'Начать тестирование',
      name: 'start_test',
      desc: '',
      args: [],
    );
  }

  /// `Закончить`
  String get end {
    return Intl.message(
      'Закончить',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Результат`
  String get res {
    return Intl.message(
      'Результат',
      name: 'res',
      desc: '',
      args: [],
    );
  }

  /// `Сначала выберите вариант ответа`
  String get error_test {
    return Intl.message(
      'Сначала выберите вариант ответа',
      name: 'error_test',
      desc: '',
      args: [],
    );
  }

  /// `Тест должен быть сдан минимум на 60%`
  String get error_bad_test {
    return Intl.message(
      'Тест должен быть сдан минимум на 60%',
      name: 'error_bad_test',
      desc: '',
      args: [],
    );
  }

  /// `Пересдать`
  String get retest {
    return Intl.message(
      'Пересдать',
      name: 'retest',
      desc: '',
      args: [],
    );
  }

  /// `Пройдите предыдущий материал`
  String get lesson_error {
    return Intl.message(
      'Пройдите предыдущий материал',
      name: 'lesson_error',
      desc: '',
      args: [],
    );
  }

  /// `Для доступа, преобретите подписку`
  String get course_error {
    return Intl.message(
      'Для доступа, преобретите подписку',
      name: 'course_error',
      desc: '',
      args: [],
    );
  }

  /// `Здесь появятся тесты, которые вы будете проходить по мере изучения материала.`
  String get tests_not_fount {
    return Intl.message(
      'Здесь появятся тесты, которые вы будете проходить по мере изучения материала.',
      name: 'tests_not_fount',
      desc: '',
      args: [],
    );
  }

  /// `Здесь будут результаты ваших тестов.`
  String get tests_res_not_found {
    return Intl.message(
      'Здесь будут результаты ваших тестов.',
      name: 'tests_res_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Добавить курс`
  String get add_course {
    return Intl.message(
      'Добавить курс',
      name: 'add_course',
      desc: '',
      args: [],
    );
  }

  /// `Добавить урок`
  String get add_lesson {
    return Intl.message(
      'Добавить урок',
      name: 'add_lesson',
      desc: '',
      args: [],
    );
  }

  /// `Добавить тему`
  String get add_theme {
    return Intl.message(
      'Добавить тему',
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

  /// `Добавить новость`
  String get add_new {
    return Intl.message(
      'Добавить новость',
      name: 'add_new',
      desc: '',
      args: [],
    );
  }

  /// `Добавить вопрос`
  String get add_question {
    return Intl.message(
      'Добавить вопрос',
      name: 'add_question',
      desc: '',
      args: [],
    );
  }

  /// `Не выбран ответ !`
  String get test_quest_error {
    return Intl.message(
      'Не выбран ответ !',
      name: 'test_quest_error',
      desc: '',
      args: [],
    );
  }

  /// `Вопрос не может быть пустым`
  String get test_quest_error_2 {
    return Intl.message(
      'Вопрос не может быть пустым',
      name: 'test_quest_error_2',
      desc: '',
      args: [],
    );
  }

  /// `Ответ не может быть пустым`
  String get test_quest_error_3 {
    return Intl.message(
      'Ответ не может быть пустым',
      name: 'test_quest_error_3',
      desc: '',
      args: [],
    );
  }

  /// `Добавить комбо`
  String get add_combo {
    return Intl.message(
      'Добавить комбо',
      name: 'add_combo',
      desc: '',
      args: [],
    );
  }

  /// `Введите название`
  String get enter_name {
    return Intl.message(
      'Введите название',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Введите описание`
  String get enter_desc {
    return Intl.message(
      'Введите описание',
      name: 'enter_desc',
      desc: '',
      args: [],
    );
  }

  /// `Введите ссылку на доступное видео YouTube`
  String get enter_video_url {
    return Intl.message(
      'Введите ссылку на доступное видео YouTube',
      name: 'enter_video_url',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get desc {
    return Intl.message(
      'Описание',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get name {
    return Intl.message(
      'Название',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Создать`
  String get crate {
    return Intl.message(
      'Создать',
      name: 'crate',
      desc: '',
      args: [],
    );
  }

  /// `Обратитесь к администратору для редактирования`
  String get edit_course {
    return Intl.message(
      'Обратитесь к администратору для редактирования',
      name: 'edit_course',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать картинку(Обязательно)`
  String get enter_image {
    return Intl.message(
      'Выбрать картинку(Обязательно)',
      name: 'enter_image',
      desc: '',
      args: [],
    );
  }

  /// `Изменить картинку`
  String get edit_photo {
    return Intl.message(
      'Изменить картинку',
      name: 'edit_photo',
      desc: '',
      args: [],
    );
  }

  /// `Добавьте видео и тесты, которые относятся к теме`
  String get add_test_and_video {
    return Intl.message(
      'Добавьте видео и тесты, которые относятся к теме',
      name: 'add_test_and_video',
      desc: '',
      args: [],
    );
  }

  /// `Для перетаскивания удерживайте палец на объекте`
  String get drag {
    return Intl.message(
      'Для перетаскивания удерживайте палец на объекте',
      name: 'drag',
      desc: '',
      args: [],
    );
  }

  /// `Введите текст вопроса`
  String get test_text {
    return Intl.message(
      'Введите текст вопроса',
      name: 'test_text',
      desc: '',
      args: [],
    );
  }

  /// `Текст вопроса`
  String get test_test_ {
    return Intl.message(
      'Текст вопроса',
      name: 'test_test_',
      desc: '',
      args: [],
    );
  }

  /// `Добавьте варианты ответов`
  String get test_answer {
    return Intl.message(
      'Добавьте варианты ответов',
      name: 'test_answer',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get test_answer_ {
    return Intl.message(
      'Добавить',
      name: 'test_answer_',
      desc: '',
      args: [],
    );
  }

  /// `Вариант ответа`
  String get answer {
    return Intl.message(
      'Вариант ответа',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `Выберите правильные варианты`
  String get test_true_answers {
    return Intl.message(
      'Выберите правильные варианты',
      name: 'test_true_answers',
      desc: '',
      args: [],
    );
  }

  /// `Отменить`
  String get cansel {
    return Intl.message(
      'Отменить',
      name: 'cansel',
      desc: '',
      args: [],
    );
  }

  /// `Пользователи`
  String get users {
    return Intl.message(
      'Пользователи',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Поиск по номеру`
  String get search_by_number {
    return Intl.message(
      'Поиск по номеру',
      name: 'search_by_number',
      desc: '',
      args: [],
    );
  }

  /// `Доступные курсы`
  String get user_courses {
    return Intl.message(
      'Доступные курсы',
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

  /// `Нет доступных курсов`
  String get courses_not_found {
    return Intl.message(
      'Нет доступных курсов',
      name: 'courses_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Выберите курс`
  String get enter_course {
    return Intl.message(
      'Выберите курс',
      name: 'enter_course',
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
