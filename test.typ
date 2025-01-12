#import "CHNtemplate.typ": *
#show: doc => conf(doc)

#set page(numbering: "i")
#makecontent()
#counter(page).update(1)
#set page(numbering: "1")
#show: fix-indent()

= 章节标题测试

本章主要对章节摘要功能进行测试. 本章要求读者具备基本的 typst 编程能力和阅读能力，能够理解简单的 typst 代码.

#infobox(title: "本章摘要")[在本章中，读者将理解如何构建一个教科书的摘要栏，并且使得其能够放在章节起首处. 在编写一些教科书时，这往往是重要的.]

== 正文第一部分

在这一部分中，我们将展示如何正确书写正文. 正文的书写往往是重要的，它能够使得我们快速把握关键内容，获得对主要内容的准确理解.

在正文中，我们通常需要用到*加粗*、_强调_和#underline[下划线]来对内容进行强调，也可以使用脚注#footnote[所谓的脚注，指的就是那些不重要的、简短的内容，通常在每一页的下方呈现.]来对主要的内容加以补充.

== 正文第二部分

我们也可以建立多级标题机制，例如：

=== 三级标题

三级标题将不会被展示在目录当中.

#infobox(title: "拓展阅读")[
  可以通过这样的方式放置一个带标题的方块.
]

=== 关于扩展方块

#extrabox[
  也可以像这样放一个小方块，来表示拓展内容. 因为没有中文对应的 lorem ipsum 相关的包，所以姑且如此说一些废话来处理.
]

#pagebreak()

= 第二章的内容