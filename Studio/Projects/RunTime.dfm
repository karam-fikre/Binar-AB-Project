object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Run Time'
  ClientHeight = 363
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ProductionLine1CheckBox: TCheckBox
    Left = 8
    Top = 50
    Width = 97
    Height = 17
    Caption = 'Production Line 1'
    Enabled = False
    TabOrder = 0
  end
  object ProductionLine2CheckBox: TCheckBox
    Left = 8
    Top = 88
    Width = 97
    Height = 17
    Caption = 'Production Line 2'
    Enabled = False
    TabOrder = 1
  end
  object ProductionLine3CheckBox: TCheckBox
    Left = 8
    Top = 128
    Width = 97
    Height = 17
    Caption = 'Production Line 3'
    Enabled = False
    TabOrder = 2
  end
  object ProductionLine4CheckBox: TCheckBox
    Left = 8
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Production Line 4'
    Enabled = False
    TabOrder = 3
  end
  object ProductionLine1Edit: TEdit
    Left = 272
    Top = 48
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object CloseButton: TButton
    Left = 374
    Top = 320
    Width = 75
    Height = 25
    Caption = 'St'#228'ng'
    TabOrder = 5
    OnClick = CloseButtonClick
  end
  object ProductionLine1StatusComboBox: TComboBox
    Left = 128
    Top = 48
    Width = 121
    Height = 21
    AutoComplete = False
    Enabled = False
    TabOrder = 6
    Text = 'Status'
  end
  object ProductionLine2Edit: TEdit
    Left = 272
    Top = 86
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object ProductionLine2StatusComboBox: TComboBox
    Left = 128
    Top = 86
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 8
    Text = 'Status'
  end
  object ProductionLine3Edit: TEdit
    Left = 272
    Top = 126
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object ProductionLine3StatusComboBox: TComboBox
    Left = 128
    Top = 126
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 10
    Text = 'Status'
  end
  object ProductionLine4Edit: TEdit
    Left = 272
    Top = 166
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object ProductionLine4StatusComboBox: TComboBox
    Left = 128
    Top = 166
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 12
    Text = 'Status'
  end
  object ManuelCheckBox: TCheckBox
    Left = 8
    Top = 16
    Width = 97
    Height = 17
    Caption = 'Manuel'
    TabOrder = 13
    OnClick = ManuelCheckBoxClick
  end
  object SendButton: TButton
    Left = 374
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Skicka'
    Enabled = False
    TabOrder = 14
    OnClick = SendButtonClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 424
    Top = 8
  end
end
