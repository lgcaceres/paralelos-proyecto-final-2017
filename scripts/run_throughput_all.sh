# USAGE: ./run.sh var
#  var: print statistics for indicated variable (default #txs)
#       need complete enough name for grep to find unambiguously (e.g. '#txs' works, 'txs' doesn't)

if [ -z $1 ]
then
var="\#txs"
else
var=$1
fi

bin=../test_ejecutables/spray

num_procs=(1 2 4 8 16 32 40 64 80)
#num_procs=(8 16 32 64)
#num_procs=(80)

#echo "#######################################"
#echo "spray"
#echo "lotan_shavit"
#echo "#######################################"

for i in "${num_procs[@]}"
do
  spray[$i]=`$bin -l -i 1000000 -u 100 -d 1000 -n $i | grep $var | grep '(?<= )[0-9]+\.?[0-9]+' -Po`
  lotan_shavit[$i]=`$bin -p -i 1000000 -u 100 -d 1000 -n $i | grep $var | grep '(?<= )[0-9]+\.?[0-9]+' -Po`
  #echo $i,${spray[$i]},${lotan_shavit[$i]}
  echo ${spray[$i]}		${lotan_shavit[$i]}
done


