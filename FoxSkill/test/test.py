import sys
from PyQt5 import QtWidgets
from PyQt5.QtWidgets import QMainWindow, QPushButton
import webbrowser


class MainWindow(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)

        button = QPushButton('Открыть ссылку', self)
        button.clicked.connect(lambda: webbrowser.open('https://ktk40.ru/index.php/ru/'))


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    mainWin = MainWindow()
    mainWin.show()
    sys.exit(app.exec_())