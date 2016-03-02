# CSS 盒子

## 大纲
> * 宽度：width
* 高度：height
* 边框：border
* 边框宽度：border-width
* 边框样式：border-style
* 边框颜色：border-color
* 边框圆角：border-radius
* 内边距：padding
* 外边距：margin
* 盒子限制：box-sizing
* 盒子阴影：box-shadow
* 媒体查询：@media

## 宽度：width
> ### 说明
```css
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
```css
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
> ### 说明
```css
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
> ### 说明
```css
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
> ### 说明
```css
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
> ### 说明
```css
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
> ### 说明
```css
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

## 内边距：padding
> ### 说明
```css
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
> ### 说明
```css
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

## 盒子限制：box-sizing
> ### 说明
```css
/* == 参数 ==
 * 内容基准：content-box
 * 边框基准：border-box (内边距 padding 和边框 border 不再会增加元素的宽度和高度)
 * 继承：inherit
 */
box-sizing: ${1:value};
```

## 盒子阴影：box-shadow
> ### 说明
```css
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
```css
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
