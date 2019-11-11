name_num=5;
befor_impact=zeros(13,11);
start_AngleZ=zeros(6,1);

for name_num = 1 : 28
    if(name_num~=10 && name_num~=24 && name_num~=25 && name_num~=26)
        
        name_str = num2str(name_num,'%03d');
        name_file=[name_str,'.csv'];
        s_IMU=importdata(name_file);
        
        [azmin_temp,time_min_temp]=min(s_IMU.data(:,4));    %az
        befor_impact((name_num),:) = s_IMU.data(time_min_temp-10,:);
        
        start_AngleZ((name_num),1)=s_IMU.data(1,10);
        
    else
        continue;
    end;
    
end;

f1=figure('Name','Æ«º½½Ç¶È','NumberTitle','off');
scatter(start_AngleZ(:,1),befor_impact(:,10),'LineWidth',2);
legend('AngleZ(deg)');

f2=figure('Name','Æ«º½½ÇËÙ¶È','NumberTitle','off');
scatter(start_AngleZ(:,1),befor_impact(:,7),'LineWidth',2);
legend('wz(deg/s)');

