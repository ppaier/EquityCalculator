#ifndef MAINWINDOW_HPP
#define MAINWINDOW_HPP

#include <QMainWindow>
#include <QComboBox>
#include "EqCalculator.hpp"
#include <vector>

namespace Ui {


class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    EqCalculator m_eqCalc;
    std::vector<QWidget*> m_guiObjects;
    std::map<std::string, int> m_mapPositions;
    std::map<int, double> m_mapPosBlinds;

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    void _updateGUI();
    std::vector<double> _getParameters();
    void _initGUIObjects();
    void _initMethods();
    void _createPositionMaps();
    void _adaptBetSizeMinima();
    void _setPositions();
    void _adaptPositions(QComboBox* master, QComboBox* slave, int dir);

private slots:
    void on_CB_Methods_currentIndexChanged(const QString &arg1);
    void on_CB_AllIn3Bet_stateChanged(int arg1);
    void on_CB_AllIn4Bet_stateChanged(int arg1);
    void on_CB_AllIn5Bet_stateChanged(int arg1);
    void on_CB_PosVill_currentIndexChanged(const QString &arg1);
    void on_CB_PosHero_currentIndexChanged(const QString &arg1);
    void on_SB_Blinds_editingFinished();
    void on_SB_SizeStack_editingFinished();
    void on_SB_FoldPctVill_editingFinished();
    void on_SB_EquHero_editingFinished();
    void on_SB_OpenTo_editingFinished();
    void on_SB_3BetTo_editingFinished();
    void on_SB_4BetTo_editingFinished();
    void on_SB_5BetTo_editingFinished();
    void on_SB_EV_editingFinished();
    void on_SB_5BetTo_valueChanged(double arg1);
    void on_SB_OpenTo_valueChanged(double arg1);
    void on_SB_EquHero_valueChanged(double arg1);
    void on_SB_Blinds_valueChanged(double arg1);
    void on_SB_SizeStack_valueChanged(double arg1);
    void on_SB_FoldPctVill_valueChanged(double arg1);
    void on_SB_3BetTo_valueChanged(double arg1);
    void on_SB_4BetTo_valueChanged(double arg1);
    void on_SB_EV_valueChanged(double arg1);

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_HPP
