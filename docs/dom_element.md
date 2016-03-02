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

## 类库 jQuery - 元素属性
> ### $('#foo').html()
>> #### 说明：
* html() 方法返回或设置被选元素的内容

>> #### 示例：
```html
<body>
  <div id="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').html(); // 'hello world'
    $('#foo').html('<p>hello javascript</p>');
  </script>
</body>
```

> ### $('#foo').clone()
>> #### 说明：
* clone() 方法生成被选元素的副本，包含子节点、文本和属性

>> #### 示例：
```html
<body>
  <div id="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    var clone = $('#foo').clone();
    $('#foo').after(clone);
  </script>
</body>
```

> ### $('#foo').empty()
>> #### 说明：
* empty() 方法从被选元素移除所有内容，包括所有文本和子节点

>> #### 示例：
```html
<body>
  <div id="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').empty();
  </script>
</body>
```

> ### $('#foo').remove()
>> #### 说明：
* remove() 方法移除被选元素，包括所有文本和子节点
* 该方法不会把匹配的元素从 jQuery 对象中删除，因而可以在将来再使用这些匹配的元素
* 但除了这个元素本身得以保留之外，remove() 不会保留元素的 jQuery 数据（其他的比如绑定的事件、附加的数据等都会被移除，这一点与 detach() 不同）

>> #### 示例：
```html
<body>
  <div id="sign1" style="color: red">
    <div id="foo">hello world</div>
  </div>
  <div id="sign2" style="color: blue"></div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 绑定点击事件，使用remove方法后，绑定的事件将无效
    $('#foo').bind('click', function(){
      console.log($(this).html());
    });
    // 从sign1中移除又恢复元素到sign2
    var foo = $('#foo').remove();
    $('#sign2').append(foo);
  </script>
</body>
```

> ### $('#foo').detach()
>> #### 说明：
* detach() 方法移除被选元素，包括所有文本和子节点
* 这个方法会保留 jQuery 对象中的匹配的元素，因而可以在将来再使用这些匹配的元素
* detach() 会保留所有绑定的事件、附加的数据，这一点与 remove() 不同

>> #### 示例：
```html
<body>
  <div id="sign1" style="color: red">
    <div id="foo">hello world</div>
  </div>
  <div id="sign2" style="color: blue"></div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 绑定点击事件，使用detach方法后，绑定的事件依然有效
    $('#foo').bind('click', function(){
      console.log($(this).html());
    });
    // 从sign1中移除又恢复元素到sign2
    var foo = $('#foo').detach();
    $('#sign2').append(foo);
  </script>
</body>
```

> ### $('#foo').attr()
>> #### 说明：
* attr() 方法设置或返回被选元素的属性值

>> #### 示例：
```html
<body>
  <div id="foo" style="color: red">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 取属性值
    var attr = $('#foo').attr('style');
    console.log(attr); // color: red
    // 赋属性值
    $('#foo').attr('style', 'color: blue');
  </script>
</body>
```

> ### $('#foo').removeAttr()
>> #### 说明：
* removeAttr() 方法从被选元素中移除属性

>> #### 示例：
```html
<body>
  <div id="foo" style="color: red">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').removeAttr('style');
  </script>
</body>
```

> ### $('#foo').hasClass()
>> #### 说明：
* hasClass() 方法检查被选元素是否包含指定的 class

>> #### 示例：
```html
<body>
  <style>
    .test {
      color: red;
    }
  </style>
  <div id="foo" class="test">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    var status = $('#foo').hasClass('test');
    console.log(status); // true
  </script>
</body>
```

> ### $('#foo').addClass()
>> #### 说明：
* addClass() 方法向被选元素添加一个或多个类
* 如需添加多个类，请使用空格分隔类名

>> #### 示例：
```html
<body>
  <style>
    .test {
      color: red;
    }
  </style>
  <div id="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').addClass('test');
  </script>
</body>
```

> ### $('#foo').removeClass()
>> #### 说明：
* removeClass() 方法从被选元素移除一个或多个类
* 如需移除若干类，请使用空格来分隔类名
* 如果没有规定参数，则该方法将从被选元素中删除所有类

>> #### 示例：
```html
<body>
  <style>
    .test {
      color: red;
    }
  </style>
  <div id="foo" class="test">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').removeClass('test');
  </script>
</body>
```

> ### $('#foo').toggleClass()
>> #### 说明：
* toggleClass() 对设置或移除被选元素的一个或多个类进行切换

>> #### 示例：
```html
<body>
  <style>
    .test {
      color: red;
    }
  </style>
  <div id="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').bind('click', function(){
      $('#foo').toggleClass('test');
    });
  </script>
</body>
```

> ### $('#foo').after()
>> #### 说明：
* after() 方法在被选元素外部后插入指定的内容
* 不推荐：`$('html').insertAfter('#foo')`

>> #### 示例：
```html
<body>
  <div id="foo">hello</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').after('<span> world</span>');
  </script>
</body>
```

> ### $('#foo').before()
>> #### 说明：
* before() 方法在被选元素外部前插入指定的内容
* 不推荐：`$('html').insertBefore('#foo')`

>> #### 示例：
```html
<body>
  <div id="foo">world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').before('<span>hello </span>');
  </script>
</body>
```

> ### $('#foo').append()
>> #### 说明：
* append() 方法在被选元素内部后插入指定的内容
* 不推荐：`$('html').appendTo('#foo')`

>> #### 示例：
```html
<body>
  <div id="foo">hello</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').append('<span> world</span>');
  </script>
</body>
```

> ### $('#foo').prepend()
>> #### 说明：
* prepend() 方法在被选元素内部前插入指定的内容
* 不推荐：`$('html').prependTo('#foo')`

>> #### 示例：
```html
<body>
  <div id="foo">world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').prepend('<span>hello </span>');
  </script>
</body>
```

> ### $('#foo').replaceWith()
>> #### 说明：
* replaceWith() 方法用指定的 HTML 内容或元素替换被选元素
* 不推荐：`$('html').replaceAll('#foo')`

>> #### 示例：
```html
<body>
  <div id="foo">world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').prepend('<span>hello </span>');
  </script>
</body>
```

> ### $('#foo').wrap()
>> #### 说明：
* wrap() 方法把每个被选元素放置在指定的 HTML 内容或元素中

>> #### 示例：
```html
<body>
  <div class="foo">hello world</div>
  <div class="foo">hello world</div>
  <div class="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('.foo').wrap('<div id="parent" style="color:red"></div>');
  </script>
</body>
```

> ### $('#foo').wrapAll()
>> #### 说明：
* wrapAll() 在指定的 HTML 内容或元素中放置所有被选的元素

>> #### 示例：
```html
<body>
  <div class="foo">hello world</div>
  <div class="foo">hello world</div>
  <div class="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('.foo').wrapAll('<div id="parent" style="color:red"></div>');
  </script>
</body>
```


> ### $('#foo').wrapInner()
>> #### 说明：
* wrapInner() 方法使用指定的 HTML 内容或元素，来包裹每个被选元素中的所有内容

>> #### 示例：
```html
<body>
  <div class="foo">hello world</div>
  <div class="foo">hello world</div>
  <div class="foo">hello world</div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('.foo').wrapInner('<div id="parent" style="color:red"></div>');
  </script>
</body>
```

> ### $('#foo').unwrap()
>> #### 说明：
* unwrap() 方法删除被选元素的父元素

>> #### 示例：
```html
<body>
  <div id="parent" style="color: red;">
    <div id="foo">hello world</div>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $('#foo').unwrap();
  </script>
</body>
```

## 类库 jQuery - 表单元素
> ### select 下拉框
>> #### JS 示例：
```html
<body>
  <select id="foo1">
    <option value="1">one</option>
    <option value="2" selected>two</option>
    <option value="3">three</option>
    <option value="4">four</option>
    <option value="5">five</option>
  </select>
  <script>
    // 取值
    console.log(foo1.value);
    // 赋值
    foo1.value = 4;
  </script>
</body>
```

>> #### JQ 示例：
```html
<body>
  <select id="foo1">
    <option value="1">one</option>
    <option value="2" selected>two</option>
    <option value="3">three</option>
    <option value="4">four</option>
    <option value="5">five</option>
  </select>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 取值
    var val = $('#foo1').val();
    console.log(val);
    // 赋值
    $('#foo1').val(4);
  </script>
</body>
```

> ### radio 单选框
>> #### JS 示例：
```html
<body>
  <label><input type="radio" name="foo1" value="1"> one</label>
  <label><input type="radio" name="foo1" value="2" checked> two</label>
  <label><input type="radio" name="foo1" value="3"> three</label>
  <script>
    // 取值
    var foo1 = document.getElementsByName('foo1');
    for(var i in foo1){
      if(foo1[i].checked){
        console.log(foo1[i].value);
      }
    }
    // 赋值
    var foo1 = document.getElementsByName('foo1');
    for(var i in foo1){
      if(foo1[i].value == 3){
        foo1[i].checked = 'checked';
      }else{
        foo1[i].checked = false;
      }
    }
  </script>
</body>
```

>> #### JQ 示例：
```html
<body>
  <label><input type="radio" name="foo1" value="1"> one</label>
  <label><input type="radio" name="foo1" value="2" checked> two</label>
  <label><input type="radio" name="foo1" value="3"> three</label>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 取值
    var radioVal = $('[name = "foo1"]:checked').val();
    console.log(radioVal);
    // 赋值
    $('[name = "foo1"]').val([3]);
  </script>
</body>
```

> ### checkbox 多选框
>> #### JS 示例：
```html
<body>
  <input type="checkbox" name="foo1" value="1"> one
  <input type="checkbox" name="foo1" value="2" checked> two
  <input type="checkbox" name="foo1" value="3"> three
  <input type="checkbox" name="foo1" value="4" checked> four
  <input type="checkbox" name="foo1" value="5"> five
  <script>
    // 取值
    var foo1 = document.getElementsByName('foo1');
    var val = [];
    for(var i in foo1){
      if(foo1[i].checked){
        val.push(foo1[i].value);
      }
    }
    console.log(val); // [2,4]
    // 赋值
    var foo1 = document.getElementsByName('foo1');
    for(var i in foo1){
      if(foo1[i].value == 1 || foo1[i].value == 3 || foo1[i].value == 5){
        foo1[i].checked = 'checked';
      }else{
        foo1[i].checked = false;
      }
    }
    // 反选
    var foo1 = document.getElementsByName('foo1');
    for(var i in foo1){
      if(foo1[i].checked){
        foo1[i].checked = false;
      }else{
        foo1[i].checked = 'checked';
      }
    }
    // 全选
    var foo1 = document.getElementsByName('foo1');
    for(var i in foo1){
      foo1[i].checked = 'checked';
    }
  </script>
</body>
```

>> #### JQ 示例：
```html
<body>
  <label><input type="checkbox" name="foo1" value="1"> one</label>
  <label><input type="checkbox" name="foo1" value="2" checked> two</label>
  <label><input type="checkbox" name="foo1" value="3"> three</label>
  <label><input type="checkbox" name="foo1" value="4" checked> four</label>
  <label><input type="checkbox" name="foo1" value="5"> five</label>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 取值
    var val = [];
    $('[name = "foo1"]:checked').each(function(){
      val.push($(this).val());
    });
    console.log(val); // [2,4]
    // 赋值
    $('[name = "foo1"]').val([1,3,5]);
    // 反选
    $('[name = "foo1"]').each(function(){
      if($(this).attr('checked')){
        $(this).removeAttr('checked');
      }else{
        $(this).attr('checked', 'checked');
      }
    });
    // 全选
    $('[name = "foo1"]').attr('checked', 'true');
  </script>
</body>
```
