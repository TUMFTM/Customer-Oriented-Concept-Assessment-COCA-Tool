function spiderAPP(data,lbl,ax)
%% Description: this function plots the Spider diagramm according to the number of given data
%% Authors: Ferdinand Shockenhoff, Maximilian Bayerlein, Lorenzo Nicoletti
%% Last Update: 15.09.2020

%% Implementation:
%1) Initialize the MATLAB fig options and the fig color
%2) Plot the base spider diagramm
%3) Plot the Red reference line
%4) Plot the data 

%% 1) Initialize the MATLAB fig options and the fig color
% size segments and number of cases
[r c] = size(data);
min_max_rng = [4 10];
rng = repmat (min_max_rng, r, 1);          

%Initialize the axes proprierties
legend(ax,'off'); reset(ax); cla(ax); hold(ax,'on'); ax.BackgroundColor = [1,1,1]; 

% set to add plot
set(ax,'nextplot','add');

% clear figure and set limits; make the backgorund white
set(ax,'visible','off'); set(ax,'color','w');        %macht 2D plot unsichtbar und den Hintergrund weiß
set(ax,'xlim',[-1.25 1.25],'ylim',[-1.25 1.25]); axis(ax,'equal','manual') %Bestimmt Größe des 2D plots
ax.Visible = 'off'; set(ax,'color','w');

% Define the color scale
col = color_index(c);

% Adapaption Krapf:
% Define the color scale for TUM colors (overwrite col)
col = [ 162 173 0
        227 114 34
        152 198 234
        0 101 189] ./255;

% Define the portions of the Spider Diagramm according to the number of data
angw = linspace(0,2*pi,r+1)';
ang = angw(1:end-1);
angs = [ang(:); ang(1)];

%% 2) Plot the base spider diagramm

% define the axis locations (polar coordinate system)
start = [zeros(1,r); cos(ang')];
stop = [zeros(1,r); sin(ang')];

% Plot the Main Axes of the Spider Diagramm
plot(ax,start,stop,'color','k','linestyle','-','linewidth', 1); hold(ax, 'on'); axis equal;  % öffnet figure...

% Calculate axes markers
inc = (2/6):(1/6):1; tx = 0.05 * ones(1,6);

% loop each axis ang plot the line markers and labels
for ii = 1:r
	
    %Plot Thick lines in the ii_te Spider diagram area portion
     plot(ax,[cos(angs(ii)) * inc; cos(angs(ii+1)) * inc ], ...
		[sin(angs(ii)) * inc; sin(angs(ii+1)) * inc],'color',[0.7 0.7 0.7],'linewidth', 0.3);
        
	% Add numbers to the Thickmarks
	for jj = 1:5 
            temp = text(ax,cos(angs(ii)) * inc(jj) + sin(angs(ii)) * tx(jj), ...
			sin(angs(ii)) * inc(jj) - cos(angs(ii)) * tx(jj), ...
			num2str(rd(rng(ii,1) + inc(jj)*diff(rng(ii,:)),-2)), ...
			'fontsize',15);
        
		%Flip the text alignment for lower axes
		if angs(ii) >= pi
			set(temp,'HorizontalAlignment','right');
        end
    end
    
	%Label the axis
	temp = text(ax,cos(angs(ii)) * 1.1 + sin(angs(ii)) * 0, ...
			sin(angs(ii)) * 1.1 - cos(angs(ii)) * 0, ...
			char(lbl(ii,:)),'fontsize',16);
        
	%Flip the text alignment for right side axes
	if angs(ii) > pi/2 && angs(ii) < 3*pi/2
		set(temp,'HorizontalAlignment','right');
	end
end

%% 3) Plot the Red reference line

inc = (1/6); tx = 0.05 * ones(1,6); tl = 0:.25:1;
% loop each axis ang plot the line markers and labels add axes
for ii = 1:r
	% plot tick lines      
     plot(ax,[cos(angs(ii)) * inc; cos(angs(ii+1)) * inc ], ...
		[sin(angs(ii)) * inc; sin(angs(ii+1)) * inc],'color','r','linewidth', 1 );
        
	% label the tick marks
	for jj = 1:1
            temp = text(ax,cos(angs(ii)) * inc(jj) + sin(angs(ii)) * tx(jj), ...
			sin(angs(ii)) * inc(jj) - cos(angs(ii)) * tx(jj), ...
			num2str(rd(rng(ii,1) + inc(jj)*diff(rng(ii,:)),-2)), ...
			'fontsize',15);
		% flip the text alignment for lower axes
		if angs(ii) >= pi
			set(temp,'HorizontalAlignment','right');
		end
	end
	% label each axis
	temp = text(ax,cos(angs(ii)) * 1.1 + sin(angs(ii)) * 0, ...
			sin(angs(ii)) * 1.1 - cos(angs(ii)) * 0, ...
			char(lbl(ii,:)),'fontsize',16);
	% flip the text alignment for right side axes
	if angs(ii) > pi/2 && angs(ii) < 3*pi/2
		set(temp,'HorizontalAlignment','right');
	end
end

%% 4) Plot the data 

%Recalibrate the daza according to the choosen range defined above
data = data - 4;
A_xaxis = data .* start(2,:)';
A_xaxis = [A_xaxis; A_xaxis(1,:)];   
A_xaxis = A_xaxis *(1/6);

A_yaxis = data .* stop(2,:)';
A_yaxis = [A_yaxis; A_yaxis(1,:)];  
A_yaxis = A_yaxis *(1/6);


o = plot(ax,A_xaxis,A_yaxis);  %plottet nicht

% set color of the lines
for ii = 1:c; set(o(ii),'color',col(ii,:),'linewidth',3.3); end 

hold on
close
end

%% Subfunctions

function [v] = rd(v,dec)

%% Description: quick round function (to specified decimal)
if nargin == 1; dec = 0; end

v = v / 10^dec;
v = round(v);
v = v * 10^dec;
end



function [val] = color_index(len)

if len == 1
	val = [0 0 1];
else
	% initial color posibilities (no white)
	% default color scale
	col = [	0 0 1
            0 1 1
            0 1 0
			1 1 1
			1 0 1
			1 0 0];

	% reduce if fewer than 6 items are needed (no interpolation needed)
	switch len
		case 1, col([2 3 4 5 6 7],:) = [];
		case 2, col([2 3 4 5 6],:) = [];
		case 3, col([3 4 5 6],:) = [];
		case 4, col([3 5 6],:) = [];
		case 5, col([5 6],:) = [];
		case 6, col(6,:) = [];
	end

	% number of requested colors
	val = zeros(len,3); val(:,3) = linspace(0,1,len)';

 	% interpolate to fill in colors                 
 	val(:,1) = interp1q(linspace(0,1,size(col,1))',col(:,1),val(:,3));
 	val(:,2) = interp1q(linspace(0,1,size(col,1))',col(:,2),val(:,3));
 	val(:,3) = interp1q(linspace(0,1,size(col,1))',col(:,3),val(:,3));
   
    val = [0 1 1
           0 1 0
           1 1 0
           0 0 1];
end
    
end

