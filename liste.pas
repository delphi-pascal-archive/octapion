unit liste;

{

Unité powered by Jérome Fafchamps.
Cette unité à unique but de créer et gérér une liste simplement chainé avec tampom.

     ,     ,
         (\____/)
          (_oo_)
            (O)
          __||__    \)
       []/______\[] /
       / \______/ \/
      /    /__\
     (\   /____\


Relecture du cours de LAPR et les ateliers de Mr Pirlot afin de pouvoir réaliser cette unité.
}


// Début de l'interface
interface

// utilisation des units
uses SysUtils, Dialogs;

// On déclare les types
type
// Liste simplement chainée pour liste gagnante et liste perdante.
TPosition = integer;
TListe = ^PListe;
  PListe = record
  // valeur de la liste
    valeur : TPosition;
    // suivant
    suivant: Tliste;
  end;
  
// Début de la signature des procédures.
// Permet de créer une nouvelle liste et l'initialise à nil.
procedure creer(var ls: TListe);

// Permet d'inserer une valeur dans la liste simplement chainée.
procedure inserer_liste (var ls : TListe; const element : TPosition);

// Renvoie vrai si la liste est vide.
function liste_vide (ls : TListe):Boolean;

// Renvoie la premiere cellule (donnée) d'une liste simplement chainée.
function premiere_cellule (const ls : TListe):TPosition;

//affiche une liste l en console
procedure affiche_liste (const ls : TListe);

// recherche la valeur si elle est dans la liste ou non. Ceci permettra entre autre de rechercher si la position est correct et accepter le drag and drop.
function dans_liste(const ls : TListe; element : TPosition):Boolean;

// Début de l'implémentation.
implementation

uses Unit1;

// Création de la liste
procedure creer (var ls : TListe);
begin
ls := nil;
end;

// J'affiche la liste simplement chainée.
procedure affiche_liste (const ls : TListe);
var courant : TListe;
begin
// Si la liste n'est pas vide.
if liste_vide(ls) then
else begin
		// tampom
		courant := ls;
		// vu qu'on considère que la liste est vide si elle est à nil, pour faire un parcours <> nil.
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

// Prend la premiere 'donnée' de la liste simplement chainée
function premiere_cellule (const ls : TListe):TPosition;
var courant : Tliste;
begin
courant := ls;
result := courant^.valeur;
end;

// Permet d'insérer dans la liste simplement chainée.
procedure inserer_liste (var ls : TListe; const element : TPosition);
var nv : Tliste;
begin
// Si la liste est à nil, je crée une boite et j'insere les valeurs.
if (ls = nil) then begin
				new(nv);
				nv^.valeur := element;
				nv^.suivant := nil;
				ls := nv;
				end
else inserer_liste(ls^.suivant,element)
end;

// Permet de vérifier si c'est élement est dans la liste ou non. Renvoie true.
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
Fin de l'unité "liste simplement chainée" :-)

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

