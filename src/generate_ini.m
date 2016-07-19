iniFileName = 'Cam_Paras.ini';

if exist('cameraID', 'var')
    if ~isempty(cameraID)
        iniFileName = ['Cam_Paras_' num2str(cameraID) '.ini'];
    end
end

fileID = fopen(iniFileName,'w');

fprintf(fileID, [num2str(fc_left(1)) ' ' num2str(fc_left(2)) ' ' num2str(cc_left(1)) ' ' num2str(cc_left(2)) '\r\n']);
fprintf(fileID, [num2str(fc_right(1)) ' ' num2str(fc_right(2)) ' ' num2str(cc_right(1)) ' ' num2str(cc_right(2)) '\r\n']);

my_rod = round(rodrigues(om),5);
my_T = round(T,5);

fprintf(fileID, [num2str(my_rod(1,1)) ' ' num2str(my_rod(1,2)) ' ' num2str(my_rod(1,3)) '\r\n']);
fprintf(fileID, [num2str(my_rod(2,1)) ' ' num2str(my_rod(2,2)) ' ' num2str(my_rod(2,3)) '\r\n']);
fprintf(fileID, [num2str(my_rod(3,1)) ' ' num2str(my_rod(3,2)) ' ' num2str(my_rod(3,3)) '\r\n']);
fprintf(fileID, [num2str(my_T(1)) ' ' num2str(my_T(2)) ' ' num2str(my_T(3))]);
fclose(fileID);

fprintf(1, 'ini file created\n');