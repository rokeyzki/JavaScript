# DOM 样式
CSS与JavaScript是两个有着明确分工的领域，前者负责页面的视觉效果，后者负责与用户的行为互动，但是，它们毕竟同属网页开发的前端，因此不可避免有着交叉和互相配合

## 大纲
> ### 属性
>> * 获取元素的各种样式属性：Element.prototype.style.cssScripts
* 获取元素的完整样式文本信息：Element.prototype.style.cssText

> ### 方法
>> * 设置目标元素的样式属性：Element.prototype.style.setProperty()
* 读取目标元素的样式属性：Element.prototype.style.getPropertyValue()
* 移除目标元素的样式属性：Element.prototype.style.removeProperty()

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
> ###  style.setProperty() 方法
>> #### 说明：
* style对象提供三个方法，用来读写行内CSS规则
* 其中，setProperty(propertyName, value)方法用于设置某个CSS属性
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
