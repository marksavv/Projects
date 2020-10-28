function chess!(r::Robot) #Главная функция
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    #УТВ: Робот - в Юго-Западном углу
    chess_row!(r,Ost,2)                 
    #УТВ: Маркируем первую строчку
    
    while isborder(r,Nord)==false
        move!(r,Nord)
        if isborder(r,Ost)==false
            chess_row!(r,Ost,2)
        else
            chess_row!(r,West,2)
        end
    end

    moves!(r,West)
    moves!(r,Sud)
    move_back!(r,Ost,num_hor)
    move_back!(r,Nord,num_vert)

end
        
function chess_row!(r::Robot,side::HorizonSide,num::Int)
    num_steps=0
    while isborder(r,side)==false
        if mod(num_steps,2)==mod(num,2)
            putmarker!(r)
        end
        move!(r,side)
        num_steps+=1
    end
    return num_steps
    num_steps+=1                                        #учитываем клетку у перегородки
    if mod(num_steps,2)==mod(num,2)
        putmarker!(r)
    end
end

function move_back!(r::Robot,side::HorizonSide,num_steps::Int) #Вспомогательная функция
    for _ in 1:num_steps
        move!(r,side)
    end
end
