function polygon % 多邊形
    %
    % Input: "Click" the points randomly in "counter-clockwise"
    % Output: The origin is in the polygon formed by the points or not.
    %
    % Example:
    %       >> polygon
    %       (Output should be: the plot of the polygon and the origin and tell whether the origin is in the polygon) 
    %
    % Set empty matrices to save the datas we need
    X = [];
    Y = [];
    OA = [];
    crossVal1 = [];
    crossVal2 = [];
    crossVal3 = [];
    
    figure % 叫出 figure 視窗
    while 1
        axis([-100 100, -100 100]) % fix the range of the figure
        [x,y,BUTTON] = ginput(1); % 點擊
        plot(floor(x),floor(y),'o') % plot the clicked points
        hold on
        X = [X;floor(x)]; % record the points
        Y = [Y;floor(y)];

        if BUTTON == 3 % 若按左鍵停止
            number = size(X); % the number of the points
            break;
        end
    end  
   
    % form the point of the origin 
    o1 = 0; 
    o2 = 0;
    % Let the last point connected to the beginning point
    XX = [X;X(1)];
    YY = [Y;Y(1)];
    % Draw the polygon
    plot(XX, YY, 'o-')
    hold on
    % Draw the origin
    plot(o1,o2,'o')
    
    % If one of the point is the origin
    for ii = 1 : number
        if X(ii) == 0 
            if Y(ii) == 0
                disp('The origin is on the edge of the polygon.')
            end
        end
    end
    
    o = [0 0]; % Set the origin
    % Compute the vector of the points and the origin, respectively
    for ii = 1:number
        OA(ii,1) = [X(ii)-o(1)];
        OA(ii,2) = [Y(ii)-o(2)];
    end

    % Compute the cross values of two of the vectors
    for jj = 2:(number-1)
        crossVal = (OA(1,1)*OA(jj,2)) - (OA(1,2)*OA(jj,1));    
        crossVal1 = [crossVal1;crossVal];
        crossVal = (OA(jj,1)*OA(jj+1,2)) - (OA(jj,2)*OA(jj+1,1));
        crossVal2 = [crossVal2;crossVal];
    end
    for ll = 3:number
        crossVal = (OA(ll,1)*OA(1,2)) - (OA(ll,2)*OA(1,1));
        crossVal3 = [crossVal3;crossVal];
    end
    crossval = [crossVal1 crossVal2 crossVal3];
    
    % If the cross values have the same sign( + or - ), means the origin is inside the triangle 
    for ii = 1 : (number-2)
        if crossval(ii,:) > 0 
                disp('The origin is in the polygon! 原點在此多邊形內')
        else 
            if crossval(ii,:) < 0
                disp('The origin is in the polygon! 原點在此多邊形內')
            end
        end
    end
end

