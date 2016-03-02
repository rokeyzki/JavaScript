# DOM 文档
document节点是文档的根节点，document节点有不同的办法可以获取
* 对于正常的网页，直接使用document或window.document
* 对于iframe载入的网页，使用iframe节点的contentDocument属性
* 对Ajax操作返回的文档，使用XMLHttpRequest对象的responseXML属性
* 对于某个节点包含的文档，使用该节点的ownerDocument属性

***

## 文档的属性
> ### defaultView 属性
>> #### 说明：
* defaultView属性，在浏览器中返回document对象所在的window对象，否则返回null

>> #### 示例：
```javascript
console.log(document.defaultView); // Window
```

> ### doctype 属性
>> #### 说明：
* document对象一般有两个子节点。第一个子节点是document.doctype
* 它是一个对象，包含了当前文档类型（Document Type Declaration，简写DTD）信息
* 对于HTML5文档，该节点就代表<!DOCTYPE html>
* 如果网页没有声明DTD，该属性返回null

>> #### 示例：
```javascript
console.log(document.doctype); // <!DOCTYPE html>
console.log(document.firstChild == document.doctype); // true
```

> ### documentElement 属性
>> #### 说明：
* document对象一般有两个子节点。第二个子节点是document.documentElement
* document.documentElement属性，表示当前文档的根节点（root）
* 返回值为<html>标签内的全部内容

>> #### 示例：
```javascript
console.log(document.documentElement); // <html lang="zh-cmn-hans">...</html>
console.log(document.firstChild.nextSibling == document.documentElement); // true
```

> ### head 属性
>> #### 说明：
* head属性返回当前文档的head节点
* 如果当前文档有多个head，则返回第一个
* 返回值为<head>标签内的全部内容

>> #### 示例：
```javascript
console.log(document.head); // <head>...</head>
```

> ### body 属性
>> #### 说明：
* body属性返回当前文档的body或frameset节点
* 如果不存在这样的节点，就返回null
* 这个属性是可写的，如果对其写入一个新的节点，会导致原有的所有子节点被移除
* 返回值为<body>标签内的全部内容

>> #### 示例：
```javascript
console.log(document.body); // <body>...</body>
```

> ### title 属性
>> #### 说明：
* title属性返回当前文档的标题，该属性是可写的

>> #### 示例：
```javascript
console.log(document.title); // 标题
```

> ### characterSet 属性
>> #### 说明：
* characterSet属性返回渲染当前文档的字符集，比如UTF-8、ISO-8859-1

>> #### 示例：
```javascript
console.log(document.characterSet); // UTF-8"
```

> ### lastModified 属性
>> #### 说明：
* lastModified属性返回当前文档最后修改的时间戳，格式为字符串
* 注意，lastModified属性的值是字符串，所以不能用来直接比较，两个文档谁的日期更新，需要用Date.parse方法转成时间戳格式，才能进行比较

>> #### 示例：
```javascript
console.log(document.lastModified); // 06/22/2015 21:01:25
if (Date.parse(doc1.lastModified) > Date.parse(doc2.lastModified)) {
    // ...
}
```

> ### readyState 属性
>> #### 说明：
* readyState属性返回当前文档的状态，共有三种可能的值
* 加载HTML代码阶段（尚未完成解析）是“loading”
* 加载外部资源阶段是“interactive”
* 全部加载完成是“complete”

>> #### 示例：
```javascript
console.log(document.readyState); // loading
document.addEventListener("DOMContentLoaded", function(event) {
    console.log(document.readyState); // interactive
});
```

> ### activeElement 属性
>> #### 说明：
* activeElement属性返回当前文档中获得焦点的那个元素
* 用户通常可以使用tab键移动焦点，使用空格键激活焦点，比如如果焦点在一个链接上，此时按一下空格键，就会跳转到该链接

>> #### 示例：
```javascript
console.log(document.activeElement); // <body>...</body>
```

> ### designMode 属性
>> #### 说明：
* designMode属性控制当前document是否可编辑
* 通常会打开iframe的designMode属性，将其变为一个所见即所得的编辑器

>> #### 示例：
```javascript
console.log(document.designMode); // off
```

> ### documentURI 属性
>> #### 说明：
* documentURI属性和URL属性都返回当前文档的网址
* documentURI属性是所有文档都具备的

>> #### 示例：
```javascript
console.log(document.documentURI); // http://127.0.0.1/123.html
```

> ### URL 属性
>> #### 说明：
* documentURI属性和URL属性都返回当前文档的网址
* URL属性则是HTML文档独有的

>> #### 示例：
```javascript
console.log(document.URL); // http://127.0.0.1/123.html
```

> ### domain 属性
>> #### 说明：
* domain属性返回当前文档的域名
* 如果无法获取域名，该属性返回null

>> #### 示例：
```javascript
console.log(document.domain); // 127.0.0.1
```

> ### location 属性
>> #### 说明：
* location属性返回一个只读对象，提供了当前文档的URL信息
* 虽然location属性返回的对象是只读的，但是可以将URL赋值给这个属性，网页就会自动跳转到指定网址，但是因兼容性问题，为了保险起见，建议优先使用window.location

>> #### 示例：
```javascript
// 假定当前网址为http://user:passwd@www.example.com:4097/path/a.html?x=111#part1
document.location.href // "http://user:passwd@www.example.com:4097/path/a.html?x=111#part1"
document.location.protocol // "http:"
document.location.host // "www.example.com:4097"
document.location.hostname // "www.example.com"
document.location.port // "4097"
document.location.pathname // "/path/a.html"
document.location.search // "?x=111"
document.location.hash // "#part1"
document.location.user // "user"
document.location.password // "passed"
// 跳转到另一个网址
document.location.assign('http://www.google.com')
// 优先从服务器重新加载
document.location.reload(true)
// 优先从本地缓存重新加载（默认值）
document.location.reload(false)
// 跳转到另一个网址，但当前文档不保留在history对象中，
// 即无法用后退按钮，回到当前文档
document.location.assign('http://www.google.com')
// 将location对象转为字符串，等价于document.location.href
document.location.toString()
document.location = 'http://www.example.com';
// 等价于
document.location.href = 'http://www.example.com';
```

> ### referrer 属性
>> #### 说明：
* referrer属性返回一个字符串，表示前文档的访问来源
* 如果是无法获取来源或是用户直接键入网址，而不是从其他网页点击，则返回一个空字符串

>> #### 示例：
```javascript
console.log(document.referrer);
```

> ### cookie 属性
>> #### 说明：
* cookie属性返回当前网页的cookie
* 该属性是可写的，但是一次只能写入一个cookie，也就是说写入并不是覆盖，而是添加
* cookie的值可以用encodeURIComponent方法进行处理，对逗号、分号、空格进行转义（这些符号都不允许作为cookie的值）
* 删除一个cookie的简便方法，就是设置expires属性等于0

>> #### 示例：
```javascript
// 写入一个新cookie
document.cookie = "test1=hello";
// 再写入一个cookie
document.cookie = "test2=world";
document.cookie // test1=hello;test2=world
/**
 * 除了cookie本身的内容，还有一些可选的属性也是可以写入的，它们都必须以分号开头
 * Set-Cookie: value[; expires=date][; domain=domain][; path=path][; secure]
 */
var str = 'someCookieName=true';
str += '; expires=Fri, 31 Dec 9999 23:59:59 GMT';
str += '; path=/';
document.cookie = str;
console.log(document.cookie); // someCookieName=true;
```

> ### implementation 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

> ### compatMode 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

## 文档的集合属性
> ### anchors 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

> ### embeds 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

> ### forms 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

> ### images 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

> ### links 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

> ### scripts 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

> ### styleSheets 属性
>> #### 说明：
* 暂无说明

>> #### 示例：
```javascript
// 暂无示例
```

## 文档的方法
> ### document.open() 方法
>> #### 说明：
* document.open方法用于新建一个文档，供write方法写入内容
* 它实际上等于清除当前文档，重新写入内容
* 不要将此方法与window.open()混淆，后者用来打开一个新窗口，与当前文档无关

>> #### 示例：
```javascript
// 页面显示“helloworld”
document.open();
document.write("hello ");
document.write("world!");
document.close();
```

> ### document.close() 方法
>> #### 说明：
* document.close方法用于关闭open方法所新建的文档
* 一旦关闭，write方法就无法写入内容了
* 如果再调用write方法，就等同于又调用open方法，新建一个文档，再写入内容

>> #### 示例：
```javascript
// 页面显示“helloworld”
document.open();
document.write("hello ");
document.write("world!");
document.close();
```

> ### document.write() 方法
>> #### 说明：
* document.write方法用于向当前文档写入内容
* 只要当前文档还没有用close方法关闭，它所写入的内容就会追加在已有内容的后面
* 除了某些特殊情况，应该尽量避免使用document.write这个方法

>> #### 示例：
```javascript
// 页面显示“helloworld”
document.open();
document.write("hello ");
document.write("world!");
document.close();
```

> ### document.writeln() 方法
>> #### 说明：
* document.writeln方法与write方法完全一致，除了会在输出内容的尾部添加换行符
* 注意，writeln方法添加的是ASCII码的换行符，渲染成HTML网页时不起作用
* 除了某些特殊情况，应该尽量避免使用document.writeln这个方法

>> #### 示例：
```javascript
document.write(1);
document.write(2);
// 12
document.writeln(1);
document.writeln(2);
// 1
// 2
//
```

> ### document.hasFocus() 方法
>> #### 说明：
* document.hasFocus方法返回一个布尔值，表示当前文档之中是否有元素被激活或获得焦点

>> #### 示例：
```javascript
focused = document.hasFocus();
console.log(focused); // true
```


