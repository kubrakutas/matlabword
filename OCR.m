clc, close all, clear all % PROGRAMI ÇALIÞTIRMADAN ÖNCE ÇALIÞIR DURUMDAKÝ TÜM UYGULAMALARI VE PENCERELERÝ KAPATMAK VE  AYRICA COMMAND WÝNDOWU TEMÝZLEMEK ÝÇÝN.
imagen=imread('deneme3.jpg'); % ÝNPUT RESMÝ. 
imshow(imagen); % ÝNPUT RESMÝNÝ GÖSTERME.
title('INPUT RESMÝ') % ÝNPUT RESMÝNE BAÞLIK KOYMA.
if size(imagen,3)==3 % RESMÝ BÝNAY YAPMAK ÝÇÝN ÖNCE RESMÝ GRAY KODA DÖNÜÞTÜRÜYORUZ.
    imagen=rgb2gray(imagen);
end
threshold = graythresh(imagen); % TÜM RESMÝ BAZ ALARAK(ORTALAMA) MATLAB OTOMATÝK OLARAK THRESHOLD DEÐERÝ ATIYOR.
imagen =~im2bw(imagen,threshold); % ÝNPUT RESMÝMÝZE UYGULUYORUZ. FAKAT NOT EQUAL OPERATORUNU KULLANIYORUZ CUNKU BÝZÝM TEMPLATESLERÝMÝZ SÝYAH ÜZERÝNE BEYAZ KARAKTERLER.
imagen = bwareaopen(imagen,30); % 30-CONNECTED NEÝGHBORHOOD OLMAYANLARI RESÝMDEN ELÝYORUZ. SÝYAH(SIFIR) YAPIYORUZ.
word=[ ]; % text DOSYASINA YAZACAÐIMIZ KARAKTERLERÝ WORD STRÝNGÝNDE DEPOLAYACAÐIZ.
re=imagen; % KOLAY YAZMAK ÝÇÝN KISALTIYORUZ.
fid = fopen('text.txt', 'wt');
load templates % BELÝNEN TEPMLATESLERÝ YÜKLEME.
global templates % TEMPLATESLERÝ PROGRAM ÝÇERÝSÝNDE GLOBAL YAPMA.
num_letras=size(templates,2); % 50 TANE KARAKTERÝMÝZ VAR(HARFLER VE RAKAMLAR OLMAK ÜZERE)
while 1
    [fl re]=lines(re); % LÝNES FONKSÝYONU
    imgn=fl;
    [L Ne] = bwlabel(imgn); % BURADA RESMÝN ÝÇÝNDEKÝ COMPONENTLERÝ(FARKLI KARAKTERLERÝ) TANIMLIYORUZ. "NE" KAÇ TANE KARAKTER OLDUÐUNU GÖSTERÝYOR.
    for n=1:Ne
        [r,c] = find(L==n); % MESELA n=2 ÝÇÝN BULDUÐU COMPONENT(KARAKTER) RC MATRÝXÝNÝ OLUÞTURUYOR. RC MATRÝXÝ ONUN YARÝNÝ BELÝRLÝYOR(LOCATÝON). 
            [r1, c2]= find(L==n+1);%alýnan bir sonraki karekterin deðerleridir bunlarda r ve c olan karakterlerden bir sonraki
            
            fark = min(c2)-max(c);% iki karakter arasýndaki boþluðu hesaplýyoruz
            %imgn kendi resmim
        n1=imgn(min(r):max(r),min(c):max(c)); % N1 COMPONENTÝ(KARAKTER) ÝÇÝN SOL ÜSTEN SAÐ ALTA KADAR SINIRLIYORUZ ONU, O COMPONENTÝ OLUÞTURAN YERLERÝ BELÝRTÝYOR. 
       [ksef tempT]=size(imgn);
       [msef tempT]=size(n1);
         b=0;
        if ksef == msef
           b= 1;% 1 se büyük karakter deðilse küçük
        end
       % if ksef > msef
        %    b=0;
        %end
        
        img_r=imresize(n1,[42 24]);% TEMPLATESLERÝMÝZ 42X24 PÝXEL OLDUKLARI ÝÇÝN, BULUNAN KARAKTERÝ YENÝDEN BOYUTLANDIRIYORUZ.
        imagn = img_r;
        %read letter a gönder okunsun diye
        letter=read_letter(imagn,num_letras,b); % ,b vardý sonda sildim READ_LETTER FONKSÝYONU ÇAÐIRILIYOR.
        word=[word letter]; % WORD MATRÝXÝ ÝÇERÝSÝNE BULUNAN KARAKTER YAZILIYOR. HER SEFERÝNDE BULUNAN KARAKTER SÝLÝNMEMESÝ ÝÇÝN BU FORMATTA TANIMLIYORUZ.
       %fark varsa boþluk býrakýyoruz
        if fark >= 10
                word=[word ' '];
            end
    end
    
    fprintf(fid,'%s\n',word); % ÝLK SATIRDAKÝ TÜM KARAKTERLER TANIMLANIP WORD MATRÝXÝNE YAZILDIKTAN SONRA, ÝLK SATIRI TEXT DOSYASININ ÝLK SATIRINA YAZIYORUZ.
    word=[ ]; % ÝKÝNCÝ SATIR ÝÇÝN , MATRÝSÝ BOÞALTIYORUZ.
    if isempty(re) % EÐER RE BOÞSA LOOPTAN ÇIKIYORUZ.
        break
    end    
end
fclose(fid); % TEXT DOSYASINI KAPATIYORUZ.
winopen('text.txt')
