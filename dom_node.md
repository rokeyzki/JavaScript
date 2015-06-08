# DOM 节点
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
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* 获取ID为foo的DIV元素节点的三种常用方法 */
/* 1 */
var div_1st = foo;
console.log(div_1st); // div#foo
/* 2 */
var div_2nd = document.getElementById("foo");
console.log(div_2nd); // div#foo
/* 3 */
var div_3rd = document.querySelector("#foo");
console.log(div_3rd); // div#foo
/* ownerDocument 属性示例 */
console.log(foo.ownerDocument); // #document
```

>> #### parentNode 属性
>>> #### 说明：
* parentNode属性返回当前节点的父节点
* 对于一个节点来说，它的父节点只可能是三种类型：document节点、element节点、documentfragment节点
* 如果当前节点没有父节点，则返回null

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* parentNode 属性示例 */
var p_1st = foo.firstElementChild;
console.log(p_1st.parentNode); // div#foo
```

>> #### parentElement 属性
>>> #### 说明：
* parentElement属性返回当前节点的父Element节点
* 如果当前节点没有父节点，或者父节点类型不是Element节点，则返回null

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* parentElement 属性示例 */
var p_1st = foo.firstElementChild;
console.log(p_1st.parentElement); // div#foo
```

> ### 平级属性
>> #### nextSibling 属性
>>> #### 说明：
* nextsibling属性返回紧跟在当前节点后面的第一个同级兄弟节点
* 如果当前节点后面没有同级节点，则返回null
* 该属性包括元素节点和文本节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* nextSibling 属性示例 */
var p_1st = foo.firstElementChild;
var span_1st = p_1st.firstElementChild;
console.log(span_1st.nextSibling); // span
```

>> #### previousSibling 属性
>>> #### 说明：
* previoussibling属性返回当前节点前面的、距离最近的一个同级兄弟节点
* 如果当前节点前面没有同级节点，则返回null
* 该属性包括元素节点和文本节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* previousSibling 属性示例 */
var p_1st = foo.firstElementChild;
var span_1st = p_1st.firstElementChild;
console.log(span_1st.previousSibling); // null
```

>> #### nextElementSibling 属性
>>> #### 说明：
* nextElementSibling属性返回指定元素的后一个同级元素
* 如果没有则返回null
* 该属性只包括元素节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* nextElementSibling 属性示例 */
var p_1st = foo.firstElementChild;
var span_1st = p_1st.firstElementChild;
console.log(span_1st.nextElementSibling); // span
```

>> #### previousElementSibling 属性
>>> #### 说明：
* previousElementSibling属性返回指定元素的前一个同级元素
* 如果没有则返回null
* 该属性只包括元素节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* previousElementSibling 属性示例 */
var p_1st = foo.firstElementChild;
var span_1st = p_1st.firstElementChild;
console.log(span_1st.previousElementSibling); // null
```

> ### 子级属性
>> #### children 属性
>>> #### 说明：
* children属性返回一个类似数组的动态对象（实时反映变化）
* 如果当前元素没有子元素，则返回的对象包含零个成员
* 该属性包括当前元素节点的所有子元素

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* children 属性示例 */
console.log(foo.children); // HTMLCollection[3] 0:p,1:p,2:p
```

>> #### childNodes 属性
>>> #### 说明：
* childNodes属性返回一个NodeList集合，成员包括当前节点的所有子节点
* 如果当前节点不包括任何子节点，则返回一个空的NodeList集合
* 由于NodeList对象是一个动态集合，一旦子节点发生变化，立刻会反映在返回结果之中
* 该属性包括元素节点和文本节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* childNodes 属性示例 */
console.log(foo.childNodes); // HTMLCollection[7] 0:text,1:p,2:text,3:p,4:text,5:p,6:text
```

>> #### firstChild 属性
>>> #### 说明：
* firstChild属性返回当前节点的第一个子节点
* 如果当前节点没有子节点，则返回null
* 该属性包括元素节点和文本节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* firstChild 属性示例 */
console.log(foo.firstChild); // #text
```

>> #### lastChild 属性
>>> #### 说明：
* lastChild属性返回当前节点的最后一个子节点
* 如果当前节点没有子节点，则返回null
* 该属性包括元素节点和文本节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* lastChild 属性示例 */
console.log(foo.lastChild); // #text
```

>> #### childElementCount 属性
>>> #### 说明：
* childElementCount属性返回当前元素节点包含的子元素节点的个数
* 该属性只包括元素节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* childElementCount 属性示例 */
console.log(foo.childElementCount); // 3
```

>> #### firstElementChild 属性
>>> #### 说明：
* firstElementChild属性返回第一个子元素
* 如果没有，则返回null
* 该属性只包括元素节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* firstElementChild 属性示例 */
console.log(foo.firstElementChild); // p
```

>> #### lastElementChild 属性
>>> #### 说明：
* lastElementChild属性返回最后一个子元素
* 如果没有，则返回null
* 该属性只包括元素节点

>>> #### 示例：
```html
<div id="foo">
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p>
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
</div>
```
```javascript
/* lastElementChild 属性示例 */
console.log(foo.lastElementChild); // p
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
