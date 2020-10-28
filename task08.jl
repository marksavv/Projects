function find_exit(r::Robot)
    n=0 
    side=Ost
    while isborder(r,Nord)==true # прохода сверху нет
        n+=1
        move!(r,side,n)
        side=inverse(side)
    end
end

import HorizonSideRobots.move!
move!(r,side,num_steps)=for _ in 1:num_steps move!(r,side) end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))


