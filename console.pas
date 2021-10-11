unit console;

{

Unité powered by Jérome Fafchamps.
Unité qui gère tout les affichages en console...

     ,     ,
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

// Unité requise afin que cette unité fonctionne.
uses calcul, coeur, liste, affichage, Dialogs, SysUtils, Graphics;

{ besoin de quatre colonne, donc 0 = une colonne, 1 = 2ème colonne, ainsi de suite }
const 	  indiceMinColonne = 0; // indice de la 1ère colone
	  indiceMaxColonne = 3; // indice de la dernière colone
	  indiceMinLigne = 0;	// indice de la 1ère ligne
	  indiceMaxLigne = 3; // indice de la dernière ligne


// type
type

element = byte;
position = integer;
// le vecteur et la matrice..
TVecteur = array [0..3] of Element;
TMatrice = array [0..3] of TVecteur;

// revoir un nombre d'entier donné par l'utilisateur (en console) et
// renvoie la position de l'octapion en 0 (pour aucun pion), 1 pour les blancs, 2 pour
// les noirs
function console_position(poss : position):TMatrice;

// transformation de matrice
function matrice_number(m : TMatrice):position;

// ordinateur qui joue en console
procedure ordinateur (var position, main : position);

// utilisateur qui joue
procedure utilisateur (var position, main, positionprecedente : position);

implementation

uses Unit1, Grids;
// procedure de l'utilisateur
procedure utilisateur (var position, main, positionprecedente : position);
// variable du tableau
var k : integer;
// true/false pour voir si le coup est dans le fichier de position ou non.
   starti : boolean;
begin
starti:=false;
// debut de la recherche
for k := low(tab) to high(tab) DO
begin

	// compare le nombre de coup joué et le nombre de coup joué dans octapion.txt
	if ((main = tab[k].cout) and (not odd(main))
		// dans_liste() >> procedure de liste chainée pour voir si la position mise à l'écran est correct.
		AND (dans_liste(tab[k].listeg,position)) or (dans_liste(tab[k].listep,position))) THEN
										begin
										// on rajoute un coup jouer
										// au tour de l'ordinateur à jouer
										starti:=true;
										end;
		end;

		if (not starti) then
				begin
                                // affiche le coup refusé
                                refused;
                                // reaffiche l'écran la position precedente
                                Unit1.MatricePos := console_position(positionprecedente);
                		end else
                                begin
                                // on joue un coup
                                inc(main);
                                // on renvoie la main à l'ordinateur
                                ordinateur(position,main);
                                end;


{Form1.Memo1.Lines.Add('Position : ');
Form1.Memo1.Lines.Add(IntToStr(position));
Form1.Memo1.Lines.Add('Main : ');
Form1.Memo1.Lines.Add(IntToStr(main));    }

end;

// ordinateur qui joue contre l'utilisateur :-)
procedure ordinateur (var position, main : position);
// variable du tableau et de la premiere cellule
var k, cellule : integer;
begin

// début du tableau
for k := low(tab) to high(tab) DO
begin
// si le nombre de cout est joué ainsi que la position bonne dans les record du fichier octapion
if (main = tab[k].cout) and (tab[k].position = position) and (odd(main)) THEN
begin

{Form1.Memo1.Lines.Add('Liste gagnante : ');
affiche_liste(tab[k].listeg);
Form1.Memo1.Lines.Add('Liste perdante : ');
affiche_liste(tab[k].listep);
Form1.Memo1.Lines.Add('Position : ');
Form1.Memo1.Lines.Add(IntToStr(position));
Form1.Memo1.Lines.Add('Main : ');
Form1.Memo1.Lines.Add(IntToStr(main));  }


	// on vérifie si la liste des coups gagnants n'est pas vide et si pas vide, l'ordinateur joue la position gagnante.
	if (not liste_vide(tab[k].listeg)) THEN begin
	// affiche la premiere cellule de la liste (gagnante).
					// on encalpse la premiere position gagnante dans la variable cellule
					cellule:=premiere_cellule(tab[k].listeg);
        
                                        // on affiche la matrice!
                                        Unit1.MatricePos := console_position(cellule);
					end
					// si la liste est vide de valeur gagnante on affiche le coup des perdants...
						else if (not liste_vide(tab[k].listep)) THEN
							begin
							// on encalpsule la premiere donnée de la liste simplement chainé de la liste perdante
							cellule:=premiere_cellule(tab[k].listep);
                                                        // on affiche la matrice à l'écran
                                                        // on attend 400 milliseconde

						     Unit1.MatricePos := console_position(cellule);
							end
                                                else if (liste_vide(tab[k].listep)) and (liste_vide(tab[k].listeg)) then
                                                if (odd(tab[k].cout) and (tab[k].coutrestant>0)) then noirg else blancg;

				end;


			end;

                        inc(main);

		end;

// calcul la position
function console_position(poss : position):TMatrice;
var a,b:byte;
begin
for a:=0 to 3 do
	for b:=0 to 3 do
		begin
		result[a,b] := poss MOD 3;
		poss := poss DIV 3;
		end
end;


function matrice_number(m : TMatrice):position;
var a,b : byte;
begin
result := 0;
for a := 0 to 3 do
		for b := 0 to 3 do
			result := result + (m[a,b]*exposant(3,(3+1)*a+b))
end;


initialization


end.	

