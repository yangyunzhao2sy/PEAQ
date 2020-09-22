bitrates = [128, 320];
EC = {'1000' '1500' '2000' '2500' '3000' '3500' '4000'};
fp=fopen('eecs_ODG.txt','a');
for b=2:2
    for j=1:7
        cover_path = ['D:\1AYYZ\sample\mp3_10s\', num2str(bitrates(b)), '\wav\'];
        stego_path=['G:\1AYYZ\Paper\ICME\sample\DB\eecs320\', EC{j}, '\wav\'];
        output_path=['eecs320_' EC{j} '.txt'];
        fileExt = '*.wav';  
        cover = dir(fullfile(cover_path,fileExt));
        stego = dir(fullfile(stego_path,fileExt));
        len = size(cover,1);  
        for i=1:len  
        cover_Name = strcat(cover_path,cover(i,1).name);
        stego_Name = strcat(stego_path,stego(i,1).name);
        %stego = strrep(fileName,'tempcover320','temp320_10');
        PQevalAudio (cover_Name, stego_Name, [0,0], [80000,80000],output_path);
        end; 
        odg_txt=load(output_path);
        ODG=mean(odg_txt);
        fprintf(fp,'bitrate: %d, EC: %s,ODG: %d, \n', bitrates(b), EC{j},ODG);
    end
end
