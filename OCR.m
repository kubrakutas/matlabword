clc, close all, clear all % PROGRAMI �ALI�TIRMADAN �NCE �ALI�IR DURUMDAK� T�M UYGULAMALARI VE PENCERELER� KAPATMAK VE  AYRICA COMMAND W�NDOWU TEM�ZLEMEK ���N.
imagen=imread('deneme3.jpg'); % �NPUT RESM�. 
imshow(imagen); % �NPUT RESM�N� G�STERME.
title('INPUT RESM�') % �NPUT RESM�NE BA�LIK KOYMA.
if size(imagen,3)==3 % RESM� B�NAY YAPMAK ���N �NCE RESM� GRAY KODA D�N��T�R�YORUZ.
    imagen=rgb2gray(imagen);
end
threshold = graythresh(imagen); % T�M RESM� BAZ ALARAK(ORTALAMA) MATLAB OTOMAT�K OLARAK THRESHOLD DE�ER� ATIYOR.
imagen =~im2bw(imagen,threshold); % �NPUT RESM�M�ZE UYGULUYORUZ. FAKAT NOT EQUAL OPERATORUNU KULLANIYORUZ CUNKU B�Z�M TEMPLATESLER�M�Z S�YAH �ZER�NE BEYAZ KARAKTERLER.
imagen = bwareaopen(imagen,30); % 30-CONNECTED NE�GHBORHOOD OLMAYANLARI RES�MDEN EL�YORUZ. S�YAH(SIFIR) YAPIYORUZ.
word=[ ]; % text DOSYASINA YAZACA�IMIZ KARAKTERLER� WORD STR�NG�NDE DEPOLAYACA�IZ.
re=imagen; % KOLAY YAZMAK ���N KISALTIYORUZ.
fid = fopen('text.txt', 'wt');
load templates % BEL�NEN TEPMLATESLER� Y�KLEME.
global templates % TEMPLATESLER� PROGRAM ��ER�S�NDE GLOBAL YAPMA.
num_letras=size(templates,2); % 50 TANE KARAKTER�M�Z VAR(HARFLER VE RAKAMLAR OLMAK �ZERE)
while 1
    [fl re]=lines(re); % L�NES FONKS�YONU
    imgn=fl;
    [L Ne] = bwlabel(imgn); % BURADA RESM�N ���NDEK� COMPONENTLER�(FARKLI KARAKTERLER�) TANIMLIYORUZ. "NE" KA� TANE KARAKTER OLDU�UNU G�STER�YOR.
    for n=1:Ne
        [r,c] = find(L==n); % MESELA n=2 ���N BULDU�U COMPONENT(KARAKTER) RC MATR�X�N� OLU�TURUYOR. RC MATR�X� ONUN YAR�N� BEL�RL�YOR(LOCAT�ON). 
            [r1, c2]= find(L==n+1);%al�nan bir sonraki karekterin de�erleridir bunlarda r ve c olan karakterlerden bir sonraki
            
            fark = min(c2)-max(c);% iki karakter aras�ndaki bo�lu�u hesapl�yoruz
            %imgn kendi resmim
        n1=imgn(min(r):max(r),min(c):max(c)); % N1 COMPONENT�(KARAKTER) ���N SOL �STEN SA� ALTA KADAR SINIRLIYORUZ ONU, O COMPONENT� OLU�TURAN YERLER� BEL�RT�YOR. 
       [ksef tempT]=size(imgn);
       [msef tempT]=size(n1);
         b=0;
        if ksef == msef
           b= 1;% 1 se b�y�k karakter de�ilse k���k
        end
       % if ksef > msef
        %    b=0;
        %end
        
        img_r=imresize(n1,[42 24]);% TEMPLATESLER�M�Z 42X24 P�XEL OLDUKLARI ���N, BULUNAN KARAKTER� YEN�DEN BOYUTLANDIRIYORUZ.
        imagn = img_r;
        %read letter a g�nder okunsun diye
        letter=read_letter(imagn,num_letras,b); % ,b vard� sonda sildim READ_LETTER FONKS�YONU �A�IRILIYOR.
        word=[word letter]; % WORD MATR�X� ��ER�S�NE BULUNAN KARAKTER YAZILIYOR. HER SEFER�NDE BULUNAN KARAKTER S�L�NMEMES� ���N BU FORMATTA TANIMLIYORUZ.
       %fark varsa bo�luk b�rak�yoruz
        if fark >= 10
                word=[word ' '];
            end
    end
    
    fprintf(fid,'%s\n',word); % �LK SATIRDAK� T�M KARAKTERLER TANIMLANIP WORD MATR�X�NE YAZILDIKTAN SONRA, �LK SATIRI TEXT DOSYASININ �LK SATIRINA YAZIYORUZ.
    word=[ ]; % �K�NC� SATIR ���N , MATR�S� BO�ALTIYORUZ.
    if isempty(re) % E�ER RE BO�SA LOOPTAN �IKIYORUZ.
        break
    end    
end
fclose(fid); % TEXT DOSYASINI KAPATIYORUZ.
winopen('text.txt')
