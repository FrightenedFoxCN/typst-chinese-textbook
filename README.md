# 用于中文教科书的 typst 模板

这个模板是一个以蓝色为重点色的中文通用教科书模板，排版的主要设计来源于 [LALU](https://github.com/yhwu-is/Linear-Algebra-Left-Undone) 的 LaTeX 模板设计.

## 主要功能

- 中文章节名支持，改写自 [PKUTHSS-Typst](https://github.com/pku-typst/pkuthss-typst) 中关于中文章节名设置的代码.
- 标题的特殊设计，主要依赖 showybox.
- 页眉的章节名设计，依赖于 hydra.
- 额外的拓展块设计，依赖于 showybox.

总之这就是一个心血来潮拼凑而成的产物，可能存在诸多的不稳定性，如果需要使用，请确保自己具备修改任意可能的问题的能力.

## 使用方法

参见 `test.typ` 为例导入模板即可，各种功能已在其中说明. 特别注意，目录的页码如果需要特殊设置，请见其中的用例.