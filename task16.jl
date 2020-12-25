
function mark_square_painter!(r::Robot) #Главная функция

    ch1=1

    h=0
    v=-1
    
    while (ch1==1)

        if isborder(r,Sud)==true
            ch1=round_borders!(r,Sud)
            v+=1
        else
            v+=moves!(r,Sud)
        end

    end
    h=moves!(r,West)
    #Робот в Юго-Западном углу

    putmarker!(r)

    ch=1
    side=Ost
    
    while ((isborder(r,Nord)==false) || (ch==1))
        
        if isborder(r,side)==false
            move!(r,side)
            putmarker!(r)
        else
            ch=round_borders!(r,side)
            putmarker!(r)
        end

        if ((ch==0) && (isborder(r,Nord)==false))
            move!(r,Nord)
            putmarker!(r)
            side=inverse(side)
            ch=1
        end

    end
  
    moves!(r,West)
    moves!(r,Sud)
    
    move_back!(r,Ost,h)

    for _ in 0:(v-1) 
        
        if (isborder(r,Nord)==true)
            round_borders!(r,Nord)
        else
            move!(r,Nord)
        end
    end

end

#функция, позволяющая преодалевать перегородки
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