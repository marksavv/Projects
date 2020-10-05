function mark_square_painter!(r::Robot) #Главная функция
    pace=-1
    wall=false

    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    #УТВ: Робот - в Юго-Западном углу
    
    putmarker!(r)
    putmarkers!(r,Ost)
    #УТВ: Роюот в Юго-Восточном углу, вся нижняя линия промаркерована
    
    while isborder(r,Nord)==false
        move!(r,Nord)
        putmarker!(r)
        if isborder(r,Ost)==false
            putmarkers!(r,Ost)
        else
            putmarkers!(r,West)
        end
    end
  
    moves!(r,West)
    moves!(r,Sud)
    move_back!(r,Ost,num_hor)
    move_back!(r,Nord,num_vert)

end

function move_back!(r::Robot,side::HorizonSide,num_steps::Int) #Вспомогательная функция
    for _ in 1:num_steps
        move!(r,side)
    end
end
