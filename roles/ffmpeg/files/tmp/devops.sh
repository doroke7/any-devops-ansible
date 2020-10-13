ffmpeg -y -i "dist/avi.avi" "dist/avi.mp4"

ffmpeg -y -i "dist/wmv.wmv" -c:v libx264 -crf 23 -c:a libfdk_aac -q:a 100 "dist/wmv.mp4"

# rm to mp4
ffmpeg -y -i "dist/rm.rm" -c:v h264 -c:a libfdk_aac "dist/rm.mp4"

# rmvb to mp4
ffmpeg -y -i "dist/rmvb.rmvb" -c:v h264 -c:a libfdk_aac "dist/rmvb.mp4"










# mp4 to ts
ffmpeg -y -i fff1b353d64ee65f72f7acbb985d8af0.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb fff1b353d64ee65f72f7acbb985d8af0.ts


ffmpeg -i fff1b353d64ee65f72f7acbb985d8af0.ts -c copy -map 0 -f segment -segment_list fff1b353d64ee65f72f7acbb985d8af0.m3u8 -segment_time 1 fff1b353d64ee65f72f7acbb985d8af0_%03d.ts  
