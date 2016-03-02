# DOM 文本
文本是元素节点的内容
***

## 文本的属性
> ### data 属性
>> #### 说明：
* data属性等同于nodeValue属性，用来设置或读取Text节点的内容

>> #### 示例：
```javascript
// <div id="demo">4 <em>Hello World</em> 5</div>
console.log(demo.childNodes); // [text, em, text]
console.log(demo.firstChild.data); // "4 "
```

> ### wholeText 属性
>> #### 说明：
* wholeText属性将当前Text节点与毗邻的Text节点，作为一个整体返回

>> #### 示例：
```javascript
// <div id="demo">4 <em>Hello World</em> 5</div>
console.log(demo.firstChild.wholeText); // "4 "
console.log(demo.firstChild.data); // "4 "
demo.childNodes[1].remove();
console.log(demo.firstChild.wholeText); // "4  5"
console.log(demo.firstChild.data); // "4"
```

> ### length 属性
>> #### 说明：
* length属性返回当前Text节点的文本长度

>> #### 示例：
```javascript
// <div id="demo">4 <em>Hello World</em> 5</div>
console.log(demo.firstChild.length); 2
```

## 文本的方法
> ### text.appendData() 方法
>> #### 说明：
* appendData方法用于在Text节点尾部追加字符串

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
<div id="demo">4 <em>Hello World</em> 5</div>
```
```javascript
var emText = demo.childNodes[1].firstChild;
emText.appendData('test'); "Hello Worldtest"
```

> ### text.insertData() 方法
>> #### 说明：
* insertData方法用于在Text节点插入字符串
* 第一个参数为插入位置
* 第二个参数为插入的子字符串

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
<div id="demo">4 <em>Hello World</em> 5</div>
```
```javascript
var emText = demo.childNodes[1].firstChild;
emText.insertData(0, 'test'); // "testHello World"
emText.insertData(1, 'test'); // "Htestello World"
```

> ### text.deleteData() 方法
>> #### 说明：
* deleteData方法用于删除Text节点内部的子字符串
* 第一个参数为子字符串位置
* 第二个参数为子字符串长度

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
<div id="demo">4 <em>Hello World</em> 5</div>
```
```javascript
var emText = demo.childNodes[1].firstChild;
emText.deleteData(1, 5); // "HWorld"
```

> ### text.replaceData() 方法
>> #### 说明：
* replaceData方法用于替换文本
* 第一个参数为替换开始位置
* 第二个参数为需要被替换掉的长
* 第三个参数为新加入的字符串

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
<div id="demo">4 <em>Hello World</em> 5</div>
```
```javascript
var emText = demo.childNodes[1].firstChild;
emText.replaceData(6, 5, 'JavaScript'); // "Hello JavaScript"
```

> ### text.subStringData() 方法
>> #### 说明：
* subStringData方法用于获取子字符串
* 第一个参数为子字符串在Text节点中的开始位置
* 第二个参数为子字符串长度

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
<div id="demo">4 <em>Hello World</em> 5</div>
```
```javascript
var emText = demo.childNodes[1].firstChild;
var subText = emText.substringData(1, 5);
console.log(subText); // "ello "
console.log(emText); // "Hello World"
```

> ### text.splitText() 方法
>> #### 说明：
* splitText方法将Text节点一分为二，变成两个毗邻的Text节点
* 它的参数就是分割位置（从零开始），分割到该位置的字符前结束
* 如果分割位置不存在，将报错
* 分割后，该方法返回分割位置后方的字符串，而原Text节点变成只包含分割位置前方的字符串

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
<div id="demo">4 <em>Hello World</em> 5</div>
```
```javascript
var emText = demo.childNodes[1].firstChild;
var newText = emText.splitText(3);
console.log(newText); // "lo World"
console.log(emText); // "Hel"
```

> ### text.normalize() 方法
>> #### 说明：
* normalize方法可以将毗邻的两个Text节点合并

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
<div id="demo">4 <em>Hello World</em> 5</div>
```
```javascript
console.log(demo.firstChild.wholeText); // "4 "
console.log(demo.firstChild.data); // "4 "
demo.childNodes[1].remove();
console.log(demo.firstChild.wholeText); // "4  5"
console.log(demo.firstChild.data); // "4"
demo.normalize();
console.log(demo.firstChild.data); // "4  5"
```

## 类库 jQuery - 元素内容
> ### $('#foo').text()
>> #### 说明：
* text() 方法设置或返回被选元素的文本内容

>> #### 示例：
```html
<body>
  <div id="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 取值
    var val = $('#foo').text();
    console.log(val); // hello world
    // 赋值
    $('#foo').text('hello javascript');
  </script>
</body>
```
