# CSS 形状

## 大纲
> * 侧边（设固定宽度）：sidebar
* 栅栏（包含响应式）：grid
* 居中（块级带边距）：center
* 居左（块级带边距）：left
* 居右（块级带边距）：right
* 平铺（块级瀑布流）：tile

## 侧边（设固定宽度）：sidebar
> ### 说明
```html
<style>
  #sidebar {
    width: ${1:150px};
    background-color: ${2:#333};
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    z-index: 1000;
  }
  #container {
    padding-left: ${1:150px};
  }
</style>
<div id="sidebar" title="侧边栏">
</div>
<div id="container" title="容器">
</div>
```

## 栅栏（包含响应式）：grid
> ### 说明
```css
/*
1、准备：
1.1：栅栏布局依赖于 cdn-pure-grid
1.2：栅栏外部需要使用 <div class="pure-g"></div> 来包含
2、基础栅栏：
2.1：Pure栅格默认支持1、2、3、4、5、6、8、12、24列。比如用1-2替换*，class名就是pure-u-1-2，表示宽1/2，即50%。
3、响应式栅栏：
3.1：响应式栅栏依赖基础栅栏，书写响应式栅栏时，先使用基础栅栏书写最小屏的样式，再通过响应式标签去书写各种大屏下的样式。比如对应小屏幕的class是.pure-u-1，中屏幕.pure-u-md-1-2，大屏幕 .pure-u-lg-1-4。缩放浏览器可以看到效果
3.2：媒体查询关键词：
3.2.1：手机sm ≥ 568px：（Class名为.pure-u-sm-*-*）
3.2.2：平板md ≥ 768px：（Class名为.pure-u-md-*-*）
3.2.3：手提lg ≥ 1024px：（Class名为.pure-u-lg-*-*）
3.2.4：台式xl ≥ 1280px：（Class名为.pure-u-xl-*-*）
3.3：Class书写顺序：先基础，后响应，由小屏到大屏
*/
```

## 居中（块级带边距）：center
> ### 说明
```css
.section-center {
  margin: 0 auto; /* 设置块级居中 */
  max-width: ${1:300px}; /* 设置最大宽度 */
  padding: ${2:50px}; /* 设置内边距 */
  box-sizing: border-box; /* 内边距计算到盒子宽度中 */
}
```

## 居左（块级带边距）：left
> ### 说明
```css
.section-left {
  max-width: ${1:300px}; /* 设置最大宽度 */
  padding: ${2:50px}; /* 设置内边距 */
  box-sizing: border-box; /* 内边距计算到盒子宽度中 */
}
```

## 居右（块级带边距）：right
> ### 说明
```css
.section-right {
  float: right; /* 设置块级向右浮动 */
  max-width: ${1:300px}; /* 设置最大宽度 */
  padding: ${2:50px}; /* 设置内边距 */
  box-sizing: border-box; /* 内边距计算到盒子宽度中 */
  /* 注意：带边框居右，后面需清除右浮动 .clear{clear: both;} */
}
```

## 平铺（块级瀑布流）：tile
> ### 说明
```css
.section-tile {
  display: inline-block; /* 设置块级可平铺 */
  vertical-align: top;
  max-width: ${1:300px}; /* 设置最大宽度 */
  padding: ${2:50px}; /* 设置内边距 */
  margin: ${3:1em}; /* 设置外边距 */
  background-color: ${4:#EBDCA2}; /* 设置背景颜色 */
}
```
