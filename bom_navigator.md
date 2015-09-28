# BOM 引擎
浏览器的核心是两部分：渲染引擎和JS解释器，不同的浏览器有不同的渲染引擎，Firefox浏览器为Gecko引擎，Safari为WebKit引擎，Chrome为Blink引擎。JS引擎的主要作用是读取网页中的代码，对其处理后运行
***

## 脚本加载方式
> ### 属性加载
>> #### 说明：
* HTML语言允许在某些元素的事件属性和a元素的href属性中，直接写入JavaScript
* 这种写法将HTML代码与JavaScript代码混写在一起，不利于代码管理。

>> #### 示例：
```html
<div onclick="alert('Hello')"></div>
<a href="javascript:alert('Hello')"></a>
```

> ### 元素加载
>> #### 说明：
* 通过`<script>`元素，可以直接将JavaScript代码嵌入网页。
* 一般建议将`<script>`元素放置在页面底部。

>> #### 示例：
```html
<script>
    // some JavaScript code
</script>
<script>
    // 利用DOMContentLoaded事件的回调函数
    document.addEventListener('DOMContentLoaded', function(event) {
        console.log('Hello');
    });
</script>
```

> ### 外部加载
>> #### 说明：
* 通过`<script>`元素也可以指定加载外部的脚本文件
* 同样都是为了避免下载阻塞网页渲染，async属性和defer属性到底应该使用哪一个？
* 一般来说，如果脚本之间没有依赖关系，就使用async属性，如果脚本之间有依赖关系，就使用defer属性
* 如果同时使用async和defer属性，后者不起作用，浏览器行为由async属性决定。

>> #### 示例：
```html
<script src="example.js"></script>
<!--
    1、async属性的作用是，使用另一个进程下载脚本，下载时不会阻塞渲染；
    2、需要注意的是，一旦采用这个属性，就无法保证脚本的执行顺序，哪个脚本先下载结束，就先执行那个脚本；
    3、使用async属性的脚本文件中，不应该使用document.write方法
-->
<script src="1.js" async></script>
<script src="2.js" async></script>
<!--
    1、defer属性的作用是，告诉浏览器，等到DOM加载完成后，再执行指定脚本（类似利用DOMContentLoaded事件的回调函数），防止脚本文件下载阻塞了网页渲染；
    2、对于内置而不是连接外部脚本的script标签，以及动态生成的script标签，defer属性不起作用；
-->
<script src="1.js" defer></script>
<script src="2.js" defer></script>
```

