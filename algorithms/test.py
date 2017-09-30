class Rectangle(object):

  def __init__(self, width, height):
    self.__width = width
    self.__height = height


  def getArea(self):
    return self.__width * self.__height






rec = Rectangle(3,4)

print rec.getArea()