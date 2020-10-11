ffmpeg -y -i z.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb z.ts

ffmpeg -i z.ts -c copy -map 0 -f segment -segment_list z.m3u8 -segment_time 1 z_%03d.ts  
