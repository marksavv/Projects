X_CORD=0
Y_CORD=0
include("task7.jl")

function chess_up!(r::Robot,n::Int)
    num_vert=moves!(r,Sud)
    num_hor=moves!(r,West)
    global X_CORD=0
    global Y_CORD=0
    m=0
    nr=0

    while isborder(r,Nord)==false
        if mod(div(Y_CORD,n),2)==mod(m,2)
            chess_row_up!(r,Ost,n,nr)
            moves!(r,West)
            move!(r,Nord)
            Y_CORD+=1
            X_CORD=0
        else
            m+=1
            nr=mod(nr+1,2)
        end
    end
    if mod(div(Y_CORD,n),2)==mod(m,2)               #Условие для последней строчки
        chess_row_up!(r,Ost,n,nr)
    else
        chess_row_up!(r,Ost,n,mod(nr+1,2))
    end

    moves!(r,West)
    moves!(r,Sud)
    move_back!(r,Ost,num_hor)
    move_back!(r,Nord,num_vert)
end

function chess_row_up!(r::Robot,side::HorizonSide,n::Int,num::Int) #Робот, сторона горизонта,длина единичной клетки, четная/нечетная строка
    global X_CORD
    
    while isborder(r,side)==false           
        if mod(div(X_CORD,n),2)==mod(num,2)         
            putmarker!(r)
        end
        X_CORD+=1
        move!(r,side)
    end
    if mod(div(X_CORD,n),2)==mod(num,2)
        putmarker!(r)
    end

end
