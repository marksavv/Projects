function count!(r::Robot)
    while ((isborder(r,Sud)==false) || (isborder(r,West)==false))
        moves!(r,Sud)
        moves!(r,West)
    end
    #Робот в Юго-Западном углу

    c=1 # т.к. при подсчете последнего ряда горизонталной перегородки moves не считает перегородку над "стартовой" клеткой

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
    end
    
    c+=moves!(r,side)   #верхние горизонталные перегородки
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