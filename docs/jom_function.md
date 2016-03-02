# JOM 函数
编写可重复使用的代码块

## 大纲
> ### 方法
>> * 函数调用外部指针，第一参数为指针所在对象，其次参数为函数正常参数：Function.prototype.call()
* 函数调用外部指针，第一参数为指针对象，第二参数为数组，数组成员为函数正常参数：Function.prototype.apply()
* 函数调用外部指针与属性，第一参数为指针所在对象，其次参数为函数正常参数：Function.prototype.bind()

***

## 函数的创建
> ### 说明：
* 函数就是包裹在花括号中的代码块，前面使用了关键词 function
* JavaScript 对大小写敏感。关键词 function 必须是小写的，并且必须以与函数名称相同的大小写来调用函数
* 创建函数有三种方式

> ### 函数声明
>> #### 说明：
* 最常见的函数创建方式
* 可以后置，可以通过函数名访问
* 不可以匿名，不可以立即调用

>> #### 示例：
```javascript
function fooA(a, b) {
    // code
}
```

> ### 函数表达式
>> #### 说明：
* 函数表达式有四种书写形式
* 不可以后置，不可以通过函数名访问
* 可以匿名，可以立即调用

>> #### 示例：VFE 变量函数表达式
```javascript
var fooA = function(a, b) {
    // code
};
```

>> #### 示例：NFE 命名函数表达式
```javascript
var fooA = function fooB(a, b) {
    // code
}
```

>> #### 示例：IIFE 即调函数表达式
```javascript
// 用法一
(function() {
    // code
})(); // 注意，IIFE的结尾，都必须加上分号
```
```javascript
// 用法二
(function(){
    // code
}()); // 注意，IIFE的结尾，都必须加上分号
```
```javascript
// 用法三（任何让解释器以表达式来处理函数定义的方法，都能产生同样的效果）
var i = function(){ /* code */ }();
true && function(){ /* code */ }();
0, function(){ /* code */ }();
!function(){ /* code */ }();
~function(){ /* code */ }();
-function(){ /* code */ }();
+function(){ /* code */ }();
new function(){ /* code */ }
new function(){ /* code */ }() // 只有传递参数时，才需要最后那个圆括号。
```
```javascript
// 错误用法
function(){
    // code
}(); // SyntaxError: Unexpected token (
// 通常情况下，只对匿名函数使用IIFE。它的目的有两个：
// 一是不必为函数命名，避免了污染全局变量；
// 二是IIFE内部形成了一个单独的作用域，可以封装一些外部无法读取的私有变量。
```

>> #### 示例：FCFE 首类函数表达式
```javascript
return function() {
    // code
}
```

> ### 函数构造器
>> #### 说明：
* 最少见的函数创建方式
* 不可以后置，不可以通过函数名访问
* 必须匿名，可以立即调用

>> #### 示例：
```javascript
var fooA = new Function('a', 'b', 'console.log(a + b);'); // 参数数量不限，但是最后一个参数为函数所要执行的的代码块
fooA(1, 2); // 3
var fooA = Function('a', 'b', 'console.log(a + b);'); // 加不加 new 关键词不影响函数构造器的执行
fooA(1, 2); // 3
```

## 函数的类型
> ### 说明：
* 根据函数的内部代码块来区分，函数类型包括有返函数、无返函数、递归函数、闭包函数、构造函数五种

> ### 有返函数
>> #### 说明：
* 函数体内部包含return语句，表示该函数有返回值，即有返函数

>> #### 示例：
```javascript
function add(x,y) {
  return x+y;
}
console.log(add(1,1)); // 2
```

> ### 无返函数
>> #### 说明：
* 函数体内部的return语句不是必需的，如果没有的话，该函数就不返回任何值，或者说返回undefined，即无返函数

>> #### 示例：
```javascript
function f(){
  console.log(2);
}
console.log(f()); // undefined
```

> ### 递归函数
>> #### 说明：
* 函数可以调用自身，这就是递归，即递归函数

>> #### 示例：
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
>> #### 说明：
* 闭包函数就是定义在函数体内部的函数
* 闭包是函数与其生成时所在的作用域对象的一种结合
* 闭包的特点在于，在函数外部可以读取函数的内部变量
* 闭包不仅可以读取函数内部变量，还可以使得内部变量记住上一次调用时的运算结果
* 闭包存在空间浪费，性能消耗的缺点

>> #### 示例：
```javascript
function f() {
    var v = 1;
    // 下面的c函数就是闭包函数
    var c = function (){
        return v;
    };
    return c;
}
console.log(f()); // function(){return v};
// 借助f函数内部的c闭包函数，我们读取到了f函数的内部变量v
console.log(f()()); // 1
```

>> #### 示例：
```javascript
function fooA(attr) {
    // 下面的匿名函数就是闭包函数
    var start = attr;
    return function () {
        return start++;
    }
}
var test = fooA(5);
test(); // 5
test(); // 6
test(); // 7
console.log(start); // ReferenceError: start is not defined
```

> ### 构造函数
>> #### 说明：
* 构造函数就是专门用来生成对象的函数，它提供模板，作为对象的基本结构
* 构造函数无直接返回值，可被实例化为对象实例
* 一个构造函数，可以生成多个对象，这些对象都有相同的结构
* 函数体内部使用了this关键字，代表了所要生成的对象实例
* 生成对象的时候，必需用new命令来调用构造函数

>> #### 示例：
```javascript
var Vehicle = function() {
    this.price = 1000;
};
var v = new Vehicle();
console.log(v.price); // 1000
```

## 函数的参数
> ### 说明：
* 函数的参数数量不限，参数之前由逗号 (,) 分隔
* 通过使用 return 语句就可以实现函数将值返回调用它的地方

> ### 示例：
```javascript
function example(a, b)
{
	var a = arguments[0] ? arguments[0] : 1; // 设置参数a的默认值为1
    var b = arguments[1] ? arguments[1] : 2; // 设置参数b的默认值为2
    return a + b;
}
```

> ### 示例：
```javascript
function example()
{
	var a = arguments[0] ? arguments[0] : 1; // 设置参数a的默认值为1
    var b = arguments[1] ? arguments[1] : 2; // 设置参数b的默认值为2
    return a + b;
}
```

> ### 示例：
```javascript
function example(a, b)
{
	a = a || 1; // 设置参数a的默认值为1
	b = b || 2; // 设置参数b的默认值为2
    return a + b;
}
```

> ### 示例：
```javascript
function example(a, b)
{
	if(!a) a = 1; // 设置参数a的默认值为1
	if(!b) b = 2; // 设置参数b的默认值为2
	return a + b;
}
```

## 函数的作用域
> ### 说明：
* 作用域指的是变量存在的范围
* Javascript只有两种作用域：
* 一种是全局作用域，变量在整个程序中一直存在
* 另一种是函数作用域，变量只在函数内部存在

> ### 全局作用域
>> #### 说明：
* 在函数外部声明的变量就是全局变量，它可以在函数内部读取，作用域覆盖全局

>> #### 示例：
```javascript
var v = 1;
function f(){
   return v;
}
console.log(v); // 1
console.log(f()); // 1
```

> ### 函数作用域
>> #### 说明：
* 在函数内部定义的变量，外部无法读取，称为局部变量，作用域只覆盖变量所在的函数内部
* 函数内部定义的变量，会在该作用域内覆盖同名全局变量，但是函数作用域外部的全局变量不会被覆盖
* var命令声明的变量，不管在函数什么位置，变量声明都会被提升到函数体的头部

>> #### 示例：
```javascript
var v = 1；
function f(){
    var v = 2;
    return v；
}
console.log(f()); // 2
console.log(v); // 1
```

>> #### 示例：
```javascript
function foo(x) {
    if (x > 100) {
        // 下面的tmp变量等于被放到函数头部，如function foo(x){ var tmp; /* code */};
        var tmp = x - 100;
    }
}
```

> ### 作用域链
>> #### 说明：
* 如果函数A调用函数B，函数B是在函数A内声明，则函数B可以引用函数A的内部变量，这就是变量的作用域链
* 如果函数A调用函数B，函数B是在函数A外声明，则函数B不能引用函数A的内部变量，因为函数本身的作用域只绑定在其声明时所在的区域
* 函数构造器生成的函数无法读取外部函数的变量

>> #### 示例：
```javascript
function A(){
    var x = 2;
    // 下面的函数B在函数A的作用域内声明，所以可以读取到变量x
    var B = function (){
        return x;
    };
    return B();
}
console.log(A()); // 2
```

>> #### 示例：
```javascript
// 下面的函数B在函数A的作用域外声明，所以读取不到变量x
var B = function (){
    return x;
};
function A(){
    var x = 2;
    return B();
}
console.log(A()); // ReferenceError: x is not defined
```

>> #### 示例：
```javascript
function A(){
    var x = 1;
    // 函数构造器生成的函数无法读取外部函数的变量
    var B = new Function("return x;");
    return B();
}
console.log(A()); // ReferenceError: x is not defined
```

## 函数的指针
> ### 说明：
* 函数的指针即this
* this即函数内当前使用的对象，简单说，this就是指函数当前的运行环境

> ### 使用场景1.全局环境
>> #### 说明：
* 在全局环境使用this，它指的是顶层对象（浏览器中为window对象）

>> #### 示例：
```javascript
function fooA(){
    return this;
}
fooA() === window; // true;
```

>> #### 示例：
```javascript
this === window // true
function f() {
    console.log(this === window); // true
}
```

> ### 使用场景2.构造函数
>> #### 说明：
* 构造函数中的this，指的是实例对象本身

>> #### 示例：
```javascript
function fooB(){
    this.attr = 1000;
}
var foob = new fooB();
console.log(foob.attr); // 1000
```

>> #### 示例：
```javascript
var Foo = function(x) {
    this.attr = x;
};
var foo = new Foo("hello");
console.log(foo.attr) // "hello"
```

> ### 使用场景3.对象方法
>> #### 说明：
* 对象方法中的this是方法所属的对象
* 当a对象的方法被赋予b对象，该方法就变成了普通函数，其中的this就从指向a对象变成了指向b对象

>> #### 示例：
```javascript
var obj = {
    attr:50,
    fooC:function(){
        return this.attr;
    }
};
console.log(obj.fooC()); // 50
```

>> #### 示例：
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

## 函数的属性
> ### 说明：
* 每个函数对象包含两个标准属性：prototype和length
* 还包含一个非标准属性：name

> ### prototype 属性
>> #### 说明：
* prototype是函数的原型属性，toString()和valueOf()等方法实际上都保存在prototype名下，通过各自对象的实例来访问

>> #### 示例：
```javascript
function A(){};
A.prototype.x = 1;
console.log(A.x); // undefined
console.log(A.prototype.x); // 1
var a = new A();
console.log(a.x); // 1
```

> ### length 属性
>> #### 说明：
* length代表函数定义的命名参数（形参）的个数

>> #### 示例：
```javascript
function A(x){};
console.log(A.length); // 1
```

> ### name 属性
>> #### 说明：
* name属性返回紧跟在function关键字之后的那个函数名
* 大多数JavaScript引擎支持非标准的name属性

>> #### 示例：
```javascript
function f1() {}
console.log(f1.name) // 'f1'
var f2 = function () {};
console.log(f2.name) // ''
var f3 = function myName() {};
console.log(f3.name) // 'myName'
```

## 函数实例对象的方法
> ### 说明：
* 需要先实例化Function对象才可以调用的方法
* JavaScript提供了call、apply、bind这三个方法，用来切换/固定this的指向

> ### Function.prototype.call() 方法
>> #### 说明：
* 函数的call方法，可以改变指定该函数内部this的指向，然后再调用该函数
* call方法的作用包括两个：
* 1.继承其他对象来调用方法（直接执行）
* 2.继承其他对象的属性（new 实例化之后继承）
* 语法：func.attr.call(obj, 'arguA', 'arguB', ...);
* 语法解释1. func 函数（必需）：必须为函数，要执行的代码块
* 语法解释2. attr 属性（可选）：必须为函数，为函数对象的属性，这里如果要使用属性，该属性必须为函数（即方法）
* 语法解释3. obj 对象（必需）：必须为对象，作为父类对象（提供继承的对象源），是func函数中真实的this对象（即指针），如果设为null或undefined，则等同于指定全局对象
* 语法解释4. arguA 参数（可选）：参数需要用引号包围，这里的参数对应为真正要执行的函数（func或func.attr）的参数，当该函数无参数时可以为空

>> #### 示例：
```javascript
function Animal(){
    this.name = "Animal";
    this.show = function(){
        console.log("show: " + this.name);
    }
}
function Dog(){
    this.name = "Dog";
}
var animal = new Animal();
var dog = new Dog();
animal.show.call(dog); // Dog
```

>> #### 示例：
```javascript
function sayColor(a, b) {
    console.log(a + this.color + b);
};
var obj = {'color':'blue'};
sayColor.call(obj, "The color is ", " a very nice color indeed."); // The color is blue a very nice color indeed.
```

>> #### 示例：
```javascript
function fooA(x, y){
	this.attrA = 'a1';
	this.attrB = function(y){
		console.log(this.attrA + ' - ' + y);
	}
	this.attrC = '继承';
}
var fooa = new fooA();
function fooB(){
	this.attrA = 'b1';
	this.attrB = 'b2';
}
var foob = new fooB();
fooa.attrB.call(foob, 'y1'); // b1 - y1
function fooC(){
	fooA.call(this);
}
console.log(fooC); // function fooC(){ fooA.call(this); }
var fooc = new fooC();
console.log(fooc); // fooC {attrA: "a1", attrB: function, attrC: "继承"}
fooc.attrB.call(foob, 'haha'); // b1 - haha
```

>> #### 示例
```javascript
function Animal(name){
    this.name = name;
    this.show = function(){
        console.log(this.name);
    }
}
function Cat(name){
    Animal.call(this, name);
}
var cat = new Cat("Black Cat");
cat.show(); // Black Cat
```

>> #### 示例
```javascript
// 多重继承
function Class1()
{
    this.showSub = function(a,b)
    {
        console.log(a-b);
    }
}
function Class2()
{
    this.showAdd = function(a,b)
    {
        console.log(a+b);
    }
}
function Class3()
{
    Class1.call(this);
    Class2.call(this);
}
class3 = new Class3();
console.log(class3); // Class3 {showSub: function, showAdd: function}
class3.showAdd(1, 2); // 3
```

> ### Function.prototype.apply() 方法
>> #### 说明：
* apply方法的作用与call方法类似，也是改变this指向，然后再调用该函数。
* apply方法与call方法不同的地方在于，其第二个参数是一个数组，该数组的所有成员依次作为参数，传入原函数。
* 语法：func.attr.call(obj, ['arguA', 'arguB', ...]);

>> #### 示例：
```javascript
function f(x,y){ console.log(x+y); }
f.call(null,1,1) // 2
f.apply(null,[1,1]) // 2
```

>> #### 示例：
```javascript
// 找出数组最大元素
var a = [10, 2, 4, 15, 9];
Math.max.apply(null, a); // 15
// 将数组的空元素变为undefined
Array.apply(null, ["a",,"b"]) // [ 'a', undefined, 'b' ]
```

> ### Function.prototype.bind() 方法
>> #### 说明：
* bind方法用于将函数体内的this绑定到某个对象，然后返回一个新函数
* bind比call方法和apply方法更进一步的是，除了绑定this以外，还可以绑定原函数的参数
* 语法：func.attr.bind(obj, 'arguA', 'arguB', ...);
* 要特别注意bind方法每运行一次，就返回一个新函数

>> #### 示例：
```javascript
var o1 = new Object();
o1.p = 123;
o1.m = function (){
    console.log(this.p);
};
o1.m(); // 123
var o2 = new Object();
o2.p = 456;
o2.m = o1.m;
o2.m(); // 456
o2.m = o1.m.bind(o1);
o2.m(); // 123
```

>> #### 示例：
```javascript
function add(x,y) { return x+y; }
var plus5 = add.bind(null, 5, 10); // 即x=5, y=10
plus5(); // 15
```

>> #### 示例：
```javascript
var add = function (x,y) {
    return x*this.m + y*this.n;
}
var obj = {
    m: 1,
    n: 2
};
var newAdd = add.bind(obj, 3); // 即设置x=3
newAdd(4); // 11
```

## 类库 jQuery - 扩展
> ### $.extend();
>> #### 说明：
* 为jQuery类添加类方法，可以理解为添加静态方法

>> #### 示例：
```html
<body>
  <script src="https://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
  <script>
    $.extend({
      min: function(a, b){
        return a < b ? a : b;
      },
      max: function(a, b){
        return a > b ? a : b;
      }
    });
    console.log($.min(2,3)); // 2
    console.log($.max(4,5)); // 5
  </script>
</body>
```

> ### $.fn.extend();
>> #### 说明：
* jQuery.fn = jQuery.prototype
* 为jQuery类添加成员函数，可以理解为对jQuery.prototype进得扩展
* jQuery类的实例可以使用这个成员函数

>> #### 示例：
```html
<body>
  <p id="foo">hello world</p>
  <script src="https://cdn.bootcss.com/jquery/2.1.0/jquery.min.js"></script>
  <script>
    $.fn.extend({
      content: function(){
        return 'content : ' + $(this).text();
      }
    });
    console.log($('#foo').content()); // "content : hello world"
  </script>
</body>
```
