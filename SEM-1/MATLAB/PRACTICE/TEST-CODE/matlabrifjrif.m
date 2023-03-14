Word = ['D', 'A', 'U', 'G', 'H', 'T', 'E', 'R'];
Total = length(perms(Word));

% Vowels : A, E, U (3 vowels)
% All vowels together = perm(DGHTR) - perm(AEU)

T = perms((Word(Word~='A' & Word~='E' & Word~='U')));
Term1 = length(T)

