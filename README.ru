﻿=======================================
Bluetooth для Microsoft Device Emulator
version 0.9.4
April 2nd, 2009
=======================================


ВСТУПЛЕНИЕ
==========

Bluetooth для Microsoft Device Emulator добавляет поддержку Bluetooth в эмулятор.

Bluetooth был проверен со следующими образами операционных систем (ОС):

  * Windows Mobile 5.0 Pocket PC SDK
  * Windows Mobile 5.0 Smartphone SDK
  * Windows Mobile 6 Professional SDK
  * Windows Mobile 6 Standard SDK 


ТРЕБОВАНИЯ
==========

Пожалуйста обратите внимание, что ВСЕ ниже перечисленное ДОЛЖНО БЫТЬ установлено:

  * Windows XP или Windows Vista 32-bit с последними пакетами обновлений.
  * Microsoft Visual Studio 2005 или 2008 с последними пакетами обновлений. Ваша Visual Studio инсталяция должна включать Smart Device Programmability функциональность.
  * Windows Mobile 5.0 Pocket PC SDK и/или Windows Mobile 5.0 Smartphone SDK и/или Windows Mobile 6 Professional SDK и/или Windows Mobile 6 Standard SDK образы ОС
  * Microsoft Device Emulator (Рекомендавана: Версия 3.0).
  * Microsoft Remote Tools Framework 1.00. 

Также у вас должно быть свободное Bluetooth USB устройство.


ВНИМАНИЕ
========

Эта версия Bluetooth для Microsoft Device Emulator использует FreeBT проект <http://freebt.net/> для доступа к Bluetooth USB устройству.


ОБЗОР АРХИТЕКТУРЫ
=================

Проект состоит из следующих компонентов:
  1. На стороне эмулятора
    * Bluetooth HCI транспортный драйвер <http://msdn.microsoft.com/en-us/library/ms890918.aspx>.
    * Драйвер последовательного порта <http://msdn.microsoft.com/en-us/library/ms923741.aspx> для абстрагирования транспортного драйвера от знания конкретного средства связи.
    * Microsoft Remote Tools Framework удаленный агент.
  2. На стороне ПК
    * Microsoft Remote Tools Framework ПК плагин.
    * FreeBT USB библиотека времени выполнения.
    * FreeBT USB драйвер.
    * Подключенное Bluetooth USB устройство.


АППАРАТНОЕ ОБЕСПЕЧЕНИЕ
======================

FreeBT USB драйвер написан в соответствие со Bluetooth USB HCI спецификацией. Любое устройство, которое следует рекомендациям этой спецификации должно быть совместимым с FreeBT USB драйвером.

fbtusb.inf по умолчанию устанавливается для любого USB устройства, которое идентифицирует себя как Класс 0xE0 (Беспроводное устройсво), Подкласс 0x01 (Высоко частотное устройство) и Протокол 0x01 (Bluetooth).

FreeBT USB драйвер быть протестирован со следующими устройствами:

  * Acer BT-700 (Класс 1)
  * D-Link DBT-120 (Класс 2)
  * Любые CSR или Silicon Wave USB устройства

В настоящее время, оба выше перечисленные устройства построены на базе CSR BlueCore01 чипа (как и большинство Bluetooth устройств на данный момент), что (исключая их усилители сигнала) делает их идентичными.


УСТАНОВКА BLUETOOTH USB ДРАЙВЕРА
================================

  1. Откройте Диспетчер устройств.
  2. В Диспетчере устройств выберите Bluetooth устройство, которое должно быть использовано как FreeBT USB.
  3. Нажмите правую кнопку мыши и выберите "Обновить драйвер..." из всплывающего меню.
  4. Выберите "Нет, не в этот раз" и нажмите "Далее >".
  5. Выберите "Install from a list or specific location" and click "Далее >".
  6. Выберите "Don’t search. I will choose the driver to install" and click "Далее >".
  7. Выберите the device driver and click the "Have Disk...".
  8. In the Locate File dialog, browse to fbtusb.inf file and click "Далее >".
  9. When a "Hardware Installation warning" appears, click "Continue Anyway".
  10. когда установка будет закончена, нажмите "Finish".
  11. В списке USB устройств теперь должно быть добавлено "FreeBT USB Driver". 

Обращайтесь к FreeBT документации для получения более подробной информации.


УСТАНОВКА
=========

  1. Установите Visual Studio 2005 или 2008 и последние пакеты обновлений. Ваша Visual Studio инсталяция должна включать Smart Device Programmability функциональность.
  2. Установите Microsoft Device Emulator. У вас уже может быть он установлен вместе с Visual Studio инсталяцией. Обновите его до Microsoft Device Emulator 3.0 -- Standalone Release <http://www.microsoft.com/downloads/details.aspx?familyid=A6F6ADAF-12E3-4B2F-A394-356E2C2FB114&displaylang=en>.
  3. Установите образы ОС, которые вам нужны.
  4. У вас должно быть свободное Bluetooth USB устройство. Воткните его в свободный USB порт.
  5. Установите FreeBT USB драйвер как описано в секции. УСТАНОВКА BLUETOOTH USB ДРАЙВЕРА.
  6. Установите Remote Tools Framework 1.00 <http://www.microsoft.com/downloads/details.aspx?FamilyID=35e9ef0f-833f-4987-9d1f-157a0a6a76e4&DisplayLang=en>.


НАЧАЛО РАБОТЫ
=============

  1. Установите FreeBT USB драйвер как описано в секции УСТАНОВКА BLUETOOTH USB ДРАЙВЕРА.
  2. Установите ВСЕ из секции ТРЕБОВАНИЯ как описано в секции УСТАНОВКА.
  3. Запустите Remote Tools Framework плагин BthEmulManager.cetool из папки "RTFx Plugin".
  4. Выберите нужный образ ОС из списка.
  5. подождите пока эмулятор будет запущен.
  6. Выберите "Bluetooth for Microsoft Device Emulator" узел в дереве.
  7. Если Bluetooth устройство было соединено успешно тогда информация о Bluetooth устройстве (Адрес, Производитель, HCI Версия, LMP Версия) будет отображена. Bluetooth теперь должен быть работоспособным на эмуляторе. В противном случае будет отображен код ошибки и ее описание.
  8. To clear the communication log click the right mouse button and select "Clear All".
  9. To copy current device information to the clipboard select "Bluetooth for Microsoft Device Emulator" node, click the right mouse button and select "Copy to Clipboard". 
  10. To switch off Bluetooth on the emulator click "Connection" menu item and select "Disconnect from ... emulator".
  11. Microsoft Remote Tools Framework allows you to start two device emulators at the same time. If you have installed two or more FreeBT USB devices click "Windows" menu item and select "Split Windows View". Repeat steps 3-6. You will get two Bluetooth powered emulators are running simultaneously.
  12. It is possible to enable/disable device side logging. If you enable "Device Logging" checkbox then remote logging will be enabled on the emulator. Have a look at \\Temp directory on the emulator. There should be created btd_bthemul_0.txt, btd_BthEmulAgent_0.txt, btd_bthemulcom_0.txt files. 
  13. It is possible to enable/disable desktop side logging. If you enable "Desktop Logging" checkbox then local logging will be enabled. Have a look at your installation directory. There should be created BthEmulManager.txt file. 
  14. It is possible to enable/disable communication logging. Communication logging allows to see communication activities between the emulator and the Bluetooth device.


РЕШЕНИЕ ПРОБЛЕМ
===============

  Q. I've installed the Free BT Driver, but after deploying the emulator, it is still not working.
  A. Install the Microsoft Remote Tools Framework 1.00 if you haven't done it yet. Launch the Remote Tools Framework plugin BthEmulManager.cetool from "RTFx Plugin" folder.
  
  Q. I'm trying to connecter Pocket PC 2003 SE Emulator but I receive an error all the time: "The device Pocket PC 2003 SE VGA Emulator has a CPU type of ARMV4 and an operating system version of 4.21."
  A. Pocket PC 2003 and Smartphone 2003 aren't supported yet.

  Q. Which Windows Device Manager the README refers to ?
  A. Win2K&XP: Control Panel -> System -> Hardware tab -> Device Manager
     Vista: Control Panel -> Hardware and Sound -> Device Manager

  Q. I have started the BthEmulManager.cetool plugin for the first time but nothinng happens. There isn't Bluetooth in the emulator.
  A. Try to restart the plugin for the previously choosen emulator. Also go to Settings -> Connections -> Bluetooth -> Mode tab and turn on Bluetooth.

You may also have problems with the FreeBT USB Driver itself. The driver is still (and will probably remain at this stage) in alpha version. There are a number of reports saying it has problems. The problems with this driver are the following:

  1. It stops working for no reason.
  2. It may miss packets in write/read operations. The problems start when you send large packets very fast. The most probably the problem in an incorrect using HCI buffers (Read Buffer Size Command, Number Of Completed Packets Event).
  3. It isn't stable with some chipset like CSR.

But the driver works quite stable for me at least. I encourage you if you have such problems and have experience in the Windows driver development try to improve the driver and share your results.


БЛАГОДАРНОСТИ
=============

Спасибо Antony C. Roberts за FreeBT <http://freebt.net/> проект. Без него этот проект мог бы быть невозможным.


ПРАВОВАЯ ИНФОРМАЦИЯ
===================

Bluetooth для Microsoft Device Emulator
Copyright (C) 2008-2009 Dmitry Klionsky <dm.klionsky@gmail.com>

FreeBT
Copyright (C) 2004 Antony C. Roberts <http://www.freebt.net/>

Bluetooth(TM)
Copyright (C) Bluetooth SIG, Inc. All rights reserved. 

Windows(TM), Windows XP(TM), Windows Mobile(TM),
Microsoft Visual Studio, Microsoft Device Emulator, 
Microsoft Remote Tools Framework
Copyright (C) Microsoft Corporation. All rights reserved.