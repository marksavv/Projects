function mark_kross!(r::Robot)
    i=0
    b=0
    t=1
    while i<4
        if  (t==1)
            if (isborder(r,HorizonSide(i))==true) 
                t=round!(r,HorizonSide(i))
                putmarker!(r)
                b+=1
            else
                putmarkers!(r,HorizonSide(i))
                b+=1
            end
        else
            move_by_markers!(r,inverse(HorizonSide(i)))
            i+=1
            t=1
        end
    end
    putmarker!(r)
end

function putmarkers!(r::Robot, side::HorizonSide)
    if  isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end

function round!(r::Robot,side::HorizonSide)
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

function move_by_markers!(r::Robot,side::HorizonSide)
    a=0
    while ismarker(r)==true
        if isborder(r,side)==true
            round!(r,side)
            a+=1
        else
            move!(r,side)
            a+=1
        end
        if (a>19)
            break
        end
    end

end





prev(side::HorizonSide)=HorizonSide(mod(Int(side)-1,4))