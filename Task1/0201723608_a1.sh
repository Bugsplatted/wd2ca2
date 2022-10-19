#Path of the end-user's image that he wants to resize
IMAGE= "$1"
#Width of the image that the end-user wants to have
WIDTH= "$2"
#Dividing the path to get the path without the extension
IMAGENAME =$(echo $IMAGE | cut -d"." -f 1)
#Divinding like in line 5 but for the extension
EXT =$"."$(echo $IMAGE | cut -d"." -f 2)
#if statement to chekc if the path is a empty string
if [-z "$IMAGE"]; then
    #if true, exit with code error 1
    exit 1
fi
#if statement to check id the width is a empty string
if [-z "$WIDTH"] || [$WIDTH -lt 1]; then
    #if true, exit with default value of width=100px
    WIDTH=100
fi
#reiszing the image
convert $IMAGE -resize "$WIDTH"x $IMAGENAME$WIDTH$EXT
