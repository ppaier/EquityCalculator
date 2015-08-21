#include "MainWindow.hpp"
#include "ui_MainWindow.h"

#include "GuiObjects.hpp"
#include "Methods.hpp"
#include "Positions.hpp"


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    setFixedSize(this->geometry().width(),this->geometry().height());
    m_guiObjects = std::vector<QWidget*>(NUM_GUI_OBJECTS);
    _initGUIObjects();

    std::vector<unsigned int> a = m_eqCalc.getCurMethod()->getNeededParams();
    //int b = m_eqCalc.getCurMethod()->getRelationHeroVillain();

    _createPositionMaps();
    _initMethods();

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::_updateGUI()
{
    _adaptBetSizeMinima();

    int curIdx = ui->CB_Methods->currentIndex();
    m_eqCalc.setCurMethod(curIdx);
    double value = m_eqCalc.getCurMethod()->calculate(_getParameters());

    std::vector<unsigned int> neededParams = m_eqCalc.getCurMethod()->getNeededParams();
    unsigned int calcValueID = m_eqCalc.getCurMethod()->getCalculatedValueID();

    for(unsigned int i=0; i<NUM_GUI_OBJECTS; i++){
        QWidget* qWidg = m_guiObjects[i];
        if (qWidg){
            if(std::string(qWidg->metaObject()->className()).compare("QDoubleSpinBox")==0){
                QDoubleSpinBox* qDSpinBox= (QDoubleSpinBox*) qWidg;
                QPalette palette = qDSpinBox->palette();
                QColor bgColor;
                if(i==calcValueID){
                    qDSpinBox->setEnabled(true);
                    qDSpinBox->setReadOnly(true);
                    qDSpinBox->setValue(value);
                    qDSpinBox->setFont(QFont("MS Shell Dlq 2", 8, QFont::Bold));
                    if(value < g_tolGuiObjects[calcValueID][0] || value > g_tolGuiObjects[calcValueID][1] ){
                        bgColor = QColor( 255,0,0,255 );
                    }
                    else{
                        bgColor = QColor( 0,200,0,255 );
                    }
                    palette.setColor(QPalette::Text,Qt::white);
                    palette.setColor(QPalette::Base, bgColor);
                    qDSpinBox->setPalette(palette);
                }
                else{
                    QPalette palette = qDSpinBox->palette();
                    if(neededParams[i]){
                        palette.setColor(QPalette::Text,Qt::black);
                        palette.setColor(QPalette::Base,Qt::white);
                    }
                    else{
                        palette.setColor(QPalette::Text,QColor(120,120,120,255));
                        palette.setColor(QPalette::Base,QColor(240,240,240,255));
                    }
                    qDSpinBox->setPalette(palette);
                    qDSpinBox->setEnabled(neededParams[i]);
                    qDSpinBox->setFont(QFont("MS Shell Dlq 2", 8));
                    qDSpinBox->setReadOnly(!neededParams[i]);
                }
            }
            else{
                qWidg->setEnabled(neededParams[i]);
            }
        }

    }
}


std::vector<double> MainWindow::_getParameters(){

    std::vector<double> params(NUM_GUI_OBJECTS, 0);

    for(unsigned int i=0; i<NUM_GUI_OBJECTS; i++){
        QWidget* qWidg = m_guiObjects[i];
        if (qWidg){
            if(std::string(qWidg->metaObject()->className()).compare("QDoubleSpinBox")==0){
                QDoubleSpinBox* qDSpinBox= (QDoubleSpinBox*) qWidg;
                params[i] = qDSpinBox->value();
            }
            if(std::string(qWidg->metaObject()->className()).compare("QComboBox")==0){
                QComboBox* qComboBox = (QComboBox*) qWidg;
                int idx = qComboBox->currentIndex();
                QString pos = qComboBox->itemText(idx);
                int mapIdx = m_mapPositions[pos.toStdString()];
                params[i] = m_mapPosBlinds[mapIdx];
            }
            if(std::string(qWidg->metaObject()->className()).compare("QCheckBox")==0){
                QCheckBox* qComboBox= (QCheckBox*) qWidg;
                params[i] = qComboBox->isChecked() ? 1 : 0;
            }
        }
    }

    return params;
}


void MainWindow::_initMethods(){

    for(int i=0; i< NUM_METHODS; i++)
    {
        QComboBox *qComboBoxMethods = ui->CB_Methods;
        qComboBoxMethods->addItem(QString(g_methodNames[i]));
    }

}

void MainWindow::_initGUIObjects()
{
    m_guiObjects[POS_HERO]      = ui->CB_PosHero;
    m_guiObjects[POS_VILL]      = ui->CB_PosVill;
    m_guiObjects[BLINDS]        = ui->SB_Blinds;
    m_guiObjects[SIZE_OPEN]     = ui->SB_OpenTo;
    m_guiObjects[SIZE_3BET]     = ui->SB_3BetTo;
    m_guiObjects[SIZE_4BET]     = ui->SB_4BetTo;
    m_guiObjects[SIZE_5BET]     = ui->SB_5BetTo;
    m_guiObjects[ALLIN_3BET]    = ui->CB_AllIn3Bet;
    m_guiObjects[ALLIN_4BET]    = ui->CB_AllIn4Bet;
    m_guiObjects[ALLIN_5BET]    = ui->CB_AllIn5Bet;
    m_guiObjects[SIZE_STACK]    = ui->SB_SizeStack;
    m_guiObjects[FOLDPCT_VILL]  = ui->SB_FoldPctVill;
    m_guiObjects[EQU_HERO]      = ui->SB_EquHero;
    m_guiObjects[EXP_VALUE]     = ui->SB_EV;
}


void MainWindow::_createPositionMaps()
{
    for (int i=0; i<NUM_POSITIONS;i++){
        m_mapPositions.insert(std::pair<std::string, int>(std::string(g_positionNames[i]),i));
        m_mapPosBlinds.insert(std::pair<int, double>(i,g_positionBlinds[i]));
    }
}

//----------------- Bet Size updates -------------------------------

void MainWindow::_adaptBetSizeMinima()
{
    //QDoubleSpinBox* qDSpinBoxBlinds = (QDoubleSpinBox*) m_guiObjects[BLINDS];
    QDoubleSpinBox* qDSpinBoxOpen   = (QDoubleSpinBox*) m_guiObjects[SIZE_OPEN];
    QDoubleSpinBox* qDSpinBox3Bet   = (QDoubleSpinBox*) m_guiObjects[SIZE_3BET];
    QDoubleSpinBox* qDSpinBox4Bet   = (QDoubleSpinBox*) m_guiObjects[SIZE_4BET];
    QDoubleSpinBox* qDSpinBox5Bet   = (QDoubleSpinBox*) m_guiObjects[SIZE_5BET];

    double valueOpen = qDSpinBoxOpen->value();

    double value3Bet = qDSpinBox3Bet->value();
    double value3BetMin = valueOpen*2 - 1;
    qDSpinBox3Bet->setMinimum(value3BetMin);
    value3Bet = qDSpinBox3Bet->value();

    double value4Bet = qDSpinBox4Bet->value();
    double value4BetMin = value3Bet*2 - valueOpen;
    qDSpinBox4Bet->setMinimum(value4BetMin);
    value4Bet = qDSpinBox4Bet->value();

    //double value5Bet = qDSpinBox5Bet->value();
    double value5BetMin = value4Bet*2 - value3Bet;
    qDSpinBox5Bet->setMinimum(value5BetMin);
    //value5Bet = qDSpinBox5Bet->value();
}

void MainWindow::_setPositions()
{
    std::vector<unsigned int> positionsHero = m_eqCalc.getCurMethod()->getPossibleHeroPos();

    QComboBox* qCBPosHero = ui->CB_PosHero;
    int idxHero = qCBPosHero->currentIndex();
    QString posHero = qCBPosHero->itemText(idxHero);
    int idxMapHeroMaster = m_mapPositions[posHero.toStdString()];
    int idxHeroNew = 0;
    int k = 0;

    ui->CB_PosHero->clear();
    for(int i=0;i<static_cast<int>(positionsHero.size()) ; i++){
        if (positionsHero[i]){
            qCBPosHero->addItem(g_positionNames[i]);
            if(idxMapHeroMaster == i)
                idxHeroNew = k;
            k++;
        }
    }
    qCBPosHero->setCurrentIndex(idxHeroNew);

}

void MainWindow::_adaptPositions(QComboBox* master, QComboBox* slave, int dir)
{
    slave->blockSignals(true);
    master->blockSignals(true);
    int idxMaster = master->currentIndex();
    QString posMaster = master->itemText(idxMaster);
    int idxMapPosMaster = m_mapPositions[posMaster.toStdString()];

    int idxSlave  = slave->currentIndex();
    QString posSlave = slave->itemText(idxSlave);
    int idxMapPosSlave = m_mapPositions[posSlave.toStdString()];
    int idxPosSlaveNew = 0;
    int k = 0;

    slave->clear();
    if (dir > 0){
        for(int i=idxMapPosMaster+1; i<NUM_POSITIONS; i++){
            slave->addItem(g_positionNames[i]);
            if (i==idxMapPosSlave)
                idxPosSlaveNew = k;
            k++;
        }
    }
    else{
        for(int i=0; i<idxMapPosMaster; i++){
            slave->addItem(g_positionNames[i]);
            if (i==idxMapPosSlave)
                idxPosSlaveNew = k;
            k++;
        }
    }
    slave->setCurrentIndex(idxPosSlaveNew);
    slave->blockSignals(false);
    master->blockSignals(false);
}

//----------------- GUI updates ------------------------------------


void MainWindow::on_CB_Methods_currentIndexChanged(const QString &arg1)
{
    _updateGUI();
    _setPositions();
    _adaptPositions(ui->CB_PosHero, ui->CB_PosVill, m_eqCalc.getCurMethod()->getRelationHeroVillain());
    _updateGUI();
}

void MainWindow::on_CB_AllIn3Bet_stateChanged(int arg1)
{
    _updateGUI();
}

void MainWindow::on_CB_AllIn4Bet_stateChanged(int arg1)
{
    _updateGUI();
}

void MainWindow::on_CB_AllIn5Bet_stateChanged(int arg1)
{
    _updateGUI();
}

void MainWindow::on_CB_PosVill_currentIndexChanged(const QString &arg1)
{
    _adaptPositions(ui->CB_PosVill, ui->CB_PosHero, -(m_eqCalc.getCurMethod()->getRelationHeroVillain()));
    _updateGUI();
}

void MainWindow::on_CB_PosHero_currentIndexChanged(const QString &arg1)
{
    _adaptPositions(ui->CB_PosHero, ui->CB_PosVill, m_eqCalc.getCurMethod()->getRelationHeroVillain());
    _updateGUI();
}

void MainWindow::on_SB_Blinds_editingFinished()
{
    _updateGUI();
}


void MainWindow::on_SB_SizeStack_editingFinished()
{
    _updateGUI();
}

void MainWindow::on_SB_FoldPctVill_editingFinished()
{
    _updateGUI();
}

void MainWindow::on_SB_EquHero_editingFinished()
{
    _updateGUI();
}

void MainWindow::on_SB_OpenTo_editingFinished()
{
    _updateGUI();
}

void MainWindow::on_SB_3BetTo_editingFinished()
{
    _updateGUI();
}

void MainWindow::on_SB_4BetTo_editingFinished()
{
    _updateGUI();
}

void MainWindow::on_SB_5BetTo_editingFinished()
{
    _updateGUI();
}

void MainWindow::on_SB_EV_editingFinished()
{
    _updateGUI();
}

void MainWindow::on_SB_5BetTo_valueChanged(double arg1)
{
    _updateGUI();
}

void MainWindow::on_SB_OpenTo_valueChanged(double arg1)
{
    _updateGUI();
}

void MainWindow::on_SB_EquHero_valueChanged(double arg1)
{
    _updateGUI();
}

void MainWindow::on_SB_Blinds_valueChanged(double arg1)
{
    _updateGUI();
}

void MainWindow::on_SB_SizeStack_valueChanged(double arg1)
{
    _updateGUI();
}

void MainWindow::on_SB_FoldPctVill_valueChanged(double arg1)
{
    _updateGUI();
}

void MainWindow::on_SB_3BetTo_valueChanged(double arg1)
{
    _updateGUI();
}

void MainWindow::on_SB_4BetTo_valueChanged(double arg1)
{
    _updateGUI();
}

void MainWindow::on_SB_EV_valueChanged(double arg1)
{
    _updateGUI();
}
