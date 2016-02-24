# CSS 修正

## 大纲
> * 内容溢出：overflow
* 内容裁剪：clip
* 长词换行：word-wrap
* 鼠标指针：cursor

## 内容溢出：overflow
> ### 说明
```css
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
> ### 说明
```css
/* == 参数 ==
 * 矩形：rect(0px,60px,200px,0px)
 * 自动：auto
 * 继承：inherit
 */
clip: ${1:value};
```

## 长词换行：word-wrap
> ### 说明
```css
/* == 参数 ==
 * 浏览器保持默认处理：normal
 * 对行尾的长单词或长数字自动进行换行：break-word
 */
word-wrap: break-word;
```

## 鼠标指针：cursor
> ### 说明
```css
/* == 参数 ==
 * 自动判定：auto
 * 普通：default
 * 食指（提示可点击）：pointer
 * 竖条（提示可编辑）：text
 * 转圈（提示加载中）：wait
 * 问号（提示有注释）：help
 * 细十字（提示焦距）：crosshair
 * 粗十字（提示可移动）：move
 * 朝东箭头：e-resize
 * 朝西箭头：w-resize
 * 朝北箭头：n-resize
 * 朝南箭头：s-resize
 * 东北箭头：ne-resize
 * 西北箭头：nw-resize
 * 东南箭头：se-resize
 * 西南箭头：sw-resize
 */
cursor: ${1:value};
```
