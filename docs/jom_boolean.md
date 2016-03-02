# JOM 布尔
Boolean对象是JavaScript的三个包装对象之一
***

## 布尔的包装对象
> ### 说明：
* 作为构造函数，它主要用于生成布尔值的包装对象的实例

> ### 示例：
```javascript
var b = new Boolean(true);
typeof b // "object"
b.valueOf() // true
// 直接对变量赋值更简单清晰
var b = true;
```

## 布尔的类型转换作用
> ### 说明：
* Boolean对象除了可以作为构造函数，还可以单独使用，将任意值转为布尔值

> ### 示例：
```javascript
new Boolean(undefined).valueOf() // false
new Boolean(null).valueOf() // false
new Boolean(0).valueOf() // false
new Boolean('').valueOf() // false
new Boolean(NaN).valueOf() // false
new Boolean(1).valueOf() // true
new Boolean('false').valueOf() // true
new Boolean([]).valueOf() // true
new Boolean({}).valueOf() // true
new Boolean(function(){}).valueOf() // true
new Boolean(/foo/).valueOf() // true
```

> ### 示例：
```javascript
Boolean(undefined) // false
Boolean(null) // false
Boolean(0) // false
Boolean('') // false
Boolean(NaN) // false
Boolean(1) // true
Boolean('false') // true
Boolean([]) // true
Boolean({}) // true
Boolean(function(){}) // true
Boolean(/foo/) // true
```

> ### 示例：
```javascript
// 使用not运算符（!）也可以达到同样效果
!!undefined // false
!!null // false
!!0 // false
!!'' // false
!!NaN // false
!!1 // true
!!'false' // true
!![] // true
!!{} // true
!!function(){} // true
!!/foo/ // true
```

> ### 示例：
```javascript
// 综上所述，如果要获得一个变量对应的布尔值，有三种写法
var a = "hello world";
new Boolean(a).valueOf() // true
Boolean(a) // true
!!a // true
```

> ### 示例：
```javascript
// 对于一些特殊值，Boolean对象前面加不加new，会得到完全相反的结果，必须小心
if (Boolean(false)){
    console.log('true'); // 无输出
}
if (new Boolean(false)){
    console.log('true'); // true
}
if (Boolean(null)){
    console.log('true'); // 无输出
}
if (new Boolean(null)){
    console.log('true'); // true
}
```




