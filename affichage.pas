unit affichage;

          
{

Unité powered by Jérome Fafchamps.
Cette unité gère l'affichage des messages d'erreurs!

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



// Début de l'interface
interface

// coup joué refusé > message d'erreur pour dire que le coup est refusé..
procedure refused;

// noir qui ont gagné
procedure noirg;

// blanc qui ont gagné
procedure blancg;

// Début de l'implémentation.
implementation

uses Unit1, Dialogs;

// message d'erreur pour dire que le coup est refusé
procedure refused;
begin
showmessage('Erreur, vous ne pouvez pas jouer ce coup');
end;

procedure noirg;
begin
showmessage('Felicitation! Les noirs ont gagnés.');
end;

procedure blancg;
begin
showmessage('Felicitation! Les blancs ont gagnés.');
end;


initialization


{

Fin de l'unité affichage :-)

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

