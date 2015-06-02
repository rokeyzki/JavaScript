# 标准节点
DOM的最小组成单位叫做节点（node），一个文档的树形结构，就是由各种不同类型的节点组成，所有类型的节点都是标准Node对象派生出来的，也就是说，它们都继承了标准Node的属性和方法
***

## 标准节点的属性
> ### 基础属性
>> #### nodeName 属性、nodeType 属性
>>> ##### 说明：
* nodeName属性返回节点的名称
* nodeType属性返回节点的常数值

>>> ##### 表格：
节点类型 | nodeName | nodeType
---|---|---
文档节点 | #document | 9
元素节点 | 大写的HTML元素名 | 1
属性节点 | 等同于Attr.name | 2
内容节点 | #text | 3
碎片节点 | #document-fragment | 11

>>> ##### 示例：
```javascript
document.nodeName // "#document"
document.nodeType // 9
```

>> #### nodeValue 属性
>>> ##### 说明：
* nodeValue属性返回或设置当前节点的值，格式为字符串
* 该属性只对Text节点、Comment节点、XML文档的CDATA节点有效，其他类型的节点一律返回null
* 对于那些返回null的节点，设置nodeValue属性是无效的

>>> ##### 示例：
```javascript
document.nodeValue // "hello world"
```

>> #### textContent 属性
>>> ##### 说明：
* textContent属性返回当前节点和它的所有后代节点的文本内容
* textContent属性会自动忽略当前节点内部的HTML标签，返回所有文本内容
* 该属性是可读写的，设置该属性的值，会用一个新的文本节点，替换所有它原来的子节点
* document节点和doctype节点的textContent属性为null
* 如果要读取整个文档的内容，可以使用document.documentElement.textContent

>>> ##### 示例：
```javascript
// HTML代码为
// <div id="divA">This is <span>some</span> text</div>
document.getElementById("divA").textContent // This is some text
document.getElementById('foo').textContent = '<p>GoodBye!</p>';
```

>> #### baseURI 属性
>>> ##### 说明：
* baseURI属性返回一个字符串，由当前网页的协议、域名和所在的目录组成，表示当前网页的绝对路径
* 如果无法取到这个值，则返回null
* 通常情况下，该属性由当前网址的URL（即window.location属性）决定，但是可以使用HTML的<base>标签，改变该属性的值

>>> ##### 示例：
```javascript
<base href="http://www.example.com/page.html">
<base target="_blank" href="http://www.example.com/page.html">
```

> ### 遍历属性
>> #### ownerDocument 属性
>>> ##### 说明：
* ownerDocument属性返回当前节点所在的顶层文档对象，即document对象
* document对象本身的ownerDocument属性，返回null

>>> ##### 示例：
```javascript
var d = p.ownerDocument;
d === document // true
```

>> #### parentNode 属性
>>> ##### 说明：
* parentNode属性返回当前节点的父节点
* 对于一个节点来说，它的父节点只可能是三种类型：document节点、element节点、documentfragment节点
* 如果当前节点没有父节点，则返回null

>>> ##### 示例：
```javascript
if (node.parentNode) {
    node.parentNode.removeChild(node);
}
```

>> #### parentElement 属性
>>> ##### 说明：
* parentElement属性返回当前节点的父Element节点
* 如果当前节点没有父节点，或者父节点类型不是Element节点，则返回null

>>> ##### 示例：
```javascript
if (node.parentElement) {
    node.parentElement.style.color = "red";
}
```

>> #### nextSibling 属性
>>> ##### 说明：
* nextsibling属性返回紧跟在当前节点后面的第一个同级兄弟节点
* 如果当前节点后面没有同级节点，则返回null

>>> ##### 示例：
```javascript
var el = document.getelementbyid('div-01').firstchild;
var i = 1;
while (el) {
    console.log(i + '. ' + el.nodename);
    el = el.nextsibling;
    i++;
}
```

>> #### previousSibling 属性
>>> ##### 说明：
* previoussibling属性返回当前节点前面的、距离最近的一个同级兄弟节点
* 如果当前节点前面没有同级节点，则返回null

>>> ##### 示例：
```javascript
// html代码如下
// <a><b1 id="b1"/><b2 id="b2"/></a>
document.getelementbyid("b1").previoussibling // null
document.getelementbyid("b2").previoussibling.id // "b1"
```

>> #### childNodes 属性
>>> ##### 说明：
* childNodes属性返回一个NodeList集合，成员包括当前节点的所有子节点
* 如果当前节点不包括任何子节点，则返回一个空的NodeList集合
* 由于NodeList对象是一个动态集合，一旦子节点发生变化，立刻会反映在返回结果之中

>>> ##### 示例：
```javascript
var ulElementChildNodes = document.querySelector('ul').childNodes;
```

>> #### firstChild 属性
>>> ##### 说明：
* firstChild属性返回当前节点的第一个子节点
* 如果当前节点没有子节点，则返回null

>>> ##### 示例：
```javascript
// 暂无示例
```

>> #### lastChild 属性
>>> ##### 说明：
* lastChild属性返回当前节点的最后一个子节点
* 如果当前节点没有子节点，则返回null

>>> ##### 示例：
```javascript
// 暂无示例
```

## 标准节点的方法
> ### 查询方法
>> #### node.hasChildNodes() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

>> #### node.contains() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

>> #### node.compareDocumentPosition() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

>> #### node.isEqualNode() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

> ### 插入方法
>> #### node.appendChild() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

>> #### node.cloneNode() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

>> #### node.insertBefore() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

> ### 修改方法
>> #### node.replaceChild() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

> ### 删除方法
>> #### node.removeChild() 方法
>>> ##### 说明：
* 123

>>> ##### 示例：
```javascript
123
```

## 标准节点的集合
> ### XX() 方法
>> #### 说明：
* 123

>> #### 表格：
dog | bird | cat
----|------|----
foo | foo  | foo
bar | bar  | bar
baz | baz  | baz

>> #### 示例：
```javascript
123
```
