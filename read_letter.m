function letter=read_letter(imagn,num_letras,b)%,b vard� onu sildim
%num let templates lar�n say�s� bende 50 tane var
%imagn resmim
global templates
comp=[ ]; % COMPARE ETMEK ���N BO� B�R MATR�X TANIMLIYORUZ.
for n=1:num_letras % 1'DEN 50'YA KADAR.sayd�r�yoruz
    sem=corr2(templates{1,n},imagn); % HER B�R KARAKTERLERLE OLAN BENZERL���N� BULUYOR.
    comp=[comp sem]; % BULUNAN BENZERL�KLER� COMP MATR�X�NE TEK SATIR OLU�TURACAK �EK�LDE YERLE�T�R�YORUZ.
end
%benzerlik oranlar� comp dizimizde tutar�z
vd=find(comp==max(comp)); % COMP MATR�X�NDEK� EN Y�KSEK ORANDA OLANINI, YAN� EN �OK BENZEYEN�N� ALIYORUZ.
%max benzerlik ka��nc� s�radaysa o de�eri vd ye at�yor
%1 se a �eklinde d�nder
if vd==1
    letter='A';
elseif vd==2
    letter='B';
elseif vd==3
    if  b == 1
        letter='C';
    else    
        letter ='c';
    end
elseif vd==4
    letter='D';
elseif vd==5
    letter='E';
elseif vd==6
    letter='F';
elseif vd==7
    letter='G';
elseif vd==8
    letter='H';
elseif vd==9 
    if b==1
        letter='I';
    else 
        letter ='�';
    end
elseif vd==10 
    if b==1
        letter='J';
    else 
        letter ='j';
    end
elseif vd==11
    letter='K';
elseif vd==12
    letter='L';
elseif vd==13
    letter='M';
elseif vd==14
    letter='N';
elseif vd==15 
    if b==1
        letter='O';
    else 
        letter ='o';
    end
elseif vd==16
    if b==1
        letter='P';
    else
        letter ='p';
    end
elseif vd==17
    letter='Q';
elseif vd==18
    letter='R';
elseif vd==19
    if b==1
        letter='S';
    else
        letter ='s';
    end
elseif vd==20
    letter='T';
elseif vd==21
    if b==1
        letter='U';
    else
        letter ='u';
    end
elseif vd==22
    if b==1
        letter='V';
    else
        letter ='v';
    end
elseif vd==23
    if b==1
        letter='W';
    else
        letter ='w';
    end
elseif vd==24
    if b==1
        letter='X';
    else
        letter ='x';
    end
elseif vd==25
    letter='Y';
elseif vd==26 
    if b==1
        letter='Z';
    else
        letter ='z';
    end
    %*-*-*-*-*
elseif vd==27
    letter='a';
elseif vd==28
    letter='b';
elseif vd==29
    letter='d';
elseif vd==30
    letter='e';
elseif vd==31
    letter='f';
elseif vd==32
    letter='g';
elseif vd==33
    letter='h';
elseif vd==34
    letter='k';

elseif vd==36
    letter='m';
elseif vd==37
    letter='n';
elseif vd==38
    letter='r';
elseif vd==39
    letter='t';
elseif vd==40
    letter='y';
elseif vd==41
    letter='1';
elseif vd==42
    letter='2';
elseif vd==43
    letter='3';
elseif vd==44
    letter='4';
elseif vd==45
    letter='5';
elseif vd==46
    letter='6';
elseif vd==47
    letter='7';
elseif vd==48
    letter='8';
elseif vd==49
    letter='9';
elseif vd == 50
    if b==1
    letter='0';
    else
    letter='o';
    end
else
    if b==1
        letter = 'l';
    else
        letter = '�';
    end

end

