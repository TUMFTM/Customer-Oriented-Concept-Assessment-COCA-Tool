function SpiderAPP_prop_changed(data,ax)
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
rng = repmat (min_max_rng, r, 1);                  %repmat - repeat Matrix, so oft in Vektorform wie einzelne Datenelemente

% set to add plot
set(ax,'nextplot','add');

% clear figure and set limits; make the backgorund white
set(ax,'visible','off'); set(ax,'color','w');      
set(ax,'xlim',[-1.25 1.25],'ylim',[-1.25 1.25]); axis(ax,'equal','manual') 
ax.Visible = 'off'; set(ax,'color','w');

% define data case colors
col = color_index(c);

% Define the portions of the Spider Diagramm according to the number of data
angw = linspace(0,2*pi,r+1)';
ang = angw(1:end-1);


%% 2) Plot the data
% define the axis locations
start = [zeros(1,r); cos(ang')];
stop = [zeros(1,r); sin(ang')];

% Transformation der Daten
data = data - 4;
A_xaxis = data .* start(2,:)';
A_xaxis = [A_xaxis; A_xaxis(1,:)];   % Startwert noch an das Ende anfügen, weil Ringschluss
A_xaxis = A_xaxis *(1/6);

A_yaxis = data .* stop(2,:)';
A_yaxis = [A_yaxis; A_yaxis(1,:)];  
A_yaxis = A_yaxis *(1/6);


% plot the data
o = plot(ax,A_xaxis,A_yaxis, '--');  %plottet nicht
% o = plot(f,angw*ones(1,c),magw); %polar
% set color of the lines
for ii = 1:c; set(o(ii),'color',col(ii,:),'linewidth',1.5); end   
% apply the legend
%temp = legend(o,leg,'location','southwestoutside');            % Legende

close
end


%% Subfunction

function [v] = rd(v,dec)
% quick round function (to specified decimal)
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
