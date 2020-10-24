NUM_MARKERS=0


function mean_temp!(r::Robot)
    global NUM_MARKERS=0
    side=West
    t=0
    while isborder(r,Nord)==false
        t+=row_temp!(r,side)
        side=inverse(side)
        move!(r,Nord)
    end  
    t+=row_temp!(r,side)
    s=t/NUM_MARKERS
    return  s
    
end


function row_temp!(r::Robot,side::HorizonSide)
    temp=0
    while isborder(r,side)==false
        temp+=find_temp(r)
        move!(r,side)
    end
    temp+=find_temp(r)
    return temp
    
end

function find_temp(r::Robot)
    global NUM_MARKERS
    if ismarker==true
        NUM_MARKERS+=1
        return temperature(r)
    else
        return 0
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))