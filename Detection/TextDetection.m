% Lire l'image
imageCouleur = imread('OIP.jpg');
imageNiveauGris = rgb2gray(imageCouleur);

% Détection des contours
imageContours = edge(imageNiveauGris, 'Canny');

% Analyse des régions en utilisant regionprops
infosRegions = regionprops(imageContours, 'BoundingBox');

% Afficher les résultats
figure;
imshow(imageCouleur);
hold on;

% Boucle pour encadrer les régions détectées en rouge
for i = 1:numel(infosRegions)
    rectangle('Position', infosRegions(i).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
end

% Colorer le texte et les contours en rouge
rouge = cat(3, ones(size(imageContours)), zeros(size(imageContours)), zeros(size(imageContours)));
h = imshow(rouge);
set(h, 'AlphaData', imageContours * 0.5);

title('Régions de texte détectées');
hold off;
