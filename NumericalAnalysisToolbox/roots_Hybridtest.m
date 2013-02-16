function [answerRoots] = roots_Hybrid(f,startPt,endPt,epsilon)
%% ***********************************************************************
% FUNCTION ROOTS_BISECTIONS
% Purpose: Calculates the roots of a given function in between two points,
% as determined via the Bisection method.
%
% Function call: [answerRoots] = roots_Bisection(f,startPt,endPt,epsilon)
%
% Input: f = polynomial function
% startPt = starting point of the search
% endPt = Ending point of the search
% epsilon = Stopping criterion
%
% Outputs: answerRoots = array of roots for the given function.
%
% Adam Hollock
% 15 January 2012
%% ***********************************************************************
for i = startPt:0.001:endPt
if f(i)*f(i+1) < 0
    
diff = 100000000;               %Sets up a large difference so the loop will run through at least once.
xl = startPt;                   %Initializes xl and xu as the starting and ending points.
xu = endPt;
xr1 = (xl + xu)/2;
xr2 = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));
counter = 0;

if abs(f(xr1)) < abs(f(xr2))             %This will use whatever value is closer to 0 for the initial value
    xr = xr1;
else
    xr = xr2;
end

while diff > epsilon
    if f(xl)*f(xr) > 0          %This will move either the lower or hte higher end point to the mid,
        xl = xr;                %Dependent on the logic
    elseif f(xu)*f(xr) > 0      %This is the biscection method solver
        xu = xr;
    end
    if f(xl)*f(xr) > 0          %This will move either the lower or hte higher end point to the mid,
        xl = xr;                %Dependent on the logic
    elseif f(xu)*f(xr) > 0      %This is the false position method
        xu = xr;
    end
    
    xr1new = (xl + xu)/2;        %Finds the middle point.
    diff1 = abs((abs(xr)-abs(xr1new))/abs(xr))*100;     %Updates the difference for the next loop.
    xr2new = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));
    diff2 = abs((abs(xr)-abs(xr2new))/abs(xr))*100;     %Updates the difference for the next loop.
    
    if diff1 > diff2                    %Will determine next value of xr based on what percentage change is greater
        if abs(f(xr1new)) < abs(f(xr))  %But it also needs to make sure that it is closer to 0 (going in the right direction.)
            xr = xr1new;                %So priority will go towards the value that's closer to 0.
        elseif abs(f(xr2new)) < abs(f(xr1new))
            xr = xr2new;
        else
            %error('When someone asks you: are you are a god, you say yes!');
            xr = xr1new;  
        end
    else
        if abs(f(xr2new)) < abs(f(xr))
            xr = xr2new;
        elseif abs(f(xr1new)) < abs(f(xr2new))
            xr = xr1new;
        else
            %error('When someone asks you: are you are a god, you say yes!');
            xr = xr2new;
        end   
    end
    
    counter = counter + 1;
    if counter >= 50            %This will catch the program if a convergence takes too long.
        error('I think there might be a problem capn.');
    end
    
end

end
end
IternationHyrbid = counter
answerRoots = xr;