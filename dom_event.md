# DOM 事件
事件是一种异步编程的实现方式，本质上是程序各个组成部分之间传递的特定消息
***

## 事件的属性
> ### bubbles 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### eventPhase 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### cancelable 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### defaultPrevented 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### currentTarget 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### target 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### type 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### detail 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### timeStamp 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### isTrusted 属性
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

## 事件的方法
> ### event.preventDefault() 方法
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### event.stopPropagation() 方法
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

> ### event.stopImmediatePropagation() 方法
>> #### 说明：
* 123

>> #### 示例：
```javascript
123
```

## 事件的名称
> ### 文档事件
>> #### 原生
>>> #### beforeunload 事件
>>>> #### 说明：
* beforeunload事件当窗口将要关闭或者重载的时候触发

>>>> #### 示例：
```html
<script>
window.addEventListener('beforeunload', function(e) {
    e.returnValue = '你确认要离开吗？';
}, false);
</script>
```

>>> #### unload 事件
>>>> #### 说明：
* 不明

>>>> #### 示例：
```html
123
```

>>> #### load 事件
>>>> #### 说明：
* load事件在页面加载成功的时候触发

>>>> #### 示例：
```html
<script>
window.addEventListener('load', function(e) {
    console.log('load 文档加载完成');
}, false);
</script>
```

>>> #### error 事件
>>>> #### 说明：
* error事件在页面加载失败时触发

>>>> #### 示例：
```html
<img id="error_img" src="2121212121" alt="">
<script>
error_img.addEventListener('error', function(e) {
    console.log('error 文档加载错误');
}, false);
</script>
```

>>> #### pageshow 事件
>>>> #### 说明：
* pageshow事件在页面加载时触发，包括第一次加载和从缓存加载两种情况。如果要指定页面每次加载（不管是不是从浏览器缓存）时都运行的代码，可以放在这个事件的监听函数

>>>> #### 示例：
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

>>> #### pagehide 事件
>>>> #### 说明：
* 不明

>>>> #### 示例：
```javascript
123
```

>>> #### DOMContentLoaded 事件
>>>> #### 说明：
* DOMContentLoaded事件,当HTML文档下载并解析完成以后，就会在document对象上触发DOMContentLoaded事件。这时，仅仅完成了HTML文档的解析（整张页面的DOM生成），所有外部资源（样式表、脚本、iframe等等）可能还没有下载结束。也就是说，这个事件比load事件，发生时间早得多。

>>>> #### 示例：
```html
<script>
document.addEventListener("DOMContentLoaded", function(e) {
    console.log("DOMContentLoaded DOM生成");
}, false);
</script>
```

>>> #### readystatechange 事件
>>>> #### 说明：
* readystatechange事件发生在Document对象和XMLHttpRequest对象，当它们的readyState属性发生变化时触发。

>>>> #### 示例：
```html
<script>
console.log(document.readyState);
document.addEventListener("readystatechange", function(e) {
    if(document.readyState == "loading") {
        // readyState属性返回当前文档的状态，共有三种可能的值
        // 加载HTML代码阶段（尚未完成解析）是“loading”
        // 加载外部资源阶段是“interactive”
        // 全部加载完成是“complete”
        console.log('readystatechange loading 开始加载文档中。。。');
    }else if(document.readyState == "interactive") {
        console.log('readystatechange interactive 文档加载完成，开始加载外部资源中。。。');
    }else{
        console.log('readystatechange complete 全部加载完成');
    }
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 网址事件
>> #### 原生
>>> #### hashchange 事件
>>>> #### 说明：
* hashchange事件在URL的hash部分（即#号后面的部分，包括#号）发生变化时触发

>>>> #### 示例：
```html
<script>
window.addEventListener('hashchange', function(e) {
    console.log('hashchange ' + window.location.hash);
}, false);
</script>
```

>>> #### popstate 事件
>>>> #### 说明：
* popstate事件在浏览器的history对象的当前记录发生显式切换时触发

>>>> #### 示例：
```html
<script>
window.addEventListener('popstate', function(e) {
    console.log('popstate' + document.documentURI);
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 剪贴板事件
>> #### 原生
>>> #### copy 事件
>>>> #### 说明：
* copy事件在选中的内容加入剪贴板后触发

>>>> #### 示例：
```html
<input id="input" type="text">
<script>
window.addEventListener('copy', function(e) {
    console.log('copy 复制文本');
}, false);
</script>
```

>>> #### paste 事件
>>>> #### 说明：
* paste事件在剪贴板内容被粘贴到文档后触发

>>>> #### 示例：
```html
<input id="input" type="text">
<script>
window.addEventListener('paste', function(e) {
    console.log('paste 粘贴文本');
}, false);
</script>
```

>>> #### cut 事件
>>>> #### 说明：
* cut事件在将选中的内容从文档中移除，加入剪贴板后触发

>>>> #### 示例：
```html
<input id="input" type="text">
<script>
window.addEventListener('cut', function(e) {
    console.log('cut 剪切文本');
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 焦点事件
>> #### 原生
>>> #### focus 事件
>>>> #### 说明：
* focus事件当Element节点获得焦点后触发，该事件不会冒泡，只能在捕获阶段触发，所以addEventListener方法的第三个参数需要设为true

>>>> #### 示例：
```html
<input id="input" type="text">
<script>
input.addEventListener('focus', function(e) {
    e.target.style.background = "pink";
    console.log('focus 获取焦点');
}, true);
</script>
```

>>> #### blur 事件
>>>> #### 说明：
* blur事件当Element节点失去焦点后触发，该事件不会冒泡，只能在捕获阶段触发，所以addEventListener方法的第三个参数需要设为true

>>>> #### 示例：
```javascript
<input id="input" type="text">
<script>
input.addEventListener('blur', function(e) {
    e.target.style.background = "";
    console.log('blur 失去焦点');
}, true);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 表单事件
>> #### 原生
>>> #### input 事件
>>>> #### 说明：
* input事件当`<input>`、`<textarea>`的值发生变化时触发

>>>> #### 示例：
```html
<input type="text" id="foo1">
<script>
foo1.addEventListener('input', function(e){
    console.log('input 触发');
}, false);
</script>
```

>>> #### select 事件
>>>> #### 说明：
* select事件当在`<input>`、`<textarea>`中选中文本时触发

>>>> #### 示例：
```html
<input type="text" id="foo2">
<script>
foo2.addEventListener('select', function(e){
    console.log('select 触发');
}, false);
</script>
```

>>> #### change 事件
>>>> #### 说明：
* change事件当`<input>`、`<select>`、`<textarea>`的值发生变化，并且丧失焦点时触发

>>>> #### 示例：
```html
<input type="text" id="foo3">
<script>
foo3.addEventListener('change', function(e){
    console.log('change 触发');
}, false);
</script>
```

>>> #### reset 事件
>>>> #### 说明：
* reset事件当表单重置（所有表单成员变回默认值）时触发

>>>> #### 示例：
```html
<form action="" id="form">
    <input type="text" id="foo1">
    <button type="reset">重置</button>
</form>
<script>
form.addEventListener('reset', function(e){
    console.log('reset 触发');
}, false);
</script>
```

>>> #### submit 事件
>>>> #### 说明：
* submit事件当表单数据向服务器提交时触发

>>>> #### 示例：
```html
<form action="" id="form">
    <input type="text" id="foo1">
    <button type="reset">重置</button>
</form>
<script>
form.addEventListener('submit', function(e){
    alert('submit 触发');
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 鼠标事件
>> #### 原生
>>> #### click 事件
>>>> #### 说明：
* click事件当用户在Element节点、document节点、window对象上，单击鼠标（或者按下回车键）时触发

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('click', function(e){
    console.log('click 事件');
}, false);
</script>
```

>>> #### dblclick 事件
>>>> #### 说明：
* dblclick事件当用户在element、document、window对象上，双击鼠标时触发。该事件会在mousedown、mouseup、click之后触发。

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('dblclick', function(e){
    console.log('dblclick 事件');
}, false);
</script>
```

>>> #### mousedown 事件
>>>> #### 说明：
* mousedown事件在按下鼠标键时触发

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('mousedown', function(e){
    console.log('mousedown 事件');
}, false);
</script>
```

>>> #### mouseup 事件
>>>> #### 说明：
* mouseup事件在松掉鼠标键时触发

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('mouseup', function(e){
    console.log('mouseup 事件');
}, false);
</script>
```

>>> #### mousemove 事件
>>>> #### 说明：
* mousemove事件当鼠标在一个节点内部移动时触发。当鼠标持续移动时，该事件会连续触发

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('mousemove', function(e){
    console.log('mousemove 事件');
}, false);
</script>
```

>>> #### mouseover 事件
>>>> #### 说明：
* mouseover事件是鼠标进入一个节点时触发，会冒泡，比mouseenter事件快

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('mouseover', function(e){
    console.log('mouseover 事件');
}, false);
</script>
```

>>> #### mouseenter 事件
>>>> #### 说明：
* mouseenter事件是鼠标进入一个节点时触发，不会冒泡

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('mouseenter', function(e){
    console.log('mouseenter 事件');
}, true);
</script>
```

>>> #### mouseout 事件
>>>> #### 说明：
* mouseout事件是鼠标离开一个节点时触发，会冒泡，比mouseleave事件快

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('mouseout', function(e){
    console.log('mouseout 事件');
}, false);
</script>
```

>>> #### mouseleave 事件
>>>> #### 说明：
* mouseleave事件是鼠标离开一个节点时触发，不会冒泡

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('mouseleave', function(e){
    console.log('mouseleave 事件');
}, true);
</script>
```

>>> #### contextmenu 事件
>>>> #### 说明：
* contextmenu事件在一个节点上点击鼠标右键时触发，或者按下“上下文菜单”键时触发

>>>> #### 示例：
```html
<div id="foo" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('contextmenu', function(e){
    console.log('contextmenu 事件');
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 滚轮事件
>> #### 原生
>>> #### scroll 事件
>>>> #### 说明：
* scroll事件在文档或文档元素滚动时触发

>>>> #### 示例：
```html
<div style="height:1000px;"></div>
<script>
window.addEventListener('scroll', function(e) {
    console.log('scroll 文档元素滚动');
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 缩放事件
>> #### 原生
>>> #### resize 事件
>>>> #### 说明：
* resize事件在改变浏览器窗口大小时触发，发生在window、body、frameset对象上面

>>>> #### 示例：
```html
<script>
window.addEventListener('resize', function(e) {
    console.log('resize' + document.body.clientWidth);
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 拖拉事件
>> #### 原生
>>> #### drag 事件
>>>> #### 说明：
* drag事件拖拉过程中，在被拖拉的节点上持续触发

>>>> #### 示例：
```html
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;">
    <div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
</div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<script>
foo.addEventListener('drag', function(e){
    console.log('drap 触发');
}, false);
</script>
```

>>> #### dragstart 事件
>>>> #### 说明：
* dragstart事件拖拉开始时在被拖拉的节点上触发

>>>> #### 示例：
```html
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;">
    <div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
</div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<script>
foo.addEventListener('dragstart', function(e){
    console.log('dragstart 触发');
}, false);
</script>
```

>>> #### dragend 事件
>>>> #### 说明：
* dragend事件拖拉结束时（释放鼠标键或按下escape键）在被拖拉的节点上触发

>>>> #### 示例：
```html
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;">
    <div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
</div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<script>
foo.addEventListener('dragend', function(e){
    console.log('dragend 触发');
}, false);
</script>
```

>>> #### dragenter 事件
>>>> #### 说明：
* dragenter事件拖拉进入当前节点时，在当前节点上触发

>>>> #### 示例：
```html
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;">
    <div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
</div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<script>
foo.addEventListener('dragenter', function(e){
    console.log('dragenter 触发');
}, false);
</script>
```

>>> #### dragover 事件
>>>> #### 说明：
* dragover事件拖拉到当前节点上方时，在当前节点上持续触发

>>>> #### 示例：
```html
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;">
    <div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
</div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<script>
foo.addEventListener('dragover', function(e){
    console.log('dragover 触发');
}, false);
</script>
```

>>> #### dragleave 事件
>>>> #### 说明：
* dragleave事件拖拉离开当前节点范围时，在当前节点上触发

>>>> #### 示例：
```html
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;">
    <div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
</div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<script>
foo.addEventListener('dragleave', function(e){
    console.log('dragleave 触发');
}, false);
</script>
```

>>> #### drop 事件
>>>> #### 说明：
* drop事件被拖拉的节点或选中的文本，释放到目标节点时，在目标节点上触发

>>>> #### 示例：
```html
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;">
    <div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
</div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<div class="dropzone" style="height:100px; width:100px; border:1px solid #000;"></div>
<script>
var dragged;
document.addEventListener("dragstart", function(e) {
    // 保存被拖拉节点
    dragged = e.target;
}, false);
document.addEventListener("drop", function(e) {
    // 防止事件默认行为（比如某些Elment节点上可以打开链接）
    e.preventDefault();
    if ( e.target.className == "dropzone" ) {
        // 将被拖拉节点插入目标节点
        dragged.parentNode.removeChild( dragged );
        e.target.appendChild( dragged );
    }
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 键盘事件
>> #### 原生
>>> #### keydown 事件
>>>> #### 说明：
* keydown事件在按下键盘时触发

>>>> #### 示例：
```html
<script>
document.addEventListener('keydown', function(e){
    console.log('keydown 触发');
}, false);
</script>
```

>>> #### keypress 事件
>>>> #### 说明：
* keypress事件在按下键盘时（非Ctrl、Alt、Shift和Meta）触发

>>>> #### 示例：
```html
<script>
document.addEventListener('keypress', function(e){
    console.log('keypress 触发');
}, false);
</script>
```

>>> #### keyup 事件
>>>> #### 说明：
* keyup事件在松开键盘时触发

>>>> #### 示例：
```html
<script>
document.addEventListener('keyup', function(e){
    console.log('keyup 触发');
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 触摸事件
>> #### 原生
>>> #### touchstart 事件
>>>> #### 说明：
* touchstart事件当用户接触触摸屏时触发
* APPLE Magic Trackpad 不支持 DOM 触摸事件

>>>> #### 示例：
```html
<div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('touchstart', function(e){
    console.log('touchstart 触发');
}, false);
</script>
```

>>> #### touchend 事件
>>>> #### 说明：
* touchend事件当用户不再接触触摸屏时（或者移出屏幕边缘时）触发
* APPLE Magic Trackpad 不支持 DOM 触摸事件

>>>> #### 示例：
```html
<div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('touchend', function(e){
    console.log('touchend 触发');
}, false);
</script>
```

>>> #### touchmove 事件
>>>> #### 说明：
* touchmove事件当用户移动触摸点时触发
* APPLE Magic Trackpad 不支持 DOM 触摸事件

>>>> #### 示例：
```html
<div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('touchmove', function(e){
    console.log('touchmove 触发');
}, false);
</script>
```

>>> #### touchcancel 事件
>>>> #### 说明：
* touchcancel事件当触摸点取消时触发
* APPLE Magic Trackpad 不支持 DOM 触摸事件

>>>> #### 示例：
```html
<div id="foo" draggable="true" style="height:100px; width:100px; background-color:red"></div>
<script>
foo.addEventListener('touchcancel', function(e){
    console.log('touchcancel 触发');
}, false);
</script>
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 进度事件
>> #### 原生
>>> #### load 事件
>>>> #### 说明：
* load事件当进度成功结束时触发

>>>> #### 示例：
```html
<img id="foo1" src="https://www.baidu.com/img/bd_logo1.png" alt="">
<script>
foo1.addEventListener('load', function(e) {
    console.log('img 加载完成');
}, false);
</script>
```

>>> #### error 事件
>>>> #### 说明：
* error事件当由于错误导致资源无法加载时触发

>>>> #### 示例：
```html
<img id="foo1" src="1212121212121" alt="">
<script>
foo1.addEventListener('error', function(e) {
    console.log('img 加载失败');
}, false);
</script>
```

>>> #### abort 事件
>>>> #### 说明：
* abort事件当进度事件被中止时触发
* 如果发生错误，导致进程中止，不会触发该事件

>>>> #### 示例：
```javascript
暂无
```

>>> #### timeout 事件
>>>> #### 说明：
* timeout事件当进度超过限时时触发

>>>> #### 示例：
```javascript
暂无
```

>>> #### loadstart 事件
>>>> #### 说明：
* loadstart事件当进度开始时触发

>>>> #### 示例：
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

>>> #### progress 事件
>>>> #### 说明：
* progress事件当操作处于进度之中，由传输的数据块不断触发

>>>> #### 示例：
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

>>> #### canplay 事件
>>>> #### 说明：
* canplay事件当浏览器能够开始播放指定的音频/视频时触发

>>>> #### 示例：
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

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

> ### 定制事件
>> #### 原生
>>> #### N/A 事件
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

>> #### 定制
>>> #### xxx 属性
>>>> #### 说明：
* 123

>>>> #### 示例：
```javascript
123
```

## 事件的监听


## 事件的传播
