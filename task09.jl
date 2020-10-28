function find_marker!(r::Robot)
    marker=false
    a=1
    s=1
    n=0
    while marker==false
        if ismarker(r)==false
            side=HorizonSide(mod(a-1,4))
            move!(r,side,s)
            n+=1
        else
            marker=true
        end
        if (n==2)
            n=0
            s+=1
        end
        a+=1
    end
    return n
    return a
    return s

end    

import HorizonSideRobots.move!
function move!(r,side,num_steps)
    for _ in 1:num_steps 
        if ismarker(r)==false
            move!(r,side) 
        end
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
