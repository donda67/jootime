import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(CollegeDuCloneApp());
}

class CollegeDuCloneApp extends StatefulWidget {
  @override
  _CollegeDuCloneAppState createState() => _CollegeDuCloneAppState();
}

class _CollegeDuCloneAppState extends State<CollegeDuCloneApp> {
  bool _loggedIn = false;
  String _userName = '';
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = Locale('ru');
  bool _notifyClasses = true;
  bool _notifyAnnouncements = true;
  bool _notifyEvents = true;

  void _login(String name) {
    setState(() {
      _loggedIn = true;
      _userName = name;
    });
  }

  void _logout() {
    setState(() {
      _loggedIn = false;
      _userName = '';
    });
  }

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void _toggleNotifyClasses(bool value) {
    setState(() {
      _notifyClasses = value;
    });
  }

  void _toggleNotifyAnnouncements(bool value) {
    setState(() {
      _notifyAnnouncements = value;
    });
  }

  void _toggleNotifyEvents(bool value) {
    setState(() {
      _notifyEvents = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
      state: this,
      child: MaterialApp(
        title: 'CollegeDu Clone',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru'), Locale('kk')],
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.indigo,
          colorScheme: ThemeData.dark().colorScheme.copyWith(primary: Colors.indigo),
          appBarTheme: AppBarTheme(backgroundColor: Colors.indigo[700]),
        ),
        themeMode: _themeMode,
        locale: _locale,
        home: _loggedIn
            ? MainScreen(userName: _userName, onLogout: _logout)
            : LoginScreen(onLogin: _login),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AppStateWidget extends InheritedWidget {
  final _CollegeDuCloneAppState state;

  AppStateWidget({required this.state, required Widget child}) : super(child: child);

  static _CollegeDuCloneAppState of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppStateWidget>();
    assert(widget != null, 'No AppStateWidget found in context');
    return widget!.state;
  }

  @override
  bool updateShouldNotify(covariant AppStateWidget oldWidget) {
    return oldWidget.state._themeMode != state._themeMode || oldWidget.state._locale != state._locale;
  }
}

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    final state = AppStateWidget.of(context);
    return AppLocalizations(state._locale);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'ru': {
      'appTitle': 'CollegeDu Clone',
      'welcomeTitle': 'Добро пожаловать в CollegeDu',
      'welcomeSubtitle': 'Пример учебного приложения — войдите, чтобы продолжить.',
      'nameLabel': 'ФИО',
      'loginButton': 'Войти',
      'emptyNameError': 'Пожалуйста, введите имя',
      'testDataHint': 'Или используйте тестовые данные',
      'demoNote': 'CollegeDu clone — demo',
      'homeGreeting': 'Привет, {name}',
      'myCourses': 'Мои курсы',
      'newsTitle': 'Новости',
      'viewMenuButton': 'Посмотреть меню столовой',
      'showScheduleButton': 'Показать расписание',
      'weekInfo': '2 недели',
      'theoreticalClasses': 'Теоретические занятия',
      'scheduleTitle': 'Расписание',
      'coursesTitle': 'Курсы',
      'materialsTitle': 'Материалы',
      'lecture1': 'Лекция 1 — Введение',
      'practice1': 'Практика 1',
      'menuPageTitle': 'Меню столовой',
      'takeButton': 'Взять',
      'itemAdded': '{item} добавлено в корзину (mock)',
      'journalTitle': 'Журнал',
      'journalSubtitle': 'Успеваемость за 2 семестра',
      'academicPerformance': 'Табель успеваемости',
      'semesterLabel': 'Семестр',
      'averageLabel': 'Средний',
      'overallAverage': 'Средний балл',
      'profileTitle': 'Профиль',
      'studentGroupFull': 'Группа: ИС-25-3',
      'freeTime': 'Свободно',
      'specialty': 'Специальность: Программная инженерия',
      'studentGpa': 'Успеваемость: 4.2',
      'studentCredits': 'Кредиты: 86',
      'notificationsTitle': 'Настройки уведомлений',
      'notifyClasses': 'Напоминания о парах',
      'notifyAnnouncements': 'Уведомления об объявлениях',
      'notifyEvents': 'Уведомления о событиях',
      'groupChatTitle': 'Чат группы',
      'onlyCurator': 'Здесь пишет только куратор',
      'openAnnouncements': 'Открыть объявления',
      'facilityStatusTitle': 'Статус аудиторий и библиотек',
      'curatorOnlyNote': 'В этом чате публикует только куратор.',
      'preorderButton': 'Предзаказать',
      'cartTitle': 'Корзина заказа',
      'cartEmpty': 'Корзина пуста',
      'total': 'Итого:',
      'payNow': 'Оплатить онлайн',
      'orderConfirmed': 'Заказ принят',
      'pickupReady': 'Заказ будет готов через 15 минут. Подойдите без задержек.',
      'phoneLabel': '+7 700 000 0000',
      'logoutTitle': 'Выход',
      'logoutConfirm': 'Вы действительно хотите выйти?',
      'cancel': 'Отмена',
      'logoutButton': 'Выйти',
      'darkMode': 'Темная тема',
      'lightTheme': 'Светлая тема',
      'darkTheme': 'Темная тема включена',
      'changeLanguage': 'Язык интерфейса',
      'languageRussian': 'Русский',
      'languageKazakh': 'Қазақша',
      'all': 'Все',
      'notifications': 'Уведомления',
      'close': 'Закрыть',
      'eventsTitle': 'События',
      'aiAssistantTitle': 'ИИ-помощник',
      'upcomingEvents': 'Предстоящие события',
      'eventDate': 'Дата',
      'eventLocation': 'Место',
      'askAI': 'Спросить ИИ',
      'send': 'Отправить',
      'aiPlaceholder': 'Задайте вопрос...',
      'aiResponse': 'Ответ ИИ: ',
      'quickQuestions': 'Быстрые вопросы',
      'question1': 'Расскажи о курсе математики',
      'answer1': 'Курс математики включает алгебру, геометрию и анализ. Лекции по понедельникам в 9:00.',
      'question2': 'Какое расписание на сегодня?',
      'answer2': 'Сегодня: Математика 9:00-10:30, Программирование 11:00-12:30.',
      'question3': 'Помоги с задачей по физике',
      'answer3': 'Конечно! Расскажите подробнее о задаче, и я помогу.',
      'question4': 'Что в меню столовой?',
      'answer4': 'Сегодня: Борщ, котлета с картошкой, салат из свеклы.',
    },
    'kk': {
      'appTitle': 'CollegeDu Clone',
      'welcomeTitle': 'CollegeDu қосымшасына қош келдіңіз',
      'welcomeSubtitle': 'Оқу қосымшасының мысалы — кіріп жалғастырыңыз.',
      'nameLabel': 'Аты-жөні',
      'loginButton': 'Кіру',
      'emptyNameError': 'Атыңызды енгізіңіз',
      'testDataHint': 'Немесе тест деректерін қолданыңыз',
      'demoNote': 'CollegeDu clone — demo',
      'homeGreeting': 'Сәлем, {name}',
      'myCourses': 'Менің курстарым',
      'newsTitle': 'Жаңалықтар',
      'viewMenuButton': 'Асхана мәзірін қарау',
      'coursesTitle': 'Курстар',
      'materialsTitle': 'Материалдар',
      'lecture1': '1 дәріс — Кіріспе',
      'practice1': '1 тәжірибе',
      'menuPageTitle': 'Асхана мәзірі',
      'showScheduleButton': 'Кестені көрсету',
      'weekInfo': '2 апта',
      'theoreticalClasses': 'Теориялық сабақтар',
      'scheduleTitle': 'Кесте',
      'journalTitle': 'Табель',
      'journalSubtitle': '2 семестр үшін бағалар',
      'academicPerformance': 'Жылдық үлгерім',
      'semesterLabel': 'Семестр',
      'averageLabel': 'Орташа',
      'overallAverage': 'Орташа баға',
      'profileTitle': 'Профиль',
      'studentGroupFull': 'Топ: ИС-25-3',
      'freeTime': 'бос',
      'specialty': 'Мамандығы: Бағдарламалық инженерия',
      'studentGpa': 'Бағалау: 4.2',
      'studentCredits': 'Кредиттер: 86',
      'notificationsTitle': 'Хабарламалар параметрлері',
      'notifyClasses': 'Сабақтарға ескерту',
      'notifyAnnouncements': 'Хабарландырулар туралы ескерту',
      'notifyEvents': 'Оқиғалар туралы ескерту',
      'groupChatTitle': 'Топтық чат',
      'onlyCurator': 'Тек куратор жазады',
      'openAnnouncements': 'Хабарландыруларды ашу',
      'facilityStatusTitle': 'Сыныптар мен кітапханалардың статусы',
      'curatorOnlyNote': 'Бұл чатта тек куратор хабарламалар жариялайды.',
      'preorderButton': 'Алдын ала тапсырыс беру',
      'cartTitle': 'Тапсырыс себеті',
      'cartEmpty': 'Себет бос',
      'total': 'Барлығы:',
      'payNow': 'Онлайн төлеу',
      'orderConfirmed': 'Тапсырыс қабылданды',
      'pickupReady': 'Тапсырыс 15 минут ішінде дайын болады. Кешіктпей келіңіз.',
      'phoneLabel': '+7 700 000 0000',
      'logoutTitle': 'Шығу',
      'logoutConfirm': 'Шығатыныңызға сенімдісіз бе?',
      'cancel': 'Болдырмау',
      'logoutButton': 'Шығу',
      'darkMode': 'Қара режим',
      'lightTheme': 'Жарық режим',
      'darkTheme': 'Қара режим қосылған',
      'changeLanguage': 'Тіл',
      'languageRussian': 'Орысша',
      'languageKazakh': 'Қазақша',
      'all': 'Барлығы',
      'notifications': 'Хабарламалар',
      'close': 'Жабу',
      'eventsTitle': 'Оқиғалар',
      'aiAssistantTitle': 'ЖИ көмекші',
      'upcomingEvents': 'Алдағы оқиғалар',
      'eventDate': 'Күні',
      'eventLocation': 'Орын',
      'askAI': 'ЖИ-дан сұрау',
      'send': 'Жіберу',
      'aiPlaceholder': 'Сұрақ қойыңыз...',
      'aiResponse': 'ЖИ жауабы: ',
      'quickQuestions': 'Жылдам сұрақтар',
      'question1': 'Расскажи о курсе математики',
      'answer1': 'Курс математики включает алгебру, геометрию и анализ. Лекции по понедельникам в 9:00.',
      'question2': 'Какое расписание на сегодня?',
      'answer2': 'Сегодня: Математика 9:00-10:30, Программирование 11:00-12:30.',
      'question3': 'Помоги с задачей по физике',
      'answer3': 'Конечно! Расскажите подробнее о задаче, и я помогу.',
      'question4': 'Что в меню столовой?',
      'answer4': 'Сегодня: Борщ, котлета с картошкой, салат из свеклы.',
    },
  };

  String t(String key, [Map<String, String>? params]) {
    final values = _localizedValues[locale.languageCode] ?? _localizedValues['ru']!;
    var result = values[key] ?? _localizedValues['ru']![key] ?? key;
    params?.forEach((name, value) {
      result = result.replaceAll('{$name}', value);
    });
    return result;
  }
}

class LoginScreen extends StatefulWidget {
  final void Function(String name) onLogin;
  LoginScreen({required this.onLogin});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController(text: 'Иван Иванов');

  void _tryLogin() {
    final name = _controller.text.trim();
    final loc = AppLocalizations.of(context);
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.t('emptyNameError'))));
      return;
    }
    widget.onLogin(name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 48),
              FlutterLogo(size: 96),
              SizedBox(height: 24),
              Text(loc.t('welcomeTitle'), style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              SizedBox(height: 12),
              Text(loc.t('welcomeSubtitle'), textAlign: TextAlign.center,),
              SizedBox(height: 28),
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: loc.t('nameLabel'), border: OutlineInputBorder()),
              ),
              SizedBox(height: 12),
              ElevatedButton(onPressed: _tryLogin, child: Text(loc.t('loginButton'))),
              SizedBox(height: 16),
              Text(loc.t('testDataHint'), textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
              SizedBox(height: 24),
              Text(loc.t('demoNote'), textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final String userName;
  final VoidCallback onLogout;
  MainScreen({required this.userName, required this.onLogout});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _notifyClasses = true;
  bool _notifyAnnouncements = true;
  bool _notifyEvents = true;

  final List<Course> courses = [
    Course(id: 'c1', title: 'Математика 1', teacher: 'Проф. Петров', description: 'Базовая математика: алгебра, геометрия.'),
    Course(id: 'c2', title: 'Программирование', teacher: 'Иванова А.', description: 'Введение в Dart и Flutter.'),
    Course(id: 'c3', title: 'Физика', teacher: 'Сидоров', description: 'Механика, термодинамика.'),
  ];

  final List<MenuItem> menu = [
    MenuItem(name: 'Борщ', type: 'Обед', price: 350),
    MenuItem(name: 'Котлета с картошкой', type: 'Обед', price: 420),
    MenuItem(name: 'Салат из свеклы', type: 'Закуска', price: 150),
    MenuItem(name: 'Куринное филе', type: 'Ужин', price: 380),
    MenuItem(name: 'Вода 0.5л', type: 'Напитки', price: 100),
  ];

  final List<Grade> grades = [
    Grade(subject: 'Математика', semester1: 4, semester2: 5, average: 4.5),
    Grade(subject: 'Программирование', semester1: 5, semester2: 5, average: 5.0),
    Grade(subject: 'Физика', semester1: 4, semester2: 4, average: 4.0),
    Grade(subject: 'Химия', semester1: 5, semester2: 4, average: 4.5),
    Grade(subject: 'Қазақ тілі', semester1: 4, semester2: 4, average: 4.0),
    Grade(subject: 'Орыс тілі', semester1: 5, semester2: 5, average: 5.0),
  ];

  final List<Event> events = [
    Event(id: 'e1', title: 'Олимпиада по математике', description: 'Международная олимпиада по математике для студентов.', date: '15.05.2026', location: 'Главный зал'),
    Event(id: 'e2', title: 'Конференция по ИТ', description: 'Ежегодная конференция по информационным технологиям.', date: '20.05.2026', location: 'Аудитория 201'),
    Event(id: 'e3', title: 'Спортфест', description: 'Фестиваль спортивных мероприятий.', date: '25.05.2026', location: 'Стадион'),
  ];

  final List<Announcement> announcements = [
    Announcement(author: 'Куратор', time: '09:00', message: 'Собрание группы завтра в 16:00 в аудитории 201.'),
    Announcement(author: 'Куратор', time: '13:30', message: 'Пожалуйста, заполните анкеты для практики до конца недели.'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final pages = [
      HomePage(userName: widget.userName, courses: courses, events: events, announcements: announcements),
      MenuPage(menu: menu),
      JournalPage(grades: grades),
      CoursesPage(courses: courses),
      ProfilePage(userName: widget.userName, onLogout: widget.onLogout, announcements: announcements),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: loc.t('homeGreeting').split(',').first),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: loc.t('menuPageTitle')),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: loc.t('journalTitle')),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: loc.t('coursesTitle')),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: loc.t('profileTitle')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AIAssistantPage()));
        },
        child: Icon(Icons.smart_toy),
        tooltip: loc.t('aiAssistantTitle'),
      ),
    );
  }
}

class Course {
  final String id;
  final String title;
  final String teacher;
  final String description;

  Course({required this.id, required this.title, required this.teacher, required this.description});
}

class MenuItem {
  final String name;
  final String type;
  final int price;
  MenuItem({required this.name, required this.type, required this.price});
}

class Lecture {
  final String time;
  final String title;
  final String room;
  Lecture({required this.time, required this.title, required this.room});
}

class Event {
  final String id;
  final String title;
  final String description;
  final String date;
  final String location;
  Event({required this.id, required this.title, required this.description, required this.date, required this.location});
}

class Announcement {
  final String author;
  final String time;
  final String message;
  Announcement({required this.author, required this.time, required this.message});
}

class Grade {
  final String subject;
  final int semester1;
  final int semester2;
  final double average;
  Grade({required this.subject, required this.semester1, required this.semester2, required this.average});
}

class FacilityStatus {
  final String area;
  final String status;
  FacilityStatus({required this.area, required this.status});
}

class Message {
  final String text;
  final bool isUser;
  Message({required this.text, required this.isUser});
}

class HomePage extends StatelessWidget {
  final String userName;
  final List<Course> courses;
  final List<Event> events;
  final List<Announcement> announcements;
  HomePage({required this.userName, required this.courses, required this.events, required this.announcements});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(child: Text(userName.isNotEmpty ? userName[0] : 'U'), radius: 28),
              SizedBox(width: 12),
              Expanded(child: Text(loc.t('homeGreeting', {'name': userName}), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              Icon(Icons.notifications),
            ],
          ),
          SizedBox(height: 18),
          Text(loc.t('myCourses'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (_, i) {
                final c = courses[i];
                return Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => CourseDetailPage(course: c)));
                    },
                    child: SizedBox(
                      width: 220,
                      height: 140,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(c.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              Text(c.teacher, style: TextStyle(color: Colors.grey[700])),
                              SizedBox(height: 8),
                              Flexible(
                                child: Text(c.description, maxLines: 3, overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(height: 8),
                              Align(alignment: Alignment.bottomRight, child: Icon(Icons.arrow_forward)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 18),
          Text(loc.t('groupChatTitle'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(loc.t('onlyCurator'), style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  ...announcements.map((announcement) => Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${announcement.author} • ${announcement.time}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        Text(announcement.message),
                      ],
                    ),
                  )),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => GroupChatPage(announcements: announcements)));
                      },
                      child: Text(loc.t('openAnnouncements')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18),
          Text(loc.t('upcomingEvents'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (_, i) {
                final e = events[i];
                return Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (_) => AlertDialog(
                        title: Text(e.title),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.description),
                            SizedBox(height: 8),
                            Text('${loc.t('eventDate')}: ${e.date}'),
                            Text('${loc.t('eventLocation')}: ${e.location}'),
                          ],
                        ),
                        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(loc.t('close')))],
                      ));
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                            Spacer(),
                            Text(e.date, style: TextStyle(color: Colors.grey)),
                            Text(e.location, style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 18),
          Text(loc.t('newsTitle'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          NewsTile(title: 'Открытие новой лаборатории', subtitle: 'Вслед за обновлением кампуса...'),
          NewsTile(title: 'Расписание экзаменов', subtitle: 'Посмотреть на странице Расписание.'),
          SizedBox(height: 24),
          ElevatedButton.icon(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => MenuPage(menu: [
              MenuItem(name: 'Борщ', type: 'Обед', price: 350),
              MenuItem(name: 'Котлета', type: 'Ужин', price: 420),
            ])));
          }, icon: Icon(Icons.restaurant), label: Text(loc.t('viewMenuButton'))),
        ],
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  NewsTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          showDialog(context: context, builder: (_) => AlertDialog(
            title: Text(title),
            content: Text(subtitle + '\n\n' + (loc.t('newsTitle') + ' здесь (mock).')),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(loc.t('close')))],
          ));
        },
      ),
    );
  }
}

class CoursesPage extends StatelessWidget {
  final List<Course> courses;
  CoursesPage({required this.courses});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text(loc.t('coursesTitle'))),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: courses.length,
        itemBuilder: (_, i) {
          final c = courses[i];
          return Card(
            child: ListTile(
              title: Text(c.title),
              subtitle: Text(c.teacher),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CourseDetailPage(course: c))),
            ),
          );
        },
      ),
    ));
  }
}

class CourseDetailPage extends StatelessWidget {
  final Course course;
  CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course.teacher, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(course.description),
            SizedBox(height: 16),
            Text(loc.t('materialsTitle'), style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Expanded(child: ListView(
              children: [
                ListTile(leading: Icon(Icons.picture_as_pdf), title: Text(loc.t('lecture1')), trailing: Icon(Icons.download)),
                ListTile(leading: Icon(Icons.picture_as_pdf), title: Text(loc.t('practice1')), trailing: Icon(Icons.download)),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  final List<MenuItem> menu;
  MenuPage({required this.menu});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String filter = 'Все';
  final List<MenuItem> _cart = [];

  void _addToCart(MenuItem item) {
    setState(() {
      _cart.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).t('itemAdded', {'item': item.name}))));
  }

  int get _cartTotal => _cart.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final types = <String>{'Все', ...widget.menu.map((e) => e.type)};
    final shown = filter == 'Все' ? widget.menu : widget.menu.where((m) => m.type == filter).toList();

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(loc.t('menuPageTitle')),
        actions: [
          IconButton(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.shopping_cart),
                if (_cart.isNotEmpty) Positioned(
                  right: 0,
                  top: 8,
                  child: CircleAvatar(radius: 8, backgroundColor: Colors.red, child: Text('${_cart.length}', style: TextStyle(fontSize: 10, color: Colors.white))),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => PreOrderPage(cart: _cart, total: _cartTotal, onClear: () {
                setState(() {
                  _cart.clear();
                });
              })));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: types.map((t) => Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(t == 'Все' ? loc.t('all') : t),
                    selected: filter == t,
                    onSelected: (_) {
                      setState(() {
                        filter = t;
                      });
                    },
                  ),
                )).toList(),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: shown.length,
                itemBuilder: (_, i) {
                  final m = shown[i];
                  return Card(
                    child: ListTile(
                      title: Text(m.name),
                      subtitle: Text('${m.type} • ${m.price}₸'),
                      trailing: ElevatedButton(
                        child: Text(loc.t('preorderButton')),
                        onPressed: () => _addToCart(m),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class PreOrderPage extends StatelessWidget {
  final List<MenuItem> cart;
  final int total;
  final VoidCallback onClear;

  PreOrderPage({required this.cart, required this.total, required this.onClear});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.t('cartTitle'))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: cart.isEmpty
            ? Center(child: Text(loc.t('cartEmpty')))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cart.length,
                      separatorBuilder: (_, __) => Divider(),
                      itemBuilder: (_, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text('${item.type} • ${item.price}₸'),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('${loc.t('total')} ${total}₸', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: (_) => AlertDialog(
                        title: Text(loc.t('orderConfirmed')),
                        content: Text(loc.t('pickupReady')),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: Text(loc.t('close'))),
                        ],
                      ));
                      onClear();
                    },
                    child: Text(loc.t('payNow')),
                  ),
                ],
              ),
      ),
    );
  }
}

class JournalPage extends StatelessWidget {
  final List<Grade> grades;
  JournalPage({required this.grades});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(loc.t('journalTitle'))),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(loc.t('journalSubtitle'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => SchedulePage()));
                      },
                      icon: Icon(Icons.calendar_today, size: 18),
                      label: Text(loc.t('showScheduleButton')),
                      style: ElevatedButton.styleFrom(minimumSize: Size(140, 42)),
                    ),
                  ],
                ),
              ),
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey[600],
                tabs: [
                  Tab(text: '${loc.t('semesterLabel')} 1'),
                  Tab(text: '${loc.t('semesterLabel')} 2'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildSemesterList(context, grades, 1),
                    _buildSemesterList(context, grades, 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSemesterList(BuildContext context, List<Grade> grades, int semester) {
    final loc = AppLocalizations.of(context);
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: grades.length,
      separatorBuilder: (_, __) => Divider(height: 1),
      itemBuilder: (_, index) {
        final grade = grades[index];
        final value = semester == 1 ? grade.semester1 : grade.semester2;
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          title: Text(grade.subject, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text('$value', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
          ),
          subtitle: Text('${loc.t('averageLabel')}: ${grade.average.toStringAsFixed(1)}'),
        );
      },
    );
  }
}

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int _selectedDayIndex = 1;

  final List<CalendarDay> _calendarDays = [
    CalendarDay(weekday: 'ПН', date: 6, hasClass: true),
    CalendarDay(weekday: 'ВТ', date: 7, hasClass: true),
    CalendarDay(weekday: 'СР', date: 8, hasClass: true),
    CalendarDay(weekday: 'ЧТ', date: 9, hasClass: true),
    CalendarDay(weekday: 'ПТ', date: 10, hasClass: true),
    CalendarDay(weekday: 'СБ', date: 11, hasClass: false),
    CalendarDay(weekday: 'ВС', date: 12, hasClass: false),
  ];

  final List<ScheduleClass> _classes = [
    ScheduleClass(title: 'Информатика', subtitle: 'Теоретические занятия', time: '08:30-09:50', teacher: 'Е. Мирғалыйқызы', room: '216'),
    ScheduleClass(title: 'Биология', subtitle: 'Теоретические занятия', time: '09:55-11:15', teacher: 'Мирғалыйқызы Ә.', room: '217'),
    ScheduleClass(title: 'География', subtitle: 'Теоретические занятия', time: '11:30-12:50', teacher: 'А. Сергеев', room: '214'),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.t('scheduleTitle'))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back)),
                Expanded(child: Text('апрель 2026 г.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(20)),
                  child: Text(loc.t('weekInfo'), style: TextStyle(color: Colors.orange[900], fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _calendarDays.asMap().entries.map((entry) {
                  final index = entry.key;
                  final day = entry.value;
                  final selected = index == _selectedDayIndex;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDayIndex = index),
                    child: Container(
                      width: 64,
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selected ? Theme.of(context).primaryColor : Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: selected ? Theme.of(context).primaryColor : Colors.grey[300]!),
                      ),
                      child: Column(
                        children: [
                          Text(day.weekday, style: TextStyle(color: selected ? Colors.white : Colors.black54, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('${day.date}', style: TextStyle(color: selected ? Colors.white : Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                          if (day.hasClass)
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Icon(Icons.circle, size: 8, color: selected ? Colors.white : Theme.of(context).primaryColor),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: _classes.length,
                separatorBuilder: (_, __) => SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final item = _classes[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.description, size: 18, color: Theme.of(context).primaryColor),
                              SizedBox(width: 8),
                              Expanded(child: Text(item.subtitle)),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.access_time, size: 18, color: Theme.of(context).primaryColor),
                              SizedBox(width: 8),
                              Text(item.time),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.person, size: 18, color: Theme.of(context).primaryColor),
                              SizedBox(width: 8),
                              Expanded(child: Text(item.teacher)),
                              Icon(Icons.location_on, size: 18, color: Theme.of(context).primaryColor),
                              SizedBox(width: 4),
                              Text(item.room),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarDay {
  final String weekday;
  final int date;
  final bool hasClass;
  CalendarDay({required this.weekday, required this.date, required this.hasClass});
}

class ScheduleClass {
  final String title;
  final String subtitle;
  final String time;
  final String teacher;
  final String room;
  ScheduleClass({required this.title, required this.subtitle, required this.time, required this.teacher, required this.room});
}

class AIAssistantPage extends StatefulWidget {
  @override
  _AIAssistantPageState createState() => _AIAssistantPageState();
}

class GroupChatPage extends StatelessWidget {
  final List<Announcement> announcements;
  GroupChatPage({required this.announcements});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.t('groupChatTitle'))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.t('onlyCurator'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: announcements.length,
                itemBuilder: (_, index) {
                  final announcement = announcements[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${announcement.author} • ${announcement.time}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          SizedBox(height: 8),
                          Text(announcement.message),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            Text(loc.t('curatorOnlyNote'), style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

class _AIAssistantPageState extends State<AIAssistantPage> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final Map<String, String> _quickAnswers = {
    'question1': 'answer1',
    'question2': 'answer2',
    'question3': 'answer3',
    'question4': 'answer4',
  };

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(Message(text: message, isUser: true));
        final loc = AppLocalizations.of(context);
        final response = _getResponse(message, loc);
        _messages.add(Message(text: response, isUser: false));
      });
      _controller.clear();
      _scrollToBottom();
    }
  }

  String _getResponse(String question, AppLocalizations loc) {
    // Simple matching for quick questions
    for (final entry in _quickAnswers.entries) {
      if (question.contains(loc.t(entry.key))) {
        return loc.t(entry.value);
      }
    }
    return loc.t('aiResponse') + 'Это симуляция. Ваш вопрос: "$question". В реальном приложении здесь был бы ответ от ИИ.';
  }

  void _quickQuestion(String questionKey) {
    final loc = AppLocalizations.of(context);
    final question = loc.t(questionKey);
    _sendMessage(question);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.t('aiAssistantTitle'))),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: message.isUser ? Theme.of(context).primaryColor : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: message.isUser ? Radius.circular(16) : Radius.zero,
                        bottomRight: message.isUser ? Radius.zero : Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!message.isUser) ...[
                          CircleAvatar(
                            radius: 16,
                            child: Icon(Icons.smart_toy, size: 16),
                          ),
                          SizedBox(width: 8),
                        ],
                        Flexible(
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: message.isUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        if (message.isUser) ...[
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 16,
                            child: Text('Вы'[0]),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey[100],
            child: Column(
              children: [
                Text(loc.t('quickQuestions'), style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: _quickAnswers.keys.map((key) => ActionChip(
                    label: Text(loc.t(key)),
                    onPressed: () => _quickQuestion(key),
                  )).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: loc.t('aiPlaceholder'),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _sendMessage(_controller.text.trim()),
                  child: Text(loc.t('send')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String userName;
  final VoidCallback onLogout;
  final List<Announcement> announcements;
  ProfilePage({required this.userName, required this.onLogout, required this.announcements});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final state = AppStateWidget.of(context);
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text(loc.t('profileTitle'))),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
            CircleAvatar(radius: 42, child: Text(userName.isNotEmpty ? userName[0] : 'U', style: TextStyle(fontSize: 32))),
            SizedBox(height: 12),
            Text(userName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(loc.t('studentGroup'), style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text(loc.t('specialty'), style: TextStyle(color: Colors.grey[700])),
            Text(loc.t('studentGpa'), style: TextStyle(color: Colors.grey[700])),
            Text(loc.t('studentCredits'), style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 16),
            ListTile(leading: Icon(Icons.email), title: Text(loc.t('emailLabel'))),
            ListTile(leading: Icon(Icons.phone), title: Text(loc.t('phoneLabel'))),
            Divider(),
            SwitchListTile(
              title: Text(loc.t('darkMode')),
              subtitle: Text(state._themeMode == ThemeMode.dark ? loc.t('darkTheme') : loc.t('lightTheme')),
              value: state._themeMode == ThemeMode.dark,
              onChanged: state._toggleTheme,
              secondary: Icon(Icons.brightness_6),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text(loc.t('changeLanguage')),
              trailing: DropdownButton<Locale>(
                value: state._locale,
                items: [
                  DropdownMenuItem(value: Locale('ru'), child: Text(loc.t('languageRussian'))),
                  DropdownMenuItem(value: Locale('kk'), child: Text(loc.t('languageKazakh'))),
                ],
                onChanged: (value) {
                  if (value != null) {
                    state._setLocale(value);
                  }
                },
              ),
            ),
            Divider(),
            Text(loc.t('notificationsTitle'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SwitchListTile(
              title: Text(loc.t('notifyClasses')),
              value: state._notifyClasses,
              onChanged: state._toggleNotifyClasses,
              secondary: Icon(Icons.access_time),
            ),
            SwitchListTile(
              title: Text(loc.t('notifyAnnouncements')),
              value: state._notifyAnnouncements,
              onChanged: state._toggleNotifyAnnouncements,
              secondary: Icon(Icons.announcement),
            ),
            SwitchListTile(
              title: Text(loc.t('notifyEvents')),
              value: state._notifyEvents,
              onChanged: state._toggleNotifyEvents,
              secondary: Icon(Icons.event),
            ),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text(loc.t('announcementsTitle')),
              subtitle: Text(loc.t('onlyCurator')),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => GroupChatPage(announcements: announcements)));
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(context: context, builder: (_) => AlertDialog(
                  title: Text(loc.t('logoutTitle')),
                  content: Text(loc.t('logoutConfirm')),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: Text(loc.t('cancel'))),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                      onLogout();
                    }, child: Text(loc.t('logoutButton'))),
                  ],
                ));
              },
              icon: Icon(Icons.exit_to_app),
              label: Text(loc.t('logoutButton')),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            SizedBox(height: 16),
          ],
      ),
    ));
  }
}
