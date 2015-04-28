# Object 方法
对象方法也是对象的属性，如果属性的value是函数，则该属性就是对象的方法
***

## 对象扩展方法
通过对象扩展方法可以限制对象是否可以增加属性
> ```javascript
var fooA = {x:1, y:2};
// 判断对象的扩展性
Object.isExtensible(fooA); // true
// 设置对象为不可拓展
Object.preventExtensions(fooA);
// 再次判断对象的扩展性
Object.isExtensible(fooA); // false
// 尝试给不可拓展的对象添加属性
fooA.z = 3; // undefined, add new property failed
```

## 对象限制方法
通过对象限制方法可以统一控制对象属性的标签（不包括原型链上的属性）<br>
对象限制方法包括 seal（封印）、freeze（冻结）两种方式：
> 第一种对象限制方式（seal）
> ```javascript
var fooA = {x:1; y:2};
// 检测该对象的属性的标签
Object.getOwnPropertyDescriptor(fooA, 'x'); // Object {value: 1, writable: true, enumerable: true, configurable: true}
// 使用seal方法将对象所有属性的 configurable 标签统一设置为 false
Object.seal(fooA);
// 检测该对象的属性的标签
Object.getOwnPropertyDescriptor(fooA, 'x'); // Object {value: 1, writable: true, enumerable: true, configurable: false}
// 判断对象是否被seal（封印）
Object.isSealed(fooA); // true
```
> 第二种对象限制方式（freeze）
> ```javascript
var fooA = {x:1; y:2};
// 检测该对象的属性的标签
Object.getOwnPropertyDescriptor(fooA, 'x'); // Object {value: 1, writable: true, enumerable: true, configurable: true}
// 使用freeze方法将对象所有属性的 writable 与 configurable 标签统一设置为 false
Object.freeze(fooA);
// 检测该对象的属性的标签
Object.getOwnPropertyDescriptor(fooA, 'x'); // Object {value: 1, writable: false, enumerable: true, configurable: false}
// 判断对象是否被freeze（冻结）
Object.isFrozen(fooA); // true
```

## 对象序列化方法
对象格式数据与JSON格式数据之间的转换
> 第一种对象序列化方式（直接转换）
> ```javascript
var fooA = {a:1, b:true, c:[1,2,3], d:null, e:undefined, f:NaN, g:Infinity, h:new Date()};
// 使用JSON.stringify方法将对象转为JSON
JSON.stringify(fooA); // '{"a":1, "b":true, "c":[1,2,3], "d":null, "f":null, "g":null, "h":"2015-01-20T14:15:43.910Z"}'
// 使用JSON.parse方法将JSON转为对象
fooB = JSON.parse('{"x":1}');
console.log(fooB.x); // 1
```
> 第二种对象序列化方式（内置转换）
> ```javascript
var fooA = {
    x:1,
    y:2,
    z:{
        z1:1,
        z2:2,
        toJSON:function(){
            return this.z1 + this.z2;
        }
    }
};
JSON.stringify(fooA); // '{"x":1, "y":2, "z":3}';
```

## 对象输出方法
一般通过重定义 toString 或 valueOf 方法 来使对象有输出值
> ```javascript
var fooA = {x:1, y:2};
fooA.toString(); // [object Object]
+fooA; // NaN
// 重定义 toString 输出的是字符串型数据
fooA.toString = function(){return this.x + this.y};
// 重定义 valueOf 输出的是整型数据
fooA.valueOf = function(){return this.x + this.y + 100};
// 当拼接的前引为字符串时，对象输出为字符串型数据
"输出 " + fooA; // "输出 103"
// 当拼接的前引为数字时，对象输出为整型数据
1 + fooA; // 104
```
>
