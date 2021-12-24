
materials = ["Mild steel"; "Al alloy"; "PVC"; "Glass"; "GFRP"; "Chipboard"; "Pine"];
youngsModulus = [210e9;70e9;3e9;70e9;13e9;1.9e9;16e9];
failureStress = [350e9;200e9;50e9;50e9;180e9;12e9;45e9];
rho = [7.8;2.6;1.5;2.5;1.5;0.7;0.5];

index1 = sqrt(failureStress) ./ (rho .* 1000);
index2 = nthroot(youngsModulus,3) ./ (rho .* 1000);

indexComparison = table(materials, index1, index2);
writetable(indexComparison,'answers3.csv');

