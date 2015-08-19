function [] = runVideo( filename, frameRate, time)
%RUNVIDEO Summary of this function goes here
%   Detailed explanation goes here

videobj = videoinput(); % Need parameters
set(vidobj, 'LoggingMode', 'disk');

logfile = videoWriter(filename, 'Uncompressed AVI');
vidobj.DiskLogger = logfile;

start(vidobj);
wait(vidobj, time);

while(vidobj.Framesaquired ~= vidobj.DiskLoggerFrameCount)
    pause(.1);
end

delete(vidobj);
clear(vidobj);

end

