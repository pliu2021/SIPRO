function [N, Xe] = ore(equarec, N, x0, varargin)
dim = length(x0); % dimension du vecteur d'etat
Duree = N(2) - N(1) + 1; % duree de la resolution
N = N(1):N(2);
Xe = zeros(Duree, dim);
xe = x0;
indmatlab = 1;
for n = N
   Xe(indmatlab,:) = xe';
   xe = equarec(n, xe, varargin{:});
   indmatlab = indmatlab + 1;
end
