/* Nama         : Hidayatullah Wildan Ghaly Buchary     */
/* NIM          : 13521015                              */
/* Kelas        : K3                                    */
/* Topik        : PraPraktikum 1 Logika Komputasional   */
/* Nama File    : PP01_13521015.pl                      */

/* Bagian <I> */
/* Deklarasi Fakta */

/* pria(X) : X adalah pria */
pria(gede).
pria(gojo).
pria(von_Neumann). 
pria(van_Rossum). 
pria(bambang). 
pria(vito). 
pria(ave). 
pria(wesly). 
pria(elon_Musk). 
pria(patrick). 

/* wanita(X) : X adalah wanita */
wanita(indah).
wanita(lovelace). 
wanita(kheli). 
wanita(power). 
wanita(aqua). 
wanita(wulandari). 
wanita(anya). 

/* usia(X,Y) : X berusia Y */
usia(gede, 96).
usia(indah, 92).
usia(gojo, 90).
usia(lovelace, 79).
usia(kheli, 89).
usia(von_Neumann, 92).
usia(van_Rossum, 65).
usia(bambang, 60).
usia(vito, 56).
usia(power, 50).
usia(ave, 54).
usia(aqua, 50).
usia(wulandari, 24).
usia(wesly, 26).
usia(elon_Musk,28).
usia(patrick,24).
usia(anya,4).

/* menikah(X,Y) : X menikah dengan Y */
menikah(gede,indah).
menikah(indah,gede).
menikah(gojo,lovelace).
menikah(lovelace,gojo).
menikah(kheli,von_Neumann).
menikah(von_Neumann,kheli).
menikah(vito,power).
menikah(power,vito).
menikah(ave,aqua).
menikah(aqua,ave).
menikah(wulandari,wesly).
menikah(wesly,wulandari).

/* saudara(X,Y) : X adalah saudara kandung Y */
saudara(van_Rossum,bambang).
saudara(bambang,van_Rossum).
saudara(bambang,vito).
saudara(vito,bambang).
saudara(vito,van_Rossum).
saudara(van_Rossum,vito).
saudara(power,ave).
saudara(ave,power).
saudara(elon_Musk,patrick).
saudara(patrick,elon_Musk).

/* anak(X,Y) : X adalah anak Y */
anak(van_Rossum, gede).
anak(van_Rossum, indah).
anak(bambang, gede).
anak(bambang, indah).
anak(vito, gede).
anak(vito, indah).
anak(power, gojo).
anak(power, lovelace).
anak(ave, gojo).
anak(ave, lovelace).
anak(aqua, kheli).
anak(aqua, von_Neumann).
anak(wesly, vito).
anak(wesly, power).
anak(elon_Musk, ave).
anak(elon_Musk, aqua).
anak(patrick, ave).
anak(patrick, aqua).
anak(anya, wesly).
anak(anya, wulandari).


/* Deklarasi Rules */

/* kakak(X,Y) : X adalah kakak dari Y (baik perempuan maupun lelaki) */
kakak(X,Y)                      :-  saudara(X,Y),
                                    usia(X,UsiaX),
                                    usia(Y,UsiaY),
                                    UsiaX > UsiaY.

/* keponakan(X,Y) : X adalah keponakan dari Y */
keponakan(X,Y)                  :-  anak(X, KakakAdek),
                                    saudara(KakakAdek, Y).

/* suami(X,Y) : X adalah suami dari Y */                                    
suami(X,Y)                      :-  menikah(X,Y),
                                    pria(X).

/* sepupu(X,Y) : X adalah sepupu dari Y */                                    
sepupu(X,Y)                     :-  anak(X, Z),
                                    anak(Y, W),
                                    saudara(Z, W).

/* menantu(X,Y) : X adalah menantu dari Y */
menantu(X,Y)                    :-  menikah(X,Z),
                                    anak(Z,Y).

/* orangtua(X,Y): X adalah orang tua dari Y */
orangtua(X,Y)                   :-  anak(Y,X).

/* bibi(X,Y) : X adalah bibi dari Y */
bibi(X,Y)                       :-  wanita(X),
                                    anak(Y,Z),
                                    saudara(Z,X).

/* cucu(X,Y) : X adalah cucu dari Y */
cucu(X,Y)                       :-  anak(X,Z),
                                    anak(Z,Y).

/* keturunan(X,Y): X adalah keturunan dari Y (berlaku untuk anak, cucu, dan seterusnya) */
keturunan(X, Y)                 :-  anak(X, Y).
keturunan(X, Y)                 :-  anak(X, Z), keturunan(Z, Y).

/* anaksulung(X) : X adalah anak paling tua */
anaksulung(X)                   :-  anak(X,Y),
                                    wanita(Y), /*atau pria(Y)*/
                                    \+kakak(_,X).

/* anakbungsu(X) : X adalah anak paling muda */
anakbungsu(X)                   :-  anak(X,Y),
                                    wanita(Y), /*atau pria(Y)*/
                                    \+kakak(X,_).


/* ================================================================================================================================= */
/* ================================================================================================================================= */
/* ================================================================================================================================= */


/* Bagian <II> */


/* combination */
/* Deklarasi Fakta */
/* Basis */
combination(_,0,1)              :-  !.           
/* Deklarasi Rules */
/* Rekurens */ 
combination(N,C,X)              :-  C1 is C - 1, 
                                    combination(N,C1,X1),
                                    X is X1 * (N-C+1) / C.



/* change */
/* Deklarasi Fakta */
/* Basis */
change(0,0)                     :-  !.                
change(1,1)                     :-  !.                         
change(1,2)                     :-  !.                     
change(2,3)                     :-  !.                     
change(2,4)                     :-  !.    
/* Deklarasi Rules */
/* Rekurens */                   
change(X,Y)                     :-  Y1 is Y-5,
                                    change(X1,Y1),
                                    X is X1+1.



/* fpb */
/* Deklarasi Fakta */
/* Basis */
fpb(X,0,X)                      :-  !.                       
fpb(0,X,X)                      :-  !.  
/* Deklarasi Rules */
/* Rekurens */                         
fpb(A,B,X)                      :-  A1 is A mod B,
                                    fpb(B,A1,X).



/* mod */
/* Deklarasi Fakta */
/* Basis */
mod(A,B,X)                      :-  A-B < 0 -> X is A,         
                                    !.       
/* Deklarasi Rules */
/* Rekurens */ 
mod(A,B,X)                      :-  A1 is A-B,
                                    mod(A1,B,X).



/* deret */
/* Deklarasi Fakta */
/* Basis */
/* asumsi pola deret :
 *  - Untuk n <= 2, Un = n,
 *  - Untuk n == 3, Un = 4,
 *  - Untuk n >= 4, Un = 5 * (n-3)
 */
deret(1,1)                      :-  !.                          
deret(2,2)                      :-  !.                         
deret(3,4)                      :-  !.                   
deret(4,5)                      :-  !.     
/* Deklarasi Rules */
/* Rekurens */                     
deret(X,Y)                      :-  X1 is X-1,
                                    deret(X1,Y1),
                                    Y is Y1 + 5.


/* ================================================================================================================================= */
/* ================================================================================================================================= */
/* ================================================================================================================================= */


/* Bagian <III> */

/* Fungsi Lain */
minimum(X,Y,X)                  :-  X < Y.
minimum(X,Y,Y)                  :-  X > Y.
minimum(X,X,X)                  :-  !.
maximum(X,Y,X)                  :-  X > Y.
maximum(X,Y,Y)                  :-  X < Y.
maximum(X,X,X)                  :-  !.



/* min */
/* Deklarasi Fakta */
/* BASIS */
min([X],X)                      :-  !.
/* Deklarasi Rules */
/* Rekurens */  
min([Y|Z], X1)                  :-  min(Z,X2),
                                    minimum(Y,X2,X1).



/* max */
/* Deklarasi Fakta */
/* Basis */
max([X],X)                      :-  !.
/* Deklarasi Rules */
/* Rekurens */
max([Y|Z],X1)                   :-  max(Z,X2), 
                                    maximum(Y,X2,X1).



/* range */
/* Deklarasi Fakta */
/* Basis */
getRange(0,Range,Range)         :-  !.
/* Deklarasi Rules */
/* Rekurens */
getRange(Min,Max,Range)         :-  Min < 0 ->
                                    Min1 is Min+1,
                                    Max1 is Max+1,
                                    getRange(Min1,Max1,Range),
                                    !.
getRange(Min,Max,Range)         :-  Min > 0 ->
                                    Min1 is Min-1,
                                    Max1 is Max-1,
                                    getRange(Min1,Max1,Range).
range(A,B)                      :-  min(A,Min),
                                    max(A,Max),
                                    getRange(Min,Max,B).

        

/* count */
/* Deklarasi Fakta */
/* Basis */
count([_],1)                    :-  !.
/* Deklarasi Rules */
/* Rekurens */
count([_|Z],X1)                 :-  count(Z,X), 
                                    X1 is X + 1.



/* sum */
/* Deklarasi Fakta */
/* Basis */
sum([X],X)                      :-  !.
/* Deklarasi Rules */
/* Rekurens */
sum([Y|Z],X1)                   :-  sum(Z,X), 
                                    X1 is X + Y. 



/* getIndex */
/* Deklarasi Fakta */
/* Basis */
getIndex([X|_],X,1)             :-  !.
/* Deklarasi Rules */
/* Rekurens */
getIndex([_|Z],X,Index)         :-  getIndex(Z,X,Index1),
                                    Index is Index1+1.



/* swap */
/* Deklarasi Fakta */
/* Basis */
changeIdx(A,[B|C],[D|C],B,D)    :-  A == 1, 
                                    !.
/* Deklarasi Rules */
/* Rekurens */
changeIdx(A,[E|C],[E|DC],B,D)   :-  A > 1,
                                    F is A - 1,
                                    changeIdx(F, C, DC, B, D).
swap(V, A, B, W)                :-  changeIdx(A,V,L,X,Y),
                                    changeIdx(B,L,W,Y,X).



/* splitlist */
/* Deklarasi Fakta */
/* Basis */
splitList([],[],[])             :-  !.
/* Deklarasi Rules */
/* Rekurens */
splitList([A|B],[A|X], Y)       :-  A mod 2 =:= 1, 
                                    splitList(B,X,Y).
splitList([A|B],X,[A|Y])        :-  A mod 2 =:= 0, 
                                    splitList(B,X,Y).


/* ================================================================================================================================= */
/* ================================================================================================================================= */
/* ================================================================================================================================= */


/* Bagian <BONUS> */

:-dynamic(currentValue/1).
:-dynamic(isValid/1).

/* Deklarasi Fakta */
/* isValid digunakan untuk mengecek apakah kalkulator sudah distart atau belum */
/* isValid(1) jika kalkulator belum distart atau sudah selesai digunakan */
/* isValid(0) jika kalkulator sedang berjalan */
isValid(1).

/* Deklarasi Fakta */
/* Basis */
addisi(X,0,X)                   :-  !.
addisi(0,X,X)                   :-  !.
/* Deklarasi Rules */
/* Note: tidak digunakan rekurens karena mungkin ada input desimal */
addisi(A,B,X)                   :-  X is A+B.


/* Deklarasi Fakta */
/* Basis */
substraksi(X,0,X)               :-  !.
/* Deklarasi Rules */
/* Note: tidak digunakan rekurens karena mungkin ada input desimal */
substraksi(A,B,X)               :-  X is A-B,
                                    !.


/* Deklarasi Fakta */
/* Basis */
multiplikasi(_,0,0)             :-  !.
multiplikasi(X,1,X)             :-  !.
multiplikasi(1,X,X)             :-  !.
multiplikasi(0,_,0)             :-  !.
multiplikasi(A,B,Z)             :-  B < 1 -> Z is A*B, /* Terjadi jika B < 1 */
                                    !.
/* Deklarasi Rules */
/* Rekurens */
multiplikasi(A,B,Z)             :-  B1 is B-1,
                                    multiplikasi(A,B1,Z1),
                                    Z is Z1 + A.


/* Deklarasi Fakta */
/* Basis */
divisi(X,0,X)                   :-  write('Invalid, Saved Value is Still '),
                                    !.
divisi(X,1,X)                   :-  !.
divisi(X,X,1)                   :-  !.
/* Deklarasi Rules */
divisi(A,B,X)                   :-  X is A/B,
                                    !.


/* Memulai kalkulator, kalkulator nilai value saat kalkulator baru dimulai adalah 0 (nol) */
/* Apabila fungsi dipanggil tetapi kalkulator sudah distart maka currentValue tidak akan berubah */
/* kalkulator hanya bisa distart jika isValid(X) dengan X bernilai 1 (satu) */
startCalculator                 :-  isValid(X),
                                    X =\= 1 -> write('Kalkulator sudah dijalankan'),
                                    !.
startCalculator                 :-  write('Selamat Datang di Kalkulator Prolog!\n'),
                                    write('Curently Saved Value is '),
                                    asserta(currentValue(0)), 
                                    write(0),
                                    retractall(isValid(_)),
                                    asserta(isValid(0)).


/* Melakukan penambahan value sebelumnya dengan A lalu disimpan ke value saat ini */
add(A)                          :-  currentValue(Y),
                                    write('Old Saved Value is '),
                                    write(Y),
                                    write('\nNew Saved Value is '),
                                    addisi(Y,A,Z),
                                    retractall(currentValue(_)),
                                    asserta(currentValue(Z)), 
                                    currentValue(Z),
                                    write(Z).


/* Melakukan pengurangan value sebelumnya dengan A lalu disimpan ke value saat ini */
subtract(A)                     :-  currentValue(Y),
                                    write('Old Saved Value is '),
                                    write(Y),
                                    write('\nNew Saved Value is '),
                                    substraksi(Y,A,Z),
                                    retractall(currentValue(_)),
                                    asserta(currentValue(Z)), 
                                    currentValue(Z),
                                    write(Z).


/* Melakukan pembagian value sebelumnya dengan A lalu disimpan ke value saat ini */
divide(A)                       :-  currentValue(Y),
                                    write('Old Saved Value is '),
                                    write(Y),
                                    write('\nNew Saved Value is '),
                                    divisi(Y,A,Z),
                                    retractall(currentValue(_)),
                                    asserta(currentValue(Z)), 
                                    currentValue(Z),
                                    write(Z).


/* Melakukan perkalian value sebelumnya dengan A lalu disimpan ke value saat ini */
multiply(A)                     :-  currentValue(Y),
                                    write('Old Saved Value is '),
                                    write(Y),
                                    write('\nNew Saved Value is '),
                                    multiplikasi(Y,A,Z),
                                    retractall(currentValue(_)),
                                    asserta(currentValue(Z)), 
                                    currentValue(Z),
                                    write(Z).


/* Mengulang kalkulator dengan mengubah nilai saat ini menjadi 0 (nol) */
clearCalculator                 :-  currentValue(Y),
                                    write('Old Saved Value is '),
                                    write(Y),
                                    write('\nNew Saved Value is '),
                                    retractall(currentValue(_)),
                                    asserta(currentValue(0)), 
                                    currentValue(Z),
                                    write(Z).


/* Mendapatkan nilai value saat ini pada kalkulator */
getValue                        :-  currentValue(Y),
                                    write('Currently Saved Value is '),
                                    write(Y).


/* Melakukan exit dengan calculator */
/* isValid di set berisi 1 agar calculator dapat di start ulang */
exitCalculator                  :-  currentValue(_),
                                    write('Terima Kasih telah Menggunakan Kalkulator Prolog'),
                                    retractall(currentValue(_)),
                                    retractall(isValid(_)),
                                    asserta(isValid(1)).


/* ================================================================================================================================= */
/* ================================================================================================================================= */
/* ================================================================================================================================= */