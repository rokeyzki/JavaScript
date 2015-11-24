# DOM 样式
CSS与JavaScript是两个有着明确分工的领域，前者负责页面的视觉效果，后者负责与用户的行为互动，但是，它们毕竟同属网页开发的前端，因此不可避免有着交叉和互相配合

## 大纲
> ### 属性
>> * 获取元素的各种样式属性：Element.prototype.style.cssScripts
* 获取元素的完整样式文本信息：Element.prototype.style.cssText

> ### 方法
>> * 设置目标元素的样式属性：Element.prototype.style.setPropertyValue()
* 读取目标元素的样式属性：Element.prototype.style.getPropertyValue()
* 移除目标元素的样式属性：Element.prototype.style.removeProperty()

## CSS
> ### 基础
>> * 区块：display
  * 无样式：none
  * 块级：block
  * 行内：inline
  * 行内块级：inline-block
  * 继承：inherit
* 显示：visibility
  * 可见：visible
  * 隐藏：hidden
  * 折叠：collapse
  * 继承：inherit

> ### 盒子
>> * 宽度：width
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 高度：height
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 最大(小)宽度：max(min)-width
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 最大(小)高度：max(min)-height
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 边框：border
  * 集合：border-width、border-style、border-color
* 边框宽度：border-width
  * 全：10px
  * 上下、右左：10px 20px
  * 上、右左、下：10px 20px 30px
  * 上、右、下、左：10px 20px 30px 40px
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 边框样式：border-style
  * 无样式：none
  * 隐藏：hidden
  * 实线：solid
  * 虚线：dashed
  * 点状：dotted
  * 继承：inherit
* 边框颜色：border-color
  * 名字：red
  * hex：#000000
  * rgb：rgb(255,0,0)
  * 透明：transparent
  * 反转：invert
  * 继承：inherit
* 边框圆角：border-radius
  * 全：10px
  * 上下、右左：10px 20px
  * 上、右左、下：10px 20px 30px
  * 上、右、下、左：10px 20px 30px 40px
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 轮廓：outline
  * 集合：outline-color、outline-style、outline-width
* 轮廓颜色：outline-color
  * 名字：red
  * hex：#000000
  * rgb：rgb(255,0,0)
  * 透明：transparent
  * 反转：invert
  * 继承：inherit
* 轮廓样式：outline-style
  * 无样式：none
  * 隐藏：hidden
  * 实线：solid
  * 虚线：dashed
  * 点状：dotted
  * 继承：inherit
* 轮廓宽度：outline-width
  * 全：10px
  * 上下、右左：10px 20px
  * 上、右左、下：10px 20px 30px
  * 上、右、下、左：10px 20px 30px 40px
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 内边距：padding
  * 全：10px
  * 上下、右左：10px 20px
  * 上、右左、下：10px 20px 30px
  * 上、右、下、左：10px 20px 30px 40px
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 外边距：margin
  * 全：10px
  * 上下、右左：10px 20px
  * 上、右左、下：10px 20px 30px
  * 上、右、下、左：10px 20px 30px 40px
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 内容溢出：overflow
  * 可见：visible
  * 隐藏：hidden
  * 滚动：scroll
  * 自动：auto
  * 继承：inherit
* 内容水平溢出：overflow-x
  * 可见：visible
  * 隐藏：hidden
  * 滚动：scroll
  * 自动：auto
  * 继承：inherit
* 内容垂直溢出：overflow-y
  * 可见：visible
  * 隐藏：hidden
  * 滚动：scroll
  * 自动：auto
  * 继承：inherit
* 内容裁剪：clip
  * 矩形：rect(0px,60px,200px,0px)
  * 自动：auto
  * 继承：inherit
* 盒子限制：box-sizing
  * 内容基准：content-box
  * 边框基准：border-box
  * 继承：inherit
* 盒子阴影：box-shadow
  * 水平位置、垂直位置：10px 20px
  * 水平位置、垂直位置、阴影颜色：10px 20px red
  * 水平位置、垂直位置、模糊距离、阴影颜色：10px 20px 5px red
  * 水平位置、垂直位置、模糊距离、阴影尺寸、阴影颜色：10px 20px 5px 5px red
* 响应规则：@media
  * 当页面宽度小于760px时使用的样式：@media screen and (max-width: 760px) { /* code */ }
  * 当页面宽度大于760px时使用的样式：@media screen and (min-width: 760px) { /* code */ }

> ### 背景
>> * 背景：background
  * 集合：background-color、background-position、background-size、background-repeat、background-origin、background-clip、background-attachment、background-image
* 背景颜色：background-color
  * 名字：red
  * hex：#000000
  * rgb：rgb(255,0,0)
  * 透明：transparent
  * 反转：invert
  * 继承：inherit
* 背景位置：background-position
  * 中央：center
  * 顶部：top
  * 底部：bottom
  * 左边：left
  * 右边：right
* 背景尺寸：background-size
  * 绝对值拉伸：px
  * 百分比拉伸：%
  * 覆盖：cover
  * 适应：contain
* 背景重复：background-repeat
  * 全重复：repeat
  * 水平重复：repeat-x
  * 垂直重复：repeat-y
  * 不重复：no-repeat
  * 继承：inherit
* 背景定位区域：background-origin
  * 内容基准：content-box
  * 边框基准：border-box
  * 继承：inherit
* 背景绘制区域：background-clip
  * 内容基准：content-box
  * 边框基准：border-box
  * 继承：inherit
* 背景滚动：background-attachment
  * 滚动：scroll
  * 固定：fixed
  * 继承：inherit
* 背景图片：background-image
  * 图片路径：url(URL)
  * 无样式：none
  * 继承：inherit
* 不透明度：opacity
  * 完全不透明：1.0
  * 完全透明：0.0
  * 继承：inherit

> ### 格式
>> * 行级对齐：vertical-align
  * 基线对齐：baseline
  * 上标对齐：text-top
  * 中部对齐：middle
  * 下标对齐：text-bottom
  * 继承：inherit
* 块级对齐：text-align
  * 左侧对齐：left
  * 中间对齐：center
  * 右侧对齐：right
  * 两端对齐：justify
  * 继承：inherit
* 文本缩进：text-indent
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 字母间距：letter-spacing
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 单词间距：word-spacing
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 空白间距：white-space
  * 正常：normal
  * 不换行：nowrap
  * 换行：pre
* 列表：list-style
  * 集合：list-style-type、list-style-position、list-style-image
* 列表类型：list-style-type
  * 实心圆：disc
  * 空心圆：circle
  * 方框：square
  * 数字：decima
  * 罗马数字：upper-roman
  * 拉丁字母：lower-alpha
  * 无样式：none
* 列表位置：list-style-position
  * 文本以外：outside
  * 文本以内：inside
  * 继承：inherit
* 列表图像：list-style-image
  * 图片路径：url(URL)
  * 无样式：none
  * 继承：inherit

> ### 字体
>> * 字体：font
  * 集合：font-style、font-variant、font-weight、font-size、font-family
* 字体样式：font-style
  * 正常：normal
  * 斜体：italic
  * 倾斜：oblique
  * 继承：inherit
* 字体变体：font-variant
  * 正常：normal
  * 小型大写：small-caps
  * 继承：inherit
* 字体粗细：font-weight
  * 最粗：700
  * 更粗：600
  * 粗体：500
  * 正常：400
  * 细体：300
  * 更细：200
  * 最细：100
  * 继承：inherit
* 字体大小：font-size
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 字体样式：font-family
  * 常用："Microsoft YaHei", "SimSun", "Helvetica Neue", Arial, Helvetica, sans-serif;
  * 继承：inherit
* 字体行高：line-height
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 字体大小写：text-transform
  * 无样式：none
  * 单词首字母大写：capitalize
  * 全部大写：uppercase
  * 全部小写：lowercase
  * 继承：inherit
* 字体修饰：text-decoration
  * 无样式：none
  * 上划线：overline
  * 中划线：line-through
  * 下划线：underline
  * 继承：inherit
* 字体阴影：text-shadow
  * 水平位置、垂直位置：10px 20px
  * 水平位置、垂直位置、阴影颜色：10px 20px red
  * 水平位置、垂直位置、模糊距离、阴影颜色：10px 20px 5px red
  * 水平位置、垂直位置、模糊距离、阴影尺寸、阴影颜色：10px 20px 5px 5px red
* 字体颜色：color
  * 名字：red
  * hex：#000000
  * rgb：rgb(255,0,0)
  * 透明：transparent
  * 反转：invert
  * 继承：inherit

> ### 变换
>> * 变换：transform
  * 无样式：none
  * 移动：transform(20px,10px)
  * 旋转：rotate(45deg)
  * 继承：inherit
* 变换原点：transform-origin
  * 坐标：20% 40%

> ### 定位
>> * 位置：position
  * 自然：static
  * 相对：relative
  * 全局固定：fixed
  * 局部固定：absolute
* 上移：top
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 下移：bottom
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 左移：left
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 右移：right
  * 绝对值：px
  * 相对值：em
  * 百分比：%
  * 自动：auto
  * 继承：inherit
* 浮动：float
  * 无样式：none
  * 左侧浮动：left
  * 右侧浮动：right
  * 继承：inherit
* 清除：clear
  * 无样式：none
  * 左侧不浮动：left
  * 右侧不浮动：right
  * 两侧不浮动：both
  * 继承：inherit
* 层级：z-index
  * 自动：auto
  * 级数：0 到 2147483647
  * 继承：inherit

> ### 动画
>> * 动画：animation
  * 集合：animation-name、animation-duration、animation-timing-function、animation-delay、animation-iteration-count、animation-direction
* 动画名称：animation-name
  * 单词：foo
* 动画时长：animation-duration
  * 秒数：10s
* 动画速度曲线：animation-timing-function
  * 优化：ease
  * 匀速：linear
  * 起慢：ease-in
  * 尾慢：ease-out
* 动画延迟：animation-delay
  * 秒数：10s
* 动画播放次数：animation-iteration-count
  * 次数：8
  * 无限：infinite
* 动画轮流反向播放：animation-direction
  * 正常：normal
  * 来回：alternate
* 动画规则：@keyframes
  * 简单：@keyframes foo{ from {top:0px;} to {top:200px;} }
  * 复杂：0% {top:0px; left:0px; background:red;} 25% {top:0px; left:100px; background:blue;} 50% {top:100px; left:100px; background:yellow;} 75% {top:100px; left:0px; background:green;} 100% {top:0px; left:0px; background:red;}

***

## 样式的属性
> ### 说明：
* Element节点本身提供了style属性，用来操作CSS样式
* style属性指向一个对象，用来读写页面元素的行内CSS样式

> ### 示例：
```html
<div>Hello JavaScript</div>
<script>
  var divStyle = document.querySelector('div').style;
</script>
```

> ### cssScripts 属性
>> #### 说明：
* style属性本身即为对象，包含了各种CSS样式属性，这些属性统称为cssScripts属性
* style对象的cssScripts属性与CSS规则名一一对应，但是需要改写，具体规则是将横杠从CSS属性名中去除，然后将横杠后的第一个字母大写，比如background-color写成backgroundColor
* 如果CSS属性名是JavaScript保留字，则规则名之前需要加上字符串“css”，比如float写成cssFloat
* style对象的属性值都是字符串，而且包括单位。比如divStyle.width不能设置为100，而要设置为'100px'

>> #### 示例：
```javascript
var divStyle = document.querySelector('div').style;
// 设置CSS样式
divStyle.backgroundColor = 'red';
divStyle.border = '1px solid black';
divStyle.width = '100px';
divStyle.height = '100px';
// 读取CSS样式
divStyle.backgroundColor // red
divStyle.border // 1px solid black
divStyle.height // 100px
divStyle.width // 100px
```

> ### cssText 属性
>> #### 说明：
* style对象的cssText可以用来读写或删除整个style属性
* cssText对应的是HTML元素的style属性，所以不用改写CSS属性名

>> #### 示例：
```javascript
var divStyle = document.querySelector('div').style;
divStyle.cssText = 'background-color:red;'
  + 'border:1px solid black;'
  + 'height:100px;'
  + 'width:100px;';
```

## 样式的方法
> ###  style.setPropertyValue() 方法
>> #### 说明：
* style对象提供三个方法，用来读写行内CSS规则
* 其中，setPropertyValue(propertyName,value)方法用于设置某个CSS属性
* 该方法的第一个参数是CSS属性名，且不用改写连词线
* 该方法的第二个参数是CSS属性名的值

>> #### 示例：
```javascript
var divStyle = document.querySelector('div').style;
divStyle.setProperty('background-color', 'red');
```

> ###  style.getPropertyValue() 方法
>> #### 说明：
* style对象提供三个方法，用来读写行内CSS规则
* 其中，getPropertyValue(propertyName)方法用于读取某个CSS属性
* 该方法的第一个参数是CSS属性名，且不用改写连词线

>> #### 示例：
```javascript
var divStyle = document.querySelector('div').style;
divStyle.getPropertyValue('background-color'); // "red"
```

> ###  style.removeProperty() 方法
>> #### 说明：
* style对象提供三个方法，用来读写行内CSS规则
* 其中，removeProperty(propertyName)方法用于删除某个CSS属性
* 该方法的第一个参数是CSS属性名，且不用改写连词线

>> #### 示例：
```javascript
var divStyle = document.querySelector('div').style;
divStyle.removeProperty('background-color');
```

> ###  window.getComputedStyle() 方法
>> #### 说明：
* CSS伪元素是通过CSS向DOM添加的元素，主要方法是通过“:before”和“:after”选择器生成伪元素，然后用content属性指定伪元素的内容
* DOM节点的style对象无法读写伪元素的样式，这时就要用到window对象的getComputedStyle方法

>> #### 示例：
```javascript
var test = document.querySelector('#test');
var result = window.getComputedStyle(test, ':before').content;
var color = window.getComputedStyle(test, ':before').color;
```

## 样式表的属性
> ### 说明：
* StyleSheet对象代表网页的一张样式表，它包括link节点加载的样式表和style节点内嵌的样式表
* document对象的styleSheets属性，可以返回当前页面的所有StyleSheet对象（即所有样式表），它是一个类似数组的对象
* 此外，link节点和style节点的sheet属性，也可以获取StyleSheet对象

> ### 示例：
```html
<link id="linkElement" href="http://path/to/stylesheet">
<style id="styleElement">
    body{font-size: 1.2 rem;}
</style>
<script>
var sheets = document.styleSheets;
var sheetA = document.styleSheets[0];
var linkSheet = document.querySelector('#linkElement').sheet;
var styleSheet = document.querySelector('#styleElement').sheet;
</script>
```

> ### media 属性
>> #### 说明：
* media属性表示这个样式表是用于屏幕（screen），还是用于打印（print），或两者都适用（all）。该属性只读，默认值是screen

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.media.mediaText; // "all"
```

> ### disabled 属性
>> #### 说明：
* disabled属性用于打开或关闭一张样式表
* disabled属性只能在JavaScript中设置，不能在html语句中设置

>> #### 示例：
```javascript
// 注意：用法存疑
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.disabled = true;
```

> ### href 属性
>> #### 说明：
* href属性是只读属性，返回StyleSheet对象连接的样式表地址
* 对于内嵌的style节点，该属性等于null

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.href;
```

> ### title 属性
>> #### 说明：
* title属性返回StyleSheet对象的title值

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.title;
```

> ### type 属性
>> #### 说明：
* type属性返回StyleSheet对象的type值，通常是text/css

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.type  // "text/css"
```

> ### parentStyleSheet 属性
>> #### 说明：
* CSS的@import命令允许在样式表中加载其他样式表
* parentStyleSheet属性返回包括了（引用了）当前样式表的那张（引用方）样式表
* 如果当前样式表是顶层样式表，则该属性返回null

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
if (styleSheet.parentStyleSheet) {
    sheet = styleSheet.parentStyleSheet;
} else {
    sheet = styleSheet;
}
```

> ### ownerNode 属性
>> #### 说明：
* ownerNode属性返回StyleSheet对象所在的DOM节点，通常是`<link>`或`<style>`
* 对于那些由其他样式表引用的样式表，该属性为null

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.ownerNode // [object HTMLLinkElement]
```

> ### cssRules 属性
>> #### 说明：
* cssRules属性指向一个类似数组的对象，里面每一个成员就是当前样式表的一条CSS规则
* 使用该规则的cssText属性，可以得到CSS规则对应的字符串
* 每条CSS规则还有一个style属性，指向一个对象，用来读写具体的CSS命令

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.cssRules[0].cssText; // "body { background-color: red; margin: 20px; }"
styleSheet.cssRules[1].cssText; // "p { line-height: 1.4em; color: blue; }"
styleSheet.cssRules[0].style.color = 'red';
```

## 样式表的方法
> ### styleSheet.insertRule() 方法
>> #### 说明：
* insertRule方法用于在当前样式表的cssRules对象插入CSS规则
* 第一个参数是表示CSS规则的字符串
* 第二个参数是该规则在cssRules对象的插入位置

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.insertRule('#blanc { color:white }', 0);
styleSheet.insertRule('p { color:red }', 1);
```

> ### styleSheet.deleteRule() 方法
>> #### 说明：
* deleteRule方法用于删除cssRules对象的CSS规则
* 第一个参数是该条（待删除的）规则在cssRules对象中的位置

>> #### 示例：
```javascript
var styleSheet = document.querySelector('#styleElement').sheet;
styleSheet.deleteRule(1);
```

## 类库 jQuery - 方法
> ### $('#foo').css();
>> #### 说明：
* 为匹配元素设置一个或多个CSS属性

>> #### 示例：
```javascript
$('#foo').css("color","red");
$('#foo').css({"color":"red", "background-color":"yellow"});
```

> ### $('#foo').hasClass();
>> #### 说明：
* 判断匹配元素是否被分配制定的样式类

>> #### 示例：
```javascript
$('#foo').hasClass('#test'); // true
$('#foo').hasClass('#test').css("color","red");
```

> ### $('#foo').addClass();
>> #### 说明：
* 为匹配元素设置一个或多个样式类
* 一次添加多个用空格隔开

>> #### 示例：
```javascript
$('#foo').addClass("myClass");
$('#foo').addClass("myClass yourClass");
```

> ### $('#foo').removeClass();
>> #### 说明：
* 为匹配元素移除一个或多个样式类
* 一次移除多个用空格隔开

>> #### 示例：
```javascript
$('#foo').removeClass("myClass");
$('#foo').removeClass("myClass yourClass");
```

> ### $('#foo').toggleClass();
>> #### 说明：
* 为匹配元素切换（设置或移除）一个或多个样式类
* 一次切换多个用空格隔开

>> #### 示例：
```javascript
$('#foo').toggleClass("myClass");
$('#foo').toggleClass("myClass yourClass");
```
