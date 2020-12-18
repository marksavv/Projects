NUM_VERT=0          #Число клеток сверху от начального положения
NUM_HOR=0           #Число клеток справа от начального плоложения

function points!(r::Robot)
    global NUM_HOR=0
    global NUM_VERT=0
    v=0
    h=0
    num=0
    num_steps=[]
    while ((isborder(r,Nord)==false) || (isborder(r,Ost)==false))
        v=moves!(r, Nord)
        NUM_VERT+=v
        push!(num_steps, v)
        h=moves!(r, Ost)
        NUM_HOR+=h
        push!(num_steps, h)
        num+=2
    end
    dh=moves!(r,West)
    dv=moves!(r,Sud)
    way_mark!(r,Ost,dh-NUM_HOR)
    way_mark!(r,Nord,dv-NUM_VERT)
    way_mark!(r,West,NUM_HOR)
    way_mark!(r,Sud,NUM_VERT)
    moves!(r,Ost)
    moves!(r,Nord)
    while (num>0)==true
        side = isodd(num) ? Sud : West
        move!(r,side,num_steps[num])
        num-=1
    end
end

function way_mark!(r::Robot,side::HorizonSide,num::Int)
    move!(r,side,num)
    putmarker!(r)
    moves!(r,side)
end

import HorizonSideRobots.move!
move!(r,side,num_steps)=for _ in 1:num_steps move!(r,side) end
