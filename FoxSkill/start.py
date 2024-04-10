import sys
import mysql.connector as mc # Подключение к БД

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import (QCoreApplication, QPropertyAnimation, QDate,
                          QDateTime, QMetaObject, QObject, QPoint, QRect,
                          QSize, QTime, QTimer, QUrl, Qt, QEvent, QRegExp)
from PyQt5.QtGui import (QBrush, QColor, QConicalGradient, QCursor, QFont,
                         QFontDatabase, QIcon, QKeySequence, QLinearGradient,
                         QPalette, QPainter, QPixmap, QRadialGradient, QRegExpValidator)
from PyQt5.QtWidgets import *

from login import Ui_LoginWindow # Подключение к файлу login.py (Окно авторизация)
from reg import Ui_RegWindow # Подключение к файлу reg.py (Окно регистрация)


from main_teacher import Ui_MainTeacherWindow
from main_student import Ui_MainStudentWindow
import mysql.connector as mc

mydb = mc.connect(
    host="localhost",
    user="root",
    password="",
    database="foxskill"
)

print("Успешное подключение БД - Авторизация")

mycursor = mydb.cursor()

class MainWindow(QMainWindow):
    def __init__(self, parent=None):
        QMainWindow.__init__(self)
        self.ui = Ui_LoginWindow()
        self.ui.setupUi(self)

        self.ui.pushButton_3.clicked.connect(self.BDLogin) # Кнопка "Войти"
        self.ui.pushButton_5.clicked.connect(self.reg) # Кнопка "Регистрация"
        self.ui.lineEdit.textChanged.connect(self.login_org) # Поле ввода "Логин"
        self.ui.lineEdit_2.textChanged.connect(self.password_org) # Поле ввода "Пароль"

    # БД авторизации
    def BDLogin(self):
        
        login = self.ui.lineEdit.text()
        password = self.ui.lineEdit_2.text()
 
        query = "SELECT login, password from user where login like '"+ login + "'and password like '" + password + "'"
        mycursor.execute(query)
        result = mycursor.fetchone()
        mydb.commit()
        
        # Если поле не заполнено, появится сообщение
        if len(login) == 0:
            self.ui.label.setText("Введите логин")
            return
        
        # Если поле не заполнено, появится сообщение
        if len(password) == 0:
            self.ui.label.setText("Введите пароль")
            return

        # Если не правильно ввести логин или пароль, появится сообщение
        if result == None:
            self.ui.label.setText("Вы не правильно ввели логин или пароль!")
        
        # Условие, если админ по логину, то открывает окно Администратора
        elif login == "admin":
            self.window1 = QtWidgets.QMainWindow()
            self.ui = Ui_MainTeacherWindow()
            self.ui.setupUi(self.window1)
            self.window1.show()
            self.close()

        # Если не админ по логину, то открывается окно Пользователя
        else:
            self.window1 = QtWidgets.QMainWindow()
            self.ui = Ui_MainStudentWindow()
            self.ui.setupUi(self.window1)
            self.window1.show()
            self.close()
    
    # Окно "Регистрация"
    def reg (self):
        self.window = QtWidgets.QMainWindow()
        self.ui = Ui_RegWindow()
        self.ui.setupUi(self.window)
        self.window.show()

    # Ограничение символов поле ввода "Логин"
    def login_org(self):
        reg_ex = QRegExp("[a-zA-Z_0-9]{20}") # "[Ограниченые символов]{ограничение размер}"
        input_validator = QRegExpValidator(reg_ex, self.ui.lineEdit)
        self.ui.lineEdit.setValidator(input_validator)
    
    # Ограничение символов поле ввода "Пароль"
    def password_org(self):
        reg_ex = QRegExp("[a-zA-Z_0-9]{30}") # "[Ограниченые символов]{ограничение размер}"
        input_validator = QRegExpValidator(reg_ex, self.ui.lineEdit_2)
        self.ui.lineEdit_2.setValidator(input_validator)
    

# END (Запуск)
if __name__ == "__main__":
    app = QApplication(sys.argv)

    #id = QFontDatabase.addApplicationFont('fonts\Montserrat-VariableFont_wght.ttf')
    
    # Если id равен -1, то шрифт не установлен
    #if id == -1:
    #    print('Шрифт Montserrat не установлен')
    #else:
    #    print("Шрифт Montserrat установлен")

    window = MainWindow()
    window.show()
    sys.exit(app.exec_())