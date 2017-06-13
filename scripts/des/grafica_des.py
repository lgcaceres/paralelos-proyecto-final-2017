from bokeh.plotting import figure, output_file, show
import csv


with open('data3.csv', 'rb') as f:
    reader = csv.reader(f)

	#x = [1, 23, 33, 42, 52]
	#y = [6, 7, 8, 7, 3]
    tag1=[]
    x1=[]
    y1=[]
    tag2=[]
    x2=[]
    y2=[]
    tag3=[]
    x3=[]
    y3=[]
    tag4=[]
    x4=[]
    y4=[]
    tag5=[]
    x5=[]
    y5=[]
    tag6=[]
    x6=[]
    y6=[]
    tag7=[]
    x7=[]
    y7=[]
    tag8=[]
    x8=[]
    y8=[]
    tag9=[]
    x9=[]
    y9=[]

    for row in reader:
        if row[0]=="100" :
            tag1.append(row[0])
            x1.append(row[1])
            y1.append(row[2])
            tag2.append(row[3])
            x2.append(row[4])
            y2.append(row[5])
            tag3.append(row[6])
            x3.append(row[7])
            y3.append(row[8])
        
           

        if row[0]=="1000":
            tag4.append(row[0])
            x4.append(row[1])
            y4.append(row[2])
            tag5.append(row[3])
            x5.append(row[4])
            y5.append(row[5])
            tag6.append(row[6])
            x6.append(row[7])
            y6.append(row[8])

        if row[0]=="10000":
            tag7.append(row[0])
            x7.append(row[1])
            y7.append(row[2])
            tag8.append(row[3])
            x8.append(row[4])
            y8.append(row[5])
            tag9.append(row[6])
            x9.append(row[7])
            y9.append(row[8])
            
        
   # print tag1
   # print x1
   # print y1


output_file("grafica_des.html")

p = figure(plot_width=700, plot_height=700)

# add both a line and circles on the same plot
p.line(x1, y1, line_width=2,legend="spray"+tag1[0], line_color="blue")
p.circle(x1, y1, legend="spray"+tag1[0],fill_color=None, line_color="blue")

p.line(x4, y4, line_width=2,legend="spray"+tag4[0], line_color="navy")
p.circle(x4, y4, legend="spray"+tag4[0],fill_color=None, line_color="navy")

p.line(x7, y7, line_width=2,legend="spray"+tag7[0], line_color="deepskyblue")
p.circle(x7, y7, legend="spray"+tag7[0],fill_color=None, line_color="deepskyblue")



p.line(x2, y2, line_width=2,legend="lotan_shavit"+tag2[0], line_color="red")
p.circle(x2, y2, legend="lotan_shavit"+tag2[0],fill_color=None, line_color="red")

p.line(x5, y5, line_width=2,legend="lotan_shavit"+tag5[0], line_color="darksalmon")
p.circle(x5, y5, legend="lotan_shavit"+tag5[0],fill_color=None, line_color="darksalmon")

p.line(x8, y8, line_width=2,legend="lotan_shavit"+tag8[0], line_color="firebrick")
p.circle(x8, y8, legend="lotan_shavit"+tag8[0],fill_color=None, line_color="firebrick")


p.line(x3, y3, line_width=2,legend="linden"+tag3[0], line_color="green")
p.circle(x3, y3, legend="linden"+tag3[0],fill_color=None, line_color="green")

p.line(x6, y6, line_width=2,legend="linden"+tag6[0], line_color="springgreen")
p.circle(x6, y6, legend="linden"+tag6[0],fill_color=None, line_color="springgreen")

p.line(x9, y9, line_width=2,legend="linden"+tag9[0], line_color="lime")
p.circle(x9, y9, legend="linden"+tag9[0],fill_color=None, line_color="lime")





p.legend.location = "bottom_right"
p.legend.background_fill_color = "white"
p.legend.background_fill_alpha = 0.5

#p.legend.label_standoff = 10
#p.legend.glyph_width = 20
#p.legend.spacing = 10
#p.legend.margin = 20
#p.legend.padding = 10


show(p)
#save(p,"xx.html")
