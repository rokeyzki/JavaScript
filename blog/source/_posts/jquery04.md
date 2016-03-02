title: 可想实现一个自己的简单jQuery库？(四)
date: 2015-11-23 19:54:34
tags:
---

## Lesson-3

修改f(selector) 里的判断,新增domReady

我们知道在jQuery中还有一种选择器写法
```javascript
$(function() {

});
```

在dom加载完毕后马上就执行,这样的方法会比onload更快,所以domReady对于我们来说一定是必不可少的

<!-- more -->

我们在init方法中要新增以下判断
```javascript
if(!selector) { return this; }

if (typeof selector == 'object') {
    var selector = [selector];
    for (var i = 0; i < selector.length; i++) {
        this[i] = selector[i];
    }
    this.length = selector.length;
    return this;
} else if (typeof selector == 'function') {
    Kodo.ready(selector);
    return;
}
```

首先selector可能为object的情况,比如传入的是原生dom对象,dom数组对象. 另外要记得转为数组`var selector = [selector];

因为有可能是一个元素比如是window,document等否则没法循环

然后selector如果是function那我们就认为他是domReady

PS:在这我判断的并没有非常的全面,仅仅具备了基础功能
```javascript
Kodo.ready = function(fn) {
    doc.addEventListener('DOMContentLoaded',function() {
        fn && fn();
    },false);
    doc.removeEventListener('DOMContentLoaded',fn,true);
};
```

然后这个是ready的源码,由于我们只兼容高端浏览器所以仅仅需要这样写即可.
