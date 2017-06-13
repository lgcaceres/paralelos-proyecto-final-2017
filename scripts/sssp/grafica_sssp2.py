from bokeh.plotting import figure, output_file, show
import csv


with open('data2.csv', 'rb') as f:
    reader = csv.reader(f)

	#x = [1, 23, 33, 42, 52]
	#y = [6, 7, 8, 7, 3]
    x1=[]
    y1=[]
    x2=[]
    y2=[]
    x3=[]
    y3=[]
    x4=[]
    y4=[]

    for row in reader:
        x1.append(row[0])
        y1.append(row[1])
        x2.append(row[0])
        y2.append(row[2])
        x3.append(row[0])
        y3.append(row[3])
        x4.append(row[0])
        y4.append(row[4])
    print x1
    print y1


output_file("grafica_sssp.html")

p = figure(plot_width=500, plot_height=400)

# add both a line and circles on the same plot
p.line(x1, y1, line_width=2,legend="spray", line_color="blue")
p.circle(x1, y1, legend="spray",fill_color=None, line_color="blue")
#p.circle(x1, y1, legend="sin(x)",fill_color="white", size=8,line_color="green")

p.line(x2, y2, line_width=2,legend="lotanShavit",line_color="orange")
p.square(x2, y2, legend="lotanShavit", fill_color=None, line_color="orange")

p.line(x3, y3, line_width=2,legend="linden",line_color="red")
p.square(x3, y3, legend="linden", fill_color=None, line_color="red")

p.line(x4, y4, line_width=2,legend="skip",line_color="green")
p.square(x4, y4, legend="skip", fill_color=None, line_color="green")



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
