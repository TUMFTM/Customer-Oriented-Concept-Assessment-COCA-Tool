function [KW, G] = wiki()
%% Description: this function contains the characteristcs, their units and the limits (latter derived from the database)

%       Characteristic                Unit       Row    "Limits"          Steigung
KW   = {'Acceleration',               's',        6,    13,    2.8,         -0.5;
        'Top speed',                  'km/h',     7,    250,   80,          0.5;
        'Climbing ability',           '%',        8,    42,    25,          1;
        'Lateral acceleration',       'g',        9,    1.8,   1,            0.5;
        'Turning cycle',              'm',        10,   13.5,  9,           -0.5;
        'Asset Costs',                'T€',       41,   60,    0,           -0.7;
        'Weight',                     'kg',       39,   2100,  700,         -0.7;
        'Consumption',                '€/100km',  40,   16,    0,           -0.7;
        'Headroom front',             'mm',       25,   1150,  900,         0.6;
        'Legroom rear',               'mm',       27,   1020,  670,         0.5;
        'Headroom rear',              'mm',       26,   1110,  860,         0.6;
        'Acoustics',                  'dB',       28,   84,    55,          -0.85;
        'Trunk volume',               'l',        31,   750,   50,          0.6;
        'Payload',                    'kg',       35,   880,   80,          0.65;
        'Number of seats',            '-',        34,   9,     1,           0.5;
        'Range',                      'km',       32,   1000,  50,          0.9;
        'Charging time',              'min',      33,   150,   0,           -0.55;
        'Overhang front',             'mm',       19,   1100,  600,         -0.6;
        'Overhang rear',              'mm',       20,   1400,  300,         -.7;
        'Wheelbase',                  'mm',       18,   3500,  1900,        0.55;
        'Ratio Height/Width',         '-',        16,   1.15,  0.5,         -1;
        'Ratio Length/Height',        '-',        17,   4.35,  1.6,         0.7;
        'Wheel diameter',             'mm',       22,   800,   500,         0.5
};

%Weighting factors for the custormer properties
G = {   'Vehicle dynamics',             [1 1 1 1 1];
        'Costs',                        [1 1 1];
        'Comfort',                      [1 1 1 1];
        'Suitability',                  [1 1 1 1 1];
        'Design',                       [1 1 1 1 1 1];
        'Safety'                        [1,1,1];
        };

end