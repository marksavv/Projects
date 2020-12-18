function count_all_borders!(r::Robot)
    ch1=1
    ch2=1
    
    while ((ch1==1) || ( ch2==1))
        moves!(r,Sud)
        if isborder(r,Sud)==true
            ch1=round_borders!(r,Sud)
        end

        moves!(r,West)
        if isborder(r,West)==true
            ch2=round_borders!(r,West)
        end
    end
    #Робот в Юго-Западном углу

    c=-2 # т.к боковые перегородки верхней строки считаются два раза каждая 

    side=Ost
    ch=1

    while (ch==1)
        c+=borders_count_all(r,side,0)
        if (isborder(r,Nord)==false)
            move!(r,Nord)
            side=inverse(side)
        else
            ch=round_borders!(r,Nord)
            side=inverse(side)
        end    
    end
    
    c+=borders_count_all(r,side,0)   #верхние горизонталные перегородки

    return c

end

function borders_count_all(r::Robot, side::HorizonSide, a::Int)
    flag=1
    while (flag==1)
        if isborder(r,Sud)==true
            a+=1
        end
        if isborder(r,side)==true
            a+=1
        end

        if isborder(r,side)==false
            move!(r,side)
        else
            flag=round_borders!(r,side)
        end
    end
    a+=2
    return a
end

function round_borders!(r::Robot,side::HorizonSide)     
    a=0
    ch=1
    while isborder(r,side)==true
        if isborder(r,next(side))==true
            ch=0
            break
        end
        move!(r,next(side))
        a+=1
    end
    if (ch!=0)
        move!(r,side)
        while isborder(r,prev(side))==true
            move!(r,side)
        end
        move!(r,prev(side))
        moves!(r,prev(side),a-1)
    else
        moves!(r,prev(side),a)
    end
    return ch
end