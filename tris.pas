program extri;
uses crt;
type
  fiche=file of integer;
  tab=array [1..100] of integer;
var
f:fiche;
t:tab;
rep,n:integer;
(*---------------------------------------------------------------------------*)
function pmin(t:tab;d,f:integer):integer;
 var
   min,i:integer;
   begin
     i:=d;
     min:=i;
     for i:=d+1 to f do
       begin
         if (t[i]<t[min]) then
           min:=i;
       end;
       pmin:=min;  
   end;
(*---------------------------------------------------------------------------*)
procedure permut(var x,y:integer);
var
  aux:integer;
  begin
    aux:=x;
    x:=y;
    y:=aux;
  end;
(*---------------------------------------------------------------------------*)
procedure saisie(var n:integer);
begin
  writeln('saisir n');
  readln(n);
end;
(*---------------------------------------------------------------------------*)
procedure remp(var f:fiche;n:integer);
 var
   i,x:integer;
   begin
     rewrite(f);
     for i:=1 to n do
        begin
          read(x);
          write(f,x);
        end; 
   end;
(*---------------------------------------------------------------------------*)
procedure trans1(var f:fiche; var t:tab;n:integer);
var
  i:integer;
  begin
    reset(f);
   for i:=1 to n  do
     begin
      read(f,t[i]);
    end;  
  end;
(*---------------------------------------------------------------------------*)
procedure trans2(var f:fiche;t:tab;n:integer);
var
  i:integer;
  begin
    rewrite(f);
    for i:=1 to n do
      write(f,t[i]);
  end;
(*---------------------------------------------------------------------------*)
procedure tri_ins(var t:tab;n:integer);
var
  i,j,aux:integer;
 begin
   for i:=2 to n do
    begin
      j:=i;
      aux:=t[i];
     while (j>1) and (t[j-1]>aux) do
       begin
         t[j]:=t[j-1];
         j:=j-1;
       end;
     t[j]:=aux;
   end;  
 end;
(*---------------------------------------------------------------------------*)
procedure tri_sel(var t:tab;n:integer);
var
  min,i:integer;
  Begin
  for i:=1 to n-1 do
     begin
       min:=pmin(t,i,n);
      if (i<>min) then
        permut(t[i],t[min]);
     end;  
  end;
(*---------------------------------------------------------------------------*)
Procedure tri_bull(var t:tab;n:integer);
Begin
end;
(*---------------------------------------------------------------------------*)
procedure affi(var f:fiche);
var
  x:integer;
begin
  reset(f);
  while not (EOF(f)) do
    begin
      read(f,x);
      write(x,'|');
    end;  
end;
(*---------------------------------------------------------------------------*)
BEGIN
assign(f,'triss.dat');

saisie(n);
remp(f,n);
trans1(f,t,n);
affi(f);
readln;
clrscr;
writeln(' ':15,'************Menu GÃ©nÃ©ral**************');
writeln (' ':30,'1:tri insertion');
writeln (' ':30,'2:tri sÃ©lÃ©ction');
writeln (' ':30,'3:tri Ã  bull');
writeln(' ':30,'4:Quitter');
gotoxy(55,7);
repeat
 write('Votre choix ->');
 readln(rep);
  until(rep in[1..4]);
  case rep of 
   1:tri_ins(t,n);
   2:tri_sel(t,n);
   3:tri_bull(t,n);
   4:exit;
 end;
trans2(f,t,n);
affi(f);
close(f);
END.