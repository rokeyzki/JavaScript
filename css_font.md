# CSS 字体

## 大纲
> * 字体栈：font-family
* 字体尺寸：font-size
* 字体粗体：font-weight
* 字体斜体：font-style
* 字体颜色：color
* 文本大小写：text-transform
* 文本下划线：text-decoration
* 文本阴影：text-shadow

## 字体栈：font-family
> ### 说明
```css
/* == 参数 ==
 * v2ex："Helvetica Neue", "Luxi Sans", "DejaVu Sans", Tahoma, "Hiragino Sans GB", "Microsoft Yahei", sans-serif;
 * 锤子：Helvetica, Arial, "Hiragino Sans GB", "Microsoft Yahei", "微软雅黑", STHeiti, "华文细黑", sans-serif;
 * 继承：inherit
 */
font-family: "Helvetica Neue", "Luxi Sans", "DejaVu Sans", Tahoma, "Hiragino Sans GB", "Microsoft Yahei", sans-serif;
```

## 字体尺寸：font-size
> ### 说明
```css
/* == 参数 ==
 * 绝对值：px
 * 相对值：em
 * 百分比：%
 * 自动：auto
 * 继承：inherit
 */
font-size: ${1:value};
```

## 字体粗体：font-weight
> ### 说明
```css
/* == 参数 ==
 * 最粗：700
 * 更粗：600
 * 粗体：500
 * 正常：400
 * 细体：300
 * 更细：200
 * 最细：100
 * 继承：inherit
 */
font-weight: ${1:value};
```

## 字体斜体：font-style
> ### 说明
```css
/* == 参数 ==
 * 正常：normal
 * 斜体：italic
 * 正常字体强制倾斜：oblique
 * 继承：inherit
 */
font-style: ${1:value};
```

## 字体颜色：color
> ### 说明
```css
/* == 参数 ==
 * 名字：red
 * hex：#000000
 * rgb：rgb(255,0,0)
 * 透明：transparent
 * 反转：invert
 * 继承：inherit
 */
color: ${1:value};
```

## 文本大小写：text-transform
> ### 说明
```css
/* == 参数 ==
 * 无样式：none
 * 单词首字母大写：capitalize
 * 全部大写：uppercase
 * 全部小写：lowercase
 * 继承：inherit
 */
text-transform: ${1:value};
```

## 文本下划线：text-decoration
> ### 说明
```css
/* == 参数 ==
 * 无样式：none
 * 上划线：overline
 * 中划线：line-through
 * 下划线：underline
 * 继承：inherit
 */
text-decoration: ${1:value};
```

## 文本阴影：text-shadow
> ### 说明
```css
/* == 参数 ==
 * 默认值：水平位置(必填) 垂直位置(必填) 模糊距离 阴影颜色
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
 * 4.阴影颜色：
 * - 名字：red
 * - hex：#000000
 * - rgb：rgb(255,0,0)
 * - 透明：transparent
 * - 反转：invert
 * - 继承：inherit
 */
text-shadow: ${1:value};
```
