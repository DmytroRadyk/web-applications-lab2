user = User.find_or_create_by!(email: "author@example.com") { |u| u.name = "Дмитро" }
user.microposts.find_or_create_by!(content: "Мій перший допис у Rails-мініблозі!")
user.microposts.find_or_create_by!(content: "Модель, представлення та контролер працюють разом.")
