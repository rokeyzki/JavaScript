# DOM 事件
事件是一种异步编程的实现方式，本质上是程序各个组成部分之间传递的特定消息

## 大纲
> ### 属性
>> * 判断是否能够冒泡：Event.prototype.bubbles
* 判断是否能够取消：Event.prototype.cancelable
* 判断事件当前阶段：Event.prototype.eventPhase
* 判断事件是否用过：Event.prototype.defaultPrevented
* 获取事件当前所在节点：Event.prototype.currentTarget
* 获取事件最初触发节点：Event.prototype.target
* 获取事件名称：Event.prototype.type
* 获取事件发生毫秒时长：Event.prototype.timeStamp

> ### 方法
>> * 注销单一事件行为：Event.prototype.preventDefault()
* 中止单一事件传播：Event.prototype.stopPropagation()
* 中止后续事件调用：Event.prototype.stopImmediatePropagation()

> ### 名称
>> * 网络类1 - 网址事件
  * 当URL的hash部分(#)发生变化的时候触发：hashchange
* 网络类2 - 页面事件
  * 当页面加载状态改变的时候触发：readystatechange
  * 当页面解析完成的时候触发：DOMContentLoaded
  * 当页面最后展示的时候触发：pageshow
  * 当页面将要离开的时候触发：beforeunload
* 网络类3 - 资源事件
  * 当资源开始加载时触发：loadstart
  * 当资源加载过程时不断触发：progress
  * 当资源加载成功则触发：load
  * 当资源加载失败则触发：error
  * 当浏览器开始播放音视频时触发：canplay
* 文档类1 - 焦点事件
  * 当元素获得焦点的时候触发：focus
  * 当元素失去焦点的时候触发：blur
* 文档类2 - 表单事件
  * 当表单的内容被选中的时候触发：select
  * 当表单的内容发生变化的时候触发：input
  * 当内容发生变化的表单在失去焦点时触发：change
  * 当表单被重置的时候触发：reset
  * 当表单被提交的时候触发：submit
* 文档类3 - 剪贴事件
  * 当选中的内容被复制到剪贴板的时候触发：copy
  * 当剪贴板内容被粘贴到文档的时候触发：paste
  * 当选中的内容被剪切到剪贴板的时候触发：cut
* 外设类1 - 鼠标事件
  * 当元素被点击的时候触发：click
  * 当元素被双击的时候触发：dblclick
  * 当元素区域鼠标被按下的时候触发：mousedown
  * 当元素区域鼠标被松开的时候触发：mouseup
  * 当元素区域鼠标被移动的时候触发：mousemove
  * 当鼠标进入元素区域的时候触发：mouseover
  * 当鼠标离开元素区域的时候触发：mouseout
  * 当元素区域鼠标右键被按下的时候触发：contextmenu
* 外设类2 - 键盘事件
  * 当键盘被按下时触发：keydown
  * 当键盘被松开时触发：keyup
  * 当（非Ctrl、Alt、Shift和Meta）键被按下时触发：keypress
* 外设类3 - 触摸事件
  * 当用户接触触摸屏时触发：touchstart
  * 当用户移动触摸点时触发：touchmove
  * 当用户离开触摸屏时触发：touchend
* 动作类1 - 缩放事件
  * 当窗口改变大小时触发：resize
* 动作类2 - 滚动事件
  * 当元素滚动时触发：scroll
* 动作类3 - 拖拉事件
  * 当对象节点开始被拖拉时触发：dragstart
  * 当对象节点处于拖拉状态时持续触发：drag
  * 当对象节点结束被拖拉时触发：dragend
  * 当拖拉进入对象节点时触发：dragenter
  * 当拖拉进入对象节点范围时持续触发：dragover
  * 当拖拉离开对象节点时触发：dragleave
  * 当拖拉进入对象节点后被释放时触发：drop

> ### 监听方法
>> * 用于在当前节点上的监听方法：Node.prototype.addEventListener()
* 移除在当前节点上的监听方法：Node.prototype.removeEventListener()
* 主动触发当前节点的某一事件：Node.prototype.dispatchEvent()

***

## 事件的对象
> ### 说明：
* 事件发生以后，会生成一个事件对象，作为参数传给监听函数
* 浏览器原生提供一个Event对象，所有的事件都是这个对象的实例，或者说继承了Event.prototype对象
* Event对象本身就是一个构造函数，可以用来生成新的实例
* Event构造函数接受两个参数
* 第一个参数是字符串，表示事件的名称
* 第二个参数是一个对象，表示事件对象的配置，该参数可以有以下两个属性：bubbles与cancelable

> ### 示例：
```html
<script>
// 下面代码新建一个look事件，然后使用dispatchEvent方法触发该事件
var eventLook = new Event("look", {"bubbles":true, "cancelable":false});
/**
 * 第二参数属性说明：
 * bubbles：布尔值，可选，默认为false，表示事件对象是否冒泡
 * cancelable：布尔值，可选，默认为false，表示事件是否可以被取消
 */
document.dispatchEvent(eventLook);
</script>
```

## 事件的属性
> ### bubbles 属性
>> #### 说明：
* bubbles属性返回一个布尔值，表示当前事件是否会冒泡
* 该属性为只读属性，只能在新建事件时改变
* 除非显式声明，Event构造函数生成的事件，默认是不冒泡的

>> #### 示例：
```html
<script>
// 新建一个冒泡事件，并触发它
var eventLook = new Event("look", {"bubbles":true, "cancelable":false});
document.dispatchEvent(eventLook);
</script>
```

> ### cancelable 属性
>> #### 说明：
* cancelable属性返回一个布尔值，表示事件是否可以取消
* 该属性为只读属性，只能在新建事件时改变
* 除非显式声明，Event构造函数生成的事件，默认是不可以取消的

>> #### 示例：
```html
<script>
// 新建一个不可取消事件，并触发它
var eventLook = new Event("look", {"bubbles":true, "cancelable":false});
document.dispatchEvent(eventLook);
</script>
```

> ### eventPhase 属性
>> #### 说明：
* eventPhase属性返回一个整数值，表示事件目前所处的节点
* 0表示：事件目前没有发生
* 1表示：事件目前处于捕获阶段，即处于从祖先节点向目标节点的传播过程中。该过程是从Window对象到Document节点，再到HTMLHtmlElement节点，直到目标节点的父节点为止。
* 2表示：事件到达目标节点，即target属性指向的那个节点
* 3表示：事件处于冒泡阶段，即处于从目标节点向祖先节点的反向传播过程中。该过程是从父节点一直到Window对象。只有bubbles属性为true时，这个阶段才可能发生

>> #### 示例：
```html
<script>
var phase = event.eventPhase;
</script>
```

> ### defaultPrevented 属性
>> #### 说明：
* defaultPrevented属性返回一个布尔值，表示该事件是否调用过preventDefault方法

>> #### 示例：
```html
<script>
if (e.defaultPrevented) {
    // ...
}
</script>
```

> ### currentTarget 属性
>> #### 说明：
* currentTarget属性返回事件当前所在的节点，即正在执行的监听函数所绑定的那个节点
* 在监听函数中，currentTarget属性实际上等同于this对象
* 作为比较，target属性返回事件发生的节点，如果监听函数在捕获阶段和冒泡阶段触发，那么这两个属性返回的值是不一样的

>> #### 示例：
```html
<script>
function hide(e){
    console.log(this === e.currentTarget);  // true
    e.currentTarget.style.visibility = "hidden";
}
para.addEventListener('click', hide, false);
</script>
```

> ### target 属性
>> #### 说明：
* target属性返回触发事件的那个节点，即事件最初发生的节点
* 如果监听函数不在该节点触发，那么它与currentTarget属性返回的值是不一样的

>> #### 示例：
```html
<script>
function hide(e){
    console.log(this === e.target);  // true
    e.currentTarget.style.visibility = "hidden";
}
para.addEventListener('click', hide, false);
// 在IE6—IE8之中，该属性的名字不是target，而是srcElement，因此经常可以看到下面这样的代码
function hide(e) {
    var target = e.target || e.srcElement;
    target.style.visibility = 'hidden';
}
</script>
```

> ### type 属性
>> #### 说明：
* type属性返回一个字符串，表示事件名称
* 具体的值同addEventListener方法和removeEventListener方法的第一个参数一致，大小写不敏感

>> #### 示例：
```html
<script>
var string = event.type;
</script>
```

> ### detail 属性
>> #### 说明：
* detail属性返回一个数值，表示事件的某种信息
* 具体含义与事件类型有关

>> #### 示例：
```javascript
暂无
```

> ### timeStamp 属性
>> #### 说明：
* timeStamp属性返回一个毫秒时间戳，表示事件发生的时间

>> #### 示例：
```html
<script>
var number = event.timeStamp;
</script>
```

## 事件的方法
> ### event.preventDefault() 方法
>> #### 说明：
* preventDefault方法取消浏览器对当前事件的默认行为
* 事件的默认行为比如点击链接后，浏览器跳转到指定页面，或者按一下空格键，页面向下滚动一段距离
* 该方法生效的前提是，事件的cancelable属性为true，如果为false，则调用该方法没有任何效果
* 只要在事件的传播过程中（捕获阶段、目标阶段、冒泡阶段皆可），使用了preventDefault方法，该事件的默认方法就不会执行
* 但是该方法不会阻止事件的进一步传播

>> #### 示例：
```html
<script>
// 取消click事件的默认行为
foo.addEventListener('click', function (e){
  e.preventDefault();
}, false);
</script>
```

> ### event.stopPropagation() 方法
>> #### 说明：
* stopPropagation方法阻止事件在DOM中继续传播，防止再触发定义在别的节点上的监听函数，但是不包括在当前节点上新定义的事件监听函数

>> #### 示例：
```html
<script>
function stopEvent(e) {
    e.stopPropagation();
}
el.addEventListener('click', stopEvent, false);
</script>
```

> ### event.stopImmediatePropagation() 方法
>> #### 说明：
* 如果同一个节点对于同一个事件指定了多个监听函数，这些函数会根据添加的顺序依次调用
* 但是只要其中有一个监听函数调用了stopImmediatePropagation方法，其他的监听函数就不会再执行了

>> #### 示例：
```html
<script>
function l1(e){
    e.stopImmediatePropagation();
}
function l2(e){
    console.log('hello world');
}
el.addEventListener('click', l1, false);
el.addEventListener('click', l2, false);
</script>
```

## 事件的名称
> ### 网络类1 - 网址事件
>> #### popstate 事件
>>> #### 说明：
* popstate事件在浏览器的history对象的当前记录发生显式切换时触发

>>> #### 示例：
```html
<script>
  window.addEventListener('popstate', function(e) {
    console.log('popstate ' + document.documentURI);
  }, false);
</script>
```

>> #### hashchange 事件
>>> #### 说明：
* hashchange事件在URL的hash部分（即#号后面的部分，包括#号）发生变化时触发

>>> #### 示例：
```html
<script>
  window.addEventListener('hashchange', function(e) {
    console.log('hashchange ' + window.location.hash);
  }, false);
</script>
```

> ### 网络类2 - 页面事件
>> #### readystatechange 事件
>>> #### 说明：
* readystatechange事件发生在Document对象和XMLHttpRequest对象，当它们的readyState属性发生变化时触发。

>>> #### 示例：
```html
<script>
  /*
    readyState属性返回当前文档的状态，共有三种可能的值：
    1、加载HTML代码阶段，是“loading”
    2、加载外部资源阶段是“interactive”
    3、全部加载完成是“complete”
  */
  console.log(document.readyState);
  document.addEventListener("readystatechange", function(e) {
    if(document.readyState == "interactive") {
      console.log('readystatechange interactive DOM加载和解析完成，开始加载外部资源中。。。');
    }else{
      console.log('readystatechange complete 页面全部加载完成');
    }
  }, false);
</script>
```

>> #### DOMContentLoaded 事件
>>> #### 说明：
* DOMContentLoaded事件,当HTML文档下载并解析完成以后，就会在document对象上触发DOMContentLoaded事件。这时，仅仅完成了HTML文档的解析（整张页面的DOM生成），所有外部资源（样式表、脚本、iframe等等）可能还没有下载结束。也就是说，这个事件比load事件，发生时间早得多。

>>> #### 示例：
```html
<script>
  document.addEventListener("DOMContentLoaded", function(e) {
    console.log("DOMContentLoaded DOM加载和解析完成");
  }, false);
</script>
```

>> #### pageshow 事件
>>> #### 说明：
* pageshow事件在页面最后显示时触发，包括第一次加载和从缓存加载两种情况。如果要指定页面每次最后显示（不管是不是从浏览器缓存）时都运行的代码，可以放在这个事件的监听函数

>>> #### 示例：
```html
<script>
  window.addEventListener('pageshow', function(e) {
    if(e.persisted === false){
      console.log('pageshow 网络加载');
    }else{
      console.log('pageshow 缓存加载');
    }
  }, false);
</script>
```

>> #### beforeunload 事件
>>> #### 说明：
* beforeunload事件当窗口将要关闭或者重载的时候触发

>>> #### 示例：
```html
<script>
  window.addEventListener('beforeunload', function(e) {
    e.returnValue = '你确认要离开吗？';
  }, false);
</script>
```

>> #### pagehide 事件
>>> #### 说明：
* 不明

>>> #### 示例：
```javascript
123
```

> ### 网络类3 - 资源事件
>> #### loadstart 事件
>>> #### 说明：
* loadstart事件当资源开始加载时触发

>>> #### 示例：
```html
<video id="video1" controls="controls">
  <source src="http://www.w3school.com.cn/example/html5/mov_bbb.mp4" type="video/mp4">
</video>
<script>
  video1.addEventListener('loadstart', function(e){
    console.log('loadstart 触发');
  }, false);
</script>
```

>> #### progress 事件
>>> #### 说明：
* progress事件当操作处于下载进度之中，由传输的数据块不断触发

>>> #### 示例：
```html
<video id="video1" controls="controls">
  <source src="http://www.w3school.com.cn/example/html5/mov_bbb.mp4" type="video/mp4">
</video>
<script>
  video1.addEventListener('progress', function(e){
    console.log('progress 触发');
    if (e.lengthComputable) {
      var percentComplete = e.loaded / e.total;
      console.log(percentComplete);
    } else {
      console.log('不能计算进度');
    }
  }, false);
</script>
```

>> #### load 事件
>>> #### 说明：
* load事件当资源加载成功则触发

>>> #### 示例：
```html
<img id="foo1" src="https://www.baidu.com/img/bd_logo1.png" alt="">
<script>
  foo1.addEventListener('load', function(e) {
    console.log('img 加载完成');
  }, false);
</script>
```

>> #### error 事件
>>> #### 说明：
* error事件当资源加载失败则触发

>>> #### 示例：
```html
<img id="error_img" src="2121212121" alt="">
<script>
  error_img.addEventListener('error', function(e) {
    console.log('error 资源加载失败');
  }, false);
</script>
```

>> #### canplay 事件
>>> #### 说明：
* canplay事件当浏览器能够开始播放指定的音频/视频时触发

>>> #### 示例：
```html
<video id="video1" controls="controls">
  <source src="http://www.w3school.com.cn/example/html5/mov_bbb.mp4" type="video/mp4">
</video>
<script>
  video1.addEventListener('canplay', function(e){
    console.log('canplay 触发');
  }, false);
</script>
```

>> #### abort 事件
>>> #### 说明：
* abort事件当进度事件被中止时触发
* 如果发生错误，导致进程中止，不会触发该事件

>>> #### 示例：
```javascript
暂无
```

>> #### timeout 事件
>>> #### 说明：
* timeout事件当进度超过限时时触发

>>> #### 示例：
```javascript
暂无
```

>> #### unload 事件
>>> #### 说明：
* 不明

>>> #### 示例：
```html
123
```

> ### 文档类1 - 焦点事件
>> #### focus 事件
>>> #### 说明：
* focus事件当Element节点获得焦点后触发

>>> #### 示例：
```html
<input type="text" id="foo" />
<script>
  foo.addEventListener('focus', function(e) {
    e.target.style.background = "pink";
    console.log('focus 获取焦点');
  }, false);
</script>
```

>> #### blur 事件
>>> #### 说明：
* blur事件当Element节点失去焦点后触发

>>> #### 示例：
```html
<input type="text" id="foo" />
<script>
  foo.addEventListener('blur', function(e) {
    e.target.style.background = "";
    console.log('blur 失去焦点');
  }, false);
</script>
```

> ### 文档类2 - 表单事件
>> #### select 事件
>>> #### 说明：
* select事件当在`<input>`、`<textarea>`中选中文本时触发

>>> #### 示例：
```html
<input type="text" id="foo" />
<script>
  foo.addEventListener('select', function(e){
    console.log('select 触发');
  }, false);
</script>
```

>> #### input 事件
>>> #### 说明：
* input事件当`<input>`、`<textarea>`的值发生变化时触发

>>> #### 示例：
```html
<input type="text" id="foo" />
<script>
  foo.addEventListener('input', function(e){
    console.log('input 触发');
  }, false);
</script>
```

>> #### change 事件
>>> #### 说明：
* change事件当`<input>`、`<select>`、`<textarea>`的值发生变化，并且丧失焦点时触发

>>> #### 示例：
```html
<input type="text" id="foo" />
<script>
  foo.addEventListener('change', function(e){
    console.log('change 触发');
  }, false);
</script>
```

>> #### reset 事件
>>> #### 说明：
* reset事件当表单重置（所有表单成员变回默认值）时触发

>>> #### 示例：
```html
<form action="" id="form">
  <input type="text" id="foo">
  <button type="reset">重置</button>
</form>
<script>
  form.addEventListener('reset', function(e){
    console.log('reset 触发');
  }, false);
</script>
```

>> #### submit 事件
>>> #### 说明：
* submit事件当表单数据向服务器提交时触发

>>> #### 示例：
```html
<form action="" id="form">
  <input type="text" id="foo">
  <button type="submit">提交</button>
</form>
<script>
  form.addEventListener('submit', function(e){
    alert('submit 触发');
  }, false);
</script>
```

> ### 文档类3 - 剪贴事件
>> #### copy 事件
>>> #### 说明：
* copy事件在选中的内容加入剪贴板后触发

>>> #### 示例：
```html
<input type="text" id="foo" value="hello world" />
<script>
  foo.addEventListener('copy', function(e) {
    console.log('copy 复制文本');
  }, false);
</script>
```

>> #### paste 事件
>>> #### 说明：
* paste事件在剪贴板内容被粘贴到文档后触发

>>> #### 示例：
```html
<input type="text" id="foo" />
<script>
  foo.addEventListener('paste', function(e) {
    console.log('paste 粘贴文本');
  }, false);
</script>
```

>> #### cut 事件
>>> #### 说明：
* cut事件在将选中的内容从文档中移除，加入剪贴板后触发

>>> #### 示例：
```html
<input type="text" id="foo" value="hello world" />
<script>
  foo.addEventListener('cut', function(e) {
    console.log('cut 剪切文本');
  }, false);
</script>
```

> ### 外设类1 - 鼠标事件
>> #### click 事件
>>> #### 说明：
* click事件当用户在Element节点、document节点、window对象上，单击鼠标（或者按下回车键）时触发

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('click', function(e){
    console.log('click 事件');
  }, false);
</script>
```

>> #### dblclick 事件
>>> #### 说明：
* dblclick事件当用户在element、document、window对象上，双击鼠标时触发。该事件会在mousedown、mouseup、click之后触发。

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('dblclick', function(e){
    console.log('dblclick 事件');
  }, false);
</script>
```

>> #### mousedown 事件
>>> #### 说明：
* mousedown事件在按下鼠标键时触发

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('mousedown', function(e){
    console.log('mousedown 事件');
  }, false);
</script>
```

>> #### mouseup 事件
>>> #### 说明：
* mouseup事件在松掉鼠标键时触发

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('mouseup', function(e){
    console.log('mouseup 事件');
  }, false);
</script>
```

>> #### mousemove 事件
>>> #### 说明：
* mousemove事件当鼠标在一个节点内部移动时触发。当鼠标持续移动时，该事件会连续触发

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('mousemove', function(e){
    console.log('mousemove 事件');
  }, false);
</script>
```

>> #### mouseover 事件
>>> #### 说明：
* mouseover事件是鼠标进入一个节点时触发，会冒泡，比mouseenter事件快

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('mouseover', function(e){
    console.log('mouseover 事件');
  }, false);
</script>
```

>> #### mouseenter 事件
>>> #### 说明：
* mouseenter事件是鼠标进入一个节点时触发，不会冒泡

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('mouseenter', function(e){
    console.log('mouseenter 事件');
  }, true);
</script>
```

>> #### mouseout 事件
>>> #### 说明：
* mouseout事件是鼠标离开一个节点时触发，会冒泡，比mouseleave事件快

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('mouseout', function(e){
    console.log('mouseout 事件');
  }, false);
</script>
```

>> #### mouseleave 事件
>>> #### 说明：
* mouseleave事件是鼠标离开一个节点时触发，不会冒泡

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('mouseleave', function(e){
    console.log('mouseleave 事件');
  }, true);
</script>
```

>> #### contextmenu 事件
>>> #### 说明：
* contextmenu事件在一个节点上点击鼠标右键时触发，或者按下“上下文菜单”键时触发

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo"></div>
<script>
  foo.addEventListener('contextmenu', function(e){
    console.log('contextmenu 事件');
  }, false);
</script>
```

> ### 外设类2 - 键盘事件
>> #### keydown 事件
>>> #### 说明：
* keydown事件在按下键盘时触发

>>> #### 示例：
```html
<script>
  document.addEventListener('keydown', function(e){
    console.log('keydown 触发');
  }, false);
</script>
```

>> #### keyup 事件
>>> #### 说明：
* keyup事件在松开键盘时触发

>>> #### 示例：
```html
<script>
  document.addEventListener('keyup', function(e){
    console.log('keyup 触发');
  }, false);
</script>
```

>> #### keypress 事件
>>> #### 说明：
* keypress事件在按下键盘时（非Ctrl、Alt、Shift和Meta）触发

>>> #### 示例：
```html
<script>
  document.addEventListener('keypress', function(e){
    console.log('keypress 触发');
  }, false);
</script>
```

> ### 外设类3 - 触摸事件
>> #### touchstart 事件
>>> #### 说明：
* touchstart事件当用户接触触摸屏时触发
* APPLE Magic Trackpad 不支持 DOM 触摸事件

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo" draggable="true"></div>
<script>
  foo.addEventListener('touchstart', function(e){
    console.log('touchstart 触发');
  }, false);
</script>
```

>> #### touchmove 事件
>>> #### 说明：
* touchmove事件当用户移动触摸点时触发
* APPLE Magic Trackpad 不支持 DOM 触摸事件

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo" draggable="true"></div>
<script>
  foo.addEventListener('touchmove', function(e){
    console.log('touchmove 触发');
  }, false);
</script>
```

>> #### touchend 事件
>>> #### 说明：
* touchend事件当用户不再接触触摸屏时（或者移出屏幕边缘时）触发
* APPLE Magic Trackpad 不支持 DOM 触摸事件

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo" draggable="true"></div>
<script>
  foo.addEventListener('touchend', function(e){
    console.log('touchend 触发');
  }, false);
</script>
```

>> #### touchcancel 事件
>>> #### 说明：
* touchcancel事件当触摸点取消时触发
* APPLE Magic Trackpad 不支持 DOM 触摸事件

>>> #### 示例：
```html
<style>
  #foo {
    width:100px;
    height:100px;
    background-color:red;
  }
</style>
<div id="foo" draggable="true"></div>
<script>
  foo.addEventListener('touchcancel', function(e){
    console.log('touchcancel 触发');
  }, false);
</script>
```

> ### 动作类1 - 缩放事件
>> #### resize 事件
>>> #### 说明：
* resize事件在改变浏览器窗口大小时触发，发生在window、body、frameset对象上面

>>> #### 示例：
```html
<script>
  window.addEventListener('resize', function(e) {
    console.log('resize' + document.body.clientWidth);
  }, false);
</script>
```

> ### 动作类2 - 滚动事件
>> #### scroll 事件
>>> #### 说明：
* scroll事件在文档或文档元素滚动时触发

>>> #### 示例：
```html
<div style="height:1000px;"></div>
<script>
  window.addEventListener('scroll', function(e) {
    console.log('scroll 文档元素滚动');
  }, false);
</script>
```

> ### 动作类3 - 拖拉事件
>> #### dragstart 事件
>>> #### 说明：
* dragstart事件，拖拉开始时在被拖拉的节点上触发

>>> #### 示例：
```html
<style>
  div {
    width:100px;
    height:100px;
    border:1px solid #000;
  }
  #foo {
    background-color:red;
  }
</style>
<div><div id="foo" draggable="true"></div></div>
<div></div>
<div></div>
<div></div>
<script>
  foo.addEventListener('dragstart', function(e){
    console.log('dragstart 触发');
  }, false);
</script>
```

>> #### drag 事件
>>> #### 说明：
* drag事件，拖拉过程中，在被拖拉的节点上持续触发

>>> #### 示例：
```html
<style>
  div {
    width:100px;
    height:100px;
    border:1px solid #000;
  }
  #foo {
    background-color:red;
  }
</style>
<div><div id="foo" draggable="true"></div></div>
<div></div>
<div></div>
<div></div>
<script>
  foo.addEventListener('drag', function(e){
    console.log('drap 触发');
  }, false);
</script>
```

>> #### dragend 事件
>>> #### 说明：
* dragend事件，拖拉结束时（释放鼠标键或按下escape键）在被拖拉的节点上触发

>>> #### 示例：
```html
<style>
  div {
    width:100px;
    height:100px;
    border:1px solid #000;
  }
  #foo {
    background-color:red;
  }
</style>
<div><div id="foo" draggable="true"></div></div>
<div></div>
<div></div>
<div></div>
<script>
  foo.addEventListener('dragend', function(e){
    console.log('dragend 触发');
  }, false);
</script>
```

>> #### dragenter 事件
>>> #### 说明：
* dragenter事件，拖拉进入当前节点时，在当前节点上触发

>>> #### 示例：
```html
<style>
  div {
    width:100px;
    height:100px;
    border:1px solid #000;
  }
  #foo {
    background-color:red;
  }
</style>
<div><div id="foo" draggable="true"></div></div>
<div></div>
<div></div>
<div id="anchor"></div>
<script>
  anchor.addEventListener('dragenter', function(e){
    console.log('dragenter 触发');
  }, false);
</script>
```

>> #### dragover 事件
>>> #### 说明：
* dragover事件，拖拉到当前节点上方时，在当前节点上持续触发

>>> #### 示例：
```html
<style>
  div {
    width:100px;
    height:100px;
    border:1px solid #000;
  }
  #foo {
    background-color:red;
  }
</style>
<div><div id="foo" draggable="true"></div></div>
<div></div>
<div></div>
<div id="anchor"></div>
<script>
  anchor.addEventListener('dragover', function(e){
    console.log('dragover 触发');
  }, false);
</script>
```

>> #### dragleave 事件
>>> #### 说明：
* dragleave事件，拖拉离开当前节点范围时，在当前节点上触发

>>> #### 示例：
```html
<style>
  div {
    width:100px;
    height:100px;
    border:1px solid #000;
  }
  #foo {
    background-color:red;
  }
</style>
<div><div id="foo" draggable="true"></div></div>
<div></div>
<div></div>
<div id="anchor"></div>
<script>
  anchor.addEventListener('dragleave', function(e){
    console.log('dragleave 触发');
  }, false);
</script>
```

>> #### drop 事件
>>> #### 说明：
* drop事件，被拖拉的节点或选中的文本，释放到目标节点时，在目标节点上触发

>>> #### 示例：
```html
<style>
  div {
    width:100px;
    height:100px;
    border:1px solid #000;
  }
  #foo {
    background-color:red;
  }
</style>
<div class="dropzone"><div id="foo" draggable="true"></div></div>
<div class="dropzone"></div>
<div class="dropzone"></div>
<div class="dropzone"></div>
<script>
  // 被拖拉节点
  var dragged;
  // dragstart 事件：拖拉开始时在被拖拉的节点上触发
  document.addEventListener("dragstart", function(e) {
    // 保存被拖拉节点
    dragged = e.target;
    // 被拖拉节点的背景色变透明
    e.target.style.opacity = 0.5;
  }, false);
  // dragend 事件：拖拉结束时（释放鼠标键或按下escape键）在被拖拉的节点上触发
  document.addEventListener("dragend", function(e) {
    // 被拖拉节点的背景色恢复不透明
    e.target.style.opacity = 1;
  }, false);
  // dragenter 事件：拖拉进入当前节点时，在当前节点上触发
  document.addEventListener("dragenter", function(e) {
    // 目标节点的背景色变紫色
    // 由于该事件会冒泡，所以要过滤节点
    if ( e.target.className == "dropzone" ) {
      e.target.style.background = "purple";
    }
  }, false);
  // dragover 事件：拖拉到当前节点上方时，在当前节点上持续触发
  document.addEventListener("dragover", function(e) {
    // 防止拖拉效果被重置，允许被拖拉的节点放入目标节点
    e.preventDefault();
  }, false);
  // dragleave 事件：拖拉离开当前节点范围时，在当前节点上触发
  document.addEventListener("dragleave", function(e) {
    // 目标节点的背景色恢复原样
    if ( e.target.className == "dropzone" ) {
      e.target.style.background = "";
    }
  }, false);
  // drop 事件：被拖拉的节点或选中的文本，释放到目标节点时，在目标节点上触发
  document.addEventListener("drop", function(e) {
    // 防止事件默认行为（比如某些Elment节点上可以打开链接）
    e.preventDefault();
    if ( e.target.className == "dropzone" ) {
      // 恢复目标节点背景色
      e.target.style.background = "";
      // 将被拖拉节点插入目标节点
      dragged.parentNode.removeChild( dragged );
      e.target.appendChild( dragged );
    }
  }, false);
</script>
```

> ### 定制事件
>> #### N/A 事件
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

## 事件的监听
> ### 说明
* 监听函数是事件发生时，程序所要执行的函数，它是事件驱动编程模式的主要编程方式
* DOM提供两种方式，可以用来为事件绑定监听函数

> ### 第一种：事件监听属性
>> #### 节点监听
>>> #### 说明：
* 节点有事件属性，通过这些事件属性可以定义监听函数
* 使用这个方法指定的监听函数，只会在冒泡阶段触发
* 缺点：同一个事件只能定义一个监听函数，也就是说，如果定义两次onclick属性，后一次定义会覆盖前一次
* 不推荐使用这种事件监听方式

>>> #### 示例：
```html
<script>
div.onclick = function(e){
    console.log('触发事件');
};
</script>
```

>> #### 元素监听
>>> #### 说明：
* HTML语言允许在元素标签的属性中，直接定义某些事件的监听代码
* 使用这种方法时，on-属性的值是“监听代码”，而不是“监听函数”。也就是说，一旦指定事件发生，这些代码是原样传入JavaScript引擎执行。因此如果要执行函数，必须在函数名后面加上一对圆括号
* 使用这个方法指定的监听函数，只会在冒泡阶段触发
* 缺点：违反了HTML与JavaScript代码相分离的原则
* 不推荐使用这种事件监听方式

>>> #### 示例：
```html
<body onload="doSomething()">
    <div onclick="console.log('触发事件')"></div>
</body>
```

> ### 第二种：事件监听方法
>> addEventListener() 方法
>>> #### 说明：
* addEventListener方法用于在当前节点或对象上，定义一个特定事件的监听函数
* addEventListener方法是推荐的事件监听方式

>>> #### 示例：
```html
<script>
/**
 * addEventListener方法接受三个参数
 *
 * target.addEventListener(type, listener[, useCapture]);
 *
 * 第一个参数：type，事件名称，大小写不敏感。
 * 第二个参数：listener，监听函数，指定事件发生时，会调用该监听函数
 * 第三个参数：useCapture，监听函数是否在捕获阶段（capture）触发，该参数是一个布尔值，默认为false（表示监听函数只在冒泡阶段被触发）
 */
window.addEventListener('beforeunload', function(e) {
    e.returnValue = '你确认要离开吗？';
}, false);
</script>
```

>> removeEventListener() 方法
>>> #### 说明：
* removeEventListener方法用来移除addEventListener方法添加的事件监听函数
* emoveEventListener方法移除的监听函数，必须与对应的addEventListener方法的参数完全一致，而且在同一个元素节点，否则无效

>>> #### 示例：
```html
<script>
// removeEventListener方法的参数，与addEventListener方法完全一致。它对第一个参数“事件类型”，也是大小写不敏感
div.addEventListener('click', listener, false);
div.removeEventListener('click', listener, false);
</script>
```

>> dispatchEvent() 方法
>>> #### 说明：
* dispatchEvent方法在当前节点上触发指定事件，从而触发监听函数的执行
* 该方法返回一个布尔值，只要有一个监听函数调用了Event.preventDefault()，则返回值为false，否则为true

>>> #### 示例：
```html
<p id="test">123</p>
<script>
// 新建事件实例
var event = new Event('foo');
// 添加监听函数
test.addEventListener('foo', function (e) {
  console.log('触发 foo 事件');
}, false);
// 触发事件（参数为事件实例）
test.dispatchEvent(event);
</script>
```

## 事件的传播
> ### 说明
* 当一个事件发生以后，它会在不同的DOM节点之间传播
* 这种传播分成三个阶段

> ### capture 捕获阶段
>> #### 说明：
* 第一阶段：从window对象传导到目标节点，称为“捕获阶段”（capture phase）

>> #### 示例：
```html
<div>
    <p>test</p>
</div>
<script>
var div = document.querySelector('div');
var p = document.querySelector('p');
function callback(event){
    var tag = event.currentTarget.tagName;
    var phase = event.eventPhase;
    // 捕获阶段：event.eventPhase = 1
    // 目标阶段：event.eventPhase = 2
    // 冒泡阶段：event.eventPhase = 3
    console.log("Tag: " + tag + ", EventPhase: " + phase);
}
// 捕获阶段触发
div.addEventListener('click', callback, true); // 返回 Tag: DIV, EventPhase: 1
</script>
```

> ### target 目标阶段
>> #### 说明：
* 第二阶段：在目标节点上触发，称为“目标阶段”（target phase）

>> #### 示例：
```html
<div>
    <p>test</p>
</div>
<script>
var div = document.querySelector('div');
var p = document.querySelector('p');
function callback(event){
    var tag = event.currentTarget.tagName;
    var phase = event.eventPhase;
    // 捕获阶段：event.eventPhase = 1
    // 目标阶段：event.eventPhase = 2
    // 冒泡阶段：event.eventPhase = 3
    console.log("Tag: " + tag + ", EventPhase: " + phase);
}
// 目标阶段触发
p.addEventListener('click', callback, true); // 返回 Tag: P, EventPhase: 2
p.addEventListener('click', callback, false); // 返回 Tag: P, EventPhase: 2
</script>
```

> ### bubble 冒泡阶段
>> #### 说明：
* 第三阶段：从目标节点传导回window对象，称为“冒泡阶段”（bubble phase）

>> #### 示例：
```html
<div>
    <p>test</p>
</div>
<script>
var div = document.querySelector('div');
var p = document.querySelector('p');
function callback(event){
    var tag = event.currentTarget.tagName;
    var phase = event.eventPhase;
    // 捕获阶段：event.eventPhase = 1
    // 目标阶段：event.eventPhase = 2
    // 冒泡阶段：event.eventPhase = 3
    console.log("Tag: " + tag + ", EventPhase: " + phase);
}
// 冒泡阶段触发
div.addEventListener('click', callback, false); // 返回 Tag: DIV, EventPhase: 3
</script>
```

## 类库 jQuery - 方法
> ### $('#foo').bind();
>> #### 说明：
* 为一个元素绑定一个事件处理程序

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").bind('mouseenter mouseleave', function() {
    $(this).toggleClass('red');
  });
</script>
```

> ### $('#foo').unbind();
>> #### 说明：
* 从元素上删除一个以前附加事件处理程序

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").bind('mouseenter mouseleave', function() {
    $(this).toggleClass('red');
  });
  $("#foo").unbind('mouseenter mouseleave');
</script>
```

> ### $('#foo').on();
>> #### 说明：
* 为一个元素绑定多个事件处理程序

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").on({
    click: function(){
      alert('hello');
    },
    mouseenter: function(){
      $(this).addClass("red");
    },
    mouseleave: function(){
      $(this).removeClass("red");
    }
  });
</script>
```

> ### $('#foo').off();
>> #### 说明：
* 从元素上删除多个以前附加事件处理程序

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").on({
    click: function(){
      alert('hello');
    },
    mouseenter: function(){
      $(this).addClass("red");
    },
    mouseleave: function(){
      $(this).removeClass("red");
    }
  });
  $("#foo").off('mouseenter mouseleave');
</script>
```

> ### $('#foo').one();
>> #### 说明：
* 为元素的事件添加处理函数
* 处理函数在每个元素上每种事件类型最多执行一次

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").one('mouseenter mouseleave', function() {
    $(this).toggleClass('red');
  });
</script>
```

> ### $('#foo').trigger();
>> #### 说明：
* 主动执行元素上的事件类型处理函数

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").on('mouseenter mouseleave', function() {
    $(this).toggleClass('red');
  });
  $('#foo').trigger('mouseenter');
</script>
```

> ### $(document).ready();
>> #### 说明：
* 在文档加载解析完成后激活的函数
* 当 DOM 已经加载，并且页面（包括图像）已经完全呈现时，会发生 ready 事件
* ready() 函数仅能用于当前文档，因此可以无需选择器
* ready() 函数不应与 `<body onload="">` 一起使用
* ready() 函数允许使用以下三种语法

>> #### 示例：
```html
<body>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 语法 1 $(document).ready(function);
    $(document).ready(function(){
      console.log('hello 1');
    });
    // 语法 2 $().ready(function);
    $().ready(function(){
      console.log('hello 2');
    });
    // 语法 3 $(function);
    $(function(){
      console.log('hello 3');
    });
  </script>
</body>
```
