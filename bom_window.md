# BOM 窗口
所有浏览器环境的全局变量，都是window对象的属性
* JavaScript的所有对象都存在于一个运行环境之中，这个运行环境本身也是对象，称为“顶层对象”
* 这就是说，JavaScript的所有对象，都是“顶层对象”的下属
* 不同的运行环境有不同的“顶层对象”，在浏览器环境中，这个顶层对象就是window对象（w为小写）
***

## 窗口的属性
> ### name 属性
>> #### 说明：
* window.name属性用于设置当前浏览器窗口的名字。它有一个特点，就是浏览器刷新后，该属性保持不变
* 所以，可以把值存放在该属性内，然后跨页面、甚至跨域名使用，当然，这个值有可能被其他网站的页面改写
* 该属性只能保存字符串，且当浏览器窗口关闭后，所保存的值就会消失，因此局限性比较大，但是与iFrame窗口通信时，非常有用

>> #### 示例：
```javascript
window.name = "Hello World!";
console.log(window.name);
```

> ### screen 属性
>> #### 说明：
* window.screen属性本身是一个对象，该对象包含了显示设备（例如显示器）的分辨率
* 一般使用以上两个属性，了解设备的分辨率
* 显示器的分辨率与浏览器设置无关，缩放网页并不会改变分辨率

>> #### 示例：
```javascript
// 下面是根据屏幕分辨率，将用户导向不同网页的代码
if ((screen.width<=800) && (screen.height<=600)) {
    window.location.replace('small.html');
} else {
    window.location.replace('wide.html');
}
```

> ### innerHeight 属性、innerWidth 属性
>> #### 说明：
* 这两个属性返回网页的CSS布局占据的浏览器窗口的高度和宽度，单位为像素
* 很显然，当用户放大网页的时候（比如将网页从100%的大小放大为200%），这两个属性会变小
* 注意，这两个属性值包括滚动条的高度和宽度

>> #### 示例：
```javascript
window.innerHeight = 1200;
window.innerWidth = 1800;
```

> ### pageXOffset 属性、pageYOffset 属性
>> #### 说明：
* window.pageXOffset属性返回页面的水平滚动距离
* window.pageYOffset属性返回页面的垂直滚动距离
* 这两个属性的单位为像素

>> #### 示例：
```javascript
console.log(window.pageXOffset);
console.log(window.pageYOffset);
```

> ### frames 属性
>> #### 说明：
* window.frames返回一个类似数组的对象，成员为页面内的所有框架，包括frame元素和iframe元素
* 需要注意的是，window.frames的每个成员对应的是框架内的窗口（即框架的window对象），获取每个框架的DOM树，需要使用window.frames[0].document
* iframe元素遵守同源政策，只有当父页面与框架页面来自同一个域名，两者之间才可以用脚本通信，否则只有使用window.postMessage方法
* 在iframe框架内部，使用window.parent指向父页面

>> #### 示例：
```javascript
var iframe = window.getElementsByTagName("iframe")[0];
var iframe_title = iframe.contentWindow.title;
```

> ### onerror 属性
>> #### 说明：
* 浏览器脚本发生错误时，会触发window对象的error事件，我们可以通过window.onerror属性对该事件指定回调函数
* error事件的回调函数，一共可以有五个参数，它们的含义依次为：出错信息、出错脚本的网址、行号、列号、错误对象
* 老式浏览器只支持前三个参数
* 并不是所有的错误，都会触发JavaScript的error事件（即让JavaScript报错），只限于此三类事件:1、JS语法错误；2、JS脚本文件不存在；3、图像文件不存在
* 这两类事件不会触发JavaScript的error事件：1、CSS文件不存在；2、iframe文件不存在

>> #### 示例一：
```javascript
window.onerror = function (message, filename, lineno, colno, error) {
    console.log("出错了！--> %s", error.stack);
};
```

>> #### 示例二：
```php
/**
 * 需要注意的是，如果脚本网址与网页网址不在同一个域（比如使用了CDN），浏览器根本不会提供详细的出错信息，只会提示出错，错误类型是“Script error.”，行号为0，其他信息都没有，这是浏览器防止向外部脚本泄漏信息。
 * 解决方法是在脚本所在的服务器，设置Access-Control-Allow-Origin的HTTP头信息。
 * 然后，在网页的script标签中设置crossorigin属性
 */
Access-Control-Allow-Origin:*
```
```html
<!-- crossorigin="anonymous"表示，读取文件不需要身份信息，即不需要cookie和HTTP认证信息 -->
<script crossorigin="anonymous" src="//example.com/file.js"></script>
```

## 窗口的方法
> ### URL编码/解码 方法
>> #### 说明：
* JavaScript提供四个URL的编码/解码方法
* encodeURI():编码
* decodeURI():对encodeURI()的编码进行解码
* encodeURIComponent():编码
* decodeURIComponent():对encodeURIComponent()的编码进行解码

>> #### 示例：
```javascript
var test1="http://www.example.com/first/";
console.log(encodeURIComponent(test1)); // http%3A%2F%2Fwww.example.com%2Ffirst%2F
console.log(decodeURIComponent(test1)); // http://www.example.com/first/
```

> ### window.alert() 方法
>> #### 说明：
* alert方法弹出的对话框，只有一个“确定”按钮，往往用来通知用户某些信息
* 用户只有点击“确定”按钮，对话框才会消失
* 在对话框弹出期间，浏览器窗口处于冻结状态，如果不点“确定”按钮，用户什么也干不了

>> #### 示例：
```javascript
// 格式
alert(message);
// 实例
alert("Hello World");
```

> ### window.confirm() 方法
>> #### 说明：
* confirm方法弹出的对话框，除了提示信息之外，只有“确定”和“取消”两个按钮，往往用来征询用户的意见
* confirm方法返回一个布尔值，如果用户点击“确定”，则返回true；如果用户点击“取消”，则返回false

>> #### 示例：
```javascript
// 格式
var result = confirm(message);
// 实例
var result = confirm("你最近好吗？");
```

> ### window.prompt() 方法
>> #### 说明：
* prompt方法弹出的对话框，在提示文字的下方，还有一个输入框，要求用户输入信息，并有“确定”和“取消”两个按钮。它往往用来获取用户输入的数据
* prompt方法的返回值是一个字符串（有可能为空）或者null，具体分成三种情况:
* 1、用户输入信息，并点击“确定”，则用户输入的信息就是返回值
* 2、用户没有输入信息，直接点击“确定”，则输入框的默认值就是返回值
* 3、用户点击了“取消”（或者按了Escape按钮），则返回值是null

>> #### 示例：
```javascript
// 格式，prompt方法的第二个参数是可选的，但是如果不提供的话，IE浏览器会在输入框中显示undefined。因此，最好总是提供第二个参数，作为输入框的默认值
var result = prompt(text[, default]);
// 实例
var result = prompt('您的年龄？', 25)
```

> ### window.getComputedStyle() 方法
>> #### 说明：
* window.getComputedStyle方法接受一个HTML元素作为参数，返回一个包含该HTML元素的最终样式信息的对象

>> #### 示例：
```javascript
// 暂无示例
```

> ### window.matchMedia() 方法
>> #### 说明：
* window.matchMedia方法用来检查CSS的mediaQuery语句

>> #### 示例：
```javascript
// 暂无示例
```
