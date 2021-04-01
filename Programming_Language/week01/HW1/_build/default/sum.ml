let rec sum n m f =
        if m=n then f n
        else f m + (sum n (m-1) f)


