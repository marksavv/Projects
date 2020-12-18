function count_hor!(r::Robot)
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

    #c=1 # т.к. при подсчете последнего ряда горизонталной перегородки moves не считает перегородку над "стартовой" клеткой
    c=0

    side=Ost
    ch=1
    while (ch==1)
        c+=borders_count_hor(r,side,0)
        if (isborder(r,Nord)==false)
            move!(r,Nord)
            side=inverse(side)
        else
            ch=round_borders!(r,Nord)
            side=inverse(side)
        end    
        c+=borders_count_hor(r,side,0)
    end
    
    #c+=moves!(r,side)   #верхние горизонталные перегородки
    c+=borders_count_hor(r,side,0)
    return c

end

function borders_count_hor(r::Robot, side::HorizonSide, a::Int)
    flag=1
    while (flag==1)
        if isborder(r,Sud)==true
            a+=1
        end
        if isborder(r,side)==false
            move!(r,side)
        else
            flag=round_borders!(r,side)
        end
    end
    return a
end