#import "fonts.typ": 字体
#import "fonts.typ": 字号

#set page("a4",
margin: (bottom: 150pt),
footer: [
  #set align(center)
  #set text(font: 字体.宋体, size: 字号.小三)
  #text("2023 年 5 月 20 日")
],
)

// logo
#set align(center)
#image("images/cdut.png", height: 64pt)

#let course="《Python 程序设计》"
#let topic="论如何给母猪做产后护理"
#let name="张三"
#let studentid="114514"
#let college="计算机学院"
#let major="母猪的产后护理"
#let teacher="李四"


#let fieldname(name) = [
  #let name = text(name, font: 字体.黑体, size: 字号.小三)
  #set align(right + top)
  #strong(name)
]

#let fieldvalue(value) = [
  #set align(center + horizon)
  #set text(font: 字体.黑体, size: 字号.小三)
  #grid(
    rows: (auto, auto),
    box(
      value,
      height: 字号.小三 - 2pt,
    ),
    line(length: 100%)
  )
]

// 距离 logo 的距离
#v(75pt)

#let course_name_left = [
    #set align(center + horizon)
    #set text(font: 字体.黑体,    size: 字号.小三)
    #grid(
      rows: (auto, auto),
      row-gutter: 0.2em,
      course,
      line(length: 100%)
    )
]

#let course_name_right = [
  #set text(font: 字体.黑体, size: 字号.小三)
  #set align(left + top)
  #strong("项目报告")
]

#grid(
  columns: (字号.小三*18, 字号.小三*4),
  row-gutter: 3em,
  course_name_left,
  course_name_right,
)

#v(3em)

#grid(
  // 左右列宽
  columns: (字号.小三*5, 字号.小三*18),
  // 行间距
  row-gutter: 3em,
  fieldname("设计题目："),
  fieldvalue(topic),
  fieldname("学院名称："),
  fieldvalue(college),
  fieldname("专业名称："),
  fieldvalue(major),
  fieldname("学生姓名："),
  fieldvalue(name),
  fieldname("学生学号："),
  fieldvalue(studentid),
  fieldname("任课老师："),
  fieldvalue(teacher),
  fieldname("设计成绩："),
  fieldvalue(text("")),
)

#pagebreak()
