# CSS 基础

## 大纲
> * 底线：display
* 显示：visibility
* 透明：opacity
* 兼容：zoom
* 优先：!important

## 底线：display
> ### 说明
```css
/* == 参数 ==
 * 无样式：none
 * 块级元素：block (底线向下换行)
 * 内联元素：inline (底线向左对齐)
 * 外部内联、内部块级元素：inline-block
 * 继承：inherit
 */
display: ${1:value};
```

## 显示：visibility
> ### 说明
```css
/* == 参数 ==
 * 可见：visible
 * 隐藏：hidden
 * 折叠：collapse
 * 继承：inherit
 */
visibility: ${1:value};
```

## 透明：opacity
> ### 说明
```css
/* == 参数 ==
 * 完全不透明：1.0
 * 完全透明：0.0
 * 继承：inherit
 */
opacity: 0.${1:value};
filter:Alpha(opacity=${1:value}0); /* 兼容 IE8 以及更早的浏览器 */
```

## 兼容：zoom
> ### 说明
```css
zoom: 1; ${1:/* IE 私有属性，解决兼容问题 */}
```

## 优先：!important
> ### 说明
```css
!important${1:/* 优先级最高 */}
```

