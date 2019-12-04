#!/bin/sh
i=2
end=10
while [ $i -le $end ]; do
	a=4
	b=12
	echo "scale=5; sqrt($a^2 + $b^2)"
	i=$(($i+1))
done

