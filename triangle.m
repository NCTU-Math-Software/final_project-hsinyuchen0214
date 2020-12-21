function triangle(a,b,c)
    %
    % Input: Please enter 3 points(3 vectors)
    % Output: The origin is in the triangle formed by the 3 points or not.
    %
    % Example:
    %       >> a = [0 3];b = [-1 -1]; c = [3 0];
    %       >> triangle(a,b,c)
    %       (Output should be) The origin is in the triangle! ���I�b���T���Τ�
    %
    o = [0 0]; % Set the origin
    % Compute the vector of the 3 points and the origin, respectively
    OA = a - o; 
    OB = b - o;
    OC = c - o;
    
    % If one of the point is the origin
    if (a == 0) 
        disp('The origin is on the edge of the triangle! ���I�b���T������W')
    end
    if (b == 0)
        disp('The origin is on the edge of the triangle! ���I�b���T������W')
    end
    if (c == 0)
        disp('The origin is on the edge of the triangle! ���I�b���T������W')
    end
    
    % Compute the cross values of two of the vectors
    x = OA(1)*OB(2)-OA(2)*OB(1); 
    y = OB(1)*OC(2)-OB(2)*OC(1);
    z = OC(1)*OA(2)-OC(2)*OA(1);
    
    % If the cross values have the same sign( + or - ), means the origin is inside the triangle 
    if x > 0 
        if y > 0 
            if z > 0
                disp('The origin is in the triangle! ���I�b���T���Τ�')
            else
                disp('The origin is NOT in the triangle! ���I �� �b���T���Τ�')
            end
        else
            disp('The origin is NOT in the triangle! ���I �� �b���T���Τ�')
        end
    end
    
    if x < 0
        if y < 0 
            if z < 0
                disp('The origin is in the triangle! ���I�b���T���Τ�')
            else
                disp('The origin is NOT in the triangle! ���I �� �b���T���Τ�')
            end
        else
            disp('The origin is NOT in the triangle! ���I �� �b���T���Τ�')
        end
    end
    u = [a(1) b(1) c(1) a(1)];
    v = [a(2) b(2) c(2) a(2)];
    o1 = 0;
    o2 = 0;
    plot(u, v, 'o-')
    hold on
    plot(o1,o2,'o')
end