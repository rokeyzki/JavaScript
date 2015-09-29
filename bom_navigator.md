# BOM 引擎
浏览器的核心是两部分：渲染引擎和JS解释器，不同的浏览器有不同的渲染引擎，Firefox浏览器为Gecko引擎，Safari为WebKit引擎，Chrome为Blink引擎。JS引擎的主要作用是读取网页中的代码，对其处理后运行
***

## 脚本加载方式
> ### 属性加载
>> #### 说明：
* HTML语言允许在某些元素的事件属性和a元素的href属性中，直接写入JavaScript
* 这种写法将HTML代码与JavaScript代码混写在一起，不利于代码管理

>> #### 示例：
```html
<div onclick="alert('Hello')"></div>
<a href="javascript:alert('Hello')"></a>
```

> ### 元素加载
>> #### 说明：
* 通过`<script>`元素，可以直接将JavaScript代码嵌入网页
* 一般情况下，是将`<script>`标签都放在页面底部，而不是头部，这样即使遇到脚本失去响应，网页主体的渲染也已经完成了

>> #### 示例一：
```html
<body>
    <!-- 其他代码  -->
    <script>
        console.log('Hello');
    </script>
</body>
```

>> #### 示例二：
```html
<head>
    <script>
        // 当javascript代码必须放在网页前面的时候，也可以利用DOMContentLoaded事件的回调函数，来使脚本代码在DOM加载完之后再运行
        document.addEventListener('DOMContentLoaded', function(event) {
            console.log('Hello');
        });
  </script>
</head>
```

> ### 外部加载
>> #### 说明：
* `<script>`标签也可以指定加载外部的脚本文件
* 同样都是避免加载阻塞渲染，`async`属性和`defer`属性到底应该使用哪一个？
* 一般来说，如果脚本之间没有依赖关系，就使用`async`属性，如果脚本之间有依赖关系，就使用`defer`属性
* 如果同时使用`async`和`defer`属性，后者不起作用，浏览器行为由`async`属性决定

>> #### 示例：
```html
<script src="example.js"></script>
<!--
    1、async属性的作用是，使用另一个进程下载脚本，下载时不会阻塞渲染；
    2、需要注意的是，一旦采用这个属性，就无法保证脚本的执行顺序，哪个脚本先下载结束，就先执行那个脚本；
    3、使用async属性的脚本文件中，不应该使用document.write方法；
-->
<script src="1.js" async></script>
<script src="2.js" async></script>
<!--
    1、defer属性的作用是，告诉浏览器，等到DOM加载完成后，再执行指定脚本；
    2、下载的脚本文件在DOMContentLoaded事件触发前执行（即刚刚读取完</html>标签），而且可以保证执行顺序就是它们在页面上出现的顺序；
    3、对于内置而不是连接外部脚本的script标签，以及动态生成的script标签，defer属性不起作用；
-->
<script src="1.js" defer></script>
<script src="2.js" defer></script>
```

## 脚本加载协议
> ### 说明：
* 一般情况下，浏览器采用HTTP或HTTPs协议来下载脚本

> ### 示例：
```html
<!-- 如果不指定协议，浏览器默认采用HTTP协议下载 -->
<script src="example.js"></script>
<!-- 如果要采用HTTPs协议下载，必需写明（假定服务器支持） -->
<script src="https://example.js"></script>
<!-- 如果希望根据页面本身的协议来决定加载协议，这时可以采用下面的写法 -->
<script src="//example.js"></script>
```
