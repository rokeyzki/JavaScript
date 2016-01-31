# CSS 基础

## 大纲
> * 区块：display
* 显示：visibility
* 透明：opacity
* 兼容：zoom
* 优先：!important

## 区块：display
> ### 说明
```
/* == 参数 ==
 * 无样式：none
 * 块级：block
 * 行内：inline
 * 行内块级：inline-block
 * 继承：inherit
 */
display: ${1:value};
```

## 显示：visibility
> ### 说明
```
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
```
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
```
zoom: 1; ${1:/* IE 私有属性，解决兼容问题 */}
```

## 优先：!important
> ### 说明
```
!important${1:/* 优先级最高 */}
```

