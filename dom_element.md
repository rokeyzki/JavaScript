# DOM 元素
元素节点主要是对元素属性的操作
***

## 元素的属性
> ### attributes 属性
>> #### 说明：
* attributes属性返回一个类似数组的对象，成员是当前元素节点的所有属性节点，每个数字索引对应一个属性节点对象
* 返回值中，所有成员都是动态的，即属性的变化会实时反映在结果集

>> #### 示例：
```javascript
// <p id="foo" class="haha"></p>
foo.attributes; // {0: id, 1: class, length: 2}
```

> ### id 属性
>> #### 说明：
* id属性返回指定元素的id标识
* 该属性可读写

>> #### 示例：
```javascript
// <p id="foo" class="haha"></p>
foo.id; // foo
```

> ### tagName 属性
>> #### 说明：
* tagName属性返回指定元素的大写的标签名
* 与nodeName属性的值相等

>> #### 示例：
```javascript
// <p id="foo" class="haha"></p>
foo.tagName // P
```

> ### className 属性
>> #### 说明：
* className属性用来读取和设置当前元素的class属性
* 它的值是一个字符串，每个class之间用空格分割

>> #### 示例：
```javascript
// <p id="foo" class="haha1 haha2"></p>
foo.className // haha1 haha2
```

> ### classList 属性
>> #### 说明：
* classList属性则返回一个类似数组的对象
* 当前元素节点的每个class就是这个对象的一个成员

>> #### 示例：
```javascript
// <p id="foo" class="haha1 haha2"></p>
foo.classList // ["haha1", "haha2"]
```

> ### innerHTML 属性
>> #### 说明：
* innerHTML属性返回该元素包含的HTML代码
* 该属性可读写，常用来设置某个节点的内容
* 如果文本节点中包含&、小于号（<）和大于号（%gt;），innerHTML属性会将它们转为实体形式&amp、&lt、&gt
* 但是，innerHTML还是有安全风险的，因此为了安全考虑，如果插入的是文本，最好用textContent属性代替innerHTML

>> #### 示例：
```javascript
// HTML代码: <div id="demo">4 <em>Hello World</em> 5</div>
console.log(demo.innerHTML); // 4 <em>Hello World</em> 5
```

> ### outerHTML 属性
>> #### 说明：
* outerHTML属性返回一个字符串，内容为指定元素的所有HTML代码，包括它自身和包含的所有子元素
* outerHTML属性是可读写的，对它进行赋值，等于替换掉当前元素
* 如果指定元素没有父节点，对它的outerTHML属性重新赋值，会抛出一个错误

>> #### 示例：
```javascript
// HTML代码: <div id="demo">4 <em>Hello World</em> 5</div>
console.log(demo.outerHTML); // <div id="demo">4 <em>Hello World</em> 5</div>
// 如果指定元素没有父节点，对它的outerTHML属性重新赋值，会抛出一个错误
document.documentElement.outerHTML = "test";  // DOMException
```

## 元素的方法
> ### element.hasAttribute() 方法
>> #### 说明：
* hasAttribute方法返回一个布尔值，表示当前元素节点是否包含指定的HTML属性

>> #### 示例：
```html
<div id="foo">
    <p class="someClass">
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p name="someName">
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
```
```javascript
console.log(foo.hasAttribute("class")); // false
console.log(foo.hasAttribute("id")); // true
```

> ### element.getAttribute() 方法
>> #### 说明：
* getAttribute方法返回当前元素节点的指定属性
* 如果指定属性不存在，则返回null

>> #### 示例：
```html
<div id="foo">
    <p class="someClass">
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p name="someName">
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
```
```javascript
console.log(foo.getAttribute("id")); // foo
```

> ### element.removeAttribute() 方法
>> #### 说明：
* removeAttribute方法用于从当前元素节点移除属性

>> #### 示例：
```html
<div id="foo">
    <p class="someClass">
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p name="someName">
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
```
```javascript
foo.removeAttribute("id");
```

> ### element.setAttribute() 方法
>> #### 说明：
* setAttribute方法用于为当前元素节点新增属性，或编辑已存在的属性
* 该方法会将所有属性名，都当作小写处理
* 对于那些已存在的属性，该方法是编辑操作，否则就会新建属性
* 大多数情况下，直接对属性赋值比使用该方法更好。

>> #### 示例：
```html
<div id="foo">
    <p class="someClass">
        <span>1</span>
        <span>2</span>
        <span>3</span>
    </p>
    <p name="someName">
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
```
```javascript
foo.setAttribute("class", "foo");
// or
foo.className = "foo";
```

> ### classList 属性的系列方法
>> #### 说明：
* add()：增加一个class
* remove()：移除一个class
* contains()：检查当前元素是否包含某个class
* toggle()：将某个class移入或移出当前元素
* item()：返回指定索引位置的class
* toString()：将class的列表转为字符串

>> #### 示例：
```javascript
myDiv.classList.add('myCssClass');
myDiv.classList.add('foo', 'bar');
myDiv.classList.remove('myCssClass');
myDiv.classList.toggle('myCssClass'); // 如果myCssClass不存在就加入，否则移除
myDiv.classList.contains('myCssClass'); // 返回 true 或者 false
myDiv.classList.item(0); // 返回第一个Class
myDiv.classList.toString();
```
