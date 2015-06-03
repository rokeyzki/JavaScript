# 节点
节点主要包含元素节点和文本节点
***

## 节点的属性
> ### 特征属性
>> #### nodeName 属性
>>> #### 说明：
* nodeName属性返回节点的名称

>>> #### 示例：
```javascript
document.nodeName // "#document"
```

>> #### nodeType 属性
>>> #### 说明：
* nodeType属性返回节点的常数值

>>> #### 表格：
节点类型 | nodeName | nodeType
---|---|---
文档节点 | #document | 9
元素节点 | 大写的HTML元素名 | 1
内容节点 | #text | 3
碎片节点 | #document-fragment | 11

>>> #### 示例：
```javascript
document.nodeType // 9
```

>> #### nodeValue 属性
>>> #### 说明：
* nodeValue属性返回或设置当前节点的值，格式为字符串
* 该属性只对Text节点、Comment节点、XML文档的CDATA节点有效，其他类型的节点一律返回null
* 对于那些返回null的节点，设置nodeValue属性是无效的

>>> #### 示例：
```javascript
document.nodeValue // "hello world"
```

>> #### textContent 属性
>>> #### 说明：
* textContent属性返回当前节点和它的所有后代节点的文本内容
* textContent属性会自动忽略当前节点内部的HTML标签，返回所有文本内容
* 该属性是可读写的，设置该属性的值，会用一个新的文本节点，替换所有它原来的子节点
* document节点和doctype节点的textContent属性为null
* 如果要读取整个文档的内容，可以使用document.documentElement.textContent

>>> #### 示例：
```javascript
// HTML代码为
// <div id="divA">This is <span>some</span> text</div>
document.getElementById("divA").textContent // This is some text
document.getElementById('foo').textContent = '<p>GoodBye!</p>';
```

> ### 父级属性
>> #### ownerDocument 属性
>>> #### 说明：
* ownerDocument属性返回当前节点所在的顶层文档对象，即document对象
* document对象本身的ownerDocument属性，返回null

>>> #### 示例：
```javascript
var d = p.ownerDocument;
d === document // true
```

>> #### parentNode 属性
>>> #### 说明：
* parentNode属性返回当前节点的父节点
* 对于一个节点来说，它的父节点只可能是三种类型：document节点、element节点、documentfragment节点
* 如果当前节点没有父节点，则返回null

>>> #### 示例：
```javascript
if (node.parentElement) {
    node.parentElement.style.color = "red";
}
```

>> #### parentElement 属性
>>> #### 说明：
* parentElement属性返回当前节点的父Element节点
* 如果当前节点没有父节点，或者父节点类型不是Element节点，则返回null

>>> #### 示例：
```javascript
if (node.parentElement) {
    node.parentElement.style.color = "red";
}
```

> ### 平级属性
>> #### nextSibling 属性
>>> #### 说明：
* nextsibling属性返回紧跟在当前节点后面的第一个同级兄弟节点
* 如果当前节点后面没有同级节点，则返回null

>>> #### 示例：
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
>>> #### 说明：
* previoussibling属性返回当前节点前面的、距离最近的一个同级兄弟节点
* 如果当前节点前面没有同级节点，则返回null

>>> #### 示例：
```javascript
// html代码如下
// <a><b1 id="b1"/><b2 id="b2"/></a>
document.getelementbyid("b1").previoussibling // null
document.getelementbyid("b2").previoussibling.id // "b1"
```

>> #### nextElementSibling 属性
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### previousElementSibling 属性
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

> ### 子级属性
>> #### children 属性
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### childNodes 属性
>>> #### 说明：
* childNodes属性返回一个NodeList集合，成员包括当前节点的所有子节点
* 如果当前节点不包括任何子节点，则返回一个空的NodeList集合
* 由于NodeList对象是一个动态集合，一旦子节点发生变化，立刻会反映在返回结果之中

>>> #### 示例：
```javascript
var ulElementChildNodes = document.querySelector('ul').childNodes;
```

>> #### firstChild 属性
>>> #### 说明：
* firstChild属性返回当前节点的第一个子节点
* 如果当前节点没有子节点，则返回null

>>> #### 示例：
```javascript
// 暂无示例
```

>> #### lastChild 属性
>>> #### 说明：
* lastChild属性返回当前节点的最后一个子节点
* 如果当前节点没有子节点，则返回null

>>> #### 示例：
```javascript
// 暂无示例
```

>> #### childElementCount 属性
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### firstElementChild 属性
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### lastElementChild 属性
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

## 节点的方法
> ### 判断方法
>> #### node.hasChildNodes() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### node.contains() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### node.compareDocumentPosition() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### node.isEqualNode() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### element.match() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

> ### 获取方法
>> #### element.closest() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### element.querySelector() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### element.querySelectorAll() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### element.getElementsByClassName() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### element.getElementsByTagName() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### document.getElementById() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### document.getElementsByName() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### document.elementFromPoint() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

> ### 插入方法
>> #### node.appendChild() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### node.cloneNode() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### node.insertBefore() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### element.insertAdjacentHTML() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### document.createElement() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### document.createTextNode() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### document.createAttribute() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### document.createDocumentFragment() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

> ### 修改方法
>> #### node.replaceChild() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

> ### 删除方法
>> #### node.removeChild() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```

>> #### node.remove() 方法
>>> #### 说明：
* 123

>>> #### 示例：
```javascript
123
```
