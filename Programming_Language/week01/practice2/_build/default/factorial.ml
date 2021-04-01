let rec factorial i = 
        if i=1 then 1
        else i * (factorial (i-1))
in
Format.printf "%d\n" (factorial 10)
