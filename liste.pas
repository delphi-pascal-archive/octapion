unit liste;

{

Unit� powered by J�rome Fafchamps.
Cette unit� � unique but de cr�er et g�r�r une liste simplement chain� avec tampom.

     ,     ,
         (\____/)
          (_oo_)
            (O)
          __||__    \)
       []/______\[] /
       / \______/ \/
      /    /__\
     (\   /____\


Relecture du cours de LAPR et les ateliers de Mr Pirlot afin de pouvoir r�aliser cette unit�.
}


// D�but de l'interface
interface

// utilisation des units
uses SysUtils, Dialogs;

// On d�clare les types
type
// Liste simplement chain�e pour liste gagnante et liste perdante.
TPosition = integer;
TListe = ^PListe;
  PListe = record
  // valeur de la liste
    valeur : TPosition;
    // suivant
    suivant: Tliste;
  end;
  
// D�but de la signature des proc�dures.
// Permet de cr�er une nouvelle liste et l'initialise � nil.
procedure creer(var ls: TListe);

// Permet d'inserer une valeur dans la liste simplement chain�e.
procedure inserer_liste (var ls : TListe; const element : TPosition);

// Renvoie vrai si la liste est vide.
function liste_vide (ls : TListe):Boolean;

// Renvoie la premiere cellule (donn�e) d'une liste simplement chain�e.
function premiere_cellule (const ls : TListe):TPosition;

//affiche une liste l en console
procedure affiche_liste (const ls : TListe);

// recherche la valeur si elle est dans la liste ou non. Ceci permettra entre autre de rechercher si la position est correct et accepter le drag and drop.
function dans_liste(const ls : TListe; element : TPosition):Boolean;

// D�but de l'impl�mentation.
implementation

uses Unit1;

// Cr�ation de la liste
procedure creer (var ls : TListe);
begin
ls := nil;
end;

// J'affiche la liste simplement chain�e.
procedure affiche_liste (const ls : TListe);
var courant : TListe;
begin
// Si la liste n'est pas vide.
if liste_vide(ls) then
else begin
		// tampom
		courant := ls;
		// vu qu'on consid�re que la liste est vide si elle est � nil, pour faire un parcours <> nil.
		while (courant <> nil) do
			begin
			// on affiche la valeur courante
			//write(courant^.valeur,' ');
              //          Form1.Memo1.Lines.Add(IntToStr(courant^.valeur));
			// On passe au suivant
			courant := courant^.suivant;
			end
	 end
end;

// Si la liste est vide, renvoie vrai sinon faux.
function liste_vide ( ls : TListe ):Boolean;
begin
liste_vide := (ls=nil);
end;

// Prend la premiere 'donn�e' de la liste simplement chain�e
function premiere_cellule (const ls : TListe):TPosition;
var courant : Tliste;
begin
courant := ls;
result := courant^.valeur;
end;

// Permet d'ins�rer dans la liste simplement chain�e.
procedure inserer_liste (var ls : TListe; const element : TPosition);
var nv : Tliste;
begin
// Si la liste est � nil, je cr�e une boite et j'insere les valeurs.
if (ls = nil) then begin
				new(nv);
				nv^.valeur := element;
				nv^.suivant := nil;
				ls := nv;
				end
else inserer_liste(ls^.suivant,element)
end;

// Permet de v�rifier si c'est �lement est dans la liste ou non. Renvoie true.
function dans_liste(const ls : TListe; element : TPosition):Boolean;
var courant : TListe;
begin
// courant pointe vers l
courant := ls;
result := false;
while (not result) and (courant <> nil) do
	begin
	result := courant^.valeur = element;
	courant := courant^.suivant;
	end
end;

initialization

{
Fin de l'unit� "liste simplement chain�e" :-)

      (\____/)
          (_oo_)
            (O)
          __||__    \)
       []/______\[] /
       / \______/ \/
      /    /__\
     (\   /____\


}

end.

