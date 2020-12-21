# final_project-hsinyuchen0214
final_project-hsinyuchen0214 created by GitHub Classroom

## My Project : Project 5

## 題目：

     任意給定平面上三點, 判斷原點是否在這三點所圍成的三角形內。

     Give 3 points randomly, determine whether the origin is in the triangle formed by the 3 points or not.


## 想法 Thoughts：

     順時針沿著三角形的邊繞，判斷某點是否在每條邊的右邊(透過外積判斷)，如果該點在每條邊的右邊，則此點就在三角形內；否則在三角形外。

## 做法 Method：

     利用外積判斷，假設A、B、C三點，先求出各點與原點構成的向量，並算OA與OB、OB與OC、OC與OA(順序不可顛倒)之外積的值，若這三個值都是正數或都是負數，則代表原點都在該邊的同側，因此原點在三角形內。
     
     要求使用者 輸入 三角形的三點 A(x1,y1)，B(x2,y2)，C(x3,y3)；原點 O(0,0)
     1. 先求出三個向量 OA,OB,OC
     2. 計算 OA x OB, OB x OC, OC x OA ( x 表示外積)
     3. 如果這三組的向量外積的值都是同號(都是 正數 或都是 負數 )，即方向相同，則說明原點在三角形每條邊的同側，即三角形的內部；否則必在外部
     
## 額外功能：

     1. 多邊形模式：點擊模式，使用者可以任意以逆時針方向點及滑鼠左鍵任意次，直到按右鍵停止，程式便會判斷原點是否在此多邊形內。
     2. 可指定其他點：指定原點以外的點，點擊任意點，並判斷此點是否在那些點構成的多邊形內。
     3. 計算多邊形面積：以上兩種模式皆會計算出多邊形面劑，利用 面積 = 1/2*[(X_1*Y_2 - X_2*Y_1) + (X_2*Y_3 - X_3*Y_2) + ... + (X_n*Y_1 - X_1*Y_n)] 之公式
