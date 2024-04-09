import cv2


# 获取基于透明元素的裁剪区域
def get_transparency_location(image):
    first_transparency: list[tuple] = []
    last_transparency: list[tuple] = []
    for y, rows in enumerate(image):
        first_location = None
        for x, BGRA in enumerate(rows):
            # BGRA[3]为透明度
            alpha = BGRA[3]
            if alpha != 0:
                # 当到新的一行时，记录一下第一个非透明像素的位置，其中有最靠上和最靠左的像素
                if not first_location or first_location[1] != y:
                    first_location = (x, y)
                    first_transparency.append(first_location)
                # 记录最后一个非透明像素的位置，其中有最靠下和最靠右的像素
                last_transparency.append(
                    (
                        x,
                        y,
                    )
                )

    # 获取最靠上的像素
    top = min(first_transparency, key=lambda item: item[1])[1]
    # 获取最靠左的像素
    left = min(first_transparency, key=lambda item: item[0])[0]
    # 获取最靠下的像素
    bottom = max(last_transparency, key=lambda item: item[1])[1]
    # 获取最靠右的像素
    right = max(last_transparency, key=lambda item: item[0])[0]
    return top, bottom, left, right


if __name__ == "__main__":
    imgname = "cdut_with_logo.png"
    # 读取PNG图片
    image = cv2.imread(imgname, cv2.IMREAD_UNCHANGED)
    box = get_transparency_location(image)
    result = image[box[0] : box[1], box[2] : box[3]]
    cv2.imwrite("output.png", result)
