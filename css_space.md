# CSS 留白

## 大纲
> * 文本对齐：text-align
* 文本开头缩进：text-indent
* 字母间距：letter-spacing
* 单词间距：word-spacing
* 空白间距：white-space
* 行高：line-height
* 列表样式：list-style
* 垂直对齐：vertical-align

## 文本对齐：text-align
> ### 说明
```css
/* == 参数 ==
 * 文本居左：left
 * 文本居中：center
 * 文本居右：right
 * 两端对齐：justify
 * 继承：inherit
 */
text-align: ${1:value};
```

## 文本开头缩进：text-indent
> ### 说明
```css
/* == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
text-indent: ${1:value};
```

## 字母间距：letter-spacing
> ### 说明
```css
/* == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
letter-spacing: ${1:value};
```

## 单词间距：word-spacing
> ### 说明
```css
/* == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
word-spacing: ${1:value};
```

## 空白间距：white-space
> ### 说明
```css
/* == 参数 ==
 * 正常：normal
 * 不换行：nowrap
 * 换行：pre
 */
white-space: ${1:value};
```

## 行高：line-height
> ### 说明
```css
/* == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
line-height: ${1:value};
```

## 列表样式：list-style
> ### 说明
```css
/* == 参数 ==
 * 默认值：列表类型 列表位置 列表图像
 *
 * == 详细说明 ==
 * 1.列表类型：ul:disc/ol:decima
 * - 实心圆：disc
 * - 空心圆：circle
 * - 实心方块：square
 * - 数字：decima
 * - 罗马数字：upper-roman
 * - 拉丁字母：lower-alpha
 * - 无样式：none
 * 2.列表位置：outside
 * - 文本以外：outside
 * - 文本以内：inside
 * - 继承：inherit
 * 3.列表图像：none
 * - 图片路径：url(URL)
 * - 无样式：none
 * - 继承：inherit
 */
list-style: ${1:value};
```

## 垂直对齐：vertical-align
> ### 说明
```css
/* == 参数 ==
 * 默认基线对齐：baseline
 * 把内联元素(如图片)的顶端与文字的顶端对齐：text-top
 * 把内联元素(如图片)的中端与文本的中端对齐：middle
 * 把内联元素(如图片)的底端与文字的底端对齐：text-bottom
 * 继承：inherit
 */
vertical-align: ${1:value};
```
