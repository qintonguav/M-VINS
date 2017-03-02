clf;clc;
% change dataset_name here MH_01 MH_02 MH_03 MH_04 MH_05 V1_01 V1_03 V2_01
% V2_02 V2_03
dataset_name = 'V2_03'
load([dataset_name , '/ground_truth.csv']);
load([dataset_name , '/vins_result.csv']);

vins_result(:,1) = (vins_result(:,1) - ground_truth(1,1)) * 1e-9;
ground_truth(:,1) = (ground_truth(:,1) - ground_truth(1,1)) * 1e-9;
sum_path = 0;
for i = 2: size(vins_result,1)
    sum_path = sum_path + norm(vins_result(i,2:4) - vins_result(i-1,2:4));
end
sum_path

index_end = size(ground_truth,1);
index_begin = 0;
for i= 1:size(vins_result,1)
    if (vins_result(i, 1) == 0)
        index_begin = i;
        break;
    end
end


final_drift = ground_truth(index_end, 2:4) - vins_result(index_end + index_begin - 1,2:4)
drift_per = norm(final_drift) / sum_path

figure(1);
plot3(vins_result(:,2), vins_result(:,3), vins_result(:,4),'LineWidth',2); 
hold on;
plot3(ground_truth(:,2), ground_truth(:,3), ground_truth(:,4),'LineWidth',2); 
h=legend('VINS', 'Ground Truth');
set(h,'Fontsize',10);
title('3D Trajectory');

figure(2);
set(gcf,'outerposition',get(0,'screensize'));
subplot(3,3,[1 2]);
plot(vins_result(:,2), vins_result(:,3));
hold on;
plot(ground_truth(:,2), ground_truth(:,3));
h=legend('VINS', 'Ground Truth', -1);
set(h,'Fontsize',10);
title({[strrep(dataset_name,'_','\_'), ' result'];['x-y trajectory']});

subplot(3,3,3);
axis([0 1 0 3]);
s_length = ['total length(m): ', num2str(sum_path)];
s_drift = 'final drift(m): ';
%s_drift_per = ['drift percentage: ', num2str(drift_per)];
text(0,3,s_length);
text(0,2,s_drift);
text(0,1, num2str(final_drift));
%text(0,1,s_drift_per);
axis off;
hold on;

subplot(3,3,4);
plot(vins_result(index_begin:end,1), vins_result(index_begin:end,2));
hold on;
plot(ground_truth(:,1), ground_truth(:,2));
title('x position');

subplot(3,3,5);
plot(vins_result(index_begin:end,1), vins_result(index_begin:end,3));
hold on;
plot(ground_truth(:,1), ground_truth(:,3));
title('y position');

subplot(3,3,6);
plot(vins_result(index_begin:end,1), vins_result(index_begin:end,4));
hold on;
plot(ground_truth(:,1), ground_truth(:,4));
title('z position');


subplot(3,3,7);
plot(vins_result(index_begin:end,1), vins_result(index_begin:end,9));
hold on;
plot(ground_truth(:,1), ground_truth(:,9));
title('x velocity');

subplot(3,3,8);
plot(vins_result(index_begin:end,1), vins_result(index_begin:end,10));
hold on;
plot(ground_truth(:,1), ground_truth(:,10));
title('y velocity');

subplot(3,3,9);
plot(vins_result(index_begin:end,1), vins_result(index_begin:end,11));
hold on;
plot(ground_truth(:,1), ground_truth(:,11));
title('z velocity');

saveas(gcf, [dataset_name , '/result'], 'png'); 