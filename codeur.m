function [npt, echelle] = codeur(y, fe, bits, fmin, fmax, fichier)

% On calcule la tfd, et on la met en colonne
tfy = fft(y);
tfy = tfy(:);

% Conversion du masque de frequence en indice matlab
npt = length(y);
kmin = round(npt*fmin/fe) + 1;
kmax = round(npt*fmax/fe) + 1;

% On masque
tfymasq = tfy(kmin:kmax);

% On stocke parties reelle et imaginaire
% (qui seront stockees comme etant les 2 voies
% d'un signal stereo).
tfymasq = [real(tfymasq) imag(tfymasq)];

% On norme entre -1 et 1
echelle = max(max(abs(tfymasq)))*1.01;
tfymasq = tfymasq/echelle;

% On sauvegarde avec la meme quantification
audiowrite(fichier,tfymasq,fe)

