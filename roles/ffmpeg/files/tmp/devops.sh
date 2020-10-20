ffmpeg -y -i "dist/avi.avi" "dist/avi.mp4"

ffmpeg -y -i "dist/wmv.wmv" -c:v libx264 -crf 23 -c:a libfdk_aac -q:a 100 "dist/wmv.mp4"

# rm to mp4
ffmpeg -y -i "dist/rm.rm" -c:v h264 -c:a libfdk_aac "dist/rm.mp4"

# rmvb to mp4
ffmpeg -y -i "dist/rmvb.rmvb" -c:v h264 -c:a libfdk_aac "dist/rmvb.mp4"










# mp4 to ts
ffmpeg -y -i fff1b353d64ee65f72f7acbb985d8af0.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb fff1b353d64ee65f72f7acbb985d8af0.ts


ffmpeg -i fff1b353d64ee65f72f7acbb985d8af0.ts -c copy -map 0 -f segment -segment_list fff1b353d64ee65f72f7acbb985d8af0.m3u8 -segment_time 1 fff1b353d64ee65f72f7acbb985d8af0_%03d.ts  


# 切片快 但是 似乎 下载慢
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -codec: copy -start_number 0 -hls_time 4 -hls_list_size 0 -f hls a09403dce1b010bbc7aef314c1197419.m3u8


# 20201020 下载速度慢
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -profile:v baseline -level 3.0 -start_number 0 -hls_time 5 -hls_list_size 0 -f hls a09403dce1b010bbc7aef314c1197419.m3u8

# 20201021 切片快
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -codec copy -vbsf h264_mp4toannexb -map 0 -f segment -segment_list a09403dce1b010bbc7aef314c1197419.m3u8 -segment_time 5 a09403dce1b010bbc7aef314c1197419%03d.ts


# 20201022
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls a09403dce1b010bbc7aef314c1197419.m3u8


# 20201023
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -b:v 2000k -bufsize 2000k a09403dce1b010bbc7aef314c1197419-2000k.mp4
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -b:v 1000k -bufsize 1000k a09403dce1b010bbc7aef314c1197419-1000k.mp4
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -b:v 700k -bufsize 700k a09403dce1b010bbc7aef314c1197419-700k.mp4
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -b:v 500k -bufsize 500k a09403dce1b010bbc7aef314c1197419-500k.mp4
ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -b:v 300k -bufsize 300k a09403dce1b010bbc7aef314c1197419-300k.mp4

# 久
ffmpeg -i a09403dce1b010bbc7aef314c1197419-2000k.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls a09403dce1b010bbc7aef314c1197419-2000k.m3u8
#ffmpeg -i a09403dce1b010bbc7aef314c1197419-1000k.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls a09403dce1b010bbc7aef314c1197419-1000k.m3u8
#ffmpeg -i a09403dce1b010bbc7aef314c1197419-700k.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls a09403dce1b010bbc7aef314c1197419-700k.m3u8
ffmpeg -i a09403dce1b010bbc7aef314c1197419-500k.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls a09403dce1b010bbc7aef314c1197419-500k.m3u8
ffmpeg -i a09403dce1b010bbc7aef314c1197419-300k.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls a09403dce1b010bbc7aef314c1197419-300k.m3u8




ffmpeg -i a09403dce1b010bbc7aef314c1197419.mp4 -b:v 300k -bufsize 300k -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls a09403dce1b010bbc7aef314c1197419-300k.m3u8



ffmpeg -i big.mp4 -b:v 1M -g 60 -hls_time 2 -hls_list_size 0 -hls_segment_size 500000 output.m3u8



# 20201030
ffmpeg -i 1b6160d31f71b2080d654325177bbea7.mp4 -b:v 1000k -bufsize 1000k -r 25 1b6160d31f71b2080d654325177bbea7-1000k.mp4
ffmpeg -i 1min.mp4 -b:v 700k -bufsize 700k 1min-700k.mp4
ffmpeg -i 1min.mp4 -b:v 500k -bufsize 500k 1min-500k.mp4
ffmpeg -i 1min.mp4 -b:v 300k -bufsize 300k 1min-300k.mp4


ffmpeg -i 1b6160d31f71b2080d654325177bbea7.mp4 -c:v libx264 -preset medium -b:v 555k -pass 2 -c:a aac -b:a 128k 1b6160d31f71b2080d654325177bbea7-1000k.mp4



ffmpeg -y -i 1b6160d31f71b2080d654325177bbea7.mp4 -c:v libx264 -b:v 500k -pass 1 -c:a aac -b:a 128k -f 1b6160d31f71b2080d654325177bbea7-500k.mp4 /dev/null 

ffmpeg -i 1b6160d31f71b2080d654325177bbea7.mp4 -c:v libx264 -b:v 500k -pass 2 -c:a aac -b:a 128k 1b6160d31f71b2080d654325177bbea7-500k.mp4

ffmpeg -i 1b6160d31f71b2080d654325177bbea7.mp4 -c:v libx264 -b:v 500k 1b6160d31f71b2080d654325177bbea7-500k.mp4
ffmpeg -i 1b6160d31f71b2080d654325177bbea7.mp4 -c:v libx265 -b:v 500k 1b6160d31f71b2080d654325177bbea7-500k.mp4
ffmpeg -i 1b6160d31f71b2080d654325177bbea7.mp4 -c:v libvpx-vp9 -b:v 500k 1b6160d31f71b2080d654325177bbea7-500k.mp4


ffmpeg -i 1.mp4 -b:v 500k -bufsize 500k 1-500k.mp4

ffmpeg -i 1-h264.mp4 -b 4000k -minrate 4000k -maxrate 4000k -bufsize 1835k 1-h264-4000k.mp4



# 20201030
ffmpeg -y -i 1min-1300k.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb 1min-1300k.ts
ffmpeg -y -i 1min-1000k.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb 1min-1000k.ts
ffmpeg -y -i 1min-700k.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb 1min-700k.ts;
ffmpeg -y -i 1min-500k.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb 1min-500k.ts;
ffmpeg -y -i 1min-300k.mp4 -vcodec copy -acodec copy -vbsf h264_mp4toannexb 1min-300k.ts;


ffmpeg -i 1min-1300k.ts -c copy -map 0 -f segment -segment_list 1min-1300k.m3u8 -segment_time 9 1min-1300k_%03d.ts; 
ffmpeg -i 1min-1000k.ts -c copy -map 0 -f segment -segment_list 1min-1000k.m3u8 -segment_time 5 1min-1000k_%03d.ts; 
ffmpeg -i 1min-700k.ts -c copy -map 0 -f segment -segment_list 1min-700k.m3u8 -segment_time 4 1min-700k_%03d.ts;  
ffmpeg -i 1min-500k.ts -c copy -map 0 -f segment -segment_list 1min-500k.m3u8 -segment_time 4 1min-500k_%03d.ts;  
ffmpeg -i 1min-300k.ts -c copy -map 0 -f segment -segment_list 1min-300k.m3u8 -segment_time 4 1min-300k_%03d.ts;  

# 20201031
ffmpeg -i 1min-1000k.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls 1min-1000k.m3u8
ffmpeg -i 1min-700k.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls 1min-700k.m3u8

# 参数-strict -2是为了使用aac音频编码



ffmpeg -i 22min.mp4 -b 1000k -minrate 1000k -maxrate 1000k -bufsize 1000k 22min-1000k.mp4
ffmpeg -i 22min-1000k.mp4 -c:v libx264 -hls_time 5 -hls_list_size 0 -c:a aac -strict -2 -f hls 22min-1000k.m3u8
ffmpeg -i a37c3d6d8f446b971ababed68cf0c802-1000k.mp4 -force_key_frames expr:gte(t,n_forced*5) -strict -2 -c:a aac -c:v libx264 -hls_list_size 0 -hls_time 5 -f hls tt.m3u8

