# CSS 盒子

## 大纲
> * 宽度：width
* 高度：height
* 边框：border
* 边框宽度：border-width
* 边框样式：border-style
* 边框颜色：border-color
* 边框圆角：border-radius
* 轮廓：outline
* 轮廓宽度：outline-width
* 轮廓样式：outline-style
* 轮廓颜色：outline-color
* 内边距：padding
* 外边距：margin
* 内容溢出：overflow
* 内容裁剪：clip
* 盒子限制：box-sizing
* 盒子阴影：box-shadow
* 媒体查询：@media

## 宽度：width
> ### 说明
```
/* == 前缀 ==
 * 固定：(none)
 * 极大：max-
 * 极小：min-
 *
 * == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
${1:min-}width: ${2:value};
```

## 高度：height
> ### 说明
```
/* == 前缀 ==
 * 固定：(none)
 * 极大：max-
 * 极小：min-
 *
 * == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
${1:min-}height: ${2:value};
```

## 边框：border
```
/* == 后缀 ==
 * 无：(none)
 * 上：-top
 * 下：-bottom
 * 左：-left
 * 右：-right
 *
 * == 参数 ==
 * 默认值：边框宽度 边框样式 边框颜色
 *
 * == 详细说明 ==
 * 1.边框宽度：none
 * - 绝对值：px
 * - 相对值：em
 * - 百分比：%
 * - 自动：auto
 * - 继承：inherit
 * 2.边框样式：none
 * - 无样式：none
 * - 隐藏：hidden
 * - 实线：solid
 * - 虚线：dashed
 * - 点状：dotted
 * - 继承：inherit
 * 3.边框颜色：none
 * - 名字：red
 * - hex：#000000
 * - rgb：rgb(255,0,0)
 * - 透明：transparent
 * - 反转：invert
 * - 继承：inherit
 */
border${1:-top}: ${2:border-width} ${3:border-style} ${4:border-color};
```

## 边框宽度：border-width
```
/* == 方向 ==
 * 全：one
 * 上下、右左：one two
 * 上、右左、下：one two three
 * 上、右、下、左：one two three four
 *
 * == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
border-width: ${1:value};
```

## 边框样式：border-style
```
/* == 方向 ==
 * 全：one
 * 上下、右左：one two
 * 上、右左、下：one two three
 * 上、右、下、左：one two three four
 *
 * == 参数 ==
 * 无样式：none
 * 隐藏：hidden
 * 实线：solid
 * 虚线：dashed
 * 点状：dotted
 * 继承：inherit
 */
border-style: ${1:value};
```

## 边框颜色：border-color
```
/* == 方向 ==
 * 全：one
 * 上下、右左：one two
 * 上、右左、下：one two three
 * 上、右、下、左：one two three four
 *
 * == 参数 ==
 * 名字：red
 * hex：#000000
 * rgb：rgb(255,0,0)
 * 透明：transparent
 * 反转：invert
 * 继承：inherit
 */
border-color: ${1:value};
```

## 边框圆角：border-radius
```
/* == 方向 ==
 * 全：one
 * 西北和东南、东北和西南：one two
 * 西北、东北和西南、东南：one two three
 * 西北、东北、东南、西南：one two three four
 *
 * == 半径 ==
 * 圆角半径：50px
 * 水平半径，垂直半径：50px/25px
 *
 * == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
border-radius: ${1:value};
```

## 轮廓：outline
```
/* == 参数 ==
 * 默认值：轮廓宽度 轮廓样式 轮廓颜色
 *
 * == 详细说明 ==
 * 1.轮廓宽度：none
 * - 绝对值：px
 * - 相对值：em
 * - 百分比：%
 * - 自动：auto
 * - 继承：inherit
 * 2.轮廓样式：none
 * - 无样式：none
 * - 隐藏：hidden
 * - 实线：solid
 * - 虚线：dashed
 * - 点状：dotted
 * - 继承：inherit
 * 3.轮廓颜色：none
 * - 名字：red
 * - hex：#000000
 * - rgb：rgb(255,0,0)
 * - 透明：transparent
 * - 反转：invert
 * - 继承：inherit
 */
outline: ${1:outline-width} ${2:outline-style} ${3:outline-color};
```

## 轮廓宽度：outline-width
```
/* == 方向 ==
 * 全：one
 * 上下、右左：one two
 * 上、右左、下：one two three
 * 上、右、下、左：one two three four
 *
 * == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
outline-width: ${1:value};
```

## 轮廓样式：outline-style
```
/* == 方向 ==
 * 全：one
 * 上下、右左：one two
 * 上、右左、下：one two three
 * 上、右、下、左：one two three four
 *
 * == 参数 ==
 * 无样式：none
 * 隐藏：hidden
 * 实线：solid
 * 虚线：dashed
 * 点状：dotted
 * 继承：inherit
 */
outline-style: ${1:value};
```

## 轮廓颜色：outline-color
```
/* == 方向 ==
 * 全：one
 * 上下、右左：one two
 * 上、右左、下：one two three
 * 上、右、下、左：one two three four
 *
 * == 参数 ==
 * 名字：red
 * hex：#000000
 * rgb：rgb(255,0,0)
 * 透明：transparent
 * 反转：invert
 * 继承：inherit
 */
outline-color: ${1:value};
```

## 内边距：padding
```
/* == 后缀 ==
 * 无：(none)
 * 上：-top
 * 下：-bottom
 * 左：-left
 * 右：-right
 *
 * == 方向 ==
 * 全：one
 * 上下、右左：one two
 * 上、右左、下：one two three
 * 上、右、下、左：one two three four
 *
 * == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
padding${1:-left}: ${2:value};
```

## 外边距：margin
```
/* == 后缀 ==
 * 无：(none)
 * 上：-top
 * 下：-bottom
 * 左：-left
 * 右：-right
 *
 * == 方向 ==
 * 全：one
 * 上下、右左：one two
 * 上、右左、下：one two three
 * 上、右、下、左：one two three four
 *
 * == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
margin${1:-left}: ${2:value};
```

## 内容溢出：overflow
```
/* == 后缀 ==
 * 全部：(none)
 * 水平：-x
 * 垂直：-y
 *
 * == 参数 ==
 * 可见：visible
 * 隐藏：hidden
 * 滚动：scroll
 * 自动：auto
 * 继承：inherit
 */
overflow${1:-y}: ${2:value};
```

## 内容裁剪：clip
```
/* == 参数 ==
 * 矩形：rect(0px,60px,200px,0px)
 * 自动：auto
 * 继承：inherit
 */
clip: ${1:value};
```

## 盒子限制：box-sizing
```
/* == 参数 ==
 * 内容基准：content-box
 * 边框基准：border-box
 * 继承：inherit
 */
box-sizing: ${1:value};
```

## 盒子阴影：box-shadow
```
/* == 参数 ==
 * 默认值：水平位置(必填) 垂直位置(必填) 模糊距离 阴影尺寸 阴影颜色
 *
 * == 详细说明 ==
 * 1.水平位置：
 * - 绝对值：px
 * - 相对值：em
 * - 百分比：%
 * - 自动：auto
 * - 继承：inherit
 * 2.垂直位置：
 * - 绝对值：px
 * - 相对值：em
 * - 百分比：%
 * - 自动：auto
 * - 继承：inherit
 * 3.模糊距离：
 * - 绝对值：px
 * - 相对值：em
 * - 百分比：%
 * - 自动：auto
 * - 继承：inherit
 * 4.阴影尺寸：
 * - 绝对值：px
 * - 相对值：em
 * - 百分比：%
 * - 自动：auto
 * - 继承：inherit
 * 5.阴影颜色：
 * - 名字：red
 * - hex：#000000
 * - rgb：rgb(255,0,0)
 * - 透明：transparent
 * - 反转：invert
 * - 继承：inherit
 */
box-shadow: ${1:value};
```

## 媒体查询：@media
```
@media screen and (min-width: 568px) { /* 大屏手机 */
  ${1:foo} {
    ${2:background-color:red;}
  }
}

@media screen and (min-width: 768px) { /* 平板电脑 */
  ${1:foo} {
    ${2:background-color:red;}
  }
}

@media screen and (min-width: 1024px) { /* 笔记本电脑 */
  ${1:foo} {
    ${2:background-color:red;}
  }
}

@media screen and (min-width: 1280px) { /* 宽屏电脑 */
  ${1:foo} {
    ${2:background-color:red;}
  }
}
```
