function mark_paint_ladder!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    putmarker!(r)
    m=putmarker_count!(r,Ost)
    
    #УТВ: Робот - в Юго-Восточном углу и вся нижняя линия промаркирована

    for i in 1:m
        if isborder(r,Nord)==false
            if isborder(r,West)==false
                move!(r,West)
                move!(r,Nord)
                putmarker!(r)
                putmarkers!(r,West)
            else
                move!(r,Nord)
                putmarker!(r)
                moves_marker!(r,Ost,m-i)
            end
        end
    end
    moves!(r,West)
    moves!(r,Sud)
    move_back!(r,Ost,num_hor)
    move_back!(r,Nord,num_vert)
end

function moves_marker!(r::Robot,side::HorizonSide, num::Int)
    for _ in 1:num
        move!(r,side)
        putmarker!(r)
    end
end

function putmarker_count!(r::Robot,side::HorizonSide)
    num=0
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
        num+=1
    end
    return num
end
