unit calcul;

{

Unit� powered by J�rome Fafchamps.
Tout les calculs pour arriver � la position sont dans cette unit�

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

// implemente l'op�ration exposant
function exposant (const x : integer; num : byte):longint;

implementation

// permet de calculer l'exposant
function exposant (const x : integer; num:byte):longint;
begin
if num = 0 then result := 1
else result := x*(exposant(x,num-1))
end;


initialization
   {
Fin de l'unit� "calcul" :-)

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

