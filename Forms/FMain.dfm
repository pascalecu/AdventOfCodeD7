object MainForm: TMainForm
  Left = 906
  Top = 249
  Width = 498
  Height = 293
  Caption = 'Advent of Code'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblYear: TLabel
    Left = 400
    Top = 8
    Width = 24
    Height = 16
    Caption = 'Year'
  end
  object lblDay: TLabel
    Left = 400
    Top = 56
    Width = 25
    Height = 16
    Caption = 'Day'
  end
  object mmoInput: TMemo
    Left = 8
    Top = 8
    Width = 384
    Height = 240
    BorderStyle = bsNone
    Enabled = False
    TabOrder = 0
  end
  object cbbYear: TComboBox
    Left = 400
    Top = 24
    Width = 80
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = cbbYearChange
  end
  object cbbDay: TComboBox
    Left = 400
    Top = 72
    Width = 80
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnChange = cbbDayChange
  end
  object rgPart: TRadioGroup
    Left = 400
    Top = 104
    Width = 80
    Height = 104
    Caption = 'Which part?'
    Items.Strings = (
      'Part 1'
      'Part 2'
      'Both')
    TabOrder = 3
  end
  object btnSolve: TButton
    Left = 400
    Top = 224
    Width = 80
    Height = 24
    Caption = 'Solve'
    TabOrder = 4
    OnClick = btnSolveClick
  end
end
