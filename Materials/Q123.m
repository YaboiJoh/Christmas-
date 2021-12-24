% lets see if this works tomorrow.

%Cylinder in tension BC
diameter = 35e-3;
length = 400e-3;
force = 80e3;

%Material Properties
materials = ["Aluminium";"Steel";"Pine"];
E = [70e9;210e9;16e9];
rho = [2600;7800;500];
yieldStress = [200e6;350e6;90e6];

%Equations 
area = pi*(diameter/2)^2;
sigma = force / area;
epsilon = sigma / E;
extension = epsilon * length;

%Failure Properties
SF = yieldStress / sigma; %no permanent deformation as sigma < yield
failureLoad = SF * force;

desiredSF = 2;
newStress = yieldStress ./ desiredSF;
newArea = force ./ newStress;
newDiameter = 2 .* sqrt((force .* desiredSF)./(pi .* yieldStress));
newEpsilon = newStress ./ E;
newExtension = newEpsilon .* length;
newVolume = newArea .* length;
mass = rho .* newVolume;
data = table(materials, newDiameter, newExtension, mass);

results = table( materials, round(newDiameter,3,'significant'), round(newExtension,3,'significant'), round(mass,3,'significant'));

writetable(results,'Answers123.csv');






