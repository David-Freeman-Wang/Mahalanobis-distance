%% Program for  Mahalanobis distance
clc;
clear;
close all;

%% Generate 1000 random points
C = 5*[1 0.1; 0.1 2];
Xa = [0;0];

Xb =  mvnrnd(Xa,C,1000); % generate samples for Gaussian/Normal distribtuion

%% Create a mesh for plotting later
xLimit =  max(Xb(:,1));
yLimit =  max(Xb(:,2));

xLength = 1000;
yLength = 1000;

xRange = linspace(-1*xLimit, xLimit, xLength);
yRange = linspace(-1*yLimit, yLimit, yLength);

[X,Y] = meshgrid(xRange,yRange);

%% Obtain the Mahalanobis distances and the pdfs

distanceMatrix = NaN(xLength,yLength);
pdfMatrix = NaN(xLength,yLength);

for i=1:1:xLength
    for j=1:1:yLength
        distanceMatrix(i,j) = mahaDistance([xRange(i); yRange(j)], C);
        pdfMatrix(i,j) = pdf([xRange(i); yRange(j)], C);
    end
    
end

%% Visualize the results
figure()
plot(Xa(1),Xa(2),'o','DisplayName','Point A');
hold on;
plot(Xb(:,1), Xb(:,2),'x','DisplayName','Point B')
xlabel('x'); ylabel('y')
axis equal;
legend
title('Random Distribution of Point B')

figure()
contour(X,Y,distanceMatrix,'ShowText','on');
xlabel('x'); ylabel('y')
axis equal;
title('Mahalanobis Distance')

figure()
contour(X,Y,pdfMatrix,'ShowText','on');
xlabel('x'); ylabel('y')
axis equal;
title('Probability density')

% figure()
% contour(X,Y,distanceMatrix,'ShowText','on','DisplayName','Distance contour');
% hold on;
% contour(X,Y,pdfMatrix,'k--','ShowText','on','DisplayName','Pdf contour');
% xlabel('x'); ylabel('y')
% axis equal;
% legend
% title('Mahalanobis Distance and Probability')

figure()
surf(X,Y,pdfMatrix,'FaceColor',[0.4 0.6 0.7]);
xlabel('x'); ylabel('y')
title('Probability density')





