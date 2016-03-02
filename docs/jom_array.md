# JOM 数组
数组是按次序排列的一组值，它们的位置都有编号（从0开始）。整个数组用方括号表示。

## 大纲
> ### 属性
>> * 获取数组的成员数量：Array.prototype.length

> ### 方法
>> * 判断是否为数组：Array.isArray()
* 数组开头添加成员：Array.prototype.unshift()
* 数组末尾添加成员：Array.prototype.push()
* 删除数组首个成员：Array.prototype.shift()
* 删除数组最后成员：Array.prototype.pop()
* 数组转为字符串：Array.prototype.join()
* 合并两个数组：Array.prototype.concat()
* 颠倒数组成员排序：Array.prototype.reverse()
* 截取指定范围的数组成员：Array.prototype.slice()
* 删除指定范围的数组成员：Array.prototype.splice()
* 对数组进行字母排序：Array.prototype.sort()

***

## 数组的创建
> ### 说明：
* 数组的键名只能为数字，类似于字典
* 数组成员只能用方括号结构arr[0]表示，不支持使用点结构arr.0来表示

> ### 数组声明
>> #### 说明：
* 直接使用方括号创建
* 除了在定义时赋值，数组也可以先定义后赋值

>> #### 示例
```javascript
var arr = ['a', 'b', 'c'];
```

>> #### 示例
```javascript
var arr = [];
arr[0] = 'a';
arr[1] = 'b';
arr[2] = 'c';
```

> ### 数组构造器
>> #### 说明：
* 数组还可以使用JavaScript内置的Array构造器创建

>> #### 示例
```javascript
/* 没有参数时，返回一个空数组 */
var a = new Array();
a // []
a.length // 0
```

>> #### 示例
```javascript
/* 使用一个参数时，返回一个指定长度的空数组*/
var a = new Array(1);
a // [undefined × 1]
a.length // 1
var a = new Array(2);
a // [undefined × 2]
a.length // 2
```

>> #### 示例
```javascript
/* 使用多个参数，返回一个指定成员的数组 */
var a = new Array(1,2);
a // [1,2]
a.length // 2
```

## 数组的空位
> ### 说明：
* 当数组的某个位置是空元素（比如两个逗号之间没有任何值，或者值为undefined），我们称该数组存在空位
* 需要注意的是，因为浏览器兼容性的问题，最后一个值后面不能有逗号
* 使用delete命令删除一个值，会形成空位
* 数组的空位或者使用delete命令删除一个值，不影响length属性
* 空位如果是通过空值生成，使用数组的forEach方法或者for...in结构进行遍历，空位就会被跳过
* 空位如果是通过显式定义undefined生成，遍历的时候就不会被跳过

> ### 示例
```javascript
/* 当数组的某个位置是空元素（比如两个逗号之间没有任何值，或者值为undefined），我们称该数组存在空位 */
var a = [1,,1];
a // [1, undefined, 1]
a.length // 3
```

> ### 示例
```javascript
/* 使用delete命令删除一个值，会形成空位 */
var a = [1,2,3];
delete a[1];
a // [1, undefined, 3]
/* 数组的空位或者使用delete命令删除一个值，不影响length属性 */
var a = [1,2,3];
delete a[1];
delete a[2];
a // [1, undefined, undefined]
a.length // 3
```

> ### 示例
```javascript
/* 空位如果是通过空值生成，使用数组的forEach方法或者for...in结构进行遍历，空位就会被跳过 */
var a = [,,,];
a.forEach(function (x, i) { console.log(i+". "+x) }) // 不产生任何输出
for (var i in a){console.log(i)} // 不产生任何输出
```

> ### 示例
```javascript
/* 空位如果是通过显式定义undefined生成，遍历的时候就不会被跳过 */
var a = [undefined,undefined,undefined];
a.forEach(function (x, i) { console.log(i+". "+x) });
// 0. undefined
// 1. undefined
// 2. undefined
for (var i in a){console.log(i+". "+a[i])}
// 0. undefined
// 1. undefined
// 2. undefined
```

## 数组的遍历
> ### 说明：
* 数组键（key）的检查用 in 运算符
* 数组值（value）的遍历用 for-in 循环

> ### in 运算符
>> #### 说明：
* 运算符in用于检查某个键是否存在于数组中，也适用于对象

>> #### 示例：
```javascript
2 in [ 'a', 'b', 'c' ] // true
'2' in [ 'a', 'b', 'c' ] // true
```

> ### for-in 循环
>> #### 说明：
* 使用for-in循环，可以遍历数组的所有元素
* 需要注意，for-in循环除了遍历数组元素，也会遍历数组对象中的（可枚举）属性

>> #### 示例：
```javascript
var a = [1,2,3];
for (var i in a){
    console.log(a[i]);
}
// 1
// 2
// 3
```

>> #### 示例：
```javascript
var a = [1,2,3];
a.foo = true;
for (var key in a) {
    console.log(key);
}
// 0
// 1
// 2
// foo
```

> ### for 循环
>> #### 说明：
* for循环需要结合数组的length属性
* for循环不会遍历数组对象中的（可枚举）属性

>> #### 示例：
```javascript
var a = [1,2,3];
a.foo = true;
for(var i = 0; i < a.length; i++) {
    console.log(a[i]);
}
// 1
// 2
// 3
```

> ### while 循环
>> #### 说明：
* while循环需要结合数组的length属性
* while循环不会遍历数组对象中的（可枚举）属性

>> #### 示例：
```javascript
/* 顺序遍历 */
var a = [1,2,3];
a.foo = true;
var i = 0;
while (i< a.length){
    console.log(a[i]);
    i++;
}
// 1
// 2
// 3
```

>> #### 示例：
```javascript
/* 逆序遍历 */
var a = [1,2,3];
a.foo = true;
var i = a.length;
while (i--){
    console.log(a[i]);
}
// 3
// 2
// 1
```

## 数组的属性
> ### 说明：
* 数组常用属性为length

> ### length 属性
>> #### 说明：
* 数组的length属性，返回数组的成员数量
* JavaScript使用一个32位整数，保存数组的元素个数。这意味着，数组成员最多只有4294967295个（232-1）个，也就是说length属性的最大值就是4294967295
* 数组的length属性与对象的length属性有区别，只要是数组，就一定有length属性，而对象不一定有

>> #### 示例：
```javascript
['a', 'b', 'c'].length // 3
var arr = ['a', 'b'];
/* 数组的length属性是一个动态的值，等于键名中的最大整数加上1 */
arr.length // 2
arr[2] = 'c';
arr.length // 3
arr[9] = 'd';
arr.length // 10
arr[1000] = 'e';
arr.length // 1001
```

>> #### 示例：
```javascript
/* length属性是可写的。如果人为设置一个小于当前成员个数的值，该数组的成员会自动减少到length设置的值 */
var arr = [ 'a', 'b', 'c' ];
arr.length // 3
arr.length = 2;
arr // ["a", "b"]
```

>> #### 示例：
```javascript
/* 如果人为设置length大于当前元素个数，则数组的成员数量会增加到这个值，新增的位置填入空元素 */
var a = ['a'];
a.length = 3;
a // ["a", undefined × 2]
```

>> #### 示例：
```javascript
/* 将数组清空的一个有效方法，就是将length属性设为0 */
var arr = [ 'a', 'b', 'c' ];
arr.length = 0;
arr // []
```

>> #### 示例：
```javascript
/* 如果人为设置length为不合法的值，JavaScript会报错 */
// 设置负值
[].length = -1 // RangeError: Invalid array length
// 数组元素个数大于等于2的32次方
[].length = Math.pow(2,32) // RangeError: Invalid array length
// 设置字符串
[].length = 'abc' // RangeError: Invalid array length
```

>> #### 示例：
```javascript
/* 值得注意的是，由于数组本质上是对象的一种，所以我们可以为数组添加属性，但是这不影响length属性的值 */
var a = [];
a["p"] = "abc";
a.length // 0
a[2.1] = "abc";
a.length // 0
```

## 数组对象的方法
> ### 说明：
* Array对象可以直接调用的方法

> ### Array.isArray() 方法
>> #### 说明：
* isArray方法用来判断一个值是否为数组。它可以弥补typeof运算符的不足

>> #### 示例：
```javascript
var a = [1,2,3];
typeof a // "object"
Array.isArray(a) // true
```

## 数组实例对象的方法
> ### 说明：
* 需要先实例化Array对象才可以调用的方法

> ### Array.prototype.valueOf() 方法
>> #### 说明：
* valueOf方法返回数组本身

>> #### 示例：
```javascript
var a = [1,2,3];
a.valueOf() // [1,2,3]
```

> ### Array.prototype.toString() 方法
>> #### 说明：
* toString方法返回数组的字符串形式

>> #### 示例：
```javascript
var a = [1,2,3];
a.toString() // "1,2,3"
var a = [1,2,3,[4,5,6]];
a.toString() // "1,2,3,4,5,6"
```

> ### Array.prototype.push() 方法
>> #### 说明：
* push方法用于在数组的末端添加一个或多个元素，并返回添加后的数组的长度

>> #### 示例：
```javascript
var a = [];
a.push(1) // 1
a.push("a") // 2
a.push(true, {}) // 4
a // [1, "a", true, {}]
```

> ### Array.prototype.pop() 方法
>> #### 说明：
* pop方法用于删除数组的最后一个元素，并返回该元素

>> #### 示例：
```javascript
var a = ['a', 'b', 'c'];
a.pop() // 'c'
a // ['a', 'b']
/* 对空数组使用pop方法，不会报错，而是返回undefined */
[].pop() // undefined
```

> ### Array.prototype.join() 方法
>> #### 说明：
* join方法以参数作为分隔符，将所有数组成员组成一个字符串返回
* 如果不提供参数，默认用逗号分隔

>> #### 示例：
```javascript
var a = [1,2,3,4];
a.join() // "1,2,3,4"
a.join('') // '1234'
a.join("|") // "1|2|3|4"
```

> ### Array.prototype.concat() 方法
>> #### 说明：
* concat方法将新数组的成员，添加到原数组的尾部，然后返回一个新数组，常用于连接多个数组

>> #### 示例：
```javascript
["hello"].concat(["world"]) // ["hello", "world"]
[1,2,3].concat(4,5,6) // [1, 2, 3, 4, 5, 6]
```

> ### Array.prototype.shift() 方法
>> #### 说明：
* shift方法用于删除数组的第一个元素，并返回该元素

>> #### 示例：
```javascript
var a = ['a', 'b', 'c'];
a.shift() // 'a'
a // ['b', 'c']
```

> ### Array.prototype.unshift() 方法
>> #### 说明：
* unshift方法用于在数组的第一个位置添加元素，并返回添加新元素后的数组长度

>> #### 示例：
```javascript
var a = ['a', 'b', 'c'];
a.unshift('x'); // 4
a // ['x', 'a', 'b', 'c']
```

> ### Array.prototype.reverse() 方法
>> #### 说明：
* reverse方法用于颠倒数组中元素的顺序，使用这个方法以后，返回改变后的原数组

>> #### 示例：
```javascript
var a = ['a', 'b', 'c'];
a.reverse() // ["c", "b", "a"]
a // ["c", "b", "a"]
```

> ### Array.prototype.slice() 方法
>> #### 说明：
* slice方法返回指定位置的数组成员组成的新数组，原数组不变
* 它的第一个参数为起始位置（从0开始），第二个参数为终止位置（但该位置的元素本身不包括在内）
* 如果省略第二个参数，则一直返回到原数组的最后一个成员

>> #### 示例：
```javascript
var a = ["a","b","c"];
a.slice(1,2) // ["b"]
a.slice(1) // ["b", "c"]
a.slice(0) // ["a","b","c"]
a.slice(-2) // ["b", "c"]
a.slice(4) // []
a.slice(2, 6) // ["c"]
a.slice(2, 1) // []
```

> ### Array.prototype.splice() 方法
>> #### 说明：
* splice方法用于删除元素，并可以在被删除的位置添加入新的数组元素，它的返回值是被删除的元素
* 需要特别注意的是，该方法会改变原数组
* splice的第一个参数是删除的起始位置，第二个参数是被删除的元素个数。如果后面还有更多的参数，则表示这些就是要被插入数组的新元素

>> #### 示例：
```javascript
var a = ["a","b","c","d","e","f"];
a.splice(4,2) // ["e", "f"]
a // ["a", "b", "c", "d"]
```

>> #### 示例：
```javascript
var a = ["a","b","c","d","e","f"];
a.splice(4,2,1,2) // ["e", "f"]
a // ["a", "b", "c", "d", 1, 2]
```

>> #### 示例：
```javascript
/* 如果只是单纯地插入元素，splice方法的第二个参数可以设为0 */
var a = [1,1,1];
a.splice(1,0,2) // []
a // [1, 2, 1, 1]
```

>> #### 示例：
```javascript
/* 如果只提供第一个参数，则实际上等同于将原数组在指定位置拆分成两个数组 */
var a = [1,2,3,4];
a.splice(2) // [3, 4]
a // [1, 2]
```

> ### Array.prototype.sort() 方法
>> #### 说明：
* sort方法对数组元素进行排序，默认是按照字典顺序排序
* 排序后，原数组将被改变
* sort方法不是按照大小排序，而是按照对应字符串的字典顺序排序，所以101排在11的前面

>> #### 示例：
```javascript
["d","c","b","a"].sort() // ["a", "b", "c", "d"]
[4,3,2,1].sort() // [1, 2, 3, 4]
[11,101].sort() // [101, 11]
[10111,1101,111].sort() // [10111, 1101, 111]
```

## 数组的方法（ECMAScript 5）（待完成）
> ### 说明：
* ECMAScript 5新增了9个数组实例的方法，分别是map、forEach、filter、every、some、reduce、reduceRight、indexOf和lastIndexOf
* 新增了9个数组方法中前7个与函数式（functional）操作有关
* IE8等老旧浏览器不支持ECMAScript 5
* 该部分内容二期开始添加

## 类库 jQuery - 方法
> ### $.each();
>> #### 说明：
* 遍历数据

>> #### 示例：
```html
<body>
  <script src="https://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
  <script>
    var foo = ['red', 'blue', 'green', 'yellow'];
    $.each(foo, function(key, value){
      console.log(key + ':' + value);
    });
  </script>
</body>
```

> ### $.grep();
>> #### 说明：
* 过滤数据

>> #### 示例：
```html
<body>
  <script src="https://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
  <script>
    var foo = ['red', 'blue', 'green', 'yellow'];
    foo = $.grep(foo, function(value, key){ // 注意：这里回调函数中的参数是value在前，key在后
      return key >= 2;
    });
    console.log(foo); // ["green", "yellow"]
    var foo = ['red', 'blue', 'green', 'yellow'];
    foo = $.grep(foo, function(value, key){ // 注意：这里回调函数中的参数是value在前，key在后
      return key >= 2;
    }, true); // 注意：最后一个参数为是否反向过滤，默认为 false，当设为 true 时，返回的过滤数组为相反的
    console.log(foo); // ["red", "blue"]
  </script>
</body>
```

> ### $.inArray();
>> #### 说明：
* 判断某个值是否为数组成员
* 如果是数组成员，则返回该值在数组中的索引值
* 如果不是数组成员，则返回-1

>> #### 示例：
```html
<body>
  <script src="https://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
  <script>
    var foo = ['red', 'blue', 'green', 'yellow'];
    var status = $.inArray('green', foo);
    console.log(status); // 2
    var status = $.inArray('black', foo);
    console.log(status); // -1
  </script>
</body>
```

> ### $.map();
>> #### 说明：
* 重构数据

>> #### 示例：
```html
<body>
  <script src="https://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
  <script>
    var foo = ['red', 'blue', 'green', 'yellow'];
    foo = $.map(foo, function(value, key) { // 注意：这里回调函数中的参数是value在前，key在后
      return value + '(test)';
    });
    console.log(foo); // ["red(test)", "blue(test)", "green(test)", "yellow(test)"]
  </script>
</body>
```

> ### $.merge();
>> #### 说明：
* 合并数据

>> #### 示例：
```html
<body>
  <script src="https://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
  <script>
    var one = ['red', 'blue'];
    var two = ['green', 'yellow'];
    var foo = $.merge(one, two);
    console.log(foo); // ["red", "blue", "green", "yellow"]
  </script>
</body>
```

> ### $.unique();
>> #### 说明：
* 数据除去重复的成员

>> #### 示例：
```html
<body>
  <script src="https://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
  <script>
    var foo = ['red', 'blue', 'green', 'yellow', 'red', 'blue', 'green', 'yellow'];
    foo = $.unique(foo);
    console.log(foo); // ["red", "blue", "green", "yellow"]
  </script>
</body>
```
