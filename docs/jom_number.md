# JOM 数值
Number对象是JavaScript的三个包装对象之一
***

## 数值的包装对象
> ### 说明：
* Number对象可以作为构造函数使用，也可以作为工具函数使用

> ### 示例：
```javascript
var n = new Number(1);
typeof n // "object"
// 作为工具函数时，它可以将任何类型的值转为数值
Number(true) // 1
```

## 数值的包装对象的属性
> ### 说明：
* 因为使用率不高，暂不介绍

## 数值实例对象的方法
> ### 说明：
* 需要先实例化Number对象才可以调用的方法

> ### Number.prototype.toString() 方法
>> #### 说明：
* toString方法可以接受一个参数，表示将一个数字转化成某个进制的字符串
* 将其他进制的数，转回十进制，需要使用parseInt方法
* 需要在数值外使用括号才能使用该方法

>> #### 示例：
```javascript
(10).toString(); // "10"
(10).toString(2); // "1010"
(10).toString(8); // "12"
(10).toString(16); // "a"
```

>> #### 示例：
```javascript
// 通过方括号运算符也可以调用toString方法
// 此时的数值不需要使用方括号
10['toString'](2); // "1010"
```

> ### Number.prototype.toFixed() 方法
>> #### 说明：
* toFixed方法用于将一个数转为指定位数的小数
* 需要在数值外使用括号才能使用该方法

>> #### 示例：
```javascript
(10).toFixed(2); // "10.00"
(10.005).toFixed(2); // "10.01"
```

>> #### 示例：
```javascript
// 通过方括号运算符也可以调用toFixed方法
// 此时的数值不需要使用方括号
10['toFixed'](2); // "10.00"
```

> ### Number.prototype.toExponential() 方法
>> #### 说明：
* 因为使用率不高，暂不介绍

> ### Number.prototype.toPrecision() 方法
>> #### 说明：
* 因为使用率不高，暂不介绍

> ### Number.prototype.custom() 自定义方法
>> #### 说明：
* 与其他对象一样，Number.prototype对象上面可以自定义方法，被Number的实例继承

>> #### 示例：
```javascript
// 定义自定义方法
Number.prototype.add = function (x) {
    return this + x;
};
// 调用方法
(8).add(2); // 10
```

>> #### 示例：
```javascript
// 通过方括号运算符也可以调用自定义方法
// 此时的数值不需要使用方括号
8['add'](2); // "10.00"
```
