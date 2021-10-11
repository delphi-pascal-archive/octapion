object Form1: TForm1
  Left = 298
  Top = 132
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Octapion'
  ClientHeight = 370
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PrintScale = poNone
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object DrawGrid1: TDrawGrid
    Left = 0
    Top = 0
    Width = 369
    Height = 369
    ColCount = 4
    DefaultColWidth = 90
    DefaultRowHeight = 90
    DragCursor = crHandPoint
    FixedColor = clWindow
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    TabOrder = 0
    OnDragDrop = DrawGrid1DragDrop
    OnDragOver = DrawGrid1DragOver
    OnDrawCell = DrawGrid1DrawCell
    OnMouseDown = DrawGrid1MouseDown
  end
  object MainMenu1: TMainMenu
    Left = 96
    Top = 8
    object Jeu1: TMenuItem
      Caption = 'Game'
      object Demarrerlejeu1: TMenuItem
        Caption = 'New Game'
        OnClick = Demarrerlejeu1Click
      end
      object Pause1: TMenuItem
        Caption = 'Pause'
        OnClick = Pause1Click
      end
      object Reprendrelejeu1: TMenuItem
        Caption = 'Play'
        OnClick = Reprendrelejeu1Click
      end
    end
  end
end
