# final_project-hsinyuchen0214
final_project-hsinyuchen0214 created by GitHub Classroom

My Project : Project 5

題目：任意給定平面上三點, 判斷原點是否在這三點所圍成的三角形內。

Give 3 points randomly, determine whether the origin is in the triangle formed by the 3 points or not.


想法 Thoughts：

順時針沿著三角形的邊繞，判斷某點是否在每條邊的右邊(透過外積判斷)，如果該點在每條邊的右邊，則此點就在三角形內；否則在三角形外。

做法 Method：

利用外積判斷，假設A、B、C三點，先求出各點與原點構成的向量，並算OA與OB、OB與OC、OC與OA之外積的值，若這三個值都是正數或都是負數，則代表原點在三角形內。
