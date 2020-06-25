# for file in $(ls);
# do
#     if [ -f $file ]; then
#         if ! grep -q Apache $file; then
#             echo $file
#         fi
#     fi
# done

for file in $(ls);
do
    if [ -f $file ]  && ! grep -q Apache $file; then
        echo $file
        echo 'test' | cat - $file > temp && mv temp $file
    fi
done