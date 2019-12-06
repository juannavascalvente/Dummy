#!/bin/sh
i=2
end_outer=30000000
while [ $i -le $end_outer ]; do
	j=2
	end_inner=20
	while [ $j -le $end_inner ]; do
		a=4
		b=12
		c=$((a^2 + b^2))
		j=$(($j+1))
	done
	i=$(($i+1))
done

