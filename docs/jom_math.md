# JOM 计算
Math对象是JavaScript的内置对象，提供一系列数学常数和计算方法。

该对象不是构造函数，所以不能生成实例，所有的属性和方法都必须在Math对象上调用。
***

## 计算的属性
> ### 说明：
* Math对象提供以下一些只读的数学常数
* E：常数e
* LN2：2的自然对数
* LN10：10的自然对数
* LOG2E：以2为底的e的对数
* LOG10E：以10为底的e的对数
* PI：常数Pi
* SQRT1_2：0.5的平方根
* SQRT2：2的平方根

> ### 示例：
```javascript
// 因为使用率不高，暂不介绍
```

## 计算对象的方法
> ### 说明
* Math对象可以直接调用的方法

> ### Math.random() 方法
>> #### 说明：
* random方法返回0到1之间的一个伪随机数，可能等于0，但是一定小于1

>> #### 示例：
```javascript
Math.random() // 0.7151307314634323
// 返回给定范围内的随机数
function getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
}
// 返回给定范围内的随机整数
function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
```

> ### Math.round() 方法
>> #### 说明：
* round方法用于四舍五入

>> #### 示例：
```javascript
Math.round(0.1); // 0
Math.round(0.5); // 1
```

>> #### 示例：
```javascript
// 它对于负值的运算结果与正值略有不同，主要体现在对.5的处理
Math.round(-1.1); // -1
Math.round(-1.5); // -1
```

> ### Math.abs() 方法
>> #### 说明：
* abs方法返回参数值的绝对值

>> #### 示例：
```javascript
Math.abs(1); // 1
Math.abs(-1); // 1
```

> ### Math.max() 方法、Math.min() 方法
>> #### 说明：
* max方法返回最大的参数
* min方法返回最小的参数

>> #### 示例：
```javascript
Math.max(2, -1, 5); // 5
Math.min(2, -1, 5); // -1
```

> ### Math.floor() 方法、Math.ceil() 方法
>> #### 说明：
* floor方法返回小于参数值的最大整数
* ceil方法返回大于参数值的最小整数

>> #### 示例：
```javascript
// 返回小于参数值的最大整数
Math.floor(3.2); // 3
Math.floor(-3.2); // -4
// 返回大于参数值的最小整数
Math.ceil(3.2); // 4
Math.ceil(-3.2); // -3
```

> ### Math.pow() 方法、Math.sqrt() 方法
>> #### 说明：
* power方法返回以第一个参数为底数、第二个参数为幂的指数值
* sqrt方法法返回参数值的平方根。如果参数是一个负值，则返回NaN

>> #### 示例：
```javascript
// 幂次方
Math.floor(3.2); // 3
Math.floor(-3.2); // -4
// 开平方
Math.sqrt(4); // 2
Math.sqrt(-4); // NaN
```

> ### Math.log() 方法、Math.exp() 方法
>> #### 说明：
* log方法返回以e为底的自然对数值
* exp方法返回常数e的参数次方

>> #### 示例：
```javascript
Math.log(Math.E); // 1
Math.log(10); // 2.302585092994046
Math.exp(1); // 2.718281828459045
Math.exp(3); // 20.085536923187668
```

> ### Math.sin()/cos()/tan() 三角函数方法
>> #### 说明：
* sin方法返回参数的正弦，asin方法返回参数的反正弦
* cos方法返回参数的余弦，acos方法返回参数的反余弦
* tan方法返回参数的正切，atan方法返回参数的反正切

>> #### 示例：
```javascript
Math.sin(0) // 0
Math.cos(0) // 1
Math.tan(0) // 0
Math.asin(1) // 1.5707963267948966
Math.acos(1) // 0
Math.atan(1) // 0.7853981633974483
```



