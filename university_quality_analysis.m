%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%~~~~~~~~~~~~~~~ University Quality Analysis Using PCA ~~~~~~~~~~~~~~~~~~~~~~~~~
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pkg load statistics

% Variable Names
labels = {'Research Orientation', 'Practice', 'Exams Preparation', 'Support', 'Learning Atmosphere', 'Computers', 'Library', 'Scholarly Materials'};

% Dataset
Univ=[3.1 3.0 2.4 1.9 2.7 1.3 1.9 2.2
3.2	3.3	2.4	2.2	3.8	2.5	2.0	2.0
3.3	3.4	2.7	2.6	3.3	2.3	1.6	1.8
3.1	3.1	2.6	2.4	3.4	2.6	2.0	2.0
2.4	3.1	2.1	1.3	3.4	1.6	2.2	1.6
3.1	2.9	2.4	2.4	2.6	2.3	2.9	2.3
2.4	3.2	2.9	2.2	3.7	1.9	1.4	1.3
2.7	4.0	2.7	2.4	3.2	2.4	2.3	1.7
2.7	3.2	2.6	1.8	3.8	2.7	1.8	2.0
3.6	3.4	2.9	2.9	3.2	2.5	1.7	1.9
4.7	3.5	2.5	2.3	2.7	2.2	1.7	1.6
3.5	2.9	2.7	2.4	3.4	2.7	2.2	1.4
3.0	2.5	2.8	2.6	3.0	3.3	2.1	1.6
4.6	3.4	2.2	2.8	4.0	2.2	2.1	2.1
2.8	3.5	2.7	2.3	4.1	2.5	3.1	2.0
4.0	3.6	2.6	2.1	3.1	3.2	2.2	2.2
3.5	3.7	2.9	2.4	3.3	2.8	3.7	2.5
4.6	3.9	2.9	3.2	2.6	3.8	1.5	1.8
3.2	3.4	2.9	3.0	3.6	4.0	3.3	3.2
4.7	4.0	3.4	3.0	3.0	2.4	2.6	2.3
4.2	4.2	2.6	2.4	3.2	3.0	2.5	2.2
3.7	4.1	3.1	3.1	3.7	3.7	2.7	2.3
3.6	3.5	3.1	3.4	4.0	2.7	2.7	2.5
4.2	4.4	2.7	2.1	2.9	3.2	2.7	2.4
4.3	3.5	3.3	3.3	3.4	2.8	2.0	2.0
3.2	4.1	2.8	2.5	4.2	3.5	3.4	3.1
4.7	4.6	2.8	4.1	2.7	4.8	1.9	2.8
4.2	4.4	2.9	3.7	3.0	4.3	1.5	1.9
4.2	4.1	3.0	3.7	2.8	4.3	2.7	2.4
3.8	4.4	3.4	3.5	4.3	3.5	3.4	2.9
3.8	3.6	2.7	2.5	3.7	3.5	2.8	3.0
3.8	4.0	3.0	3.3	4.4	3.6	3.7	2.8
3.5	3.2	3.3	3.4	4.2	3.0	2.9	3.3
3.6	3.3	3.1	3.7	3.2	2.6	3.1	2.8
4.1	4.9	3.6	3.4	4.0	4.8	3.0	2.9
4.5	4.5	3.7	4.4	3.6	3.2	3.0	2.4];

% Data Transformation
Univ = 6 - Univ;

% Descriptives
[n, p] = size(Univ);
mu = mean(Univ)
sigma = cov(Univ)
P = corr(Univ)
medians = median(Univ)
stds = std(Univ)
figure('Position', [100 100 1000 500])
boxplot(Univ)
set(gca, 'XTickLabel', labels)
ylabel('Ratings')
title('Boxplots of Quality Criteria Ratings')

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% PCA - Covariance Matrix Approach
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

X = Univ;
[T, L] = eig(sigma);
eigenvalues = diag(L);
[eigenvalues, I] = sort(eigenvalues, 'descend');
T = T(:, I); L = L(:, I);
xbar = mean(X);
Xbar = repmat(xbar, [n, 1]);
Xstar = X - Xbar;
Z = Xstar * T;
prop = eigenvalues / sum(eigenvalues);
cum_prop = cumsum(prop);
lamda_bar = mean(eigenvalues);

% Kaiser Criterion
find(eigenvalues > lamda_bar)

% Screeplot
figure(2)
plot(1:p, eigenvalues)
hold on
plot(1:p, lamda_bar * ones(1,p))
xlabel('Principal Component')
ylabel('Eigenvalue')
title('Scree-Plot')
grid on
hold off

% Plot of Component Loadings
figure(3)
plot(T(:, 1), T(:, 2), '.')
hold on
quiver(zeros(8, 1), zeros(8, 1), T(:, 1), T(:, 2))
text(T(:, 1) + 0.015, T(:, 2) + 0.015, labels)
xlabel('Principal Component 1')
ylabel('Principal Component 2')
title('Plot of Principal Component Loadings')
grid on
hold off

% Plot of Component Scores
figure(4)
plot(Z(:, 1), Z(:, 2), '.')
xlabel('First Principal Component Score')
ylabel('Second Principal Component Score')
title('Plot of Principal Component Scores')
grid on

% Northern vs Southern Universities
north = [1 2 3 4 5 6 7 8 10 11 13 14 15 16 17 19 21 22 24 26 30 31 32 33 34 35];
south = [9 12 18 20 23 25 27 28 29 36];
figure(5)
plot(Z(north, 1), Z(north, 2), 'r.')
hold on
plot(Z(south, 1), Z(south, 2), 'b.')
xlabel('Principal Component 1')
ylabel('Principal Component 2')
title('Northern vs Southern European Universities')
legend('North', 'South')
grid on
hold off

% University Quality Rankings
[sorted_univ, I] = sort(Z(:, 1));

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% PCA - Correlation Matrix Approach
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

stds = repmat(std(X), [n, 1]);
Xtilde = Xstar./stds;
P = cov(Xtilde);
[T_new, L_new] = eig(P);
new_eigenvalues = diag(L_new);
[new_eigenvalues, I] = sort(new_eigenvalues, 'descend');
T_new = T_new(:, I); L_new = L_new(I, I);
scores = Xtilde * T_new;
new_prop = new_eigenvalues / sum(new_eigenvalues);
new_cumprop = cumsum(new_prop);
new_lamda_bar = mean(new_eigenvalues);

% Kaiser Criterion
find(new_eigenvalues > new_lamda_bar)

% Screeplot
figure(6)
plot(1:p, new_eigenvalues)
hold on
plot(1:p, new_lamda_bar * ones(1,p))
xlabel('Principal Component')
ylabel('Eigenvalue')
title('Scree-Plot')
grid on
hold off

% University Rankings
[sorted, I] = sort(scores(:, 1));

% Plot of Component Loadings
figure(7)
plot(T_new(:,1), T_new(:,2), '.')
hold on
quiver(zeros(8, 1), zeros(8, 1), T_new(:, 1), T_new(:, 2))
text(T_new(:, 1) + 0.015, T_new(:, 2) + 0.015, labels)
xlabel('Principal Component 1')
ylabel('Principal Component 2')
title('Biplot of Principal Component Loadings')
grid on
hold off

% Plot of Component Scores
figure(8)
plot(scores(:, 1), scores(:, 2), '.')
xlabel('First Principal Component Score')
ylabel('Second Principal Component Score')
title('Plot of Principal Component Scores')
grid on

% Northern vs Southern Universities
north = [1 2 3 4 5 6 7 8 10 11 13 14 15 16 17 19 21 22 24 26 30 31 32 33 34 35];
south = [9 12 18 20 23 25 27 28 29 36];
figure(9)
plot(scores(north, 1), scores(north, 2), 'r.')
hold on
plot(scores(south, 1), scores(south, 2), 'b.')
xlabel('Principal Component 1')
ylabel('Principal Component 2')
title('Northern vs Southern European Universities')
legend('North', 'South')
grid on
hold off

% University Quality Rankings
[sorted_univ_new, I] = sort(scores(:, 1));



