# DOM 节点
节点主要包含元素节点和文本节点

## 大纲
> ### 属性
>> * 特征属性
  * 获取节点名称：Node.prototype.nodeName
  * 获取节点类型：Node.prototype.nodeType
* 父级属性
  * 获取文档对象：Node.prototype.ownerDocument
  * 获取父级节点：Node.prototype.parentNode
  * 获取父级元素：Node.prototype.parentElement
* 平级属性
  * 获取下一个平级节点：Node.prototype.nextSibling
  * 获取下一个平级元素：Node.prototype.nextElementSibling
  * 获取上一个平级节点：Node.prototype.previousSibling
  * 获取上一个平级元素：Node.prototype.previousElementSibling
* 子级属性
  * 获取所有子级节点：Node.prototype.childNodes
  * 获取所有子级元素：Node.prototype.children
  * 获取子级元素总数：Node.prototype.childElementCount
  * 获取首个子级节点：Node.prototype.firstChild
  * 获取首个子级元素：Node.prototype.firstElementChild
  * 获取末个子级节点：Node.prototype.lastChild
  * 获取末个子级元素：Node.prototype.lastElementChild

> ### 方法
>> * 判断方法
  * 判断当前元素是否匹配给定的CSS选择器：Element.prototype.matches()
  * 判断当前节点是否包含子节点：Node.prototype.hasChildNodes()
  * 判断是否为当前节点的后代节点：Node.prototype.contains()
  * 判断两个节点是否相同：Node.prototype.isEqualNode()
  * 判断两个节点的位置关系：Node.prototype.compareDocumentPosition()
* 获取方法
  * 根据CSS选择器获取第一个匹配的子元素：Element.prototype.querySelector()
  * 根据CSS选择器获取所有匹配的子元素：Element.prototype.querySelectorAll()
  * 根据CSS选择器获取当前元素节点的最接近的父元素：Element.prototype.closest()
  * 根据id选择器获取一个文档中匹配的子元素：document.getElementById()
  * 根据name选择器获取所有文档中匹配的子元素：document.getElementsByName()
  * 根据class选择器获取所有文档中匹配的子元素：Element.prototype.getElementsByClassName()
  * 根据tag选择器获取所有文档中匹配的子元素：Element.prototype.getElementsByTagName()
* 遍历方法
  * 生成一个包括根节点的子节点遍历器：document.createNodeIterator()
  * 生成一个不包括根节点的子节点遍历器：document.createTreeWalker()
* 生成方法
  * 生成一个元素节点：document.createElement()
  * 生成一个属性节点：document.createAttribute()
  * 生成一个文本节点：document.createTextNode()
  * 生成一个碎片节点：document.createDocumentFragment()
  * 克隆一个节点：Node.prototype.cloneNode()
* 插入方法
  * 移动一个节点到对象节点的子节点前面：Node.prototype.insertBefore()
  * 移动一个节点到对象节点的子节点后面：Node.prototype.appendChild()
  * 移动一个节点到对象节点的指定位置：Element.prototype.insertAdjacentHTML()
* 修改方法
  * 使用一个节点替换另一个节点：Node.prototype.replaceChild()
  * 使用一个属性替换另一个属性：Element.prototype.setAttributeNode() 
* 删除方法
  * 移除节点的一个子节点：Node.prototype.removeChild()
  * 移除整个节点：Node.prototype.remove()

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
>> #### Element.prototype.matches() 方法
>>> #### 说明：
* matches方法返回一个布尔值，表示当前元素是否匹配给定的CSS选择器
* 该方法包括元素节点和文本节点

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    var span_1st = foo.lastElementChild.firstElementChild;
    console.log(span_1st.matches('#foo .someClass span')); // true
  </script>
</body>
```

>> #### Node.prototype.hasChildNodes() 方法
>>> #### 说明：
* hasChildNodes方法判断节点是否包含子节点
* hasChildNodes方法结合firstChild属性和nextSibling属性，可以遍历当前节点的所有后代节点
* 该方法包括元素节点和文本节点

>>> #### 示例：
```html
<body>
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
  <script>
    console.log(foo.hasChildNodes()); // true
    console.log(foo.firstElementChild.firstElementChild.firstChild.hasChildNodes()); // false
  </script>
</body>
```

>> #### Node.prototype.contains() 方法
>>> #### 说明：
* contains方法接受一个节点作为参数，返回一个布尔值，表示参数节点是否为当前节点的后代节点
* 如果将当前节点传入contains方法，会返回true
* 该方法包括元素节点和文本节点

>>> #### 示例：
```html
<body>
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
  <script>
    var span_1st = foo.firstElementChild.firstElementChild;
    console.log(foo.contains(span_1st)); // true
    console.log(foo.contains(foo)); // true
  </script>
</body>
```

>> #### Node.prototype.isEqualNode() 方法
>>> #### 说明：
* isEqualNode方法返回一个布尔值，用于检查两个节点是否相等
* 所谓相等的节点，指的是两个节点的类型相同、属性相同、子节点相同

>>> #### 示例：
```html
<body>
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
  <script>
    var p_1st = foo.firstElementChild;
    var p_3rd = foo.lastElementChild;
    console.log(p_1st.isEqualNode(p_3rd)); // true
  </script>
</body>
```

>> #### Node.prototype.compareDocumentPosition() 方法
>>> #### 说明：
* compareDocumentPosition方法表示参数节点与当前节点的关系
* 该方法包括元素节点和文本节点

>>> #### 示例：
```html
<body>
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
  <script>
    // 当参数节点等于当前节点时，返回值为0，表示节点相同
    console.log(foo.compareDocumentPosition(foo)); // 0
    // 纵向比较
    var span_1st = foo.firstElementChild.firstElementChild;
    // 判断参数节点`span_1st`对于当前节点`foo`的位置，值20表示参数节点是当前节点的后代节点
    console.log(foo.compareDocumentPosition(span_1st)); // 20
    // 判断参数节点`foo`对于当前节点`span_1st`的位置，值10表示参数节点在当前节点的祖先节点
    console.log(span_1st.compareDocumentPosition(foo)); // 10
    // 横向比较
    var span_2nd = span_1st.nextElementSibling;
    // 判断参数节点`span_2nd`对于当前节点`span_1st`的位置，值4表示参数节点是当前节点的后面节点(不一定同级)
    console.log(span_1st.compareDocumentPosition(span_2nd)); // 4
    // 判断参数节点`span_1st`对于当前节点`span_2nd`的位置，值2表示参数节点是当前节点的前面节点(不一定同级)
    console.log(span_2nd.compareDocumentPosition(span_1st)); // 2
    var p_3rd = foo.lastElementChild;
    console.log(span_1st.compareDocumentPosition(p_3rd)); // 4
    console.log(p_3rd.compareDocumentPosition(span_1st)); // 2
  </script>
</body>
```

> ### 获取方法
>> #### Element.prototype.querySelector() 方法
>>> #### 说明：
* querySelector方法接受CSS选择器作为参数
* 返回父元素的第一个匹配的子元素

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    console.log(foo.querySelector(".someClass span")); // [object HTMLSpanElement]
  </script>
</body>
```

>> #### Element.prototype.querySelectorAll() 方法
>>> #### 说明：
* querySelectorAll方法接受CSS选择器作为参数
* 返回一个NodeList对象，包含所有匹配的子元素

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    console.log(foo.querySelectorAll("#foo .someClass span")); // [object NodeList] { 0: [object HTMLSpanElement], 1: [object HTMLSpanElement], 2: [object HTMLSpanElement] }
  </script>
</body>
```

>> #### Element.prototype.closest() 方法
>>> #### 说明：
* closest方法返回当前元素节点的最接近的父元素（或者当前节点本身）
* 条件是必须匹配给定的CSS选择器
* 如果不满足匹配，则返回null

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    var span_1st = foo.lastElementChild.firstElementChild;
    console.log(span_1st.closest("#foo .someClass")); // [object HTMLParagraphElement]
  </script>
</body>
```

>> #### document.getElementById() 方法
>>> #### 说明：
* getElementById方法返回匹配指定ID属性的元素节点
* 在搜索匹配节点时，ID属性是大小写敏感的
* 如果没有发现匹配的节点，则返回null

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    console.log(document.getElementById("foo")); // [object HTMLDivElement]
  </script>
</body>
```

>> #### document.getElementsByName() 方法
>>> #### 说明：
* getElementsByName方法用于选择拥有name属性的HTML元素
* 返回一个NodeList格式的对象，不会实时反映元素的变化
* 在IE浏览器使用这个方法，会将没有name属性、但有同名id属性的元素也返回，所以name和id属性最好设为不一样的值

>>> #### 示例：
```html
<body>
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
    <p name="someName">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    console.log(document.getElementsByName("someName")); // [object NodeList] { 0: [object HTMLParagraphElement] } 
  </script>
</body>
```

>> #### Element.prototype.getElementsByClassName() 方法
>>> #### 说明：
* getElementsByClassName方法返回一个HTMLCollection对象
* 成员是当前元素节点的所有匹配指定class的子元素
*

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    console.log(foo.getElementsByClassName("someClass")); // [object HTMLCollection] { 0: [object HTMLParagraphElement] } 
  </script>
</body>
```

>> #### Element.prototype.getElementsByTagName() 方法
>>> #### 说明：
* getElementsByTagName方法返回一个HTMLCollection对象
* 成员是当前元素节点的所有匹配指定标签名的子元素
* 该方法搜索之前，会统一将标签名转为小写

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    console.log(foo.getElementsByTagName("p")); // [object HTMLCollection] { 0: [object HTMLParagraphElement], 1: [object HTMLParagraphElement], 2: [object HTMLParagraphElement] } 
  </script>
</body>
```

>> #### document.elementFromPoint() 方法
>>> #### 说明：
* elementFromPoint方法返回位于页面指定位置的元素

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    console.log(document.elementFromPoint(1,1)); // [object HTMLHtmlElement]
  </script>
</body>
```

> ### 遍历方法
>> #### document.createNodeIterator() 方法
>>> #### 说明：
* createNodeIterator方法返回一个DOM的子节点遍历器
* createNodeIterator方法的第一个参数为遍历器的根节点
* 第二个参数为所要遍历的节点类型，类型包括
* 所有节点（NodeFilter.SHOW_ALL）
* 元素节点（NodeFilter.SHOW_ELEMENT）
* 文本节点（NodeFilter.SHOW_TEXT）
* 评论节点（NodeFilter.SHOW_COMMENT）
* 所谓“遍历器”，在这里指可以用nextNode方法和previousNode方法依次遍历根节点的所有子节点
* 遍历器返回的第一个节点，总是根节点

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    var fooNodeIterator = document.createNodeIterator(foo, NodeFilter.SHOW_ELEMENT);
    while (currentNode = fooNodeIterator.nextNode()) {
        console.log(currentNode.tagName); // DIV、P、SPAN、SPAN、SPAN、P、SPAN、SPAN、SPAN、P、SPAN、SPAN、SPAN
    }
    var nextNode = fooNodeIterator.nextNode(); 
    console.log(nextNode); // null
    var previousNode = fooNodeIterator.previousNode(); 
    console.log(previousNode); // [object HTMLSpanElement]
  </script>
</body>
```

>> #### document.createTreeWalker() 方法
>>> #### 说明：
* createTreeWalker方法返回一个DOM的子树遍历器
* 它与createNodeIterator方法的区别在于，createTreeWalker方法不遍历最初始的根节点
* createTreeWalker方法的第一个参数，是所要遍历的根节点
* 第二个参数指定所要遍历的节点类型

>>> #### 示例：
```html
<body>
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
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script>
    var fooTreeWalker = document.createTreeWalker(foo, NodeFilter.SHOW_ELEMENT);
    while (currentNode = fooTreeWalker.nextNode()) {
      console.log(currentNode.tagName); // P、SPAN、SPAN、SPAN、P、SPAN、SPAN、SPAN、P、SPAN、SPAN、SPAN
    }
  </script>
</body>
```

> ### 生成方法
>> #### document.createElement() 方法
>>> #### 说明：
* createElement方法用来生成HTML元素节点
* createElement方法的参数为元素的标签名，即元素节点的tagName属性
* 如果传入大写的标签名，会被转为小写。如果参数带有尖括号（即<和>）或者是null，会报错

>>> #### 示例：
```html
<body>
  <div id="demo">
    <div>4</div>
  </div>
  <script>
    var newDiv = document.createElement("div");
    demo.appendChild(newDiv);
  </script>
</body>
```

>> #### document.createAttribute() 方法
>>> #### 说明：
* createAttribute方法生成一个新的属性对象节点，并返回它
* createAttribute方法的参数name，是属性的名称

>>> #### 示例：
```html
<body>
  <div id="demo">
    <div>4</div>
  </div>
  <script>
    var newAttr = document.createAttribute("my_attr_key");
    newAttr.value = "my_attr_value";
    demo.setAttributeNode(newAttr);
  </script>
</body>
```

>> #### document.createTextNode() 方法
>>> #### 说明：
* createTextNode方法用来生成文本节点，参数为所要生成的文本节点的内容

>>> #### 示例：
```html
<body>
  <div id="demo">
    <div>4</div>
  </div>
  <script>
    var newDiv = document.createElement("div");
    var newText = document.createTextNode("hello");
    newDiv.appendChild(newText);
    demo.appendChild(newDiv);
  </script>
</body>
```

>> #### document.createDocumentFragment() 方法
>>> #### 说明：
* createDocumentFragment方法生成一个DocumentFragment对象
* DocumentFragment对象是一个存在于内存的DOM片段，但是不属于当前文档，常常用来生成较复杂的DOM结构，然后插入当前文档

>>> #### 示例：
```html
<body>
  <div id="demo">
    <div>4</div>
  </div>
  <script>
    var newFrag = document.createDocumentFragment();
    [1, 2, 3, 4].forEach(function(e) {
      var li = document.createElement("li");
      li.textContent = e;
      newFrag.appendChild(li);
    });
    demo.appendChild(newFrag);
  </script>
</body>
```

>> #### Node.prototype.cloneNode() 方法
>>> #### 说明：
* cloneNode方法用于克隆一个节点
* 它接受一个布尔值作为参数，表示是否同时克隆子节点，默认是false，即不克隆子节点
* 克隆一个节点之后，DOM树有可能出现两个有相同ID属性（即id="xxx"）的HTML元素，这时应该修改其中一个HTML元素的ID属性

>>> #### 示例：
```html
<body>
  <div id="demo">
    <div>4</div>
  </div>
  <script>
    // 复制一个demo节点（cloneNode方法默认只复制元素节点，不包括文本节点）
    var demo2 = demo.cloneNode();
    // 复制文本
    demo2.textContent = demo.textContent;
    demo.appendChild(demo2);
  </script>
</body>
```

> ### 插入方法
>> #### Node.prototype.insertBefore() 方法
>>> #### 说明：
* insertBefore方法用于将某个节点插入当前节点的指定位置
* 它接受两个参数，第一个参数是所要插入的节点
* 第二个参数是当前节点的一个子节点，新的节点将插在这个节点的前面

>>> #### 示例：
```html
<body>
  <div id="foo">
    <p class="someClass">
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
  <div id="demo">4</div>
  <script>
    var p_1st = foo.querySelector('#foo .someClass');
    p_1st.insertBefore(demo, p_1st.firstElementChild);
  </script>
</body>
```

>> #### Node.prototype.appendChild() 方法
>>> #### 说明：
* appendChild方法接受一个节点对象作为参数，将其作为最后一个子节点，插入当前节点
* 如果参数节点是文档中现有的其他节点，appendChild方法会将其从原来的位置，移动到新位置

>>> #### 示例：
```html
<body>
  <div id="foo">
    <p class="someClass">
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
  <div id="demo">4</div>
  <script>
    var p_1st = foo.querySelector('#foo .someClass');
    p_1st.appendChild(demo);
  </script>
</body>
```

>> #### Element.prototype.insertAdjacentHTML() 方法
>>> #### 说明：
* insertAdjacentHTML方法解析字符串，然后将生成的节点插入DOM树的指定位置
* 该方法接受两个参数，第一个是指定位置，第二个是待解析的字符串
* 指定位置共有四个
* 该方法不是彻底置换现有的DOM结构，这使得它的执行速度比innerHTML操作快得多
* 所有浏览器都支持这个方法，包括IE 6

>>> #### 示例：
```html
<body>
  <div id="foo">
    <p class="someClass">
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
  <div id="demo">4</div>
  <script>
    // beforebegin：在当前元素节点的前面
    foo.insertAdjacentHTML('beforebegin', '<div id="test">test</div>');
    // afterend：在当前元素节点的后面
    foo.insertAdjacentHTML('afterend', '<div id="test">test</div>');
    // afterbegin：在当前元素节点的里面，插在它的第一个子元素之前
    foo.insertAdjacentHTML('afterbegin', '<div id="test">test</div>');
    // beforeend：在当前元素节点的里面，插在它的最后一个子元素之后
    foo.insertAdjacentHTML('beforeend', '<div id="test">test</div>');
  </script>
</body>
```

> ### 修改方法
>> #### Node.prototype.replaceChild() 方法
>>> #### 说明：
* replaceChild方法用于将一个新的节点，替换当前节点的某一个子节点
* 它接受两个参数，第一个参数是用来替换的新节点
* 第二个参数将要被替换走的子节点。它返回被替换走的那个节点

>>> #### 示例：
```html
<body>
  <div id="foo">
    <p class="someClass">
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
  <div id="demo">4</div>
  <script>
    // 使用demo替换p_1st
    var p_1st = foo.querySelector('#foo .someClass');
    foo.replaceChild(demo, p_1st);
    // 使用demo替换foo
    // foo.parentNode.replaceChild(demo, foo);
  </script>
</body>
```

>> #### Element.prototype.setAttributeNode() 方法
>>> #### 说明：
* setAttributeNode() 方法向元素中添加指定的属性节点
* 如果这个指定的属性已存在，则此方法会替换它

>>> #### 示例：
```html
<body>
  <div id="foo">
    <p class="someClass">
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
  <div id="demo">4</div>
  <script>
    var newAttr = document.createAttribute("my_attr_key");
    newAttr.value = "my_attr_value";
    demo.setAttributeNode(newAttr);
  </script>
</body>
```

> ### 删除方法
>> #### Node.prototype.removeChild() 方法
>>> #### 说明：
* removeChild方法接受一个子节点作为参数，用于从当前节点移除该节点
* 它返回被移除的节点

>>> #### 示例：
```html
<body>
  <div id="foo">
    <p class="someClass">
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
  <script>
    foo.removeChild(foo.firstElementChild);
  </script>
</body>
```

>> #### Node.prototype.remove() 方法
>>> #### 说明：
* remove方法用于将当前节点从DOM树删除

>>> #### 示例：
```html
<body>
  <div id="foo">
    <p class="someClass">
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
  <script>
    foo.remove();
  </script>
</body>
```

> ### 外部方法
>> #### document.adoptNode() 方法
>>> #### 说明：
* adoptNode方法将某个节点，从其原来所在的文档移除，插入当前文档，并返回插入后的新节点

>>> #### 示例：
```html
/* 暂无示例 */
```
```javascript
// 暂无示例
```

>> #### document.importNode() 方法
>>> #### 说明：
* importNode方法用于创造一个外部节点的拷贝，然后插入当前文档
* 它的第一个参数是外部节点
* 第二个参数是一个布尔值，表示对外部节点是深拷贝还是浅拷贝，默认是浅拷贝（false）
* 虽然第二个参数是可选的，但是建议总是保留这个参数，并设为true

>>> #### 示例：
```html
/* 暂无示例 */
```
```javascript
// 暂无示例
```

