# Object 属性
对象有属性，属性有标签
***

## 属性操作
对象属性的读写、删除、检测、枚举

* ### 属性读写
> 属性的 key 本质上是个字符串，所以可以使用以下两种方式读写属性：
> ```javascript
var fooA = {x:1, y:2};
// 第一种属性读取方式：
console.log(fooA.x); // 1
// 第二种属性读取方式：
console.log(fooA['y']); // 2
// 第一种属性写入方式：
fooA.x = 3；
// 第二种属性写入方式：
fooA['y'] = 4;
```
读写属性时，如果出现错误时，会出现以下三种异常：
> ```javascript
var fooA = {x:1};
// 第一种属性异常信息（读取时，对象存在，属性不存在）：
console.log(fooA.y); // undefined
// 第二种属性异常信息（读取时，对象不存在，属性不存在）：
console.log(fooA.y.one); // TypeError:Cannot read property 'one' of undefined
// 第三种属性异常信息（写入时，对象不存在，属性不存在）：
fooA.y.one = 2; // TypeError:Cannot set property 'one' of undefined
// 避免出现以上异常的属性赋值方式：
var fooB = fooA && fooA.y && fooA.y.one;
```

* ### 属性删除
> 删除属性的两种方式：
> ```javascript
var fooA = {x:1, y:2};
// 第一种属性删除方式：
delete fooA.x; // true
// 第二种属性删除方式：
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

* ### 属性检测
> 检测属性即检测对象中的某个属性是否存在
> 检测属性的两种方式：
> ```javascript
var fooA = {x:1, y:2};
// 第一种属性检测方式（使用 in 检测范围，包括对象原型链上的所有属性）：
'x' in fooA; // true
'z' in fooA; // false
'toString' in fooA; // true
// 第二种属性检测方式（使用 hasOwnProperty 检测范围，不包括对象原型链上(模板对象、元祖对象)的所有属性）：
fooA.hasOwnProperty('x'); // true
fooA.hasOwnProperty('z'); // false
fooA.hasOwnPropetty('toString'); // false
```
>

* ### 属性枚举
> 属性枚举即通过 for in 语句将对象中（enumerable 属性为 true)的属性遍历输出
> 判断属性属性是否可枚举
> ```javascript
var fooA = {x:1, y:2};
// in 是检测属性是否存在对象中，propertyIsEnumerable 则是检测属性是否可枚举：
'toString' in fooA; // true
fooA.propertyIsEnumerable('toString'); // false
```
>
> 两种属性枚举的方式：
> ```javascript
var fooA = {x:1, y:2};
var fooB = Object.create(fooA);
fooB.z = 3;
// 第一种属性枚举方式（枚举实例对象与模板对象的所有自身属性）：
var key;
for(key in fooB){
    // 先列出实例对象的自身属性，再列出模板对象的自身属性
    console.log(key) // z,x,y
}
// 第二种属性枚举方式（枚举实例对象的所有自身属性）：
var key;
for (key in fooB){
    if(fooB.hasOwnPropetty(key)){
        // 只列出实例对象的自身属性
        console.log(key) // 3
    }
}
```
>
