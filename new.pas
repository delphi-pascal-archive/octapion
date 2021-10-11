program Exemple;

{

Programme de test console
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

uses SysUtils, liste, coeur, console, calcul;

var position, main : integer;
    starting : boolean;
    start : string;
begin
// Permet de lancer au démarrage le systeme qui met les données dans un tableau de record avec deux liste simplement chainée.
demarrage;
starting:=true;

// on attend d'avoir le feu vert (true) avant de demarerr le jeu
while (starting) DO begin
writeln('pour demarrer le jeu, tapez o');
readln(start);
if start = 'o' then starting:=false;
end;

// nombre de coup jouer initialisé à 0
main:=0;
// j'affiche une matrice carré en console
console_affiche_matrice(console_position(42515320));
// je lance la procedure d'affichage en console
console_affichage_main(position,main);
//affiche_recherche_console(tab,position,main);

end.