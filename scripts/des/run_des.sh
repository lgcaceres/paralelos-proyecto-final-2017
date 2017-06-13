
if [ -z $1 ]
then
  var="\#net"
else
  var=$1
fi

#echo $var

bin=../../test_ejecutables/spray

num_procs=(1 2 4 8 16 32 40 64 80)
depdist=(100 1000 10000)

#echo "depdist,#procs,spray,lotan_shavit,linden"

for j in "${depdist[@]}"
do
  for i in "${num_procs[@]}"
  do
    spray[$i]=`$bin -e $j -l -i 2000000 -u 100 -d 100 -n $i | grep $var | grep '(?<= )[0-9]+' -Po`
    lotan_shavit[$i]=`$bin -e $j -p -i 2000000 -u 100 -d 100 -n $i | grep $var | grep '(?<= )[0-9]+' -Po`
    linden[$i]=`$bin -e $j -L -i 2000000 -u 100 -d 100 -n $i | grep $var | grep '(?<= )[0-9]+' -Po`

    echo $j,$i,${spray[$i]},$j,$i,${lotan_shavit[$i]},$j,$i,${linden[$i]}
  done
done
