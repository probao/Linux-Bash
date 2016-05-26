#!/usr/bin/awk -f

{
        a=a+$1
        if( NR%3 == 0 )
        {
                aver=a/3
                print aver
                a=0
        }
}
