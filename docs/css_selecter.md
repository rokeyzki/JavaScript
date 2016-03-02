# CSS 选择

## 大纲
> * 伪类(一个冒号:)
* 伪元素(两个冒号::)

## 伪类(一个冒号:)
> ### 说明
* 链接未被访问前：`a:link`
* 链接已被访问后：`a:visited`
* 鼠标置于链接上方时：`a:hover`
* 鼠标点击链接时：`a:active`
* 表单作为焦点被选中时：`input:focus`
* 符合选择条件的第一个元素：`li:first-child`

## 伪元素(两个冒号::)
> ### 说明
> * 符合选择条件的元素前面生成子元素：
```css
div::before {
  content: "some text";
  other style
}
```

> * 符合选择条件的元素后面生成子元素：
```css
div::after {
  content: "some text";
  other style
}
```

> * 文本信息被双击时修改该文本颜色和阴影：
```css
p::selection {
  color:yellow;
  text-shadow: 1px 1px 1px red;
}
```
