unit HWEdit;
//�������������� HW

interface
  uses
    BaseEdit,
    Terminal;

  const

  NO_ITEM_ERROR =  '������';

  ACCESS_MODE_EXT_KEY      = 'Ext key/Code';
  ACCESS_MODE_ANY_CARD     = 'Any card';
  ACCESS_MODE_AUTHED_CARD  = 'Authed card';
  ACCESS_MODE_ONLY_SERVICE = 'Only service';
  ACCESS_MODE_BLOCK        = 'Block (Nobody)';

  IGNITION_CONTROL_DISABLED     = 'Disabled';
  IGNITION_CONTROL_BEEP1        = 'Beep1';
  IGNITION_CONTROL_SPEED_ALARM  = 'Speed & Alarm';
  IGNITION_CONTROL_SPEED        = 'Speed only';
  IGNITION_CONTROL_ALARM        = 'Alarm only';
  IGNITION_CONTROL_ALWAYS_ON    = 'Always on';
  IGNITION_CONTROL_SIGNAL_RELAY = 'Signal relay';

  BREAK_RELAY_ON_OFF     = 'On/Off';
  BREAK_RELAY_TILL_IGN   = 'Impulse till IGN';
  BREAK_RELAY_IMPULS_05  = 'Impulse 0.5s';
  BREAK_RELAY_IMPULS_1   = 'Impulse 1s';
  BREAK_RELAY_IMPULS_2   = 'Impulse 2s';
  BREAK_RELAY_IMPULS_3   = 'Impulse 3s';
  BREAK_RELAY_DISABLED   = 'Disabled (NC)';

  CAN_DRIVER_DISABLED = 'Disabled';
  CAN_DRIVER_TEST     = 'Test';
  CAN_DRIVER_PASSIVE  = 'Ext file passive';
  CAN_DRIVER_ACTIVE   = 'Ext file active';

  POWER_RELAY_DISABLED_EXT = 'Disabled (External signal)';
  POWER_RELAY_DISABLED_INT = 'Disabled (Internal signal)';
  POWER_RELAY_ENABLED_HOLD = 'Enabled (Power hold mode)';
  POWER_RELAY_ENABLED_NC   = 'Enabled (NC)';

  RELAY_MODULE_TYPE_V2  = 'Version 2';
  RELAY_MODULE_TYPE_V3  = 'Version 3';
  RELAY_MODULE_TYPE_V4  = 'Version 4 (12v)';

  SIGNAL_RELAY_DISABLED      = 'Disabled';
  SIGNAL_RELAY_IGN           = 'IGN';
  SIGNAL_RELAY_INV_IGN       = 'InV IGN';
  SIGNAL_RELAY_INV_IGN_DELAY = 'InV IGN delay';
  SIGNAL_RELAY_SPEED_ALARM   = 'Speed & Alarm';
  SIGNAL_RELAY_SPEED         = 'Speed only';
  SIGNAL_RELAY_ALARM         = 'Alarm only';

  RFID_WIEGAND_SINGLE  = 'Wiegand (Single)';
  RFID_WIRE_SINGLE     = '1-Wire (Single)';
  RFID_WIRE_CONTINIOUS = '1-Wire (Continious)';

  POWER_SIGNAL_ALWAYS_ON = 'Always ON';
  POWER_SIGNAL_IGN_IN    = 'IGN_IN voltage';
  POWER_SIGNAL_CAN_IGN   = 'CAN IGN';
  POWER_SIGNAL_XIN1      = 'XIN1';
  POWER_SIGNAL_XIN2      = 'XIN2';
  POWER_SIGNAL_AIN       = 'AIN';

  IGN_SIGNAL_EXT_IGN     = 'Ext IGN';
  IGN_SIGNAL_EXT_IGN_REL = 'Ext IGN & REL';
  IGN_SIGNAL_CAN         = 'CAN';
  IGN_SIGANL_XIN1        = 'XIN1';
  IGN_SIGNAL_XIN2        = 'XIN2';
  IGN_SIGNAL_IGN_S       = 'IGN_S';
  IGN_SIGNAL_AIN         = 'AIN';

  Engine_SIGNAL_Disabled  = 'Disabled';
  Engine_SIGNAL_CAN       = 'CAN';
  Engine_SIGNAL_XIN1      = 'XIN1';
  Engine_SIGNAL_XIN2      = 'XIN2';
  Engine_SIGNAL_XIN3      = 'XIN3';
  Engine_SIGNAL_IGN_S     = 'IGN_S';
  Engine_SIGNAL_AIN       = 'AIN';
  Engine_SIGNAL_IGN_STATE = 'IGN STATE';

  MOVE_SIGNAL_DIABLED  = 'Disabled';
  MOVE_SIGNAL_MOTION_S = 'Motion sensor';
  MOVE_SIGNAL_CAN      = 'CAN';
  MOVE_SIGNAL_XIN1     = 'XIN1';
  MOVE_SIGNAL_XIN2     = 'XIN2';
  MOVE_SIGNAL_XIN3     = 'XIN3';
  MOVE_SIGNAL_IGN_S    = 'IGN_S';
  MOVE_SIGNAL_AIN      = 'AIN';
  MOVE_SIGNAL_SPEED    = 'Speed';
  MOVE_SIGNAL_N_XIN1   = 'N_XIN1';
  MOVE_SIGNAL_N_XIN2   = 'N_XIN2';

  MECH_SIGNAL_DISABLED = 'Disabled';
  MECH_SIGNAL_MOTION_S = 'Motion sensor';
  MECH_SIGNAL_CAN      = 'CAN';
  MECH_SIGNAL_IN1      = 'IN1';
  MECH_SIGNAL_IN2      = 'IN2';
  MECH_SIGNAL_IN3      = 'IN3';
  MECH_SIGNAL_IGN_S    = 'IGN_S';
  MECH_SIGNAL_AIN      = 'AIN';
  MECH_SIGNAL_N_XIN1   = 'N_XIN1';
  MECH_SIGNAL_N_XIN2   = 'N_XIN2';

  SPEED_SIGNAL_DISABLED  = 'Disabled';
  SPEED_SIGNAL_CAN       = 'CAN';
  SPEED_SIGNAL_AIN1      = 'AIN1';
  SPEED_SIGNAL_AIN2      = 'AIN2';
  SPEED_SIGNAL_AIN3      = 'AIN3';
  SPEED_SIGNAL_DIN1      = 'DIN1';
  SPEED_SIGNAL_DIN2      = 'DIN2';
  SPEED_SIGNAL_AIN2_AIN1 = '|AIN2-AIN1|';

  LEVEL_SIGNAL_DISABLED = 'Disabled';
  LEVEL_SIGNAL_CAN      = 'CAN';
  LEVEL_SIGNAL_EXT      = 'Ext. Device';
  LEVEL_SIGNAL_BAT_12v  = 'BAT Voltage 12v';
  LEVEL_SIGNAL_BAT_24v  = 'BAT Voltage 24v';
  LEVEL_SIGNAL_BAT_48v  = 'BAT Voltage 48v';
  LEVEL_SIGNAL_BAT_72v  = 'BAT Voltage 72v';
  LEVEL_SIGNAL_BAT_80v  = 'BAT Voltage 80v';

  CHARGE_SIGNAL_DISABLED  = 'Disabled';
  CHARGE_SIGNAL_CAN       = 'CAN';
  CHARGE_SIGNAL_XIN1      = 'XIN1';
  CHARGE_SIGNAL_XIN2      = 'XIN2';
  CHARGE_SIGNAL_XIN3      = 'XIN3';
  CHARGE_SIGNAL_IGN_S     = 'IGN_S';
  CHARGE_SIGNAL_AIN       = 'AIN';
  CHARGE_SIGNAL_N_XIN1    = 'N_XIN1';
  CHARGE_SIGNAL_N_XIN2    = 'N_XIN2';

  RELAY_POWER_TIMEOUT_48h = '48 h';
  RELAY_POWER_TIMEOUT_24h = '24 h';
  RELAY_POWER_TIMEOUT_12h = '12 h';
  RELAY_POWER_TIMEOUT_6h  = '6 h';
  RELAY_POWER_TIMEOUT_3h  = '3 h';
  RELAY_POWER_TIMEOUT_2h  = '2 h';
  RELAY_POWER_TIMEOUT_1h  = '1 h';
  RELAY_POWER_TIMEOUT_30m = '30 min';
  RELAY_POWER_TIMEOUT_15m = '15 min';
  RELAY_POWER_TIMEOUT_10m = '10 min';
  RELAY_POWER_TIMEOUT_05m = '5 min';
  RELAY_POWER_TIMEOUT_off = 'Disabled';

  ACCEL_TYPE_DISABLED = 'Disabled';
  ACCEL_TYPE_INTERNAL = 'Internal';
  ACCEL_TYPE_EXTERNAL = 'External';
  ACCEL_TYPE_AUTO     = 'int/AutoExt';

  SPEED_LIMIT_DISABLED    = 'Disabled';
  SPEED_LIMIT_BEEP_ONLY   = 'Beep only';
  SPEED_LIMIT_BLOCK_PAUSE = 'Block/Pause';
  SPEED_LIMIT_FULL_BLOCK  = 'Full block';

  USAGE_MODE_EXPLOATATION = 'Explotation';
  USAGE_MODE_SERVICE      = 'Service';
  USAGE_MODE_MAINTENANCE  = 'Maintenance';
  USAGE_MODE_REPAIR       = 'Repair';
  USAGE_MODE_CONSERVATION = 'Conservation';

  type

    //��� ������ �������� �������
    TypeAccessMode = (
      am_OFF           = %00000000, // ��������
      am_Any_Card      = %00000001, // �� ����� �����
      am_Only_admitted = %00000010, // ������ ���������
      am_Only_service  = %00000011, // ������ ��������
      am_Nobody        = %00000100  // ������
    );

    //��� �������� ����
    TypePowerRelay = (
      pr_External_signal = %00000000, // ���� ����� ��������� (�������)
      pr_Internal_signal = %10000000, // ���� ����� ��������� (����������)
      pr_Power_hold_mode = %01000000, // ����� ������������� �������
      pr_NC              = %11000000  // ��� ����� ���������, �������� ���� ������ �����
    );

    // ��� ���������� ���������� (���� ���������� ���������)
    TypeIgnBreakRelay = (
      br_OnOff            =  %00000000, // �����������
      br_impulse_till_IGN =  %00000001, // ������� �� ���������� ��������� ���������
      br_impulse_05s      =  %00000010, // ������� 0.5 �������
      br_impuls_1s        =  %00000011, // ������� 1 ��������
      br_impuls_2s        =  %00000100, // 2 �������';
      br_impuls_3s        =  %00000101, // 3 �������';
      br_disabled         =  %00000110  // �������� (IGN Break ��������� 0);
    );

    // Beep2
    TypeBeep2 = (
      b2_disabled     = %00000000, // result:= 'Disabled';
      b2_beep1        = %01110000, // result:= 'Beep1';
      b2_speed_alarm  = %01100000, // result:= 'SPEED & ALARM';
      b2_speed        = %01000000, // result:= 'SPEED only';
      b2_alarm        = %00100000, // result:= 'ALARM only';
      b2_always_on    = %11110000, // result:= 'ALWAYS ON';
      b2_signal_relay = %11000000  // result:= 'SIGNAL RELAY';
    );

    // ��� CanDriver
    TypeCanDriver = (
      can_disabled      = %00000000,     // 0
      can_test          = %00000001,     // 1
      can_file_passive  = %00000010,     // 2
      can_file_active   = %00000011      // 3
    );

    TypeRelayModuleType = (
      Version_2 = 0,
      Version_3 = 1,
      Version_4 = 2
    );

    // ���������� ����
    TypeSignalRelay = (
      sr_Disabled      = 0,
      sr_IGN           = 1,
      sr_INV_IGN       = 2,
      sr_INV_IGN_DELAY = 3,
      sr_Speed_Alartm  = 4,
      sr_Speed         = 5,
      sr_Alarm         = 6
    );

    // ��� ������ �����������
    TypeRFIDReadMode = (
      rf_wiegand_single  = 0,
      rf_wire_single     = 1,
      rf_wire_continious = 2
    );

    // ������ ���������
    TypePowerSignal = (
      ps_always_on = 0,
      ps_ign_in    = 1,
      ps_can_ign   = 2,
      ps_xin1      = 3,
      ps_xin2      = 4,
      ps_ain       = 5
    );


    TypeSignalSourceIGN = (
      iss_ext_IGN	    =	%00000000,
      iss_ext_IGN_REL	=	%00000001,
      iss_Can			    =	%00000010,
      iss_XIN1		    =	%00000011,
      iss_XIN2		    =	%00000100,
      iss_IGN_S		    =	%00000101,
      iss_AIN			    =	%00000110
    );

    TypeSignalSourceEngine = (
      sse_disabled  = %00000000,
      sse_CAN       = %00010000,
      sse_XIN1      = %00100000,
      sse_XIN2      = %00110000,
      sse_XIN3      = %01000000,
      sse_IGN_S     = %01010000,
      sse_AIN       = %01100000,
      see_IGN_STATE = %01110000
    );

    TypeSignalSourceTurboTimer = (
     ttON  = %10000000,
     ttOFF = %00000000
    );

    TypeSingalSourceMove = (
      tss_Disabled = 0,
      tss_Motion_s = 1,
      tss_CAN      = 2,
      tss_XIN1     = 3,
      tss_XIN2     = 4,
      tss_XIN3     = 5,
      tss_IGN_S    = 6,
      tss_AIN      = 7,
      tss_Speed    = 8,
      tss_N_XIN1   = 9,
      tss_N_XIN2   = 10
    );

    TypeSignalSourceMech = (
      tsm_Disabled       = 0,
      tsm_Motion_sensor  = 1,
      tsm_CAN            = 2,
      tsm_IN1            = 3,
      tsm_IN2            = 4,
      tsm_IN3            = 5,
      tsm_IGN_S          = 6,
      tsm_AIN            = 7,
      tsm_N_XIN1         = 8,
      tsm_N_XIN2         = 9
    );

    TypeSignalSourceSpeed = (
      sss_disabled  = 0,
      sss_Can       = 1,
      sss_AIN1      = 2,
      sss_AIN2      = 3,
      sss_AIN3      = 4,
      sss_DIN1      = 5,
      sss_DIN2      = 6,
      sss_AIN2_AIN1 = 7
    );

    TypeSignalSourceLevel = (
//     ssl_Disabled   = %00000000,
     ssl_Disabled   = %00001111,
     ssl_Disabled2  = %00000000,
     ssl_CAN        = %00000001,
     ssl_Ext_device = %00000010,
     ssl_BAT_12v    = %00000011,
     ssl_BAT_24v    = %00000100,
     ssl_BAT_48v    = %00000101,
     ssl_BAT_72v    = %00000110,
     ssl_BAT_80v    = %00000111
    );

    TypeSignalSourceCharge = (

//     ssc_Disabled = %00000000,
     ssc_Disabled  = %11110000,
     ssx_disavled2 = %00000000,
     ssc_CAN       = %00010000,
     ssc_XIN1      = %00100000,
     ssc_XIN2      = %00110000,
     ssc_XIN3      = %01000000,
     ssc_IGN_S     = %01010000,
     ssc_AIN       = %01100000,
     ssc_N_XIN1    = %01110000,
     ssc_N_XIN2    = %10000000
    );

   TypeAccel = (
     al_disabled =  0,
     al_internal =  1,                                                          // ����������
     al_external =  2,                                                          // �������
     al_auto     =  3                                                           // ���������� � ����������������� �� �������
   );

   Type12vPowerOffTimeout = (
     pt_48h      = %00000000,
     pt_24h      = %00010000,
     pt_12h      = %00100000,
     pt_6h       = %00110000,
     pt_3h       = %01000000,
     pt_2h       = %01010000,
     pt_1h       = %01100000,
     pt_30m      = %01110000,
     pt_15m      = %10000000,
     pt_10m      = %10010000,
     pt_5m       = %10100000,
     pt_disabled = %11110000
   );

   // �������� ��� ���������� ��������
   TypeSpeedMode = (
    sm_disabled = 0,
    sm_beepOnly = 1,
    sm_block_P  = 2,
    sm_full_B   = 3
   );

   // ����� ������������
   TypeUsageMode = (
    um_explotation  = %00000000,
    um_service      = %00100000,
    um_maintenance  = %01000000,
    um_repair       = %01100000,
    um_conservation = %10000000
   );

  //------- ��������� ��������-----------------------------------------------------
// G - ���������, ������������ ���� ��������(THWWsetting1,2,3),
// L - ��������� ������ � ������ ���������
  THWSetting_1 = record
{-G----L--}
  {0} {0} AccessControlMode                         : Byte;                     // ����� �������� �������
                                                                                // ���� 0..5:
                                                                                // 0 - ��������,
                                                                                // 1 - �� ����� �����,
                                                                                // 2 - ������ ���������,
                                                                                // 3 - ������ ��������,
                                                                                // 4 - ������;

                                                                                // Power relay
                                                                                // ���� 6..7:
                                                                                // 0 - ���� ����� ��������� (�������),
                                                                                // 1 - ����� ������������� �������,
                                                                                // 2 - ��� ����� ��������� (������������ ����������, ��� ����),
                                                                                // 3 - ��� ����� ���������, �������� ���� ������ �����

 {1} {1} OperatorSessionTimeout                     : Byte;                     // ������� �������������� ������������� ��������� (���)
 {2} {2} IgnitionControl                            : Byte;                     // ���� 0..3: ���������� ����������:
                                                                                //  0 - �����������,
                                                                                //  1 - ������� �� ���������� ��������� ���������,
                                                                                //  2 - ������� 0.5 �������,
                                                                                //  3 - ������� 1 ��������,
                                                                                //  4 - 2 �������,
                                                                                //  5 - 3 �������,
                                                                                //  6 - �������� (IGN Break ��������� 0);
                                                                                // ���� 4..7: ����� ������ 2

 {3} {3} DriverCan                                  : Byte;                     // ������� CAN (0 - ��������, 1 - �������, 2 - ������� ����)
  end;

  THWSetting_2 = record
{-G----L--}
 {4}  {0}  AccelerometerCalibration : array[0..19] of Byte;                     // ������������� ������������ ������������� (9 + 2), ���������� (2 + 2), ������� ���� (2)
 {24} {21} BlockingThresholdIMPACT                  : Byte;                     // ����� ���������� �� �����, % (Card_enabled_timeout)
 {25} {22} BlockingThresholdMANEUVER                : Byte;                     // ����� ���������� �� �������, %
 {25} {23} Reserv_1                                 : Byte;                     // ������ 1
 {27} {24} BlockingTimeoutIMPACT                    : Byte;                     // ������� ���������� �� �����,   ���.
 {28} {25} BlockingTimeoutMANEUVER                  : Byte;                     // ������� ���������� �� �������, ���.
 {29} {26} BlockingTimeoutOverspeed                 : Byte;                     // ������� ���������� �� ���������� ��������, ���.
 {30} {27} BlockingTypeIMPACT                       : Byte;                     // ��� ���������� �� ����� (0 - ������, 1 - ����, 2 - ����. ����, 3 - ����. ����.)
 {31} {28} BlockingTypeMANEUVER                     : Byte;                     // ��� ���������� �� ������� (0 - ������, 1 - ����, 2 - ����. ����, 3 - ����. ����.)
 {32} {29} Reserv_2                                 : Byte;                     // ������ 2
 {33} {30} MassFactor                               : Byte;                     // ����������� �����
 {34} {31} RFIDReadMode                             : Byte;                     // ����� ������ �����������
 {35} {32} MotionSensorCoefficient                  : Byte;                     // ����������� ������� ��������
 {36} {33} CardEnabledTimeout                       : Byte;                     // ������� ������� ����� � "�������"
 {37} {34} RemoteReaderID                           : Byte;                     // ID ���������� �����������
 {38} {35} SignalSource                             : Byte;                     // ���� 0..3: �������� ������� "Ignition"; ���� 4..6: �������� ������� Engine, ��� 7 - �����������
 {39} {36} SignalSourceMove                         : Byte;                     // �������� ������� "Move": 0 - OFF, 1 - Motion sensor, 2 - CAN, 3 - IN1, 4 - IN2
 {40} {37} SignalSourceMechanism                    : Byte;                     // �������� ������� "Mechanism": 0 - OFF, 1 - Motion sensor, 2 - CAN, 3 - IN1, 4 - IN2.  ���7 - ������ ��� ���������
 {41} {38} RelayModuleType                          : Byte;                     // ��� ��������� ������: 0 - v2, 1 - v3, 2 - v4
 {42} {39} SignalRelayOperatingMode                 : Byte;                     // ����� ������ ����������� ����: 0 - ���������, 1 - ���������, 2 - ��������������� ���������, 3 - ������� ����� ���������, 4 - �������� + ���������, 5 - ������ ��������, 6 - ������ ����������
 {43} {40} PowerOnSignal                            : Byte;                     // ������ ���������: 0 - ������, 1 - �� ����� ���������
 {44} {41} SignalSourceSpeed                        : Byte;                     // �������� ������� "Speed": 0 - Disabled, 1 - CAN, 2 - AIN1, 3 - AIN2, 4 - AIN3, 5 - DIN1, 6 - DIN2
 {45} {42} SpeedSensorKoefficient:     array[0..1] of Byte;                     // Speed Sensor Koefficient, 0.001 units
 {47} {44} MaximumMachineSpeed                      : Byte;                     // ������������ �������� ������, ��/�
 {48} {45} ActionSpeeding                           : Byte;                     // ���� 0..1: �������� ��� ���������� ��������: 0 - ������, 1 - ����, 2 - ���� + ����������� ����������, 3 - ���� + ���������� ����������; ���� 5..7 - ����� �������������: 0 - ������������, 1 - ������ (Service), 2 - �� (maintance), 3 - ������ (repair), 4-7 - �����������
  end;

  THWSetting_3 = record
{-G----L--}
 {49} {0}  IDexternal :           array[0..03] of     Byte;                     // ID �� ������� ���� (�������� � ��) 4 �����
 {53} {5}  Accelerometertionsettings                : Byte;                     // ���� 1..0 - ��������� ����� �������������:  0 - ��������, 1 - ����������, 2 - �������, 3 - ���������� � ����������������� �� �������. ���� 4..7 - ������� �������������� ����� ��������: 0 - 48 �����, 1 - 24 ����, 2 - 12 �����, 3 - 6 �����, 4 - 3 ����, 5 - 2 ����, 6 - 1 ���, 7 -30 �����, 8 -15 �����, 9 - 10 �����, 10 - 5 �����, 11..15 - ������� ���������
 {54} {6}  ExtDeviceProtocol                        : Byte;                     // �������� RS-485 (Ext device protocol): 0 - ��������, 1 -Omincom Listen, 2 - Omnicom Request, > 2 - TVZ-bus
 {55} {7}  ExtDeviceCoefficient : array[0..01] of     Byte;                     // Ext device coefficient
 {57} {9}  SignalSourceCL                           : Byte;                     // ���� 7..4 - �������� ������� CHARGE, ���� 3..0 - �������� ������� LEVEL
 {58} {10} Reserv               : array[0..10] of     Byte;                     // Reserv 11 Byte
{---------------------------------------------------------------------------------------------------------------------------------------}
 {69 byte}
  end;

  THW = record
    Setting_1 : THWSetting_1;
    Setting_2 : THWSetting_2;
    Setting_3 : THWSetting_3;
  end;

  THWEdit = class(TBasementEdit)
    private
      FConfig    : Tconfig;
      FHWSetting : THW;
        function GetBit(const AByte: Byte; const ABitIndex: Integer): Boolean;
    public
       //----Temp----
       function getSizeSetting(index:byte) : word;
       //-----Temp---
       constructor Create;

       //----------Set HW-------------------------------------------------------
//       procedure setConfig(_Config : Tconfig);
       procedure setHWSetting_1(_HWSetting_1:THWSetting_1);                     // ������ ������ ���������_1
       procedure setHWSetting_2(_HWSetting_2:THWSetting_2);                     // ������ ������ ���������_2
       procedure setHWSetting_3(_HWSetting_3:THWSetting_3);                     // ������ ������ ���������_3

       procedure setHWSettings(_HW : THW)                                       overload; // ������ ����� ��� ����������
       procedure setHWSettings(_HWSettings: Tconfig)                            overload; // ������ ����� ��� ��������� (�� ��������� ������� Terminal)
       procedure setOperatorSessionTimeout(_timeout : Byte);                           // ��������� �������� �������������� ������������� ��������� (max 250)

       procedure setBeep2(newVal      : Byte);                                  overload; // Beep2
       procedure setBeep2(newVal      : TypeBeep2);                             overload;

       procedure setBreakRelay(newVal : Byte);                                  overload;
       procedure setBreakRelay(newVal : TypeIgnBreakRelay);                     overload;

       procedure setRelayModuleType(newVal:Byte);                               overload;
       procedure setRelayModuleType(newVal:TypeRelayModuleType);                overload;

       procedure setSignalRelay(newVal:Byte);                                   overload; // ���������� ����
       procedure setSignalRelay(newVal:TypeSignalRelay);                        overload;

       procedure setRfidReadMode(newVal:Byte);                                  overload; // ����� ������ �����������
       procedure setRfidReadMode(newVal:TypeRFIDReadMode);                      overload;

       procedure setRemoteModuleID(newVal:Byte);

       procedure setPowerOnSignal(newVal : Byte);                               overload;
       procedure setPowerOnSignal(newVal : TypePowerSignal);                    overload;

       procedure setSignalSourceIgnition(NewVal : Byte);                        overload;
       procedure setSignalSourceIgnition(NewVal : TypeSignalSourceIGN);         overload;
       procedure setSignalSourceEngine(newVal : Byte);                          overload;
       procedure setSignalSourceEngine(newVal : TypeSignalSourceEngine);        overload;
       procedure setSignalSourceTurboTimer(newVal : Byte);                      overload;
       procedure setSignalSourceTurboTimer(newVal : TypeSignalSourceTurboTimer);overload;

       procedure setSignalSourceMove(newVal : Byte);                            overload;
       procedure setSignalSourceMove(newVal : TypeSingalSourceMove);            overload;

       procedure setSignalSourceMech(newVal : Byte);                            overload;
       procedure setSignalSourceMech(newVal : TypeSignalSourceMech);            overload;
       procedure setSignalMechBeep(newVal : boolean);


       procedure setSignalSourceSpeed(newVal : Byte);                           overload;
       procedure setSignalSourceSpeed(newVal : TypeSignalSourceSpeed);          overload;

       procedure setSpeedSensorKoefficient(newVal : word);
       procedure setExtDeviceCoefficient(newVal : word);

       procedure setSignalSourceLevel(newVal : Byte);                           overload;
       procedure setSignalSourceLevel(newVal : TypeSignalSourceLevel)           overload;

       procedure setSignalSourceCharge(newVal : Byte);                          overload;
       procedure setSignalSourceCharge(newVal : TypeSignalSourceCharge);        overload;

       procedure setMassFactor(newVal : Byte);
       procedure setMotionSensorCoefficient(newVal : Byte);

       procedure setAccelerometr(newVal : Byte);                                overload;
       procedure setAccelerometr(newVal : TypeAccel);                           overload;
       procedure setAccelTimeout(newVal : Byte);                                overload;
       procedure setAccelTimeout(newVal : Type12vPowerOffTimeout);              overload;

       procedure setDeviceProtocol(newVal : Byte);

       procedure setMaxSpeed(newVal : Byte);

       procedure setSpeedModeType(newVal : Byte);                               overload;
       procedure setSpeedModeType(newVal : TypeSpeedMode);                      overload;
       procedure setUsageMode(newVal : Byte);                                   overload;
       procedure setUsageMode(newVal : TypeUsageMode);                          overload;

       function setCanDriver(newVal : Byte)         : boolean;                  overload;
       function setCanDriver(newVal : TypeCanDriver): boolean;                  overload;

       function setAccessMode(newVal : Byte) : Boolean;                         overload;
       function setAccessMode(newVal : TypeAccessMode): Boolean;                overload;

       function setPowerRelay(newVal : Byte) : Boolean;                         overload;  // ������� ����
       function setPowerRelay(newVal : TypePowerRelay): Boolean;                overload;

       procedure setBlockingThresholdIMPACT(newVal:byte);

       //-----------------------------------------------------------------------
       function getBlockingThresholdIMPACT:byte;

       //----------Get Params---------------------------------------------------
       function getAccessMode    : Byte;                                        // �������� ����� �������� �������
       function getAccessModeStr : String;                                      // �������� ����� �������� ������� (��������)

       function getPowerRelay   : Byte;                                         // ������� ����
       function getPowerRelayStr: String;                                       // ������� ���� (��������)

       function getOperatorSessionTimeout:Byte;                                 // �������� ����� ������������� ���������

       function getBreakRelay:Byte;                                             // ���� ������ ���������
       function getBreakRelayStr:String;                                        // ���� ������ ��������� (��������)

       function getIgnitionControlBeep2:Byte;                                   // ����� ������ 2
       function getIgnitionControlBeep2Str:String;                              // ����� ������ 2 (��������)

       function getCanDriver:Byte;                                              // ������� ���
       function getCanDriverStr:String;                                         //

       function getRelayModuleType   : Byte;                                    // ��� ��������� ������: 0 - v2, 1 - v3, 2 - v4
       function getRelayModuleTypeStr: String;

       procedure setCardEnabledTimeout(newVal:Byte);                            // ������� ������� ����� � "�������"
       function  getCardEnabledTimeout:Byte;                                    //

       function getSignalRelay:Byte;                                            // ���������� ����
       function getSignalRelayStr:string;

       function getRFIDReadMode:Byte;                                           // ����� ������ �����������
       function getRFIDReadModeStr:String;

       function getHardWare:Tconfig;
       function getRemoteModuleID:Byte;

       function getPowerOnSignal:Byte;
       function getPowerOnSignalStr:String;

       function getSignalSourceIgnition:Byte;
       function getSignalSourceIgnitionStr:String;
       function getSignalSourceEngine:Byte;
       function getSignalSourceEngineStr:String;
       function getSignalSourceTurboTimer:boolean;
       function getSignalSourceMove:Byte;
       Function getSignalSourceMoveStr:String;

       function getSignalSourceMech:Byte;
       function getSignalSourceMechStr:String;
       function getSignalMechBeep:boolean;

       function getSignalSourceSpeed:Byte;
       function getSignalSourceSpeedStr:String;

       function getSpeedSensorKoefficient:word;
       function getExtDeviceCoefficient:word;

       function getSignalSourceLevel:Byte;
       function getSignalSourceLevelStr:String;
       function getSignalSourceCharge:Byte;
       function getSignalSourceChargeStr:String;
       function getMassFactor:Byte;
       function getMotionSensorCoefficient:Byte;

       function getAccelerometr:Byte;
       function getAccelerometrStr:String;

       function getAccelTimeout:Byte;
       function getAccelTimeoutStr:String;
       function getDeviceProtocol:Byte;

       function getMaxSpeed:Byte;

       function getSpeedLimitType:Byte;
       function getSpeedLimiyTypeStr:String;
       function getUsegeMode:Byte;
       function getUsageModeStr:String;
  end;



implementation

{ THWEdit }

constructor THWEdit.Create;
begin

end;

//------Seters params-----------------------------------------------------------


//--- �������� AccessControlMode ($3F = %00111111 (����� ��� ����� 0..5)
function THWEdit.setAccessMode(newVal: byte): boolean overload;
begin
  result := false;
  if newVal > %00111111 then exit;

  FHWSetting.Setting_1.AccessControlMode := (FHWSetting.Setting_1.AccessControlMode and not %00111111) or newVal;
  Result := True;
end;

procedure THWEdit.setAccelerometr(newVal: byte);
begin
  FHWSetting.Setting_3.Accelerometertionsettings := (FHWSetting.Setting_3.Accelerometertionsettings and not %00000011) or newVal;
end;

procedure THWEdit.setAccelerometr(newVal: TypeAccel);
begin
  FHWSetting.Setting_3.Accelerometertionsettings := (FHWSetting.Setting_3.Accelerometertionsettings and not %00000011) or ord(newVal);
end;

procedure THWEdit.setAccelTimeout(newVal: Type12vPowerOffTimeout);
begin
  FHWSetting.Setting_3.Accelerometertionsettings := (FHWSetting.Setting_3.Accelerometertionsettings and not %11110000) or ord(newVal);
end;

procedure THWEdit.setAccelTimeout(newVal: byte);
begin
  FHWSetting.Setting_3.Accelerometertionsettings := (FHWSetting.Setting_3.Accelerometertionsettings and not %11110000) or newVal;
end;

function THWEdit.setAccessMode(newVal: TypeAccessMode): boolean overload;
begin
  FHWSetting.Setting_1.AccessControlMode := (FHWSetting.Setting_1.AccessControlMode and not %00111111) or Ord(newVal);
  Result := True;
end;
//------------------------------------------------------------------------------



procedure THWEdit.setPowerOnSignal(newVal: TypePowerSignal);
begin
  FHWSetting.Setting_2.PowerOnSignal := ord(newVal);
end;

procedure THWEdit.setPowerOnSignal(newVal: byte);
begin
  if newVal > 5 then exit;
  FHWSetting.Setting_2.PowerOnSignal := newVal;
end;

function THWEdit.setPowerRelay(newVal: TypePowerRelay): Boolean;
begin
  FHWSetting.Setting_1.AccessControlMode := (FHWSetting.Setting_1.AccessControlMode and not %11000000) or ord(newVal);
end;

function THWEdit.setPowerRelay(newVal: byte): Boolean;
begin
  FHWSetting.Setting_1.AccessControlMode := (FHWSetting.Setting_1.AccessControlMode and not %11000000) or newVal;
end;

procedure THWEdit.setRelayModuleType(newVal: byte);
begin
  if newVal > 4 then exit;
  FHWSetting.Setting_2.RelayModuleType := newVal;
end;


procedure THWEdit.setRelayModuleType(newVal: TypeRelayModuleType);
begin
  FHWSetting.Setting_2.RelayModuleType := ord(newVal);
end;

procedure THWEdit.setRemoteModuleID(newVal: byte);
begin
  if newVal > 254 then exit;
  FHWSetting.Setting_2.RemoteReaderID := newVal;
end;

// ����� ������ �����������
procedure THWEdit.setRfidReadMode(newVal: TypeRFIDReadMode);
begin
  FHWSetting.Setting_2.RFIDReadMode := ord(newVal);
end;

// ����� ������ �����������
procedure THWEdit.setRfidReadMode(newVal: byte);
begin
  FHWSetting.Setting_2.RFIDReadMode := newVal;
end;

procedure THWEdit.setSignalMechBeep(newVal: boolean);
begin
  if newVal then FHWSetting.Setting_2.SignalSourceMechanism := (FHWSetting.Setting_2.SignalSourceMechanism and not %10000000) or %10000000
            else FHWSetting.Setting_2.SignalSourceMechanism := (FHWSetting.Setting_2.SignalSourceMechanism and not %10000000) or %00000000
end;

procedure THWEdit.setSignalRelay(newVal: TypeSignalRelay);
begin
  FHWSetting.Setting_2.SignalRelayOperatingMode := ord(newVal);
end;


//----------------------------------------------------------------------------------SignalSource-----------------------------------------

//----------Ignition------------------------------------------------------------
procedure THWEdit.setSignalSourceIgnition(NewVal: byte);
begin
  FHWSetting.Setting_2.SignalSource := (FHWSetting.Setting_2.SignalSource and not %00001111) or newVal;
end;

procedure THWEdit.setSignalSourceIgnition(NewVal: TypeSignalSourceIGN);
begin
  FHWSetting.Setting_2.SignalSource := (FHWSetting.Setting_2.SignalSource and not %00001111) or ord(newVal);
end;

//-------Level-----------------------------------------------------------------------
procedure THWEdit.setSignalSourceLevel(newVal: TypeSignalSourceLevel);
begin
  FHWSetting.Setting_3.SignalSourceCL := (FHWSetting.Setting_3.SignalSourceCL and not %00001111) or ord(newVal);
end;

procedure THWEdit.setSignalSourceLevel(newVal: byte);
begin
  FHWSetting.Setting_3.SignalSourceCL := (FHWSetting.Setting_3.SignalSourceCL and not %00001111) or newVal;
end;
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------

//---------------------Mech-----------------------------------------------------
procedure THWEdit.setSignalSourceMech(newVal: TypeSignalSourceMech);
begin
   FHWSetting.Setting_2.SignalSourceMechanism := (FHWSetting.Setting_2.SignalSourceMechanism and not %01111111) or ord(newVal);
end;

procedure THWEdit.setSignalSourceMech(newVal: byte);
begin
  FHWSetting.Setting_2.SignalSourceMechanism := (FHWSetting.Setting_2.SignalSourceMechanism and not %01111111) or newVal;
end;
//------------------------------------------------------------------------------

//---------------------MOVE-----------------------------------------------------
procedure THWEdit.setSignalSourceMove(newVal: TypeSingalSourceMove);
begin
  FHWSetting.Setting_2.SignalSourceMove := ord(newVal);
end;

//---------------------SPEED----------------------------------------------------
procedure THWEdit.setSignalSourceSpeed(newVal: TypeSignalSourceSpeed);
begin
  FHWSetting.Setting_2.SignalSourceSpeed := ord(newVal);
end;

procedure THWEdit.setSignalSourceSpeed(newVal: byte);
begin
  FHWSetting.Setting_2.SignalSourceSpeed := newVal;
end;
//------------------------------------------------------------------------------

procedure THWEdit.setSignalSourceMove(newVal: byte);
begin
  FHWSetting.Setting_2.SignalSourceMove := newVal;
end;
//------------------------------------------------------------------------------


//----Charge--------------------------------------------------------------------
procedure THWEdit.setSignalSourceCharge(newVal: TypeSignalSourceCharge);
begin
  FHWSetting.Setting_3.SignalSourceCL := (FHWSetting.Setting_3.SignalSourceCL and not %11110000) or ord(newVal);
end;

procedure THWEdit.setSignalSourceCharge(newVal: byte);
begin
  FHWSetting.Setting_3.SignalSourceCL := (FHWSetting.Setting_3.SignalSourceCL and not %11110000) or newVal;
end;
//------------------------------------------------------------------------------

//----------Engine--------------------------------------------------------------
procedure THWEdit.setSignalSourceEngine(newVal: TypeSignalSourceEngine);
begin
  FHWSetting.Setting_2.SignalSource := (FHWSetting.Setting_2.SignalSource and not %01110000) or ord(newVal);
end;

procedure THWEdit.setSignalSourceEngine(newVal: byte);
begin
  FHWSetting.Setting_2.SignalSource := (FHWSetting.Setting_2.SignalSource and not %01110000) or newVal;
end;
//------------------------------------------------------------------------------

//----------TurboTimer----------------------------------------------------------
procedure THWEdit.setSignalSourceTurboTimer(newVal: TypeSignalSourceTurboTimer);
begin
  FHWSetting.Setting_2.SignalSource := (FHWSetting.Setting_2.SignalSource and not %10000000) or ord(newVal);
end;

procedure THWEdit.setSpeedModeType(newVal: TypeSpeedMode);
begin
  FHWSetting.Setting_2.ActionSpeeding := (FHWSetting.Setting_2.ActionSpeeding and not %00000011) or ord(newVal);
end;

procedure THWEdit.setSpeedModeType(newVal: byte);
begin
  FHWSetting.Setting_2.ActionSpeeding := (FHWSetting.Setting_2.ActionSpeeding and not %00000011) or newVal;
end;

procedure THWEdit.setSpeedSensorKoefficient(newVal: word);
begin
  FHWSetting.Setting_2.SpeedSensorKoefficient[1] := newVal and $FF;
  FHWSetting.Setting_2.SpeedSensorKoefficient[0] := (newVal shr 8) and $FF;
end;

procedure THWEdit.setUsageMode(newVal: TypeUsageMode);
begin
    FHWSetting.Setting_2.ActionSpeeding := (FHWSetting.Setting_2.ActionSpeeding and not %11100000) or ord(newVal);
end;

procedure THWEdit.setUsageMode(newVal: byte);
begin
  FHWSetting.Setting_2.ActionSpeeding := (FHWSetting.Setting_2.ActionSpeeding and not %11100000) or newVal;
end;

procedure THWEdit.setSignalSourceTurboTimer(newVal: byte);
begin
  FHWSetting.Setting_2.SignalSource := (FHWSetting.Setting_2.SignalSource and not %10000000) or newVal;
end;
//------------------------------------------------------------------------------
//|----------------------------------------------------------------------------------SignalSource-----------------------------------------|

procedure THWEdit.setSignalRelay(newVal: byte);
begin
  if newVal > 6 then exit;
  FHWSetting.Setting_2.SignalRelayOperatingMode := newVal;
end;

//����� ������������� ��������� (���)
procedure THWEdit.setOperatorSessionTimeout(_timeout: byte);
begin
  if _timeout >= 250 then _timeout := 250;
  FHWSetting.Setting_1.OperatorSessionTimeout := _timeout;
end;


//------------------------Geters------------------------------------------------------------------------------------------------------------------------------------------------



//-----------��� �������--------------------------------------------------------
function THWEdit.getAccelerometr: byte;
begin
  result := FHWSetting.Setting_3.Accelerometertionsettings and %00000011;
end;

function THWEdit.getAccelerometrStr: String;
begin
  case FHWSetting.Setting_3.Accelerometertionsettings and %00000011  of
    ord(al_disabled) : result := ACCEL_TYPE_DISABLED;
    ord(al_internal) : result := ACCEL_TYPE_INTERNAL;
    ord(al_external) : result := ACCEL_TYPE_EXTERNAL;
    ord(al_auto)     : result := ACCEL_TYPE_AUTO;
  else result:= NO_ITEM_ERROR;
  end;
end;

function THWEdit.getAccelTimeout: byte;
begin
  result := FHWSetting.Setting_3.Accelerometertionsettings and %11110000;
end;

function THWEdit.getAccelTimeoutStr: String;
begin
case FHWSetting.Setting_3.Accelerometertionsettings and %11110000  of
    ord(pt_48h)      : result := RELAY_POWER_TIMEOUT_48h;
    ord(pt_24h)      : result := RELAY_POWER_TIMEOUT_24h;
    ord(pt_12h)      : result := RELAY_POWER_TIMEOUT_12h;
    ord(pt_6h)       : result := RELAY_POWER_TIMEOUT_6h;
    ord(pt_3h)       : result := RELAY_POWER_TIMEOUT_3h;
    ord(pt_2h)       : result := RELAY_POWER_TIMEOUT_2h;
    ord(pt_1h)       : result := RELAY_POWER_TIMEOUT_1h;
    ord(pt_30m)      : result := RELAY_POWER_TIMEOUT_30m;
    ord(pt_15m)      : result := RELAY_POWER_TIMEOUT_15m;
    ord(pt_10m)      : result := RELAY_POWER_TIMEOUT_10m;
    ord(pt_5m)       : result := RELAY_POWER_TIMEOUT_05m;
    ord(pt_disabled) : result := RELAY_POWER_TIMEOUT_off;
  else result:= NO_ITEM_ERROR;
  end;
end;

function THWEdit.getAccessMode: Byte;
begin
  // $3F = %00111111 (����� ��� ����� 0..5)
  result := FHWSetting.Setting_1.AccessControlMode and $3F;
end;


// ��� ������� (������)
function THWEdit.getAccessModeStr: String;
begin
  // $3F = %00111111 (����� ��� ����� 0..5)
  case FHWSetting.Setting_1.AccessControlMode and $3F of
    ord(am_OFF)           : result := ACCESS_MODE_EXT_KEY;
    ord(am_Any_Card)      : result := ACCESS_MODE_ANY_CARD;
    ord(am_Only_admitted) : result := ACCESS_MODE_AUTHED_CARD;
    ord(am_Only_service)  : result := ACCESS_MODE_ONLY_SERVICE;
    ord(am_Nobody)        : result := ACCESS_MODE_BLOCK;
  else result:= NO_ITEM_ERROR;
  end;
end;
//------------------------------------------------------------------------------



//���������� ����������:--------------------------------------------------------
function THWEdit.getIgnitionControlBeep2: byte;
begin
  result :=  FHWSetting.Setting_1.IgnitionControl and %11110000;
end;

function THWEdit.getIgnitionControlBeep2Str: String;
begin
  case FHWSetting.Setting_1.IgnitionControl and %11110000 of
  ord(b2_disabled)     : result:= IGNITION_CONTROL_DISABLED;
  ord(b2_beep1)        : result:= IGNITION_CONTROL_BEEP1;
  ord(b2_speed_alarm)  : result:= IGNITION_CONTROL_SPEED_ALARM;
  ord(b2_speed)        : result:= IGNITION_CONTROL_SPEED;
  ord(b2_alarm)        : result:= IGNITION_CONTROL_ALARM;
  ord(b2_always_on)    : result:= IGNITION_CONTROL_ALWAYS_ON;
  ord(b2_signal_relay) : result:= IGNITION_CONTROL_SIGNAL_RELAY;
  else result:= NO_ITEM_ERROR;
  end;
end;


function THWEdit.getMassFactor: Byte;
begin
  result := FHWSetting.Setting_2.MassFactor;
end;

function THWEdit.getMaxSpeed: byte;
begin
  result := FHWSetting.Setting_2.MaximumMachineSpeed;
end;

function THWEdit.getMotionSensorCoefficient: byte;
begin
  result := FHWSetting.Setting_2.MotionSensorCoefficient;
end;

function THWEdit.getBlockingThresholdIMPACT: byte;
begin
  result := FHWSetting.Setting_2.BlockingThresholdIMPACT;
end;

function THWEdit.getBreakRelay: byte;
begin
  result :=  FHWSetting.Setting_1.IgnitionControl and %00001111;
end;

//���������� ����������:
function THWEdit.getBreakRelayStr: String;
begin
  case FHWSetting.Setting_1.IgnitionControl and %00001111 of
    ord(br_OnOff)            : result:= BREAK_RELAY_ON_OFF;
    ord(br_impulse_till_IGN) : result:= BREAK_RELAY_TILL_IGN;
    ord(br_impulse_05s)      : result:= BREAK_RELAY_IMPULS_05;
    ord(br_impuls_1s)        : result:= BREAK_RELAY_IMPULS_1;
    ord(br_impuls_2s)        : result:= BREAK_RELAY_IMPULS_2;
    ord(br_impuls_3s)        : result:= BREAK_RELAY_IMPULS_3;
    ord(br_disabled)         : result:= BREAK_RELAY_DISABLED;
  else result:= NO_ITEM_ERROR;
  end;
end;


//��� �������� CAN
function THWEdit.getCanDriver: byte;
begin
  result := FHWSetting.Setting_1.DriverCan;
end;

function THWEdit.getCanDriverStr: String;
begin
  case FHWSetting.Setting_1.DriverCan of
   ord(can_disabled)     : result := CAN_DRIVER_DISABLED;
   ord(can_test)         : result := CAN_DRIVER_TEST;
   ord(can_file_passive) : result := CAN_DRIVER_PASSIVE;
   ord(can_file_active)  : result := CAN_DRIVER_ACTIVE;
  end;
end;


procedure THWEdit.setCardEnabledTimeout(newVal: byte);
begin
  FHWSetting.Setting_2.CardEnabledTimeout := newVal;
end;


procedure THWEdit.setDeviceProtocol(newVal: byte);
begin
  FHWSetting.Setting_3.ExtDeviceProtocol := newval;
end;

procedure THWEdit.setExtDeviceCoefficient(newVal: word);
begin
  FHWSetting.Setting_3.ExtDeviceCoefficient[0] := Hi(newVal);  //(newVal shr 8) and $FF;
  FHWSetting.Setting_3.ExtDeviceCoefficient[1] := Lo(newVal);  //newVal and $FF;
end;

function THWEdit.getCardEnabledTimeout: byte;
begin
  result := FHWSetting.Setting_2.CardEnabledTimeout;
end;


function THWEdit.getDeviceProtocol: byte;
begin
 result := FHWSetting.Setting_3.ExtDeviceProtocol;
end;

function THWEdit.getExtDeviceCoefficient: word;
begin
  result := (FHWSetting.Setting_3.ExtDeviceCoefficient[0] shl 8) or FHWSetting.Setting_3.ExtDeviceCoefficient[1]; // FHWSetting.Setting_2.SpeedSensorKoefficient;
end;

function THWEdit.getHardWare: Tconfig;
begin
  move(FHWSetting.Setting_1, FConfig.HWSetting1, SizeOf(FHWSetting.Setting_1));
  move(FHWSetting.Setting_2, FConfig.HWSetting2, SizeOf(FHWSetting.Setting_2));
  move(FHWSetting.Setting_3, FConfig.HWSetting3, SizeOf(FHWSetting.Setting_3));
  result := FConfig;
end;

//------------------------------------------------------------------------------




//----������� �������������� ������������� ���������----------------------------
function THWEdit.getOperatorSessionTimeout: byte;
begin
  result := FHWSetting.Setting_1.OperatorSessionTimeout;
end;
//------------------------------------------------------------------------------





//--- ������� ����--------------------------------------------------------------
function THWEdit.getPowerOnSignal: byte;
begin
  result := FHWSetting.Setting_2.PowerOnSignal;
end;

function THWEdit.getPowerOnSignalStr: String;
begin
case FHWSetting.Setting_2.PowerOnSignal and $C0 of
    ord(ps_always_on) : result := POWER_SIGNAL_ALWAYS_ON;
    ord(ps_ign_in)    : result := POWER_SIGNAL_IGN_IN;
    ord(ps_can_ign)   : result := POWER_SIGNAL_CAN_IGN;
    ord(ps_xin1)      : result := POWER_SIGNAL_XIN1;
    ord(ps_xin2)      : result := POWER_SIGNAL_XIN2;
    ord(ps_ain)       : result := POWER_SIGNAL_AIN;
  else result:= NO_ITEM_ERROR;
  end;
end;

function THWEdit.getPowerRelay: Byte;
begin
  result := FHWSetting.Setting_1.AccessControlMode and $C0; // $C0 = %11000000 (����� ��� ����� 6..7)
end;

function THWEdit.getPowerRelayStr: String;
begin
  // $C0 = %1100000 (����� ��� ����� 6..7)
  case FHWSetting.Setting_1.AccessControlMode and $C0 of
    ord(pr_External_signal):result := POWER_RELAY_DISABLED_EXT;
    ord(pr_Internal_signal):result := POWER_RELAY_DISABLED_INT;
    ord(pr_Power_hold_mode):result := POWER_RELAY_ENABLED_HOLD;
    ord(pr_NC):result              := POWER_RELAY_ENABLED_NC;
  else result:= NO_ITEM_ERROR;
  end;
end;


function THWEdit.getRelayModuleType: byte;
begin
  result := FHWSetting.Setting_2.RelayModuleType;
end;

function THWEdit.getRelayModuleTypeStr: String;
begin
  case FHWSetting.Setting_2.RelayModuleType of
    ord(Version_2): result := RELAY_MODULE_TYPE_V2;
    ord(Version_3): result := RELAY_MODULE_TYPE_V3;
    ord(Version_4): result := RELAY_MODULE_TYPE_V4;
  else result:= NO_ITEM_ERROR;
  end;
end;

function THWEdit.getRemoteModuleID: Byte;
begin
 result := FHWSetting.Setting_2.RemoteReaderID;
end;

// ����� ������ �����������
function THWEdit.getRFIDReadMode: byte;
begin
  result := FHWSetting.Setting_2.RFIDReadMode;
end;

// ����� ������ �����������
function THWEdit.getRFIDReadModeStr: String;
begin
 case FHWSetting.Setting_2.RFIDReadMode of
    ord(rf_wiegand_single) : result := RFID_WIEGAND_SINGLE;
    ord(rf_wire_single)    : result := RFID_WIRE_SINGLE;
    ord(rf_wire_continious): result := RFID_WIRE_CONTINIOUS;
  else result:= NO_ITEM_ERROR;
  end;
end;

//���������� ����
function THWEdit.getSignalMechBeep: boolean;
begin
  result := False;
  if (FHWSetting.Setting_2.SignalSourceMechanism and %10000000) = %10000000
  then result := True;
end;

function THWEdit.getSignalRelay: byte;
begin
 result := FHWSetting.Setting_2.SignalRelayOperatingMode;
end;

//���������� ����
function THWEdit.getSignalRelayStr: string;
begin
  case FHWSetting.Setting_2.SignalRelayOperatingMode of
    ord(sr_Disabled)      : result := SIGNAL_RELAY_DISABLED;
    ord(sr_IGN)           : result := SIGNAL_RELAY_IGN;
    ord(sr_INV_IGN)       : result := SIGNAL_RELAY_INV_IGN;
    ord(sr_INV_IGN_DELAY) : result := SIGNAL_RELAY_INV_IGN_DELAY;
    ord(sr_Speed_Alartm)  : result := SIGNAL_RELAY_SPEED_ALARM;
    ord(sr_Speed)         : result := SIGNAL_RELAY_SPEED;
    ord(sr_Alarm)         : result := SIGNAL_RELAY_ALARM;
  else result:= NO_ITEM_ERROR;
  end;
end;

function THWEdit.getSignalSourceCharge: Byte;
begin
  result := FHWSetting.Setting_3.SignalSourceCL and %11110000;
end;

function THWEdit.getSignalSourceChargeStr: String;
begin
  case FHWSetting.Setting_3.SignalSourceCL and %11110000 of
    ord(sr_Disabled)      : result := SIGNAL_RELAY_DISABLED;
    ord(sr_IGN)           : result := SIGNAL_RELAY_IGN;
    ord(sr_INV_IGN)       : result := SIGNAL_RELAY_INV_IGN;
    ord(sr_INV_IGN_DELAY) : result := SIGNAL_RELAY_INV_IGN_DELAY;
    ord(sr_Speed_Alartm)  : result := SIGNAL_RELAY_SPEED_ALARM;
    ord(sr_Speed)         : result := SIGNAL_RELAY_SPEED;
    ord(sr_Alarm)         : result := SIGNAL_RELAY_ALARM;
  else result:= NO_ITEM_ERROR;
  end;
end;

function THWEdit.getSignalSourceEngine: byte;
begin
  result := FHWSetting.Setting_2.SignalSource and %01110000;
end;

function THWEdit.getSignalSourceEngineStr: String;
begin
 case FHWSetting.Setting_2.SignalSource and %01110000 of
    ord(sse_disabled)     : result := Engine_SIGNAL_Disabled;
    ord(sse_CAN)          : result := Engine_SIGNAL_CAN;
    ord(sse_XIN1)         : result := Engine_SIGNAL_XIN1;
    ord(sse_XIN2)         : result := Engine_SIGNAL_XIN2;
    ord(sse_XIN3)         : result := Engine_SIGNAL_XIN3;
    ord(sse_IGN_S)        : result := Engine_SIGNAL_IGN_S;
    ord(sse_AIN)          : result := Engine_SIGNAL_AIN;
    ord(see_IGN_STATE)    : result := Engine_SIGNAL_IGN_STATE;
 end;
end;

function THWEdit.getSignalSourceIgnition: Byte;
begin
  result := FHWSetting.Setting_2.SignalSource and %00001111;
end;

function THWEdit.getSignalSourceIgnitionStr: String;
begin
  case FHWSetting.Setting_2.SignalSource and %00001111 of
    ord(iss_ext_IGN)     : result := IGN_SIGNAL_EXT_IGN;
    ord(iss_ext_IGN_REL) : result := IGN_SIGNAL_EXT_IGN_REL;
    ord(iss_Can)         : result := IGN_SIGNAL_CAN;
    ord(iss_XIN1)        : result := IGN_SIGANL_XIN1;
    ord(iss_XIN2)        : result := IGN_SIGNAL_XIN2;
    ord(iss_IGN_S)       : result := IGN_SIGNAL_IGN_S;
    ord(iss_AIN)         : result := IGN_SIGNAL_AIN;
  end;
end;


//-----------------------------------------------------------------------------

function THWEdit.getSignalSourceLevel: Byte;
begin
  result := FHWSetting.Setting_3.SignalSourceCL and %00001111;
end;

function THWEdit.getSignalSourceLevelStr: String;
begin
 case FHWSetting.Setting_3.SignalSourceCL and %00001111 of
    ord(ssl_Disabled)   : result := LEVEL_SIGNAL_DISABLED;
    ord(ssl_CAN)        : result := LEVEL_SIGNAL_CAN;
    ord(ssl_Ext_device) : result := LEVEL_SIGNAL_EXT;
    ord(ssl_BAT_12v)    : result := LEVEL_SIGNAL_BAT_12v;
    ord(ssl_BAT_24v)    : result := LEVEL_SIGNAL_BAT_24v;
    ord(ssl_BAT_48v)    : result := LEVEL_SIGNAL_BAT_48v;
    ord(ssl_BAT_72v)    : result := LEVEL_SIGNAL_BAT_72v;
    ord(ssl_BAT_80v)    : result := LEVEL_SIGNAL_BAT_80v;
  else result:= NO_ITEM_ERROR;
  end;
end;

//---------------------Mech-----------------------------------------------------
function THWEdit.getSignalSourceMech: byte;
begin
  result :=  FHWSetting.Setting_2.SignalSourceMechanism and %01111111;
end;

function THWEdit.getSignalSourceMechStr: String;
begin
 case FHWSetting.Setting_2.SignalSourceMechanism and %01111111 of
    ord(tsm_Disabled)      : result := MECH_SIGNAL_DISABLED;
    ord(tsm_Motion_sensor) : result := MECH_SIGNAL_MOTION_S;
    ord(tsm_CAN)           : result := MECH_SIGNAL_CAN;
    ord(tsm_IN1)           : result := MECH_SIGNAL_IN1;
    ord(tsm_IN2)           : result := MECH_SIGNAL_IN2;
    ord(tsm_IN3)           : result := MECH_SIGNAL_IN3;
    ord(tsm_IGN_S)         : result := MECH_SIGNAL_IGN_S;
    ord(tsm_AIN)           : result := MECH_SIGNAL_AIN;
    ord(tsm_N_XIN1)        : result := MECH_SIGNAL_N_XIN1;
    ord(tsm_N_XIN2)        : result := MECH_SIGNAL_N_XIN2;
  end;
end;
//------------------------------------------------------------------------------

function THWEdit.getSignalSourceMove: byte;
begin
 result := FHWSetting.Setting_2.SignalSourceMove;
end;

function THWEdit.getSignalSourceMoveStr: String;
begin
  case FHWSetting.Setting_2.SignalSourceMove of
    ord(tss_Disabled) : result := MOVE_SIGNAL_DIABLED;
    ord(tss_Motion_s) : result := MOVE_SIGNAL_MOTION_S;
    ord(tss_CAN)      : result := MOVE_SIGNAL_CAN;
    ord(tss_XIN1)     : result := MOVE_SIGNAL_XIN1;
    ord(tss_XIN2)     : result := MOVE_SIGNAL_XIN2;
    ord(tss_XIN3)     : result := MOVE_SIGNAL_XIN3;
    ord(tss_IGN_S)    : result := MOVE_SIGNAL_IGN_S;
    ord(tss_AIN)      : result := MOVE_SIGNAL_AIN;
    ord(tss_Speed)    : result := MOVE_SIGNAL_SPEED;
    ord(tss_N_XIN1)   : result := MOVE_SIGNAL_N_XIN1;
    ord(tss_N_XIN2)   : result := MOVE_SIGNAL_N_XIN2;
  end;
end;

//------------------------SPEED-------------------------------------------------
function THWEdit.getSignalSourceSpeed: byte;
begin
  result := FHWSetting.Setting_2.SignalSourceSpeed;
end;

function THWEdit.getSignalSourceSpeedStr: String;
begin
   case FHWSetting.Setting_2.SignalSourceSpeed of
    ord(sss_disabled) : result := SPEED_SIGNAL_DISABLED;
    ord(sss_Can)      : result := SPEED_SIGNAL_CAN;
    ord(sss_AIN1)     : result := SPEED_SIGNAL_AIN1;
    ord(sss_AIN2)     : result := SPEED_SIGNAL_AIN2;
    ord(sss_AIN3)     : result := SPEED_SIGNAL_AIN3;
    ord(sss_DIN1)     : result := SPEED_SIGNAL_DIN1;
    ord(sss_DIN2)     : result := SPEED_SIGNAL_DIN2;
    ord(sss_AIN2_AIN1): result := SPEED_SIGNAL_AIN2_AIN1;
  end;
end;
//------------------------------------------------------------------------------

function THWEdit.getSignalSourceTurboTimer: boolean;
begin
  result := False;
  if (FHWSetting.Setting_2.SignalSource and %10000000) = %10000000
  then result := True;
end;

// ������ ��������
function THWEdit.getSizeSetting(index: byte): word;
begin
  if index = 1 then result := sizeOf(THWSetting_1);
  if index = 2 then result := sizeOf(THWSetting_2);
  if index = 3 then result := sizeOf(THWSetting_3);

  if index = 255 then result := sizeOf(THWSetting_1)+
                                sizeOf(THWSetting_2)+
                                sizeOf(THWSetting_3)

end;

function THWEdit.getSpeedLimitType: Byte;
begin
  result := FHWSetting.Setting_2.ActionSpeeding and %00000011;
end;

function THWEdit.getSpeedLimiyTypeStr: String;
begin
  case FHWSetting.Setting_2.ActionSpeeding and %00000011 of
    ord(sm_disabled) : result := SPEED_LIMIT_DISABLED;
    ord(sm_beepOnly) : result := SPEED_LIMIT_BEEP_ONLY;
    ord(sm_block_P)  : result := SPEED_LIMIT_BLOCK_PAUSE;
    ord(sm_full_B)   : result := SPEED_LIMIT_FULL_BLOCK;
  end;
end;

function THWEdit.getSpeedSensorKoefficient: word;
begin
  result := (FHWSetting.Setting_2.SpeedSensorKoefficient[0] shl 8) or FHWSetting.Setting_2.SpeedSensorKoefficient[1]; // FHWSetting.Setting_2.SpeedSensorKoefficient;
end;

function THWEdit.getUsageModeStr: String;
begin
  case FHWSetting.Setting_2.ActionSpeeding and %11100000 of
    ord(um_explotation)  : result := USAGE_MODE_EXPLOATATION;
    ord(um_service)      : result := USAGE_MODE_SERVICE;
    ord(um_maintenance)  : result := USAGE_MODE_MAINTENANCE;
    ord(um_repair)       : result := USAGE_MODE_REPAIR;
    ord(um_conservation) : result := USAGE_MODE_CONSERVATION;
  end;
end;

function THWEdit.getUsegeMode: byte;
begin
  result := FHWSetting.Setting_2.ActionSpeeding and %11100000;
end;

//------------------------------------------------------------------------------


//-----��������� HW-------------------------------------------------------------

procedure THWEdit.setHWSettings(_HW: THW);
begin
  FHWSetting := _HW;
end;

procedure THWEdit.setHWSetting_1(_HWSetting_1: THWSetting_1);
begin
  FHWSetting.Setting_1 := _HWSetting_1;
end;

procedure THWEdit.setHWSetting_2(_HWSetting_2: THWSetting_2);
begin
  FHWSetting.Setting_2 := _HWSetting_2;
end;

procedure THWEdit.setHWSetting_3(_HWSetting_3: THWSetting_3);
begin
  FHWSetting.Setting_3 := _HWSetting_3;
end;

procedure THWEdit.setMassFactor(newVal: byte);
begin
  if newVal > 40 then exit;
  FHWSetting.Setting_2.MassFactor := newVal;
end;

procedure THWEdit.setMaxSpeed(newVal: byte);
begin
  if newVal > 250 then exit;
  FHWSetting.Setting_2.MaximumMachineSpeed := newVal;
end;

procedure THWEdit.setMotionSensorCoefficient(newVal: byte);
begin
  if newVal > 40 then exit;
  FHWSetting.Setting_2.MotionSensorCoefficient := newVal;
end;

//-----�������� ���������---(BEEP2)---------------------------------------------
procedure THWEdit.setBeep2(newVal: byte);
begin
  FHWSetting.Setting_1.IgnitionControl := (FHWSetting.Setting_1.IgnitionControl and not %11110000) or newVal;
end;

procedure THWEdit.setBeep2(newVal: TypeBeep2);
begin
  FHWSetting.Setting_1.IgnitionControl := (FHWSetting.Setting_1.IgnitionControl and not %11110000) or ord(newVal);
end;


procedure THWEdit.setBlockingThresholdIMPACT(newVal: byte);
begin
  FHWSetting.Setting_2.BlockingThresholdIMPACT := newVal;
end;

//------------------------------------------------------------------------------

//-----�������� ���������---(���� ������ ���������)--------------------------------------
procedure THWEdit.setBreakRelay(newVal: byte);
begin
  FHWSetting.Setting_1.IgnitionControl := (FHWSetting.Setting_1.IgnitionControl and not %00001111) or newVal;
end;

procedure THWEdit.setBreakRelay(newVal: TypeIgnBreakRelay);
begin
  FHWSetting.Setting_1.IgnitionControl := (FHWSetting.Setting_1.IgnitionControl and not %00001111) or ord(newVal);
end;



function THWEdit.setCanDriver(newVal: TypeCanDriver):boolean;
begin
  FHWSetting.Setting_1.DriverCan := ord(newVal);
  result := true;
end;

function THWEdit.setCanDriver(newVal: byte):boolean;
begin
  result := false;
  if newVal > 3 then exit;                                                      // ���� ������ ����, �� �������

  FHWSetting.Setting_1.DriverCan := newVal;
  result := true;
end;

//------------------------------------------------------------------------------

procedure THWEdit.setHWSettings(_HWSettings: Tconfig);
begin
  FConfig := _HWSettings;
  move(_HWSettings.HWSetting1, FHWSetting.Setting_1, SizeOf(FHWSetting.Setting_1));
  move(_HWSettings.HWSetting2, FHWSetting.Setting_2, SizeOf(FHWSetting.Setting_2));
  move(_HWSettings.HWSetting3, FHWSetting.Setting_3, SizeOf(FHWSetting.Setting_3));
end;






















//---------------------Utils----------------------------------------------------

//��������� ���� �� �����
function THWEdit.GetBit(const AByte: Byte; const ABitIndex: Integer): Boolean;
begin
  Result := (AByte and (1 shl ABitIndex)) <> 0;
end;


end.
