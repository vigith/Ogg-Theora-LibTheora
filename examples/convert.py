
import Image

for i in range(0,3):
 file = 'dec_pic%s.raw' %(i,)
 fd=open(file,'rb')
 x=fd.read()
 fd.close()
 img=Image.fromstring('RGB',(320,240),x)
 img.save("extracted_%s.jpg" %(i,))

