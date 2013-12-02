sum=0
for i in $*; do
if [ -f $i ]; then
sum=$sum + $(wc -c $i)
done
#ls -lA|grep "^-"
#ls -lA |grep "^-" |awk '{print $5}'
