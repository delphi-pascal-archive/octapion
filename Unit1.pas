unit Unit1;

{
 Interface graphique powered by Delphi 6

         (\____/)
          (_oo_)
            (O)
          __||__    \)
       []/______\[] /
       / \______/ \/
      /    /__\
     (\   /____\
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, coeur, StdCtrls, Spin, Console, Liste, ExtCtrls;

type


  TForm1 = class(TForm)
    DrawGrid1: TDrawGrid;
    MainMenu1: TMainMenu;
    Jeu1: TMenuItem;
    Demarrerlejeu1: TMenuItem;
    Pause1: TMenuItem;
    Reprendrelejeu1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Demarrerlejeu1Click(Sender: TObject);
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DrawGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DrawGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pause1Click(Sender: TObject);
    procedure Reprendrelejeu1Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;
  // matrice en cours
  MatricePos : console.Tmatrice;
  // position du pion dans la colonne/ligne
  SourceCol, SourceRow: longint;
  // jeu est-il commenc� (oui = true)
  start : boolean;
  // nombre de coup jou�
  main : integer;
  // image des dames
  dame : TImage;
  // image du roi
  roi : TImage;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
// on charge en m�moire l'initiatlisation du jeu
demarrage;
// permet de controler via le code de programmation l'utilisation
// du drawgrid.. > on refuse au demarrage l'utilisation du dragmode.
Form1.Drawgrid1.Dragmode:=dmManual;
// on informe que le jeu est arr�t�/pas encore commenc�
start:=false;
end;

// lorsqu'on clique pour demarrer sur le jeu
procedure TForm1.Demarrerlejeu1Click(Sender: TObject);
begin
// Position de d�part et on dessine les pions dans le Drawgrid
MatricePos := console_position(42515320);
// On remet � jour l'�cran
Form1.DrawGrid1.Invalidate;
// On informe qu'on demarre le jeu via un bool.
start:=true;
// nombre de coup jou� defini � 0
main:=0;
end;

// Permet de dessiner dans le drawgrid
procedure TForm1.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  // on commence
begin
 for ARow := console.indiceMinLigne to console.indiceMaxLigne do
        for ACol := console.indiceMinColonne to console.indiceMaxColonne do
        // Si option = 2 alors on colorie en noir }
        // l'ordinateur dans la matrice joue les noirs.

 	case MatricePos[ARow, ACol] of
      // pas de pion
      0: begin
      Form1.DrawGrid1.Canvas.Brush.Color := clwhite;
      Form1.DrawGrid1.Canvas.FillRect(Form1.DrawGrid1.CellRect(ACol, ARow))
      end;
       // pion blanc
      1: begin
      Form1.DrawGrid1.Canvas.Brush.Color := clwhite;
      Form1.DrawGrid1.Canvas.Ellipse(Form1.DrawGrid1.CellRect(ACol, ARow));
      end;
      // pion noir
      2: begin
      Form1.DrawGrid1.Canvas.Brush.Color := clblack;
      Form1.DrawGrid1.Canvas.Ellipse(Form1.DrawGrid1.CellRect(ACol, ARow));
      end;
    end
 end;

procedure TForm1.DrawGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  // position courante du pion
  CurrentCol, CurrentRow : longint;
begin
	// convertir la position de la souris dans le drawgrid
	Drawgrid1.MouseToCell(X, Y, CurrentCol, CurrentRow);
	// on accepte le drag juste si le drawgrid est dans la source
        // et on v�rfie que le jeu est bien demarr� (ou pas fini).
        // si le coup est incorrect, la v�rification se fait dans la fonction utilisateur
	 Accept := (Sender = Source) and (start);
end;

procedure TForm1.DrawGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  // longint comme sp�cifie dans la doc
  DestCol, DestRow : longint;
  k : integer;
  positionprec : console.position;
  begin
  // on enregistre la position pr�cedente (pour remettre ce coup)
  positionprec:=matrice_number(MatricePos);
  k:=0;
  // on converti le positionnement de la souris.
  Drawgrid1.MouseToCell(X, Y, DestCol, DestRow);
  // si la source actuel est diff�rente que la source dest...  et que le jeu est sur on
  if (SourceCol <> DestCol) or (SourceRow <> DestRow) and (start) then
  // on commence
   begin
   // on inserer ou le pion s'est d�plac� dans la matrice
   MatricePos[DestRow,DestCol]:=1;
   // on retire ou le pion s'est retir� dans la matrice
   MatricePos[SourceRow,SourceCol]:=0;
   // on raffraichi � nouveau l'�cran
   Form1.DrawGrid1.Invalidate;
   // on met la matrice en num�ro
   k:=matrice_number(MatricePos);
   // on envoie la main � l'utilisateur
     utilisateur(k,main,positionprec);
   // on remet � jour l'�cran
     Form1.DrawGrid1.Invalidate;
    end;
end;

// lorsque je selectionne le pion et je commence � prendre
procedure TForm1.DrawGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        // on v�rifie si le jeu est sur on
        if (start) THEN
        begin
	// on converti les donn�e de souris
	Drawgrid1.MouseToCell (X, Y, SourceCol, SourceRow);
	// si le pion est blanc (==1) alors....
	if (MatricePos[SourceRow,SourceCol] = 1) then
	// commencez � faire glisser la souris s'est d�plac� apr�s 3 pixels
	Drawgrid1.BeginDrag (False, 3);
        end;
end;

// si on clique sur pause
procedure TForm1.Pause1Click(Sender: TObject);
begin
start:=false;
end;

// si on clique sur reprendre le jeu
procedure TForm1.Reprendrelejeu1Click(Sender: TObject);
begin
// on commence
start:=true;
end;

end.
