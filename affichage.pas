unit affichage;

          
{

Unit� powered by J�rome Fafchamps.
Cette unit� g�re l'affichage des messages d'erreurs!

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



// D�but de l'interface
interface

// coup jou� refus� > message d'erreur pour dire que le coup est refus�..
procedure refused;

// noir qui ont gagn�
procedure noirg;

// blanc qui ont gagn�
procedure blancg;

// D�but de l'impl�mentation.
implementation

uses Unit1, Dialogs;

// message d'erreur pour dire que le coup est refus�
procedure refused;
begin
showmessage('Erreur, vous ne pouvez pas jouer ce coup');
end;

procedure noirg;
begin
showmessage('Felicitation! Les noirs ont gagn�s.');
end;

procedure blancg;
begin
showmessage('Felicitation! Les blancs ont gagn�s.');
end;


initialization


{

Fin de l'unit� affichage :-)

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

