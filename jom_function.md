# JOM 函数
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

## 函数的类型
> 说明：
* 函数类型包括有返函数、无返函数、递归函数、闭包函数、构造函数五种

> ### 有返函数
>> 说明：
* 函数体内部包含return语句，表示该函数有返回值，即有返函数

>> 示例一：
```javascript
function add(x,y) {
  return x+y;
}
console.log(add(1,1)); // 2
```

> ### 无返函数
>> 说明：
* 函数体内部的return语句不是必需的，如果没有的话，该函数就不返回任何值，或者说返回undefined，即无返函数

>> 示例一：
```javascript
function f(){
  console.log(2);
}
console.log(f()); // undefined
```

> ### 递归函数
>> 说明：
* 函数可以调用自身，这就是递归，即递归函数

>> 示例一：
```javascript
function fib(num) {
    if (num > 2) {
        return fib(num - 2) + fib(num - 1);
    } else {
        return 1;
    }
}
console.log(fib(6)); // 8
```

> ### 闭包函数
>> 说明：
* 闭包函数就是定义在函数体内部的函数
* 闭包是函数与其生成时所在的作用域对象的一种结合
* 闭包的特点在于，在闭包函数内部可以读取闭包函数的外部变量

>> 示例一：
```javascript
function f() {
    var v = 1;
    var c = function (){
        return v;
    };
    return c;
}
console.log(f()); // function(){return v};
console.log(f()()); // 1
```

> ### 构造函数
>> 说明：
* 构造函数就是专门用来生成对象的函数，它提供模板，作为对象的基本结构
* 一个构造函数，可以生成多个对象，这些对象都有相同的结构
* 函数体内部使用了this关键字，代表了所要生成的对象实例
* 生成对象的时候，必需用new命令来调用构造函数

>> 示例一：
```javascript
var Vehicle = function() {
    this.price = 1000;
};
var v = new Vehicle();
console.log(v.price); // 1000
```

## 函数的参数
> 说明：
* 函数的参数数量不限，参数之前由逗号 (,) 分隔
* 通过使用 return 语句就可以实现函数将值返回调用它的地方

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

## 函数的作用域（待完成）

## 函数的指针
> 说明：
* 函数的指针即this
* this即函数内当前使用的对象，简单说，this就是指函数当前的运行环境

> ### 使用场景1.全局环境
>> 说明：
* 在全局环境使用this，它指的是顶层对象（浏览器中为window对象）

>> 示例一：
```javascript
function fooA(){
    return this;
}
fooA() === window; // true;
```

>> 示例二：
```javascript
this === window // true
function f() {
    console.log(this === window); // true
}
```

> ### 使用场景2.构造函数
>> 说明：
* 所谓“构造函数”，就是专门用来生成“对象”的函数。它提供模板，作为对象的基本结构，它无返回值，可被实例化
* 构造函数中的this，指的是实例对象

>> 示例一：
```javascript
function fooB(){
    this.attr = 1000;
}
var foob = new fooB();
console.log(foob.attr); // 1000
```

>> 示例二：
```javascript
var Foo = function(x) {
    this.attr = x;
};
var foo = new Foo("hello");
console.log(foo.attr) // "hello"
```

> ### 使用场景3.对象方法
>> 说明：
* 对象方法中的this是方法所属的对象
* 当a对象的方法被赋予b对象，该方法就变成了普通函数，其中的this就从指向a对象变成了指向b对象

>> 示例一：
```javascript
var obj = {
    attr:50,
    fooC:function(){
        return this.attr;
    }
};
console.log(obj.fooC()); // 50
```

>> 示例二：
```javascript
var objA = {
    m:1,
    f:function(){
        return this.m;
    }
}
console.log(objA.f()); // 1
```
```javascript
var objB = {
    m:2,
    f:objA.f // 注意，这里的objA.j 不加括号，等于将函数全部赋值给objB的属性f
}
console.log(objB.f()); // 2
```
```javascript
var objC = {
    m:3,
    f:objA.f() // 注意，这里的objA.j 加了括号，等于立即执行函数objA.j，即objC.f = objA.f() = 1
}
console.log(objC.f()); // TypeError: number is not a function
console.log(objC.f); // 1
```

## 函数的属性（待完成）
## 函数的方法（待完成）
