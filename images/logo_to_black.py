import cv2
import numpy as np

# 读取png图片
img = cv2.imread('cdut_with_logo.png', cv2.IMREAD_UNCHANGED)

# 将所有非透明像素点的颜色设置为黑色
img[img[:, :, 3] > 0] = [0, 0, 0, 255]

# 保存处理后的图片
cv2.imwrite('output.png', img)
