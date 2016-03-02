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
  * 获取上一个平级节点：Node.prototype.previousSibling
  * 获取上一个平级元素：Node.prototype.previousElementSibling
  * 获取下一个平级节点：Node.prototype.nextSibling
  * 获取下一个平级元素：Node.prototype.nextElementSibling
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
```html
<body>
  <div id="divA">This is <span>some</span> text</div>
  <script>
    var content = document.getElementById("divA").textContent;
    console.log(content); // This is some text
    document.getElementById("divA").textContent = '<p>GoodBye!</p>'; // <p>GoodBye!</p>
  </script>
</body>
```

> ### 父级属性
>> #### ownerDocument 属性
>>> #### 说明：
* ownerDocument属性返回当前节点所在的顶层文档对象，即document对象
* document对象本身的ownerDocument属性，返回null

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
    /* 获取ID为foo的DIV元素节点的三种常用方法 */
    /* 1 */
    var div_1st = foo;
    console.log(div_1st); // [object HTMLDivElement]
    /* 2 */
    var div_2nd = document.getElementById("foo");
    console.log(div_2nd); // [object HTMLDivElement]
    /* 3 */
    var div_3rd = document.querySelector("#foo");
    console.log(div_3rd); // [object HTMLDivElement]
    /* ownerDocument 属性示例 */
    console.log(foo.ownerDocument); // [object HTMLDocument]
  </script>
</body>
```

>> #### parentNode 属性
>>> #### 说明：
* parentNode属性返回当前节点的父节点
* 对于一个节点来说，它的父节点只可能是三种类型：document节点、element节点、documentfragment节点
* 如果当前节点没有父节点，则返回null

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
    /* parentNode 属性示例 */
    var p_1st = foo.firstElementChild;
    console.log(p_1st.parentNode); // [object HTMLDivElement]
  </script>
</body>
```

>> #### parentElement 属性
>>> #### 说明：
* parentElement属性返回当前节点的父Element节点
* 如果当前节点没有父节点，或者父节点类型不是Element节点，则返回null

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
    /* parentElement 属性示例 */
    var p_1st = foo.firstElementChild;
    console.log(p_1st.parentElement); // [object HTMLDivElement]
  </script>
</body>
```

> ### 平级属性
>> #### previousSibling 属性
>>> #### 说明：
* previoussibling属性返回当前节点前面的、距离最近的一个同级兄弟节点
* 如果当前节点前面没有同级节点，则返回null
* 该属性包括元素节点和文本节点

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
    /* previousSibling 属性示例 */
    var p_1st = foo.firstElementChild;
    var span_1st = p_1st.firstElementChild;
    console.log(span_1st.previousSibling); // [object Text]
  </script>
</body>
```

>> #### previousElementSibling 属性
>>> #### 说明：
* previousElementSibling属性返回指定元素的前一个同级元素
* 如果没有则返回null
* 该属性只包括元素节点

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
    /* previousElementSibling 属性示例 */
    var p_1st = foo.firstElementChild;
    var span_1st = p_1st.firstElementChild;
    console.log(span_1st.previousElementSibling); // null
  </script>
</body>
```

>> #### nextSibling 属性
>>> #### 说明：
* nextsibling属性返回紧跟在当前节点后面的第一个同级兄弟节点
* 如果当前节点后面没有同级节点，则返回null
* 该属性包括元素节点和文本节点

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
    /* nextSibling 属性示例 */
    var p_1st = foo.firstElementChild;
    var span_1st = p_1st.firstElementChild;
    console.log(span_1st.nextSibling); // [object Text]
  </script>
</body>
```

>> #### nextElementSibling 属性
>>> #### 说明：
* nextElementSibling属性返回指定元素的后一个同级元素
* 如果没有则返回null
* 该属性只包括元素节点

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
    /* nextElementSibling 属性示例 */
    var p_1st = foo.firstElementChild;
    var span_1st = p_1st.firstElementChild;
    console.log(span_1st.nextElementSibling); // [object HTMLSpanElement]
  </script>
</body>
```

> ### 子级属性
>> #### childNodes 属性
>>> #### 说明：
* childNodes属性返回一个NodeList集合，成员包括当前节点的所有子节点
* 如果当前节点不包括任何子节点，则返回一个空的NodeList集合
* 由于NodeList对象是一个动态集合，一旦子节点发生变化，立刻会反映在返回结果之中
* 该属性包括元素节点和文本节点

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
    /* childNodes 属性示例 */
    console.log(foo.childNodes); // [object NodeList]{ 0: [object Text], 1: [object HTMLParagraphElement], 2: [object Text], 3: [object HTMLParagraphElement], 4: [object Text], 5: [object HTMLParagraphElement], 6: [object Text] }
  </script>
</body>
```

>> #### children 属性
>>> #### 说明：
* children属性返回一个类似数组的动态对象（实时反映变化）
* 如果当前元素没有子元素，则返回的对象包含零个成员
* 该属性包括当前元素节点的所有子元素

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
    /* children 属性示例 */
    console.log(foo.children); // [object HTMLCollection]{ 0: [object HTMLParagraphElement], 1: [object HTMLParagraphElement], 2: [object HTMLParagraphElement] }
  </script>
</body>
```

>> #### childElementCount 属性
>>> #### 说明：
* childElementCount属性返回当前元素节点包含的子元素节点的个数
* 该属性只包括元素节点

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
    /* childElementCount 属性示例 */
    console.log(foo.childElementCount); // 3
  </script>
</body>
```

>> #### firstChild 属性
>>> #### 说明：
* firstChild属性返回当前节点的第一个子节点
* 如果当前节点没有子节点，则返回null
* 该属性包括元素节点和文本节点

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
    /* firstChild 属性示例 */
    console.log(foo.firstChild); // [object Text]
  </script>
</body>
```

>> #### firstElementChild 属性
>>> #### 说明：
* firstElementChild属性返回第一个子元素
* 如果没有，则返回null
* 该属性只包括元素节点

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
    /* firstElementChild 属性示例 */
    console.log(foo.firstElementChild); // [object HTMLParagraphElement]
  </script>
</body>
```

>> #### lastChild 属性
>>> #### 说明：
* lastChild属性返回当前节点的最后一个子节点
* 如果当前节点没有子节点，则返回null
* 该属性包括元素节点和文本节点

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
    /* lastChild 属性示例 */
    console.log(foo.lastChild); // [object Text]
  </script>
</body>
```

>> #### lastElementChild 属性
>>> #### 说明：
* lastElementChild属性返回最后一个子元素
* 如果没有，则返回null
* 该属性只包括元素节点

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
    /* lastElementChild 属性示例 */
    console.log(foo.lastElementChild); // [object HTMLParagraphElement]
  </script>
</body>
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

## 类库 jQuery - 选择器
> ### $('selector')
>> #### 说明：
* 基础选择器 1
* 根据tag选择元素

>> #### 示例：
```html
<body>
  <div id="foo">  <!-- red -->
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
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('div').css('color', 'red');
  </script>
</body>
```

> ### $('.selector')
>> #### 说明：
* 基础选择器 2
* 根据class选择元素

>> #### 示例：
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
    <p class="someClass">  <!-- red -->
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('.someClass').css('color', 'red');
  </script>
</body>
```

> ### $('#selector')
>> #### 说明：
* 基础选择器 3
* 根据id选择元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
    <p>
      <span id="oneID">1</span>  <!-- red -->
      <span>2</span>
      <span>3</span>
    </p>
    <p class="someClass">
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#oneID').css('color', 'red');
  </script>
</body>
```

> ### $('selector1selector2')
>> #### 说明：
* 基础选择器 4
* 示例：$('.a.b')
* 两个选择器连在一起（中间没有空格），表示选中同时拥有这些选择条件的元素

>> #### 示例：
```html
<body>
  <p class="a">1111111111</p>
  <p class="a b">1111111111</p>  <!-- red -->
  <p class="b">1111111111</p>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script type="text/javascript">
    $('.a.b').css('color', 'red');
  </script>
</body>
```

> ### $('selector1, selector2')
>> #### 说明：
* 基础选择器 5
* 一次选择多个元素，参数通过逗号分隔开

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
    <p>
      <span id="oneID">1</span>  <!-- red -->
      <span>2</span>
      <span>3</span>
    </p>
    <p class="someClass">  <!-- red -->
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('.someClass, #oneID').css('color', 'red');
  </script>
</body>
```

> ### $('selector1 ~ selector2')
>> #### 说明：
* 基础选择器 6
* 向后选择符合条件的所有平级元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <h3>3</h3>
    <h2>2</h2>  <!-- no -->
    <h1>1</h1>  <!-- no -->
    <p>0</p>
    <h1>1</h1>  <!-- red -->
    <h2>2</h2>  <!-- red -->
    <h3>3</h3>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p ~ h1').css('color', 'red');
    $('p ~ h2').css('color', 'red');
  </script>
</body>
```

> ### $('selector1 + selector2')
>> #### 说明：
* 基础选择器 7
* 向后选择符合条件的相邻平级元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <h3>3</h3>
    <h2>2</h2>  <!-- no -->
    <h1>1</h1>  <!-- no -->
    <p>0</p>
    <h1>1</h1>  <!-- red -->
    <h2>2</h2>  <!-- no -->
    <h3>3</h3>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p + h1').css('color', 'red');
    $('p + h2').css('color', 'red');
  </script>
</body>
```

> ### $('selector1 selector2')
>> #### 说明：
* 基础选择器 8
* 选择符合条件的所有泛后代元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
    <p>
      <span id="oneID">1</span>  <!-- red -->
      <span>2</span>
      <span>3</span>
    </p>
    <p class="someClass">  <!-- red -->
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('div #oneID').css('color', 'red');
    $('div .someClass').css('color', 'red');
  </script>
</body>
```

> ### $('selector1 > selector2')
>> #### 说明：
* 基础选择器 9
* 选择符合条件的所有子级元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
    <p>
      <span id="oneID">1</span>  <!-- no -->
      <span>2</span>
      <span>3</span>
    </p>
    <p class="someClass">  <!-- red -->
      <span>1</span>
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('div > #oneID').css('color', 'red');
    $('div > .someClass').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr]')
>> #### 说明：
* 属性选择器 1
* 如果存在某元素，且该元素具有某属性，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr>1</span>  <!-- red -->
      <span>2</span>
      <span>3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr]').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr = "value"]')
>> #### 说明：
* 属性选择器 2
* 如果存在某元素，且该元素具有某属性，且该属性的值 等于 指定值，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="value">1</span>  <!-- red -->
      <span attr>2</span>  <!-- no -->
      <span>3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr = "value"]').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr != "value"]')
>> #### 说明：
* 属性选择器 3
* 如果存在某元素，且该元素具有某属性，且该属性的值 不等于 指定值，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="1">1</span>  <!-- no -->
      <span attr="2">2</span>  <!-- red -->
      <span attr>3</span>  <!-- red -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr != "1"]').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr $= "value"]')
>> #### 说明：
* 属性选择器 4
* 如果存在某元素，且该元素具有某属性，且该属性的值 等于 区分大小写的指定值，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a1">1</span>  <!-- red -->
      <span attr="A1">2</span>  <!-- no -->
      <span attr="a1234">3</span>  <!-- no -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr $= "a1"]').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr *= "value"]')
>> #### 说明：
* 属性选择器 5
* 如果存在某元素，且该元素具有某属性，且该属性的值 包含 指定值，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a1">1</span>  <!-- red -->
      <span attr="a2">2</span>  <!-- red -->
      <span attr="b1">3</span>  <!-- no -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr *= "a"]').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr ^= "value"]')
>> #### 说明：
* 属性选择器 6
* 如果存在某元素，且该元素具有某属性，且该属性的值的开头 等于 指定值，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a1">1</span>  <!-- red -->
      <span attr="a2">2</span>  <!-- red -->
      <span attr="1a">3</span>  <!-- no -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr ^= "a"]').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr |= "value"]')
>> #### 说明：
* 属性选择器 7
* 如果存在某元素，且该元素具有某属性，且该属性的值的前缀(在连字符-之前) 等于 指定值，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a-1">1</span>  <!-- red -->
      <span attr="a2">2</span>  <!-- no -->
      <span attr="1-a">3</span>  <!-- no -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr |= "a"]').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr ~= "value"]')
>> #### 说明：
* 属性选择器 8
* 如果存在某元素，且该元素具有某属性，且该属性的值 包含 用空格分隔的指定值，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a 1">1</span>  <!-- red -->
      <span attr="a-2">2</span>  <!-- no -->
      <span attr="b 1">3</span>  <!-- no -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr ~= "a"]').css('color', 'red');
  </script>
</body>
```

> ### $('selector[attr1][attr2]')
>> #### 说明：
* 属性选择器 9
* 如果存在某元素，且该元素符合第一个属性过滤器的条件，且该元素符合第二个属性过滤器的条件，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a 1">1</span>  <!-- red -->
      <span attr="a-2">2</span>  <!-- no -->
      <span attr="b 1">3</span>  <!-- no -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span[attr ~= "a"][attr *= "1"]').css('color', 'red');
  </script>
</body>
```

## 类库 jQuery - 过滤器
> ### $('selector:has()')
>> #### 说明：
* 条件过滤器 1
* 如果存在某父元素，且该父元素 包含 符合指定选择条件的后代元素，则选中该父元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>  <!-- red -->
      <span attr="a1">1</span>
      <span attr="a2">2</span>
      <span attr="a3">3</span>
    </p>
    <p>  <!-- no -->
      <span attr="b1">1</span>
      <span attr="b2">2</span>
      <span attr="b3">3</span>
    </p>
    <p>  <!-- no -->
      <span attr="c1">1</span>
      <span attr="c2">2</span>
      <span attr="c3">3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p:has("span[attr = \'a2\']")').css('color', 'red');
  </script>
</body>
```

> ### $('selector:not()')
>> #### 说明：
* 条件过滤器 2
* 如果存在某元素，且该元素不符合指定选择条件，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a1">1</span>  <!-- red -->
      <span attr="a2">2</span>  <!-- no -->
      <span attr="a3">3</span>  <!-- red -->
    </p>
    <p>
      <span attr="b1">1</span>  <!-- red -->
      <span attr="b2">2</span>  <!-- red -->
      <span attr="b3">3</span>  <!-- red -->
    </p>
    <p>
      <span attr="c1">1</span>  <!-- red -->
      <span attr="c2">2</span>  <!-- red -->
      <span attr="c3">3</span>  <!-- red -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:not("[attr = \'a2\']")').css('color', 'red');
  </script>
</body>
```

> ### $('selector:contains()')
>> #### 说明：
* 内容过滤器 1
* 如果存在某元素，且该元素 包含 不区分大小写的指定文本内容，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a1">1</span>
      <span attr="a2">2</span>  <!-- red -->
      <span attr="a3">3</span>
    </p>
    <p>
      <span attr="b1">1</span>
      <span attr="b2">2</span>  <!-- red -->
      <span attr="b3">3</span>
    </p>
    <p>
      <span attr="c1">1</span>
      <span attr="c2">2</span>  <!-- red -->
      <span attr="c3">3</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:contains(2)').css('color', 'red');
  </script>
</body>
```

> ### $('selector:parent')
>> #### 说明：
* 内容过滤器 2
* 如果存在某元素，该元素 包含 任何子元素或内容，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>  <!-- red -->
      <span attr="a1">1</span>
      <span attr="a2">2</span>
      <span attr="a3">3</span>
    </p>
    <p></p>
    <p></p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p:parent').css('color', 'red');
  </script>
</body>
```

> ### $('selector:empty')
>> #### 说明：
* 内容过滤器 3
* 如果存在某元素，且该元素 不包含 任何子元素或内容，则选中该元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span attr="a1">1</span>
      <span attr="a2">2</span>
      <span attr="a3">3</span>
    </p>
    <p></p>
    <p></p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p:empty').append('test');
  </script>
</body>
```

> ### $('selector:first')
>> #### 说明：
* 索引过滤器 1
* 如果存在多个符合选择条件的元素，则选中符合选择条件的第一个的元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>  <!-- red -->
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:first').css('color', 'red');
  </script>
</body>
```

> ### $('selector:last')
>> #### 说明：
* 索引过滤器 2
* 如果存在多个符合选择条件的元素，则选中符合选择条件的最后一个的元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>  <!-- red -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:last').css('color', 'red');
  </script>
</body>
```

> ### $('selector:eq(index)')
>> #### 说明：
* 索引过滤器 3
* 如果存在多个符合选择条件的元素，则选中符合选择条件的索引值(从0计数) 等于 index的元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>  <!-- red -->
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:eq(4)').css('color', 'red');
  </script>
</body>
```

> ### $('selector:gt(index)')
>> #### 说明：
* 索引过滤器 4
* 如果存在多个符合选择条件的元素，则选中符合选择条件的索引值(从0计数) 大于且不等于 index的元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>  <!-- red -->
    </p>
    <p>
      <span>6</span>  <!-- red -->
      <span>7</span>  <!-- red -->
      <span>8</span>  <!-- red -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:gt(4)').css('color', 'red');
  </script>
</body>
```

> ### $('selector:lt(index)')
>> #### 说明：
* 索引过滤器 5
* 如果存在多个符合选择条件的元素，则选中符合选择条件的索引值(从0计数) 小于且不等于 index的元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>  <!-- red -->
      <span>1</span>  <!-- red -->
      <span>2</span>  <!-- red -->
    </p>
    <p>
      <span>3</span>  <!-- red -->
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:lt(4)').css('color', 'red');
  </script>
</body>
```

> ### $('selector:even')
>> #### 说明：
* 索引过滤器 6
* 如果存在多个符合选择条件的元素，则选中符合选择条件的索引值(从0计数) 等于 偶数(包括0)的元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>  <!-- red -->
      <span>1</span>
      <span>2</span>  <!-- red -->
    </p>
    <p>
      <span>3</span>
      <span>4</span>  <!-- red -->
      <span>5</span>
    </p>
    <p>
      <span>6</span>  <!-- red -->
      <span>7</span>
      <span>8</span>  <!-- red -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:even').css('color', 'red');
  </script>
</body>
```

> ### $('selector:odd')
>> #### 说明：
* 索引过滤器 7
* 如果存在多个符合选择条件的元素，则选中符合选择条件的索引值(从0计数) 等于 奇数(不包括0)的元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>
      <span>1</span>  <!-- red -->
      <span>2</span>
    </p>
    <p>
      <span>3</span>  <!-- red -->
      <span>4</span>
      <span>5</span>  <!-- red -->
    </p>
    <p>
      <span>6</span>
      <span>7</span>  <!-- red -->
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span:odd').css('color', 'red');
  </script>
</body>
```

> ### $('parent child:first-of-type')
>> #### 说明：
* 层级过滤器 1
* 如果存在多个符合选择条件的父元素，且每个父元素存在多个符合选择条件的子元素，则选中每个符合选择条件父元素的第一个符合条件子元素
* 相同用法：`$('parent child:first-child')`

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>  <!-- red -->
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>  <!-- red -->
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>  <!-- red -->
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p span:first-of-type').css('color', 'red');
  </script>
</body>
```

> ### $('parent child:last-of-type')
>> #### 说明：
* 层级过滤器 2
* 如果存在多个符合选择条件的父元素，且每个父元素存在多个符合选择条件的子元素，则选中每个符合选择条件父元素的最后一个符合条件子元素
* 相同用法：`$('parent child:last-child')`

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>  <!-- red -->
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>  <!-- red -->
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>  <!-- red -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p span:last-of-type').css('color', 'red');
  </script>
</body>
```

> ### $('parent child:nth-of-type(n)')
>> #### 说明：
* 层级过滤器 3
* 如果存在多个符合选择条件的父元素，且每个父元素存在多个符合选择条件的子元素，则选中每个符合选择条件父元素的第n个(从1计数)符合条件子元素
* 相同用法：`$('parent child:nth-child(n)')`

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>  <!-- red -->
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>  <!-- red -->
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>  <!-- red -->
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p span:nth-of-type(1)').css('color', 'red');
  </script>
</body>
```

> ### $('parent child:nth-last-of-type(n)')
>> #### 说明：
* 层级过滤器 4
* 如果存在多个符合选择条件的父元素，且每个父元素存在多个符合选择条件的子元素，则选中每个符合选择条件父元素的倒数第n个(从1计数)符合条件子元素
* 相同用法：`$('parent child:nth-last-child(n)')`

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>  <!-- red -->
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>  <!-- red -->
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>  <!-- red -->
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p span:nth-last-of-type(1)').css('color', 'red');
  </script>
</body>
```

> ### $('parent child:only-of-type')
>> #### 说明：
* 层级过滤器 5
* 如果存在多个符合选择条件的父元素，且每个父元素存在多个符合选择条件的子元素，则选中每个符合选择条件父元素的唯一符合条件子元素
* 相同用法：`$('parent child:only-child')`

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>  <!-- red -->
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p span:only-of-type').css('color', 'red');
  </script>
</body>
```

> ### $('selector:focus')
>> #### 说明：
* 状态过滤器 1
* 如果存在某元素，且该元素为 获得焦点 状态，则选中所有标的元素

>> #### 示例：
```html
<body>
  <input type="text" id="1">
  <input type="text" id="2">
  <input type="text" id="3">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $("input:text").bind('click', function() {
      var id = $('input:text:focus').attr('id');
      console.log(id);
    });
  </script>
</body>
```

> ### $('selector:hidden')
>> #### 说明：
* 状态过滤器 2
* 如果存在某元素，且该元素为 隐藏 状态，则选中所有标的元素

>> #### 示例：
```html
<body>
  <input type="text" id="1">
  <input type="text" id="2">
  <input type="text" id="3">
  <input type="hidden" value="4">  <!-- show 4 -->
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('input:hidden').attr('type', 'text');
  </script>
</body>
```

> ### $('selector:visible')
>> #### 说明：
* 状态过滤器 3
* 如果存在某元素，且该元素为 可视 状态，则选中所有标的元素

>> #### 示例：
```html
<body>
  <input type="text" id="1">  <!-- test -->
  <input type="text" id="2">  <!-- test -->
  <input type="text" id="3">  <!-- test -->
  <input type="hidden" value="4">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('input:visible').attr('value', 'test');
  </script>
</body>
```

> ### $('selector:disabled')
>> #### 说明：
* 状态过滤器 4
* 如果存在某元素，且该元素为 禁用 状态，则选中所有标的元素

>> #### 示例：
```html
<body>
  <input type="text" id="1">
  <input type="text" id="2" disabled>  <!-- test -->
  <input type="text" id="3">
  <input type="hidden" value="4">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('input:disabled').attr('value', 'test');
  </script>
</body>
```

> ### $('selector:enabled')
>> #### 说明：
* 状态过滤器 5
* 如果存在某元素，且该元素为 启用 状态，则选中所有标的元素

>> #### 示例：
```html
<body>
  <input type="text" id="1">  <!-- test -->
  <input type="text" id="2" disabled>
  <input type="text" id="3">  <!-- test -->
  <input type="hidden" value="4">  <!-- test -->
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('input:enabled').attr('value', 'test');
  </script>
</body>
```

> ### $('selector:checked')
>> #### 说明：
* 状态过滤器 6
* 如果存在某元素，且该元素为 已选 状态，则选中所有标的元素

>> #### 示例：
```html
<body>
  <input type="radio" name="sex" value="male" checked> Male
  <input type="radio" name="sex" value="female"> Female
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    console.log($('input:checked').val()); // male
  </script>
</body>
```

> ### $('selector:target')
>> #### 说明：
* 状态过滤器 7
* 如果存在某元素，且该元素为 hash匹配 状态，则选中所有标的元素

>> #### 示例：
```html
<body>
  <div id="target1">target1</div>
  <div id="target2">target2</div>
  <div id="target3">target3</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 如果当前文档的URI为 index.html#target2，则选中 div#target2
    // 在Chrome中，使用$(document).ready()仍然无法获取到匹配的元素，必须使用$(window).load()来获取
    $(window).load(function(){
        $(':target').css('color', 'red');
    });
  </script>
</body>
```

> ### $('selector:animated')
>> #### 说明：
* 状态过滤器 8
* 如果存在某元素，且该元素为 动画 状态，则选中所有标的元素

>> #### 示例：
```html
<body>
  <style>
    #box1, #box2 {
      height:40px;
      width:100px;
      background: red;
    }
  </style>
  <div id="box1"></div>
  <br/>
  <div id="box2"></div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $(document).ready(function(){
      function aniDiv1(){
        $("#box1").animate({width:300}, "slow");
        $("#box1").animate({width:100}, "slow", aniDiv1);
      }
      aniDiv1();
      $(":root").click(function(){
        $(":animated").css('background-color', 'blue');
      });
    });
  </script>
</body>
```

## 类库 jQuery - 探测方法
> ### $('selector').parent()
>> #### 说明：
* 父级探测方法 1
* 如果存在某元素，从该元素起向上探测，且该元素 拥有 符合指定选择条件的父元素，则选中所有标的父元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>  <!-- red -->
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>  <!-- red -->
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>  <!-- red -->
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span').parent().css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').parents()
>> #### 说明：
* 父级探测方法 2
* 如果存在某元素，从本元素向上探测，且该元素 拥有 符合指定选择条件的祖先元素，则选中所有标的祖先元素

>> #### 示例：
```html
<body>
  <div id="foo">  <!-- red -->
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span').parents('div').css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').parentsUntil()
>> #### 说明：
* 父级探测方法 3
* 如果存在某元素，从本元素向上探测，到制定选择条件的祖先元素为止，且该元素 拥有 祖先元素，则选中所有标的祖先元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>  <!-- red -->
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>  <!-- red -->
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>  <!-- red -->
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span').parentsUntil('div').css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').offsetParent()
>> #### 说明：
* 父级探测方法 4
* 如果存在某元素，从本元素向上探测，且该元素 拥有 符合指定选择条件的祖先元素，且祖先元素带有position属性，则选中所有标的祖先元素

>> #### 示例：
```html
<style>
  #foo {
    position: relative;
    top:100px;
  }
</style>
<body>
  <div id="foo">  <!-- red -->
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span').offsetParent().css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').closest()
>> #### 说明：
* 父级探测方法 5
* 如果存在某元素，从本元素起向上探测，且该元素 拥有 符合指定选择条件的祖先元素或本元素，则选中所有标的祖先元素或本元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>  <!-- red -->
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>  <!-- red -->
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>  <!-- red -->
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('span').closest('p').css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').siblings()
>> #### 说明：
* 平级探测方法 1
* 如果存在某元素，从本元素起平行探测，且该元素 拥有 符合指定选择条件的兄弟元素，则选中所有标的兄弟元素

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span id="foo">0</span>
      <span>1</span>  <!-- red -->
      <span>2</span>  <!-- red -->
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').siblings().css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').next()
>> #### 说明：
* 平级探测方法 2
* 如果存在某元素，从本元素起平行探测，且该元素 拥有 符合指定选择条件的兄弟元素，则选中下一个标的兄弟元素

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span id="foo">0</span>
      <span>1</span>  <!-- red -->
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').next().css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').nextAll()
>> #### 说明：
* 平级探测方法 3
* 如果存在某元素，从本元素起平行探测，且该元素 拥有 符合指定选择条件的兄弟元素，则选中后面所有标的兄弟元素

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span id="foo">0</span>
      <span>1</span>  <!-- red -->
      <span>2</span>  <!-- red -->
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').nextAll().css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').nextUntil()
>> #### 说明：
* 平级探测方法 4
* 如果存在某元素，从本元素起平行探测，到指定选择条件的兄弟元素为止，且该元素 拥有 符合指定选择条件的兄弟元素，则选中后面所有标的兄弟元素

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span id="foo0">0</span>
      <span>1</span>
      <span>2</span>
      <span id="foo3">3</span>  <!-- red -->
      <span>4</span>
      <span id="foo5">5</span>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo0').nextUntil('#foo5', '#foo3').css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').prev()
>> #### 说明：
* 平级探测方法 5
* 如果存在某元素，从本元素起平行探测，且该元素 拥有 符合指定选择条件的兄弟元素，则选中上一个标的兄弟元素

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span>0</span>
      <span>1</span>  <!-- red -->
      <span id="foo">2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').prev().css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').prevAll()
>> #### 说明：
* 平级探测方法 6
* 如果存在某元素，从本元素起平行探测，且该元素 拥有 符合指定选择条件的兄弟元素，则选中前面所有标的兄弟元素

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span>0</span>  <!-- red -->
      <span>1</span>  <!-- red -->
      <span id="foo">2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').prevAll().css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').prevUntil()
>> #### 说明：
* 平级探测方法 7
* 如果存在某元素，从本元素起平行探测，到指定选择条件的兄弟元素为止，且该元素 拥有 符合指定选择条件的兄弟元素，则选中前面所有标的兄弟元素

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span id="foo0">0</span>
      <span>1</span>
      <span>2</span>
      <span id="foo3">3</span>  <!-- red -->
      <span>4</span>
      <span id="foo5">5</span>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo5').prevUntil('#foo0', '#foo3').css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').children()
>> #### 说明：
* 子级探测方法 1
* 如果存在某元素，从本元素起向下探测，且该元素 拥有 符合指定选择条件的子元素，则选中所有标的子元素

>> #### 示例：
```html
<body>
  <div id="foo">
    <p>
      <span>0</span>  <!-- red -->
      <span>1</span>  <!-- red -->
      <span>2</span>  <!-- red -->
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo p:first').children().css('background-color', 'red');
  </script>
</body>
```

> ### $('selector').find()
>> #### 说明：
* 子级探测方法 2
* 如果存在某元素，从本元素起向下探测，且该元素 拥有 符合指定选择条件的后代元素，则选中所有标的后代元素

>> #### 示例：
```html
<body>
  <div id="foo1">
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span id="foo2">6</span>  <!-- red -->
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo1').find('#foo2').css('background-color', 'red');
  </script>
</body>
```

## 类库 jQuery - 集合方法
> ### $('selector').add()
>> #### 说明：
* 集合方法 1
* 如果存在某元素集合，且存在另一个元素集合，则将两个元素集合合并成新的元素集合

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span>0</span>
      <span id="foo1">1</span>  <!-- red bg:yellow -->
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span id="foo2">6</span>  <!-- bg:yellow -->
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo1').css('color', 'red').add('#foo2').css('background-color', 'yellow');
  </script>
</body>
```

> ### $('selector').addBack()
>> #### 说明：
* 集合方法 2
* 如果存在某元素集合，且存在上一个元素集合，则将两个元素集合合并成新的元素集合

>> #### 示例：
```html
<body>
  <div>
    <p>  <!-- bg:yellow -->
      <span>0</span>
      <span id="foo1">1</span>  <!-- red -->
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p:first').find('#foo1').css('color', 'red').addBack().css('background-color', 'yellow');
  </script>
</body>
```

> ### $('selector').end()
>> #### 说明：
* 集合方法 3
* 如果存在某元素集合，且存在上一个元素集合，则将当前元素集合还原回退为上一个元素集合

>> #### 示例：
```html
<body>
  <div>
    <p>  <!-- red bg:yellow -->
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>  <!-- red -->
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('p:first').add('p:last').css('color', 'red').end().css('background-color', 'yellow');
  </script>
</body>
```

## 类库 jQuery - 遍历方法
> ### $('selector').each()
>> #### 说明：
* 遍历方法 1
* 如果存在某元素集合，则遍历每一个符合选择指定选择条件的元素
* each() 方法主要用于遍历jQuery对象
* each() 方法返回的是原来的数组，并不会新创建一个数组

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    var test = [];
    $('div p:eq(1) span').each(function(){
      test.push($(this).text());
    });
    console.log(test); // ["3", "4", "5"]
  </script>
</body>
```

> ### $('selector').map()
>> #### 说明：
* 遍历方法 2
* 如果存在某元素集合，则遍历每一个符合选择指定选择条件的元素
* map() 方法主要用于遍历JS原生数组或对象
* map() 方法会返回一个新的数组
* 如果在没有必要的情况下使用map，则有可能造成内存浪费

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span>0</span>
      <span>1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    var test = $('div p:eq(1) span').map(function(){
              return $(this).text();
            }).get().join(", ");
    console.log(test); // "3, 4, 5"
  </script>
</body>
```

## 类库 jQuery - 判定方法
> ### $('selector').is()
>> #### 说明：
* 判定方法 1
* is() 方法根据指定选择条件判定某元素是否匹配
* is() 方法返回一个布尔值

>> #### 示例：
```html
<body>
  <div>
    <p>
      <span>0</span>
      <span id="foo1">1</span>
      <span>2</span>
    </p>
    <p>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </p>
    <p>
      <span>6</span>
      <span>7</span>
      <span>8</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    var status = $('div p:first span:eq(2)').is('#foo1');
    console.log(status); // "true"
  </script>
</body>
```

## 类库 jQuery - 索引方法（不推荐）
> ### $('selector').first()
>> #### 说明：
* 索引方法 1
* 1

>> #### 示例：
```html
1
```

> ### $('selector').last()
>> #### 说明：
* 索引方法 2
* 1

>> #### 示例：
```html
1
```

> ### $('selector').eq()
>> #### 说明：
* 索引方法 3
* 1

>> #### 示例：
```html
1
```

> ### $('selector').slice()
>> #### 说明：
* 索引方法 4
* 1

>> #### 示例：
```html
1
```
