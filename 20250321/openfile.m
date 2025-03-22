fid = fopen('magic.m', 'r');
count = 0;
while ~feof(fid) % eof 讀到檔案結束
    line = fgetl(fid)
    if isempty(line)
        break
    elseif ~strncmp(line,'%',1) % 找到「百分比 %」
        continue
    end
    count = count + 1;
end
fprintf('%d lines in MAGIC help\n',count);
fclose(fid);