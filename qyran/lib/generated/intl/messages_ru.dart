// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(phone) =>
      "Для того, чтобы продолжить, введите 4-х значный код, который мы прислали на номер +${phone}";

  static String m1(name) => "Продолжить с ${name}";

  static String m2(name, surname) => "Создатель: ${name} ${surname}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account":
            MessageLookupByLibrary.simpleMessage("У вас уже есть аккаунт?"),
        "add_combo": MessageLookupByLibrary.simpleMessage("Добавить комбо"),
        "add_course": MessageLookupByLibrary.simpleMessage("Добавить курс"),
        "add_lesson": MessageLookupByLibrary.simpleMessage("Добавить урок"),
        "add_new": MessageLookupByLibrary.simpleMessage("Добавить новость"),
        "add_question": MessageLookupByLibrary.simpleMessage("Добавить вопрос"),
        "add_test": MessageLookupByLibrary.simpleMessage("+ тест"),
        "add_test_and_video": MessageLookupByLibrary.simpleMessage(
            "Добавьте видео и тесты, которые относятся к теме"),
        "add_theme": MessageLookupByLibrary.simpleMessage("Добавить тему"),
        "add_video": MessageLookupByLibrary.simpleMessage("+ видео"),
        "all_learnd": MessageLookupByLibrary.simpleMessage("Все задания"),
        "answer": MessageLookupByLibrary.simpleMessage("Вариант ответа"),
        "back": MessageLookupByLibrary.simpleMessage("Назад"),
        "bottomBar_item1": MessageLookupByLibrary.simpleMessage("Курсы"),
        "bottomBar_item2": MessageLookupByLibrary.simpleMessage("Уроки"),
        "bottomBar_item3": MessageLookupByLibrary.simpleMessage("Тесты"),
        "bottomBar_item4": MessageLookupByLibrary.simpleMessage("Новости"),
        "bottomBar_item5": MessageLookupByLibrary.simpleMessage("Профиль"),
        "cansel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "confirm_code": m0,
        "continue_": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "continue_in": m1,
        "count_answers":
            MessageLookupByLibrary.simpleMessage("Общее количество вопросов"),
        "course_error": MessageLookupByLibrary.simpleMessage(
            "Для доступа, преобретите подписку"),
        "course_section_1": MessageLookupByLibrary.simpleMessage("Уроки"),
        "course_section_2": MessageLookupByLibrary.simpleMessage("Комбо"),
        "crate": MessageLookupByLibrary.simpleMessage("Создать"),
        "day_ago": MessageLookupByLibrary.simpleMessage("д. назад"),
        "desc": MessageLookupByLibrary.simpleMessage("Описание"),
        "drag": MessageLookupByLibrary.simpleMessage(
            "Для перетаскивания удерживайте палец на объекте"),
        "edit_course": MessageLookupByLibrary.simpleMessage(
            "Обратитесь к администратору для редактирования"),
        "edit_photo": MessageLookupByLibrary.simpleMessage("Изменить картинку"),
        "end": MessageLookupByLibrary.simpleMessage("Закончить"),
        "enter_desc": MessageLookupByLibrary.simpleMessage("Введите описание"),
        "enter_image": MessageLookupByLibrary.simpleMessage(
            "Выбрать картинку(Обязательно)"),
        "enter_name": MessageLookupByLibrary.simpleMessage("Введите название"),
        "enter_video_url": MessageLookupByLibrary.simpleMessage(
            "Введите ссылку на доступное видео YouTube"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "error_bad_test": MessageLookupByLibrary.simpleMessage(
            "Тест должен быть сдан минимум на 60%"),
        "error_code": MessageLookupByLibrary.simpleMessage("Неверный код"),
        "error_test": MessageLookupByLibrary.simpleMessage(
            "Сначала выберите вариант ответа"),
        "exit": MessageLookupByLibrary.simpleMessage("Выйти"),
        "hour_ago": MessageLookupByLibrary.simpleMessage("ч. назад"),
        "lesson_error": MessageLookupByLibrary.simpleMessage(
            "Пройдите предыдущий материал"),
        "lesson_from": m2,
        "lessons_empty": MessageLookupByLibrary.simpleMessage(
            "Вы пока не записаны на курсы. Перейдите  на страницу курсов и запишитесь на нужные."),
        "login_numberPhone":
            MessageLookupByLibrary.simpleMessage("Номер телефона"),
        "login_signIn": MessageLookupByLibrary.simpleMessage("Вход"),
        "minute_ago": MessageLookupByLibrary.simpleMessage("м. назад"),
        "name": MessageLookupByLibrary.simpleMessage("Название"),
        "next": MessageLookupByLibrary.simpleMessage("Далее"),
        "not_account":
            MessageLookupByLibrary.simpleMessage("У вас еще нет аккаунта?"),
        "or": MessageLookupByLibrary.simpleMessage("или"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "profile_item1":
            MessageLookupByLibrary.simpleMessage("Политика конфиденциальности"),
        "profile_item2":
            MessageLookupByLibrary.simpleMessage("Пользовательское соглашение"),
        "register": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "register_email": MessageLookupByLibrary.simpleMessage("Email"),
        "register_name": MessageLookupByLibrary.simpleMessage("Имя"),
        "register_password":
            MessageLookupByLibrary.simpleMessage("Придумайте пароль"),
        "register_social": MessageLookupByLibrary.simpleMessage("Соц. сети"),
        "register_social_": MessageLookupByLibrary.simpleMessage("@ivanov12"),
        "register_surname": MessageLookupByLibrary.simpleMessage("Фамилия"),
        "res": MessageLookupByLibrary.simpleMessage("Результат"),
        "retest": MessageLookupByLibrary.simpleMessage("Пересдать"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "second_ago": MessageLookupByLibrary.simpleMessage("с. назад"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Войти"),
        "skip": MessageLookupByLibrary.simpleMessage("Пропустить"),
        "start": MessageLookupByLibrary.simpleMessage("Начать"),
        "start_test":
            MessageLookupByLibrary.simpleMessage("Начать тестирование"),
        "test_answer":
            MessageLookupByLibrary.simpleMessage("Добавьте варианты ответов"),
        "test_answer_": MessageLookupByLibrary.simpleMessage("Добавить"),
        "test_current":
            MessageLookupByLibrary.simpleMessage("Текущие тестирования"),
        "test_quest_error":
            MessageLookupByLibrary.simpleMessage("Не выбран ответ !"),
        "test_quest_error_2":
            MessageLookupByLibrary.simpleMessage("Вопрос не может быть пустым"),
        "test_quest_error_3":
            MessageLookupByLibrary.simpleMessage("Ответ не может быть пустым"),
        "test_result_not_found":
            MessageLookupByLibrary.simpleMessage("Результатов нет"),
        "test_section_1": MessageLookupByLibrary.simpleMessage("Тесты"),
        "test_section_2": MessageLookupByLibrary.simpleMessage("Результаты"),
        "test_test_": MessageLookupByLibrary.simpleMessage("Текст вопроса"),
        "test_text":
            MessageLookupByLibrary.simpleMessage("Введите текст вопроса"),
        "test_true_answers": MessageLookupByLibrary.simpleMessage(
            "Выберите правильные варианты"),
        "tests_not_fount": MessageLookupByLibrary.simpleMessage(
            "Здесь появятся тесты, которые вы будете проходить по мере изучения материала."),
        "tests_res_not_found": MessageLookupByLibrary.simpleMessage(
            "Здесь будут результаты ваших тестов."),
        "welcome_context_1": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard 1"),
        "welcome_context_2": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard 2"),
        "welcome_context_3": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard 3"),
        "welcome_title_1": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing 1"),
        "welcome_title_2": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing 2"),
        "welcome_title_3": MessageLookupByLibrary.simpleMessage(
            "Lorem Ipsum is simply dummy text of the printing 3")
      };
}
