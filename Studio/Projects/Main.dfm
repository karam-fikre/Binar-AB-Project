object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Main'
  ClientHeight = 400
  ClientWidth = 813
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 102
    Top = 0
    Width = 46
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'V'#228'lj port'
  end
  object Label2: TLabel
    Left = 404
    Top = 3
    Width = 72
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 0
    Caption = 'V'#228'lj Baudrate'
  end
  object Label3: TLabel
    Left = 527
    Top = 0
    Width = 73
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Ljusintensitet'
  end
  object lightIntensityNumberLabel: TLabel
    Left = 649
    Top = 21
    Width = 7
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '0'
  end
  object Label4: TLabel
    Left = 147
    Top = 165
    Width = 69
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Text att visa'
  end
  object Label5: TLabel
    Left = 147
    Top = 219
    Width = 65
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Font storlek'
  end
  object Label6: TLabel
    Left = 275
    Top = 221
    Width = 50
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Font f'#228'rg'
  end
  object Label7: TLabel
    Left = 392
    Top = 221
    Width = 76
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Bakgrund f'#228'rg'
  end
  object Label8: TLabel
    Left = 519
    Top = 221
    Width = 36
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Rotera'
  end
  object Label9: TLabel
    Left = 147
    Top = 272
    Width = 34
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Skrolla'
  end
  object Label10: TLabel
    Left = 275
    Top = 277
    Width = 22
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Blixt'
  end
  object ApdStatusLight1: TApdStatusLight
    Left = 8
    Top = 24
    Width = 12
    Height = 11
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Lit = False
    LitColor = clLime
    NotLitColor = clRed
  end
  object ConnectLabel: TLabel
    Left = 25
    Top = 22
    Width = 60
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Ej ansluten'
  end
  object Label11: TLabel
    Left = 392
    Top = 277
    Width = 61
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Font bredd'
  end
  object Label12: TLabel
    Left = 518
    Top = 277
    Width = 101
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Horisontell linjering'
  end
  object Label13: TLabel
    Left = 518
    Top = 326
    Width = 91
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'vertikal inriktning'
  end
  object Label14: TLabel
    Left = 202
    Top = 272
    Width = 58
    Height = 14
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Mellanrum '
  end
  object Label15: TLabel
    Left = 339
    Top = 88
    Width = 38
    Height = 14
    Caption = 'Placera'
  end
  object Label16: TLabel
    Left = 510
    Top = 88
    Width = 38
    Height = 14
    Caption = 'Storlek'
  end
  object Label17: TLabel
    Left = 311
    Top = 108
    Width = 30
    Height = 14
    Caption = 'X-axis'
  end
  object Label18: TLabel
    Left = 391
    Top = 108
    Width = 31
    Height = 14
    Caption = 'Y-asix'
  end
  object Label19: TLabel
    Left = 471
    Top = 108
    Width = 32
    Height = 14
    Caption = 'Bredd'
  end
  object Label20: TLabel
    Left = 552
    Top = 108
    Width = 25
    Height = 14
    Caption = 'H'#246'jd'
  end
  object portComboBox: TComboBox
    Left = 102
    Top = 20
    Width = 65
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 0
  end
  object baudrateComboBox: TComboBox
    Left = 404
    Top = 21
    Width = 81
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Enabled = False
    TabOrder = 1
    Text = 'baudrate'
  end
  object openPortClickButton: TButton
    Left = 175
    Top = 18
    Width = 73
    Height = 23
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #214'ppna port'
    TabOrder = 2
    OnClick = openPortClickButtonClick
  end
  object closePortClickButton: TButton
    Left = 251
    Top = 18
    Width = 75
    Height = 23
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'St'#228'ng port'
    TabOrder = 3
    OnClick = closePortClickButtonClick
  end
  object saveClickButton: TButton
    Left = 680
    Top = 18
    Width = 73
    Height = 23
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Spara'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    OnClick = saveClickButtonClick
  end
  object fontComboBox: TComboBox
    Left = 147
    Top = 239
    Width = 91
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 5
    Text = 'Centered'
  end
  object fontColorComboBox: TComboBox
    Left = 275
    Top = 241
    Width = 92
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 6
    Text = 'OFF'
  end
  object backgroundColorComboBox: TComboBox
    Left = 392
    Top = 241
    Width = 97
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 7
    Text = 'OFF'
  end
  object rotateComboBox: TComboBox
    Left = 519
    Top = 241
    Width = 96
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 8
    Text = '0'
  end
  object flashComboBox: TComboBox
    Left = 275
    Top = 296
    Width = 92
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 9
    Text = 'OFF'
  end
  object fontWidthComboBox: TComboBox
    Left = 392
    Top = 296
    Width = 97
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 10
    Text = 'Proportional'
  end
  object horizontalAligComboBox: TComboBox
    Left = 518
    Top = 296
    Width = 96
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 11
    Text = 'Aligen Left'
  end
  object verticalAlignComboBox: TComboBox
    Left = 518
    Top = 345
    Width = 96
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 12
    Text = 'Align Top'
  end
  object deleteTextClickButton: TButton
    Left = 680
    Top = 358
    Width = 75
    Height = 23
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Radera text'
    Enabled = False
    TabOrder = 13
    OnClick = deleteTextClickButtonClick
  end
  object resetClickButton: TButton
    Left = 680
    Top = 327
    Width = 75
    Height = 23
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #197'terst'#228'll'
    Enabled = False
    TabOrder = 14
    OnClick = resetClickButtonClick
  end
  object okClickButton: TButton
    Left = 680
    Top = 297
    Width = 75
    Height = 23
    Caption = 'Skicka'
    Enabled = False
    TabOrder = 15
    OnClick = okClickButtonClick
  end
  object textToDisplayEditor: TEdit
    Left = 147
    Top = 187
    Width = 118
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 16
  end
  object lightIntensityTrackBar: TTrackBar
    Left = 495
    Top = 18
    Width = 150
    Height = 29
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Enabled = False
    TabOrder = 17
    OnChange = lightIntensityTrackBarChange
  end
  object spacingSpinEdit: TSpinEdit
    Left = 203
    Top = 293
    Width = 41
    Height = 23
    MaxValue = 0
    MinValue = 0
    TabOrder = 18
    Value = 0
  end
  object textAreaRadioGroup: TRadioGroup
    Left = 8
    Top = 65
    Width = 121
    Height = 302
    Caption = 'Text omr'#229'den'
    Enabled = False
    TabOrder = 19
    OnClick = textAreaRadioGroupClick
  end
  object ResetAllClickButton: TButton
    Left = 680
    Top = 48
    Width = 75
    Height = 25
    Caption = #197'terst'#228'll allt'
    Enabled = False
    TabOrder = 20
    OnClick = ResetAllClickButtonClick
  end
  object xPositionSpinEdit: TSpinEdit
    Left = 311
    Top = 128
    Width = 61
    Height = 23
    MaxValue = 0
    MinValue = 0
    TabOrder = 21
    Value = 0
  end
  object yPositionSpinEdit: TSpinEdit
    Left = 391
    Top = 128
    Width = 61
    Height = 23
    MaxValue = 0
    MinValue = 0
    TabOrder = 22
    Value = 0
  end
  object widthSpinEdit: TSpinEdit
    Left = 471
    Top = 128
    Width = 61
    Height = 23
    MaxValue = 0
    MinValue = 0
    TabOrder = 23
    Value = 0
  end
  object heightSpinEdit: TSpinEdit
    Left = 553
    Top = 128
    Width = 61
    Height = 23
    MaxValue = 0
    MinValue = 0
    TabOrder = 24
    Value = 0
  end
  object scrollSpinEdit: TSpinEdit
    Left = 147
    Top = 293
    Width = 41
    Height = 23
    MaxValue = 0
    MinValue = 0
    TabOrder = 25
    Value = 0
  end
  object RunTimeClickButton: TButton
    Left = 678
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Realtid'
    Enabled = False
    TabOrder = 26
    OnClick = RunTimeClickButtonClick
  end
  object GameButton: TButton
    Left = 680
    Top = 154
    Width = 75
    Height = 25
    Caption = 'Gissa spel'
    Enabled = False
    TabOrder = 27
    OnClick = GameButtonClick
  end
  object VaComm1: TVaComm
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
    Left = 776
    Top = 360
  end
end
