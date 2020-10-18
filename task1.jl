function mark_kross!(r::Robot)
    for i in 0:3
        putmarkers!(r,HorizonSide(i))
        move_by_markers!(r,inverse(HorizonSide(i)))
    end
    putmarker!(r)
end

function move_by_markers!(r::Robot,side::HorizonSide)
    while ismarker(r)==true
        move!(r,side)
    end
end

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 