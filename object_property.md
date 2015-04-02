# Object 属性
对象有属性，属性有标签
***

## 属性操作
对象属性的读写、删除、检测、枚举

* ### 读写属性
> 属性的 key 本质上是个字符串，所以可以使用以下两种方式读写属性：
> ```javascript
var fooA = {x:1, y:2};
// 第一种方法读取属性：
console.log(fooA.x); // 1
// 第二种方法读取属性：
console.log(fooA['y']); // 2
// 第一种方法写入属性：
fooA.x = 3；
// 第二种方法写入属性：
fooA['y'] = 4;
```
读写属性时，如果出现错误时，会出现以下三种异常：
> ```javascript
var fooA = {x:1};
// 第一种异常（读取时，对象存在，属性不存在）：
console.log(fooA.y); // undefined
// 第二种异常（读取时，对象不存在，属性不存在）：
console.log(fooA.y.one); // TypeError:Cannot read property 'one' of undefined
// 第三种异常（写入时，对象不存在，属性不存在）：
fooA.y.one = 2; // TypeError:Cannot set property 'one' of undefined
// 避免出现以上异常的属性读写方式：
var fooB = fooA && fooA.y && fooA.y.one;
```

* ### 删除属性
> 删除属性的两种方式：
> ```javascript
var fooA = {x:1, y:2};
// 第一种：
delete fooA.x; // true
// 第二种：
delete fooA['y']; // true
// 判断属性是否删除成功
console.log(fooA.x); // undefined
// 特殊情况一（即使属性不存在时，执行删除该属性也会返回 true）
delete fooA.x; // true
// 特殊情况二（属性能否删除，由属性的 configurable 标签来控制）
var fooB = Object.getOwnPropertyDescriptor(Object, 'prototype');
console.log(fooB.configurable); // false
delete Object.prototype; // false
```
>

