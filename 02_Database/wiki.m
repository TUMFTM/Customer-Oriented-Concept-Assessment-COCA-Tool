function [KW, G] = wiki()
%% Description: this function contains the characteristcs, their units and the limits (latter derived from the database)

%       Characteristic                Unit       Row    "Limits"          Steigung
KW   = {'Acceleration',               's',        6,    13,    2.8,         -0.5; %1
        'Top speed',                  'km/h',     7,    250,   80,          0.5;  %2
        'Climbing ability',           '%',        8,    42,    25,          1;    %3
        'Lateral acceleration',       'g',        9,    1.8,   1,            0.5; %4
        'Turning cycle',              'm',        10,   13.5,  9,           -0.5; %5
        'Asset Costs',                'T€',       41,   60,    0,           -0.7; %6
        'Combined Operational Costs', '€/100km',  39,   67.68, 7.6,         -0.7; %7
        'Consumption',                '€/100km',  40,   16,    0,           -0.7; %8
        'Headroom front',             'mm',       25,   1150,  900,         0.6;  %9
        'Legroom rear',               'mm',       27,   1020,  670,         0.5;  %10
        'Headroom rear',              'mm',       26,   1110,  860,         0.6;  %11
        'Acoustics',                  'dB',       28,   84,    55,          -0.85;%12
        'Trunk volume',               'l',        31,   750,   50,          0.6;  %13
        'Payload',                    'kg',       35,   880,   80,          0.65; %14
        'Number of seats',            '-',        34,   9,     1,           0.5;  %15
        'Range',                      'km',       32,   1000,  50,          0.9;  %16
<<<<<<< HEAD
        'Charging time',              'min',      33,   150,   5,           -0.55;%17
        'Overhang front',             'mm',       19,   1100,  600,         -0.6; %18
        'Overhang rear',              'mm',       20,   1400,  300,         -0.7;  %19
        'Wheelbase',                  'mm',       18,   3500,  1900,        0.55; %20
        'Ratio Height/Width',         '-',        16,   1.15,  0.5,         -1;   %21
        'Ratio Length/Height',        '-',        17,   4.35,  1.6,         0.7;  %22
        'Wheel diameter',             'mm',       22,   800,   500,         0.5   %23
=======
        'Overhang front',             'mm',       19,   1100,  600,         -0.6; %17
        'Overhang rear',              'mm',       20,   1400,  300,         -.7;  %18
        'Wheelbase',                  'mm',       18,   3500,  1900,        0.55; %19
        'Ratio Height/Width',         '-',        16,   1.15,  0.5,         -1;   %20
        'Ratio Length/Height',        '-',        17,   4.35,  1.6,         0.7;  %21
        'Wheel diameter',             'mm',       22,   800,   500,         0.5   %22
>>>>>>> c1111418298263937bfd73917e92c44516624cb1
};

%Weighting factors for the custormer properties
G = {   'Vehicle dynamics',             [1 1 1 1 1];
        'Costs',                        [1 1 1];
        'Comfort',                      [1 1 1 1];
        'Suitability',                  [1 1 1 1];
        'Design',                       [1 1 1 1 1 1];
        'Safety'                        [1,1,1];
        };

end