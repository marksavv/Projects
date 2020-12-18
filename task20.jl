function find_marker!(r::Robot)
    marker=false
    a=1
    s=1
    n=0
    while marker==false
        if ismarker(r)==false
            side=HorizonSide(mod(a-1,4))
            move!(r,side,s)
            n+=1
        else
            marker=true
        end
        if (n==2)
            n=0
            s+=1
        end
        a+=1
    end

end    

import HorizonSideRobots.move!
function move!(r,side,num_steps)
    for _ in 1:num_steps 
        if ismarker(r)==false
            if isborder(r,side)==false
                move!(r,side)
            else
                round_borders!(r,side)
            end 
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

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))