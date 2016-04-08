# Object 属性
对象有属性，属性有标签
***

## 属性操作
对象属性的读写、删除、检测、枚举

> ### 属性读写
>> 属性的 key 本质上是个字符串，所以可以使用以下四种方式读写属性：
>> ```javascript
var fooA = {x:1, y:2};
// 第一种属性读写方式：
fooA.x = 3;
console.log(fooA.x); // 3
// 第二种属性读写方式：
fooA['y'] = 4;
console.log(fooA['y']); // 4
// 第三种属性读写方式（get/set方法）：
var fooB = {
    a:5;
    get b(){
        return this.a;
    },
    set b(val){
        this.a += val;
    }
}
fooB.b = 100;
console.log(fooB.b); // 105
// 第四种属性读写方式（Object.defineProperty方法）：
var fooC = {};
Object.defineProperty(fooC, 'one', {value:1}); // 这种方式创建的属性，其writable、enumerable、configurable标签默认为false
console.log(fooC.one); // 1
// 第五种属性读写方式（Object.defineProperties方法）：
var fooD = {};
Object.defineProperties(fooD, {
    one:{value:1, writable:true},
    two:{value:2},
    three:{
        get:function(){
            return 'one的值为' + this.one + ',two的值为' + this.two;
        },
        set:function(val){
            this.one += val;
            this.two += val;
        }
    }
}); // 这种方式创建的属性，其writable、enumerable、configurable标签默认为false，所以one属性的writable标签需要申明为true，这样get\set方法才能正常使用
fooD.three = 100;
console.log(fooD.two); // "one的值为101,two的值为2"
```
读写属性时，如果出现错误时，会出现以下三种异常：
>> ```javascript
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

> ### 属性删除
>> 删除属性的两种方式：
>> ```javascript
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

> ### 属性检测
>> 检测属性即检测对象中的某个属性是否存在<br>
>> 检测属性的两种方式：
>> ```javascript
var fooA = {x:1, y:2};
// 第一种属性检测方式（使用 in 检测范围，包括对象原型链上的所有属性）：
'x' in fooA; // true
'z' in fooA; // false
'toString' in fooA; // true
// 第二种属性检测方式（使用 hasOwnProperty 检测范围，不包括对象原型链上(模板对象、元祖对象)的所有属性）：
fooA.hasOwnProperty('x'); // true
fooA.hasOwnProperty('z'); // false
fooA.hasOwnProperty('toString'); // false
```

> ### 属性枚举
>> 属性枚举即通过 for in 语句将对象中（enumerable 属性为 true）的属性遍历输出<br>
>> 判断对象属性是否可枚举:
>> ```javascript
var fooA = {x:1, y:2};
// in 是检测属性是否存在对象中，propertyIsEnumerable 则是检测属性是否可枚举：
'toString' in fooA; // true
fooA.propertyIsEnumerable('toString'); // false
```
>> 两种属性枚举的方式：
>> ```javascript
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
    if(fooB.hasOwnProperty(key)){
        // 只列出实例对象的自身属性
        console.log(key) // 3
    }
}
```

## 属性标签
对象属性的标签包括四种标签，分别是 value（属性值）writable（可复写）enumerable（可枚举）configurable（可配置）

> ### 属性标签说明
>> 1. writable （可复写）标签<br>
>> 1.1 可赋值对象属性<br>
>> 1.2 可修改对象属性的值<br>
>> 2. enumerable （可枚举）标签<br>
>> 2.1 可通过通过 for in 语句将对象中的属性遍历输出<br>
>> 3. configurable（可配置）标签<br>
>> 3.1 可删除对象属性<br>
>> 3.2 可修改对象属性的标签<br>
>> 3.3 可修改get/set方法<br>

> ### 属性标签检测
>> 通过Object.getOwnPropertyDescriptor方法可以检测对象属性标签的值
>> ```javascript
var fooA = {x:1};
Object.getOwnPropertyDescriptor(fooA, 'x'); // Object {value: 1, writable: true, enumerable: true, configurable: true}
```

> ###  属性标签配置
>> 通过Object.defineProperty方法可以修改属性标签配置
>> ```javascript
var fooA = {x:1};
Object.getOwnPropertyDescriptor(fooA, 'x'); // Object {value: 1, writable: true, enumerable: true, configurable: true}
console.log(fooA.x); // 1
Object.defineProperty(fooA, 'x', {value:2, configurable:false, writable:false}); // Object {value: 2, writable: false, enumerable: true, configurable: false}
console.log(fooA.x); // 2
```
