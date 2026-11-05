# Лабораторна робота №2 — Rails-мініблог

Перший Rails-застосунок за [завданням](https://github.com/csn-classroom-26-27/web-applications-lab2): привітання, маршрути, MVC та мініблог із користувачами й короткими дописами.

## Запуск

Потрібен Ruby 3.3, Bundler. На Windows рекомендований RubyInstaller із Devkit.

~~~sh
bundle install
bundle exec rails db:prepare
bundle exec rails db:seed
bundle exec rails server -p 3000
~~~

Відкрийте http://localhost:3000. Початкові дані додають одного автора й два дописи; повторний запуск seed не дублює записи.

## Що реалізовано

| Частина | Результат |
| --- | --- |
| Створення Rails-застосунку | Rails 7.2, SQLite для development/test |
| Hello / Goodbye | `/hello` → Hello world!, `/goodbye` → goodbye, world! |
| Головний маршрут | `/` → список користувачів |
| User scaffold | Додавання, список, перегляд, редагування та видалення користувачів |
| Micropost scaffold | Повний CRUD дописів, вибір автора у формі |
| Зв’язки | User has_many microposts; Micropost belongs_to user |
| Валідації | Допис обов’язковий, до 140 символів; ім’я й коректна унікальна email-адреса автора |
| MVC / REST | Контролери, моделі, ERB-представлення та resource routes |

При видаленні автора видаляються його дописи. Профіль показує пов’язані дописи. Навчальна лаба №2 не містить входу й прав доступу; аутентифікація реалізована в окремому проєкті лаби №3.

## Перевірка

~~~sh
bundle exec rails test
bundle exec rails zeitwerk:check
bundle exec rails assets:precompile
~~~

Перевірено локально: **18 тестів, 37 assertions, 0 failures/errors/skips**; автозавантаження та збірка assets успішні. Тести охоплюють усі CRUD-маршрути, валідації, межу 140 символів, зв’язки та привітання. Шаблон GitHub Actions наведено в `docs/github-actions.example.yml`; він не активований.

## Структура

- `app/models` — дані та валідації.
- `app/controllers` — REST-дiї та привітання.
- `app/views` — форми, список і сторінки записів.
- `db/migrate` — міграції; `db/seeds.rb` — демонстраційні дані.
- `test` — model та integration tests.

Для необов’язкового розгортання підготовлено `render.yaml`: PostgreSQL у production, автоматичні міграції та збірка assets. Секрети задаються через змінні середовища.
