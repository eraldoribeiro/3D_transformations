function display_cube()
%
% This function displays a 3-D cube. 
%

% The shape to be transformed  
pts = [ 0.0  0.5  0.0;    % 1
        0.0  0.0  1.0;    % 2
        0.0  1.0  0.0;    % 3
        0.0  1.0  1.0;    % 4
        1.0  0.0  0.0;    % 5
        1.0  0.0  1.0;    % 6
        1.0  1.0  0.0;    % 7
        1.0  1.0  1.0 ]'  % 8 

%% 
% First, we display the original shape in blue. The shape will then
% be transformed and the result is displayed in red. All shapes will be
% displayed superimposed on a single plot.
    
% Create a new figure dialog and set the background color to white.      
figure; 
set(gcf, 'color','w');     
set(gcf, 'Position', [0, 0, 100, 100])
    
% Show original shape in blue
showCube(pts,'b');  
view(62,11)  

% Transformation matrix (scaling)
S_tilde = [ 0.5 0.0 0.0;
            0.0 0.5 0.0;
            0.0 0.0 0.5]; 


% Apply transformation 
pts_prime = S_tilde * pts; 

% Show transformed shape in red
hold on;
showCube(pts_prime,'r');   

view(62,11)  
return 


function showCube(x, c )  
%% showCube 
%
% This function plots the cube shape in 3-D. 
%
% Input: 
%   x: (x,y,z) coordinates as 3xM matrix 
%   c: line color 
%
%


hold on;
    
% Indices of bottom square  
idx1 = [ 1 5 7 3 1 ];   
plot3(x(1,idx1),x(2,idx1),x(3,idx1),'Color',c, 'Marker','o','LineWidth',4);
  
% Indices of top square
idx2 = [ 2 6 8 4 2 ];   
plot3(x(1,idx2),x(2,idx2),x(3,idx2),'Color',c, 'Marker','o','LineWidth',4);
 
% Link the two squares
plot3(x(1,1:2),x(2,1:2),x(3,1:2),'Color',c, 'Marker','o','LineWidth',4, 'MarkerSize', 8, 'MarkerFaceColor','r');
plot3(x(1,5:6),x(2,5:6),x(3,5:6),'Color',c, 'Marker','o','LineWidth',4, 'MarkerSize', 8, 'MarkerFaceColor','r');
plot3(x(1,7:8),x(2,7:8),x(3,7:8),'Color',c, 'Marker','o','LineWidth',4, 'MarkerSize', 8, 'MarkerFaceColor','r');
plot3(x(1,3:4),x(2,3:4),x(3,3:4),'Color',c, 'Marker','o','LineWidth',4, 'MarkerSize', 8, 'MarkerFaceColor','r');

grid on;

hold off; 

return 

