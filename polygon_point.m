function polygon_point(p,length,width) % 多邊形 且 可指定點 和 設定長寬範圍
    %
    % Input: "Click" the points randomly in "counter-clockwise"
    % Output: The assigned point is in the polygon formed by the points or not.
    %
    % Example:
    %       >> p = [15 25];length = 150;width = 100;
    %       >> polygon_point(p,length,width)
    %       (Output should be: the plot of the polygon and the assigned point and tell whether the point is in the polygon) 
    %
    % Set empty matrices to save the datas we need
    X = [];
    Y = [];
    PA = [];
    crossVal1 = [];
    crossVal2 = [];
    crossVal3 = [];
    
    figure % 叫出 figure 視窗
    while 1
        axis([(-length) length, (-width) width]) % fix the range of the figure
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
    p1 = p(1); 
    p2 = p(2);
    % Let the last point connected to the beginning point
    XX = [X;X(1)];
    YY = [Y;Y(1)];
    % Draw the polygon
    plot(XX, YY, 'o-')
    hold on
    % Draw the assigned point
    plot(p1,p2,'o')
    
    % Compute the area of the polygon
    for ii = 1:(number-1)
        A = 0;
        AA = XX(ii)*YY(ii+1)-XX(ii+1)*YY(ii);
        A = A + AA;
    end
    Area = A*(1/2);
    disp('The area of the polygon is:')
    disp(Area)
    
    % If one of the point is the assigned point
    for ii = 1 : number
        if X(ii) == p(1) 
            if Y(ii) == p(2)
                disp('The assigned point is on the edge of the polygon.')
            end
        end
    end
    
    % Compute the vector of the points and the origin, respectively
    for ii = 1:number
        PA(ii,1) = [X(ii)-p(1)];
        PA(ii,2) = [Y(ii)-p(2)];
    end

    % Compute the cross values of two of the vectors
    for jj = 2:(number-1)
        crossVal = (PA(1,1)*PA(jj,2)) - (PA(1,2)*PA(jj,1));    
        crossVal1 = [crossVal1;crossVal];
        crossVal = (PA(jj,1)*PA(jj+1,2)) - (PA(jj,2)*PA(jj+1,1));
        crossVal2 = [crossVal2;crossVal];
    end
    for ll = 3:number
        crossVal = (PA(ll,1)*PA(1,2)) - (PA(ll,2)*PA(1,1));
        crossVal3 = [crossVal3;crossVal];
    end
    crossval = [crossVal1 crossVal2 crossVal3];
    
    % If the cross values have the same sign( + or - ), means the assigned point is inside the triangle 
    for ii = 1 : (number-2)
        if crossval(ii,:) > 0 
                disp('The assigned point is in the polygon! 原點在此多邊形內')
        else 
            if crossval(ii,:) < 0
                disp('The assigned point is in the polygon! 原點在此多邊形內')
            end
        end
    end
end
