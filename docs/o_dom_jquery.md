## 类库 jQuery - Node - 探测方法
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

## 类库 jQuery - Node - 集合方法
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

## 类库 jQuery - Node - 遍历方法
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

## 类库 jQuery - Element - 内容方法
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

## 类库 jQuery - Element - 属性方法
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

> ### $('#foo').css();
>> #### 说明：
* 为匹配元素设置一个或多个CSS属性

>> #### 示例：
```javascript
$('#foo').css("color","red");
$('#foo').css({"color":"red", "background-color":"yellow"});
```

## 类库 jQuery - Event - 绑定方法
> ### $('#foo').bind();
>> #### 说明：
* 为一个元素绑定一个事件处理程序

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").bind('mouseenter mouseleave', function() {
    $(this).toggleClass('red');
  });
</script>
```

> ### $('#foo').unbind();
>> #### 说明：
* 从元素上删除一个以前附加事件处理程序

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").bind('mouseenter mouseleave', function() {
    $(this).toggleClass('red');
  });
  $("#foo").unbind('mouseenter mouseleave');
</script>
```

> ### $('#foo').on();
>> #### 说明：
* 为一个元素绑定多个事件处理程序

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").on({
    click: function(){
      alert('hello');
    },
    mouseenter: function(){
      $(this).addClass("red");
    },
    mouseleave: function(){
      $(this).removeClass("red");
    }
  });
</script>
```

> ### $('#foo').off();
>> #### 说明：
* 从元素上删除多个以前附加事件处理程序

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").on({
    click: function(){
      alert('hello');
    },
    mouseenter: function(){
      $(this).addClass("red");
    },
    mouseleave: function(){
      $(this).removeClass("red");
    }
  });
  $("#foo").off('mouseenter mouseleave');
</script>
```

> ### $('#foo').one();
>> #### 说明：
* 为元素的事件添加处理函数
* 处理函数在每个元素上每种事件类型最多执行一次

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").one('mouseenter mouseleave', function() {
    $(this).toggleClass('red');
  });
</script>
```

> ### $('#foo').trigger();
>> #### 说明：
* 主动执行元素上的事件类型处理函数

>> #### 示例：
```html
<style>
  .red {
    color: red;
  }
</style>
<div id="foo">hello world</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $("#foo").on('mouseenter mouseleave', function() {
    $(this).toggleClass('red');
  });
  $('#foo').trigger('mouseenter');
</script>
```

> ### $(document).ready();
>> #### 说明：
* 在文档加载解析完成后激活的函数
* 当 DOM 已经加载，并且页面（包括图像）已经完全呈现时，会发生 ready 事件
* ready() 函数仅能用于当前文档，因此可以无需选择器
* ready() 函数不应与 `<body onload="">` 一起使用
* ready() 函数允许使用以下三种语法

>> #### 示例：
```html
<body>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    // 语法 1 $(document).ready(function);
    $(document).ready(function(){
      console.log('hello 1');
    });
    // 语法 2 $().ready(function);
    $().ready(function(){
      console.log('hello 2');
    });
    // 语法 3 $(function);
    $(function(){
      console.log('hello 3');
    });
  </script>
</body>
```