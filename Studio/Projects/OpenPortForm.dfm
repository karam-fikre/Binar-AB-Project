object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #214'ppna Port'
  ClientHeight = 290
  ClientWidth = 263
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
  object Label2: TLabel
    Left = 16
    Top = 123
    Width = 46
    Height = 19
    Caption = 'Parity:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 39
    Width = 68
    Height = 19
    Caption = 'Baudrate:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 82
    Width = 63
    Height = 19
    Caption = 'Databits:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 166
    Width = 63
    Height = 19
    Caption = 'Stopbits:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object baudrateSelection: TComboBox
    Left = 114
    Top = 41
    Width = 117
    Height = 21
    TabOrder = 0
  end
  object databitsSelection: TComboBox
    Left = 112
    Top = 84
    Width = 119
    Height = 21
    TabOrder = 1
  end
  object stopbitsSelection: TComboBox
    Left = 112
    Top = 168
    Width = 119
    Height = 21
    TabOrder = 2
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 8
    Width = 151
    Height = 17
    Caption = 'V'#228'nligen v'#228'lj dina inst'#228'llningar:'
    TabOrder = 3
  end
  object paritySelection: TComboBox
    Left = 112
    Top = 125
    Width = 119
    Height = 21
    TabOrder = 4
  end
  object CloseButton: TButton
    Left = 180
    Top = 257
    Width = 75
    Height = 25
    Caption = 'St'#228'ng'
    TabOrder = 5
    OnClick = CloseButtonClick
  end
  object Ok: TButton
    Left = 8
    Top = 257
    Width = 75
    Height = 25
    Caption = 'Klar'
    TabOrder = 6
    OnClick = OkClick
  end
  object comPortTVaComm: TVaComm
    FlowControl.OutCtsFlow = False
    FlowControl.OutDsrFlow = False
    FlowControl.ControlDtr = dtrDisabled
    FlowControl.ControlRts = rtsDisabled
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    FlowControl.DsrSensitivity = False
    FlowControl.TxContinueOnXoff = False
    DeviceName = 'COM%d'
    SettingsStore.RegRoot = rrCURRENTUSER
    SettingsStore.Location = slINIFile
    Version = '2.0.3.0'
    Left = 224
    Top = 208
  end
end
