%another set of qs

%beam in compression BCs
length = 2;
width = 100e-3;
desiredStiffness = 100e3

%Material properties
materials = ["Mild steel"; "Al alloy"; "PVC"; "Glass"; "GFRP"; "Chipboard"; "Pine"];
youngsModulus = [210e9;70e9;3e9;70e9;13e9;1.9e9;16e9];
failureStress = [350e9;200e9;50e9;50e9;180e9;12e9;45e9];
rho = [7.8;2.6;1.5;2.5;1.5;0.7;0.5];
costRatio = [0.3;1.3;1.0;0.9;1.7;0.6;0.2];

%calcs
heights = nthroot( (desiredStiffness .* (length.^3)) ./ (4 .* youngsModulus .* width)  ,3);
inertias = (width .* (heights.^3)) ./ 12;
maxForces = (2 .* width .* (heights.^2) .* failureStress)/(3 .* length);

weight = width .* heights .* length .* rho * 10000; %g = 10, rho in tonnes
cost = (weight/10) .* costRatio;
results = table(materials, heights, maxForces, weight, cost);
writetable(results,'Answers45.csv');

%neglect rest of sheet who cares. i just wanted to code this up tbh