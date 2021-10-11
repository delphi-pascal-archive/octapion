unit coeur;
{
Unité powered by Jérome Fafchamps.
Cette unité est le coeur du jeu, c'est à dire le système qui insère dans un tableau avec record les données du jeux.

     ,     ,
         (\____/)
          (_oo_)
            (O)
          __||__    \)
       []/______\[] /
       / \______/ \/
      /    /__\
     (\   /____\


Un vrai casse tête pour comprendre l'architecture :-( mais assez simple quand on à compris apres... à savoir...

}

// Début de l'interface
interface

uses SysUtils, liste, Dialogs;

const
// Fichier de position
NomFich : String = 'OCTAPION.TXT';

type  
  // Information sur l'octapion. On stock les données du fichier octapion dans les records.
  Octapion = record
  // coup joué
  cout : integer;
  // position actuel
  position : integer;
  // position gagnante
  listeg : liste.Tliste;
  // position perdante
  listep : liste.Tliste;
  // nombre de coup restant
  coutrestant : integer;
  end;

var 
// tableau
tab: array[1..25000] of Octapion;
  
// Début de la signature des procédures.

// Procedure de demarrage...
procedure demarrage;

// Début de l'implémentation.
implementation

uses Unit1;

// Procedure qui charge en mémoire au demarrage du programme
procedure demarrage;
	var
	// permet d'incrementer le tableau
	i : integer;
	// permet de mettre le fichier en variable
	Fich : TextFile;
	// permet de savoir si le nombre cout restant est positif ou à rencontrer le séparareur et met à true ou false (coutrestant>0 alors TRUE).
	gagnante : boolean;
	//  valeur à assigner dans le tableau.
	x : integer;
	begin
	// on initialise la variable i à 0 pour affecter une valeur dans tableau[k]
	i:=0;
	// on assigne le fichier.
	assignFile(Fich, NomFich);
	// si le fichier existe
	if FileExists(NomFich) Then begin
	// se mettre au début du fichier
	Reset(Fich);
	// tant que je ne suis pas à la fin du fichier (eof)
	while not Eof(Fich) Do begin
	// on initialise à 1 le i ou à 2 à la prochaine boucle, ainsi de suite
	inc(i);
       {	Form1.Memo1.Lines.Add(IntToStr(i));    }

	// on note le coup jouer dans la valeur coup
	read(Fich,tab[i].cout);

	// on note la position actuel et on affiche!
	read(Fich, tab[i].position);

	// On inserer le cout restant dans le tableau de record
	read(Fich, tab[i].coutrestant);

	if tab[i].coutrestant > 0 then
				// si positif
                                gagnante:=true
			        else
				// si négatif
				gagnante:=false;
	// tant que je ne suis pas à la fin de ligne
	while not EoLn(Fich) do
	try
	// valeur suivante du fichier
	read(Fich, x);

        if (gagnante) then inserer_liste(tab[i].listeg,x) else
		   inserer_liste(tab[i].listep,x);

	except // Erreur lecture d’un nombre ?
	On Exception Do
	gagnante:=false;
	end; // Try

{
permet de vérfier la position prise dans le text et l'afficher dans une boite
Form1.Memo1.Lines.Add('Position : ');
Form1.Memo1.Lines.Add(IntToStr(tab[i].position));
Form1.Memo1.Lines.Add('Cout restant : ');
Form1.Memo1.Lines.Add(IntToStr(tab[i].coutrestant));
Form1.Memo1.Lines.Add('Liste gagnante : ');
affiche_liste(tab[i].listeg);
Form1.Memo1.Lines.Add('Liste perdante : ');
affiche_liste(tab[i].listep);
Form1.Memo1.Lines.Add(' ');  }


end; // fin du while
// fermeture du fichier
closeFile(Fich); 
end;
end;

initialization


{

Fin de l'unité "coeur" :-)

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

