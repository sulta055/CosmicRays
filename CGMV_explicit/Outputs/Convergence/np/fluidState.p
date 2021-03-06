#Fluid State Plot
#plot from file: output.txt

set terminal gif animate delay 10 size 1280, 680
set output 'convergence_fluid.gif'


tSteps=350
nx1=1000
nx2=nx1
nx3=nx2
nx4=nx3


set key font ",10"

set autoscale
do for [i=0:tSteps-1] {
  set title "Time Step = #".(i+1)
  set multiplot layout 3,1
  #plot 1: fluid density
  #set label 1 'Fluid Density' at graph 0.92,0.9 font ',8'
  #set xlabel "x"
  set ylabel "Density"
  plot "output_fluid1.txt" every ::i*nx1+1::nx1+(i*nx1)-1 using 1:2 with lines lc rgb "red" title "np=100" ,\
 "output_fluid2.txt" every ::i*nx2+1::nx2+(i*nx2)-1 using 1:2 with lines lc rgb "green" title "np=200" ,\
 "output_fluid3.txt" every ::i*nx3+1::nx3+(i*nx3)-1 using 1:2 with lines lc rgb "blue" title "np=250" ,\
 "output_fluid4.txt" every ::i*nx4+1::nx4+(i*nx4)-1 using 1:2 with lines lc rgb "purple" title "np=60"
 
  unset title
  unset xlabel
  unset ylabel

  #plot 3: Fluid Pressure
  #set label 1 'Fluid Pressure' at graph 0.92,0.9 font ',8'
  set xlabel "x"
  set ylabel "Pgas"
  plot "output_fluid1.txt" every ::i*nx1+1::nx1+(i*nx1)-1 using 1:4 with lines lc rgb "red" title "np=100" ,\
 "output_fluid2.txt" every ::i*nx2+1::nx2+(i*nx2)-1 using 1:4 with lines lc rgb "green" title "np=200" ,\
 "output_fluid3.txt" every ::i*nx3+1::nx3+(i*nx3)-1 using 1:4 with lines lc rgb "blue" title "np=250" ,\
 "output_fluid4.txt" every ::i*nx4+1::nx4+(i*nx4)-1 using 1:4 with lines lc rgb "purple" title "np=60"
  
  unset xlabel
  unset ylabel

#plot 3: CR Pressure
  #set label 1 'CR Pressure' at graph 0.92,0.9 font ',8'
  set xlabel "x"
  set ylabel "Pc"
  plot "output_fluid1.txt" every ::i*nx1+1::nx1+(i*nx1)-1 using 1:5 with lines lc rgb "red" title "np=100" ,\
 "output_fluid2.txt" every ::i*nx2+1::nx2+(i*nx2)-1 using 1:5 with lines lc rgb "green" title "np=200" ,\
 "output_fluid3.txt" every ::i*nx3+1::nx3+(i*nx3)-1 using 1:5 with lines lc rgb "blue" title "np=250" ,\
 "output_fluid4.txt" every ::i*nx4+1::nx4+(i*nx4)-1 using 1:5 with lines lc rgb "purple" title "np=60"
  
  unset xlabel
  unset ylabel


  unset multiplot

}

unset output
