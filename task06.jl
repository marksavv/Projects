function inner_frame!(r::Robot)
    num_steps=[]

    while ((isborder(r,Nord)==false) || (isborder(r,Ost)==false))
        push!(num_steps, moves!(r, Nord))
        push!(num_steps, moves!(r, Ost))
    end
    #УТВ: Робот в Северо-Западном углу

    c=moves!(r, West)

    i=3
    check=0
    while (check==0)==true
        move!(r,Sud)
        check=search!(r,HorizonSide(mod(i,4)),c)
        i+=2
    end

    i-=2
    while ismarker(r)==false
        if isborder(r,HorizonSide(mod(i,4)))==true
            putmarker!(r)
            move!(r, HorizonSide(mod(i-1,4)))
        else
            putmarker!(r)
            move!(r, HorizonSide(mod(i,4)))
            i+=1
        end
    end

    moves!(r,Nord)
    moves!(r,Ost)

    
   for (j,n) in enumerate(num_steps)
        side = isodd(j) ? West : Sud
        moves2!(r,side,n)
    end

end

function search!(r::Robot,side::HorizonSide,num::Int)
    ch=0
    for _ in 1:num
        if isborder(r,side)==false
            move!(r,side)
        else
            ch=1
            break
        end
    end

    return ch
end

moves2!(r,side,num_steps) = for _ in 1:num_steps move!(r,side) end
