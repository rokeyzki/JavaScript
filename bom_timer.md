# BOM 定时
JavaScript提供定时执行代码的功能，叫做定时器（timer）
***

## 定时的方法
> ### window.setTimeout()
>> #### 说明：
* setTimeout函数用来指定某个函数或某段代码，在多少毫秒之后执行
* 它返回一个整数，表示定时器的编号，以后可以用来取消这个定时器
* setTimeout函数接受两个参数，第一个参数func|code是将要推迟执行的函数名或者一段代码，第二个参数delay是推迟执行的毫秒数
* HTML5标准规定，setTimeOut推迟执行的时间，最少是4毫秒，如果小于这个值，会被自动增加到4
* HTML5标准规定，setTimeOut推迟执行的时间，最多是2147483647毫秒（24.8天），如果大于这个值，会发生溢出，导致回调函数将在当前任务队列结束后立即执行

>> #### 示例：
```javascript
// 格式
var timerId = setTimeout(func|code, delay)；
// 需要注意的是，推迟执行的代码必须以字符串的形式，放入setTimeout，因为引擎内部使用eval函数，将字符串转为代码。
setTimeout('console.log(2)', 1000);
/**
 * 如果推迟执行的是函数，则可以直接将函数名，放入setTimeout
 * 一方面eval函数有安全顾虑
 * 另一方面为了便于JavaScript引擎优化代码，setTimeout方法一般总是采用函数名的形式，就像下面这样
 */
function f(){
    console.log(2);
}
setTimeout(f, 1000);
// 或者
setTimeout(function(){console.log(2)}, 1000);
```

> ### window.clearTimeout()
>> #### 说明：
* setTimeout函数返回一个表示计数器编号的整数值，将该整数传入clearTimeout函数，就可以取消对应的定时器

>> #### 示例：
```javascript
var id1 = setTimeout(f, 1000);
clearTimeout(id1);
```

> ### window.setInterval()
>> #### 说明：
* setInterval函数的用法与setTimeout完全一致，区别仅仅在于setInterval指定某个任务每隔一段时间就执行一次，也就是无限次的定时执行
* setInterval指定的是“开始执行”之间的间隔，并不考虑每次任务执行本身所消耗的事件。因此实际上，两次执行之间的间隔会小于指定的时间
* 比如，setInterval指定每100ms执行一次，每次执行需要5ms，那么第一次执行结束后再过95毫秒，第二次执行就会开始。如果某次执行耗时特别长，比如需要105毫秒，那么它结束后，下一次执行就会立即开始
* HTML5标准规定，setInterval的最短间隔时间是10毫秒，也就是说，小于10毫秒的时间间隔会被调整到10毫秒

>> #### 示例：
```javascript
// 下面代码表示每隔1000毫秒就输出一个2
var i = 1
var timer = setInterval(function() {
    console.log(2);
}, 1000);
```

> ### window.clearInterval()
>> #### 说明：
* setInterval函数返回一个表示计数器编号的整数值，将该整数传入clearInterval函数，就可以取消对应的定时器

>> #### 示例：
```javascript
var id2 = setInterval(f, 1000);
clearInterval(id2);
```
