name_num=1;
impact_before=zeros(28,14);
impact_after_1=zeros(28,14);
impact_after_2=zeros(28,14);
start_AngleZ=zeros(28,1);

for name_num = 7 : 28
    if(name_num~=10 && name_num~=13 && name_num~=16 && name_num~=24 && name_num~=25 && name_num~=26)
        
        name_str = num2str(name_num,'%03d');
        name_file=[name_str,'.csv'];
        s_IMU=importdata(name_file);                        %��������
        
        [azmin_temp,time_min_temp]=min(s_IMU.data(:,4));    %az��С
        
        impact_before((name_num),:) = s_IMU.data(time_min_temp,:);
        impact_after_1((name_num),:) = s_IMU.data(time_min_temp+3,:);
        impact_after_2((name_num),:) = s_IMU.data(time_min_temp+10,:);
        
        start_AngleZ((name_num),1)=s_IMU.data(1,10);
        
    else
        continue;
    end;
    
end;

f1=figure('Name','ƫ���Ƕ�','NumberTitle','off');
scatter(start_AngleZ(:,1),impact_before(:,10),'b');
hold on;
index_impact_after_1=find(impact_after_1(:,10)<0);
impact_after_1(index_impact_after_1,10)=impact_after_1(index_impact_after_1,10)+360;
scatter(start_AngleZ(:,1),impact_after_1(:,10),'filled');
hold on;
% index_impact_after_2=find(impact_after_2(:,10)<0);
% impact_after_2(index_impact_after_2,10)=impact_after_2(index_impact_after_2,10)+360;
% scatter(start_AngleZ(:,1),impact_after_2(:,10),'k');
% hold on;
x=(170:180);
y=x;
plot(x,y,'LineWidth',2);
legend('��ײǰ�Ƕ�','��ײ��Ƕ�','y=x');
axis([170 177 170 200]);
xlabel('�ڷ���̬(deg)');
% ylabel('��ײ�Ƕ�(deg)');

f2=figure('Name','ƫ�����ٶ�','NumberTitle','off');
scatter(start_AngleZ(:,1),impact_before(:,7));
hold on;
scatter(start_AngleZ(:,1),impact_after_1(:,7),'filled');
hold on;
% scatter(start_AngleZ(:,1),impact_after_2(:,7),'k');
axis([170 177 -5 35]);
legend('��ײǰ���ٶ�(deg/s)','��ײ����ٶ�(deg/s)');
xlabel('�ڷ���̬(deg)');

f3=figure('Name','�����Ƕ�','NumberTitle','off');
scatter(start_AngleZ(:,1),impact_before(:,8),'b');
hold on;
scatter(start_AngleZ(:,1),impact_after_1(:,8),'filled');
hold on;
% index_impact_after_2=find(impact_after_2(:,10)<0);
% impact_after_2(index_impact_after_2,10)=impact_after_2(index_impact_after_2,10)+360;
% scatter(start_AngleZ(:,1),impact_after_2(:,10),'k');
% hold on;
legend('��ײǰ�Ƕ�','��ײ��Ƕ�','y=x');
axis([170 177 0 8]);
xlabel('�ڷ���̬(deg)');
% ylabel('��ײ�Ƕ�(deg)');

f4=figure('Name','�������ٶ�','NumberTitle','off');
scatter(start_AngleZ(:,1),impact_before(:,5));
hold on;
scatter(start_AngleZ(:,1),impact_after_1(:,5),'filled');
hold on;
% scatter(start_AngleZ(:,1),impact_after_2(:,7),'k');
axis([170 177 -50 30]);
legend('��ײǰ���ٶ�(deg/s)','��ײ����ٶ�(deg/s)');
xlabel('�ڷ���̬(deg)');

% d_impact_angle=zeros(28,1);
% d_impact_w=zeros(28,1);
% d_x=[1:27,1];
% d_impact_angle=minus(impact_after_1(:,10),impact_after_1(:,10));
% d_impact_w=minus(impact_after_1(:,7),impact_before(:,7));
% f3=scatter(d_x,d_impact_angle,'filled');
% hold on;
% scatter(d_x,d_impact_w);
