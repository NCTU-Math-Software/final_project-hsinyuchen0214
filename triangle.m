function triangle(a,b,c) % 三角形
    %
    % Input: Please "enter" 3 points (3 vectors)
    % Output: Whether the origin is in the triangle formed by the 3 points or not.
    %
    % Example:
    %       >> a = [0 3];b = [-1 -1]; c = [3 0];
    %       >> triangle(a,b,c)
    %       (Output should be) The origin is in the triangle! 原點在此三角形內
    %                          ((Then plot the triangle and the origin))
    %
    %       >> a = [0 3];b = [1 1]; c = [3 0];
    %       >> triangle(a,b,c)
    %       (Output should be) The origin is NOT in the triangle! 原點 不 在此三角形內
    %                          ((Then plot the triangle and the origin))
    %
    o = [0 0]; % Set the origin
    % Compute the vector formed by the 3 points and the origin, respectively
    OA = a - o; 
    OB = b - o;
    OC = c - o;
    
    % If one of the point is the origin
    if (a == 0) 
        disp('The origin is on the edge of the triangle! 原點在此三角形邊上')
    end
    if (b == 0)
        disp('The origin is on the edge of the triangle! 原點在此三角形邊上')
    end
    if (c == 0)
        disp('The origin is on the edge of the triangle! 原點在此三角形邊上')
    end
    
    % Compute the cross values of OA and OB, OB and OC, OC and OA
    x = OA(1)*OB(2)-OA(2)*OB(1); 
    y = OB(1)*OC(2)-OB(2)*OC(1);
    z = OC(1)*OA(2)-OC(2)*OA(1);
    
    % If the cross values have the same sign( + or - ), means the origin is inside the triangle 
    if x > 0 
        if y > 0 
            if z > 0
                disp('The origin is in the triangle! 原點在此三角形內')
            else
                disp('The origin is NOT in the triangle! 原點 不 在此三角形內')
            end
        else
            disp('The origin is NOT in the triangle! 原點 不 在此三角形內')
        end
    end
    
    if x < 0
        if y < 0 
            if z < 0
                disp('The origin is in the triangle! 原點在此三角形內')
            else
                disp('The origin is NOT in the triangle! 原點 不 在此三角形內')
            end
        else
            disp('The origin is NOT in the triangle! 原點 不 在此三角形內')
        end
    end
    % Rearrange the points by seperating the x-axis and y-axis into two vectors
    u = [a(1) b(1) c(1) a(1)];
    v = [a(2) b(2) c(2) a(2)];
    % Define the origin
    o1 = 0;
    o2 = 0;
    % Draw the triangle
    plot(u, v, 'o-')
    hold on
    % Draw the origin
    plot(o1,o2,'o')
end