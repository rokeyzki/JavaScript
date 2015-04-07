# Grammar 函数
编写可重复使用的代码块
***

## 函数的创建
> 说明：
* 函数就是包裹在花括号中的代码块，前面使用了关键词 function
* JavaScript 对大小写敏感。关键词 function 必须是小写的，并且必须以与函数名称相同的大小写来调用函数
* 创建函数有三种方式

> ### 函数声明
>> 说明：
* 最常见的函数创建方式
* 可以后置，可以通过函数名访问
* 不可以匿名，不可以立即调用

>> 示例一：
```javascript
function fooA(a, b) {
    // do sth
}
```

> ### 函数表达式
>> 说明：
* 函数表达式有四种书写形式
* 不可以后置，不可以通过函数名访问
* 可以匿名，可以立即调用

>> 示例一：function variable 变量函数表达式
```javascript
var fooA = function(a, b) {
    // do sth
};
```

>> 示例二：IEF 立即执行函数表达式
```javascript
(function() {
    // do sth
})();
```

>> 示例三：first-class function 首类函数表达式
```javascript
return function() {
    // do sth
}
```
>> 示例四：NFE 命名式函数表达式
```javascript
var fooA = function fooB(a, b) {
    // do sth
}
```

> ### 函数构造器
>> 说明：
* 最少见的函数创建方式
* 不可以后置，不可以通过函数名访问
* 必须匿名，可以立即调用

>> 示例一：
```javascript
var fooA = new Function('a', 'b', 'console.log(a + b);'); // 参数数量不限，但是最后一个参数为函数所要执行的的代码块
fooA(1, 2); // 3
var fooA = Function('a', 'b', 'console.log(a + b);'); // 加不加 new 关键词不影响函数构造器的执行
fooA(1, 2); // 3
```

## 函数的变量
> 说明：
* 函数的参数数量不限，参数之前由逗号 (,) 分隔。
* 通过使用 return 语句就可以实现函数将值返回调用它的地方。

> 示例一：
```javascript
function example(a, b)
{
	var a = arguments[0] ? arguments[0] : 1; // 设置参数a的默认值为1
    var b = arguments[1] ? arguments[1] : 2; // 设置参数b的默认值为2
    return a + b;
}
```

> 示例二：
```javascript
function example()
{
	var a = arguments[0] ? arguments[0] : 1; // 设置参数a的默认值为1
    var b = arguments[1] ? arguments[1] : 2; // 设置参数b的默认值为2
    return a + b;
}
```

> 示例三：
```javascript
function example(a, b)
{
	a = a || 1; // 设置参数a的默认值为1
	b = b || 2; // 设置参数b的默认值为2
    return a + b;
}
```

> 示例四：
```javascript
function example(a, b)
{
	if(!a) a = 1; // 设置参数a的默认值为1
	if(!b) b = 2; // 设置参数b的默认值为2
	return a + b;
}
```
