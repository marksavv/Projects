function mark_kross_x!(r::Robot)
    for i in 0:3
        move_x!(r,HorizonSide(i))
        move_by_markers_x!(r,HorizonSide(mod(i+2,4)))
    end
    putmarker!(r)
end

function move_x!(r::Robot,side::HorizonSide)
    while ((isborder(r,side)==false) && (isborder(r,next(side))==false))
        move!(r,side)
        move!(r,next(side))
        putmarker!(r)    
    end
end

function move_by_markers_x!(r::Robot,side::HorizonSide)
    while ismarker(r)==true
        move!(r,side)
        move!(r,next(side))
    end
end

next(side::HorizonSide)=HorizonSide(mod(Int(side)+1,4))