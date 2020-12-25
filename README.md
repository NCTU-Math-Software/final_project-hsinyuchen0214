# My Project : 
# ------任意給定平面上三點, 判斷原點是否在這三點所圍成的三角形內。

final_project-hsinyuchen0214 created by GitHub Classroom

#### <triangle.m> 使用者「輸入」三個點(向量)
#### ----------------輸出 (1) 原點是否在三個點圍成的三角形內 (2) 畫出三角形和原點
             
#### <polygon.m> 使用者以逆時針「點擊」多個點後
#### -----------------輸出 (1) 原點是否在這多個點形成的多邊形內 (2)畫出多邊形和原點 (3)計算多邊形面積
            
#### <polygon_point.m> 使用者可以「指定目標點 和 設定點擊範圍(長和寬)」，再以逆時針「點擊」多個點
#### -----------------------輸出 (1) 原點是否在這多個點形成的多邊形內 (2)並畫出多邊形和指定點 (3)計算多邊形面積

## 題目：

     任意給定平面上三點, 判斷原點是否在這三點所圍成的三角形內。

     Given 3 points randomly in a plane, determine whether the origin is in the triangle formed by these 3 points or not.


## 想法 Thoughts：

     順時針沿著三角形的邊繞一圈，判斷某點是否在每條邊的右邊(透過外積判斷)，如果該點在每條邊的右邊，則此點就在三角形內；否則在三角形外。

## 做法 Method：

     利用外積判斷，假設有A、B、C三點，先求出各點與原點O構成的向量，並算OA與OB、OB與OC、OC與OA(順序不可顛倒)之外積的值；
     若這三個外積值都是正數或都是負數，則代表原點都在該邊的同側，於是原點O就會在三角形內。
     
     input: 輸入任意的三個座標
          >> a = [0 3];b = [-1 -1]; c = [3 0];
          >> triangle(a,b,c)
     output: (1) 判斷原點是否在三角形內 
             (2) 畫出三角形和原點
     
     1. 要求使用者「輸入」三角形的三點，假設這些點是A(x1,y1)、B(x2,y2)、C(x3,y3)；已知原點O(0,0)
        (若A、B、C其中一點即為原點，直接告訴使用者，原點在三角形的邊上)
        
     2. 先求出三個向量 OA,OB,OC
          origin = [0 0]; % Set the origin
          OA = a - o; 
          OB = b - o;
          OC = c - o;
          
     3. 計算 OA x OB, OB x OC, OC x OA ( x 表示外積 )
          x = OA(1)*OB(2)-OA(2)*OB(1); 
          y = OB(1)*OC(2)-OB(2)*OC(1);
          z = OC(1)*OA(2)-OC(2)*OA(1);
          
     4. 如果這三組的向量外積的值都是「同號」( 都是 正數 或都是 負數 )，即方向相同，
        則說明原點在三角形每條邊的同側，即三角形的內部；否則必在外部
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
          
     5. 告訴使用者原點是否在三角形內，並把原點跟三角形的相對位置圖畫出來
          % Draw the triangle
          plot(u, v, 'o-')
          hold on
          % Draw the origin
          plot(o1,o2,'o')
     
     
## 額外功能、延伸：
     
     利用原本的想法加以延伸：
     由於任何 n 多邊形都可以切成 n-2 個三角形，再去判斷原點或指定點是否在這 n-2 個三角形其中的某一個三角形內。
     
     作法：
     1. 讓使用者「以逆時針點擊」任意數量個點(直到按滑鼠右鍵停止)，假設這些點是A,B,C,D,E,...
        (所以若以A點為基準，這些點可以構成：三角形ABC、三角形ACD、三角形ADE、...)
          [x,y,BUTTON] = ginput(1);
          
     2. 將這些點所形成的多邊形和原點O(或指定點P)畫出來
          % Draw the polygon
          plot(XX, YY, 'o-')
          hold on
          % Draw the origin
          plot(o1,o2,'o')
          
     3. 計算出多邊形的面積並顯示
          for ii = 1:(number-1)
               AA = XX(ii)*YY(ii+1)-XX(ii+1)*YY(ii);
               A = A + AA;
          end
          Area = A*(1/2);
          disp('The area of the polygon is:')
          disp(Area)
          
     4. 如果原點O(或指定點P)在多邊形的邊上，就直接告訴使用者
          if X(ii) == 0 
               if Y(ii) == 0
                    disp('The origin is on the edge of the polygon.')
               end
          end
          
     5. 找出各點與原點(或指定點)構成的向量(OA,OB,OC,OD,OE,... 或 PA,PB,PC,PD,PE,...)，並統一存入一個矩陣
          for ii = 1:number
               OA(ii,1) = [X(ii)-o(1)];
               OA(ii,2) = [Y(ii)-o(2)];
          end
          
     6. 利用外積法去判斷原點(或指定點)是否在某一個三角形內
          crossVal = (OA(1,1)*OA(jj,2)) - (OA(1,2)*OA(jj,1));    
          crossVal1 = [crossVal1;crossVal];
          crossVal = (OA(jj,1)*OA(jj+1,2)) - (OA(jj,2)*OA(jj+1,1));
          crossVal2 = [crossVal2;crossVal];
          crossVal = (OA(ll,1)*OA(1,2)) - (OA(ll,2)*OA(1,1));
          crossVal3 = [crossVal3;crossVal];
          
          
     * 多邊形模式：
          點擊模式，使用者可以任意以逆時針方向點及滑鼠左鍵任意次，直到按右鍵停止，程式便會判斷原點是否在此多邊形內。
          (詳情看 polygon.m)
          input: 以逆時針任意點擊三個點
               >> polygon
          output: (1) 判斷原點是否在多邊形內 
                  (2) 畫出多邊形和原點
          
     * 可指定原點以外的點 和 設定可點擊的長寬範圍：
          使用者可以指定原點以外的點作為判斷目標，並設定點擊畫面的大小，
          再以逆時針點擊畫面上任意個點(直到按滑鼠右鍵停止)，最後判斷目標點是否在那些點構成的多邊形內，以及顯示多邊形和目標點的相對位置圖。
          (詳情看 polygon_point.m)
          input: 以逆時針任意點擊三個點
               >> p = [15 25];length = 150;width = 100;
               >> polygon_point(p,length,width)
          output: (1) 判斷原點是否在多邊形內 
                  (2) 畫出多邊形和指定點
          
     * 計算多邊形面積：
          以上兩種模式皆會計算出多邊形面積，利用 面積 = 1/2*[(X_1*Y_2 - X_2*Y_1) + (X_2*Y_3 - X_3*Y_2) + ... + (X_n*Y_1 - X_1*Y_n)] 之公式。
