function mark_perimetr!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, Ost)
    #УТВ: Робот - в Юго-Восточном углу

    for i in 0:3 
        putmarkers!(r,HorizonSide(i))
    end

    move_back!(r,West,num_hor)
    move_back!(r,Nord,num_vert)
end

function move_back!(r::Robot,side::HorizonSide,num_steps::Int) #Вспомогательная функция
    for _ in 1:num_steps
        move!(r,side)
    end
end