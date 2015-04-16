# JOM 数组
数组是按次序排列的一组值，它们的位置都有编号（从0开始）。整个数组用方括号表示。
***

## 数组的创建
> 说明：
* 数组的键名只能为数字，类似于字典
* 数组成员只能用方括号结构arr[0]表示，不支持使用点结构arr.0来表示

> ### 数组声明
>> 说明：
* 直接使用方括号创建
* 除了在定义时赋值，数组也可以先定义后赋值

>> 示例一
```javascript
var arr = ['a', 'b', 'c'];
```

>> 示例二
```javascript
var arr = [];
arr[0] = 'a';
arr[1] = 'b';
arr[2] = 'c';
```

> ### 数组构造器
>> 说明：
* 数组还可以使用JavaScript内置的Array构造器创建

>> 示例一
```javascript
/* 没有参数时，返回一个空数组 */
var a = new Array();
a // []
a.length // 0
```

>> 示例二
```javascript
/* 使用一个参数时，返回一个指定长度的空数组*/
var a = new Array(1);
a // [undefined × 1]
a.length // 1
var a = new Array(2);
a // [undefined × 2]
a.length // 2
```

>> 示例三
```javascript
/* 使用多个参数，返回一个指定成员的数组 */
var a = new Array(1,2);
a // [1,2]
a.length // 2
```

## 数组的空位
> 说明：
* 当数组的某个位置是空元素（比如两个逗号之间没有任何值，或者值为undefined），我们称该数组存在空位
* 需要注意的是，因为浏览器兼容性的问题，最后一个值后面不能有逗号
* 使用delete命令删除一个值，会形成空位
* 数组的空位或者使用delete命令删除一个值，不影响length属性
* 空位如果是通过空值生成，使用数组的forEach方法或者for...in结构进行遍历，空位就会被跳过
* 空位如果是通过显式定义undefined生成，遍历的时候就不会被跳过

>> 示例一
```javascript
/* 当数组的某个位置是空元素（比如两个逗号之间没有任何值，或者值为undefined），我们称该数组存在空位 */
var a = [1,,1];
a // [1, undefined, 1]
a.length // 3
```

>> 示例二
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

>> 示例三
```javascript
/* 空位如果是通过空值生成，使用数组的forEach方法或者for...in结构进行遍历，空位就会被跳过 */
var a = [,,,];
a.forEach(function (x, i) { console.log(i+". "+x) }) // 不产生任何输出
for (var i in a){console.log(i)} // 不产生任何输出
```

>> 示例四
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
> 说明：
* 数组键（key）的检查用 in 运算符
* 数组值（value）的遍历用 for-in 循环

> ### in 运算符
>> 说明：
* 运算符in用于检查某个键是否存在于数组中，也适用于对象

>> 示例一：
```javascript
2 in [ 'a', 'b', 'c' ] // true
'2' in [ 'a', 'b', 'c' ] // true
```

> ### for-in 循环
>> 说明：
* 使用for-in循环，可以遍历数组的所有元素
* 需要注意，for-in循环除了遍历数组元素，也会遍历数组对象中的（可枚举）属性

>> 示例一：
```javascript
var a = [1,2,3];
for (var i in a){
    console.log(a[i]);
}
// 1
// 2
// 3
```

>> 示例二：
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
>> 说明：
* for循环需要结合数组的length属性
* for循环不会遍历数组对象中的（可枚举）属性

>> 示例一：
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
>> 说明：
* while循环需要结合数组的length属性
* while循环不会遍历数组对象中的（可枚举）属性

>> 示例一：
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

>> 示例二：
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

## 数组的方法
