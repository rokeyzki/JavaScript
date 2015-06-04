# JOM 日期
Date对象是JavaScript提供的日期和时间的操作接口。它有多种用法。
***

## 日期的概述
> ### 说明：
* 作为一个函数，Date对象可以直接调用，返回一个当前日期和时间的字符串
* 无论有没有参数，直接调用Date总是返回当前时间

> ### 示例：
```javascript
// 直接调用Date总是返回当前时间的时间字符串
Date(); // "Sat Mar 09 2013 08:46:54 GMT+0800 (CST)"
Date(2000, 1, 1); // "Sat Mar 09 2013 08:46:54 GMT+0800 (CST)"
// 时间字符串解析：
// 星期、月份、日期、年份、时、分、秒、时区
"Sat Mar 09 2013 08:46:54 GMT+0800 (CST)"
// 常用时间单词对照
/*
关于星期的英语单词
星期日：Sunday (缩写Sun)
星期一：Monday (缩写Mon)
星期二：Tuesday (缩写Tues)
星期三：Wednesday (缩写Wed)
星期四：Thursday (缩写Thur)
星期五：Friday (缩写Fri)
星期六：Saturday (缩写Sat)
关于月份的英语单词
一月：January (缩写Jan)
二月：February (缩写Feb)
三月：March (缩写Mar)
四月：April (缩写Apr)
五月：May (缩写May)
六月：June (缩写Jun)
七月：July (缩写Jul)
八月：August (缩写Aug)
九月：September (缩写Sep)
十月：October (缩写Oct)
十一月：November (缩写Nov)
十二月：December (缩写Dec)
*/
```
---

> ### 说明：
* Date对象还是一个构造函数，对它使用new命令，会返回一个Date对象的实例
* 如果不加参数，生成的就是代表当前时间的对象

> ### 示例：
```javascript
var today = new Date();
today // Sat Mar 09 2013 08:46:54 GMT+0800 (CST)
// 等同于
today.toString() // Sat Mar 09 2013 08:46:54 GMT+0800 (CST)
```
---

> ### 说明：
* Date对象接受从1970年1月1日00:00:00 UTC开始计算的毫秒数作为参数
* 这意味着如果将Unix时间戳作为参数，必须将Unix时间戳乘以1000

> ### 示例：
```javascript
new Date(1378218728000) // Tue Sep 03 2013 22:32:08 GMT+0800 (CST)
// 1970年1月2日的零时
var Jan02_1970 = new Date(3600*24*1000); // Fri Jan 02 1970 08:00:00 GMT+0800 (CST)
// 1969年12月31日的零时
var Dec31_1969 = new Date(-3600*24*1000); // Wed Dec 31 1969 08:00:00 GMT+0800 (CST)
```
---

> ### 说明：
* Date对象还接受一个日期字符串作为参数，返回所对应的时间
* 所有可以被Date.parse()方法解析的日期字符串，都可以当作Date对象的参数

> ### 示例：
```javascript
// 以下表达式都是返回 Fri Feb 15 2013 08:00:00 GMT+0800 (CST)
new Date("2013-02-15")
new Date("2013-FEB-15")
new Date("FEB, 15, 2013")
new Date("FEB 15, 2013")
new Date("Feberuary, 15, 2013")
new Date("Feberuary 15, 2013")
new Date("15, Feberuary, 2013")
```
---

> ### 说明：
* 在多个参数的情况下，Date对象将其分别视作对应的年、月、日、小时、分钟、秒和毫秒
* 如果采用这种用法，最少需要指定两个参数（年和月），其他参数都是可选的，默认等于0
* 如果只使用年一个参数，Date对象会将其解释为毫秒数

> ### 示例：
```javascript
new Date(2013) // Thu Jan 01 1970 08:00:02 GMT+0800 (CST)
new Date(2013,0) // Tue Jan 01 2013 00:00:00 GMT+0800 (CST)
new Date(2013,0,1) // Tue Jan 01 2013 00:00:00 GMT+0800 (CST)
new Date(2013,0,1,0) // Tue Jan 01 2013 00:00:00 GMT+0800 (CST)
new Date(2013,0,1,0,0,0,0) // Tue Jan 01 2013 00:00:00 GMT+0800 (CST)
```

## 日期的类型转换
> ### 说明：
* Date对象有`时间字符串`与`毫秒时间戳`两种类型转换形式
* `时间字符串`形式的Date对象需要使用`toString`方法来转换为字符串
* `毫秒时间戳`形式的Date对象需要使用`now`方法来转换为数字（因为JS使用的是时间单位是毫秒，所以输出的数据等于对应Unix时间戳的1000倍）

> ### 示例：
```javascript
// 时间字符串
new Date("2015-05-19").toString() // "Tue May 19 2015 08:00:00 GMT+0800 (CST)"
// 毫秒时间戳
Date.parse("2015-05-19") // 1431993600000
```

## 日期的运算
> ### 说明：
* 如果两个日期对象实例进行加法运算，返回的就是它们连接后的字符串
* 如果两个日期对象实例进行减法运算，返回的就是它们间隔的毫秒数

> ### 示例：
```javascript
var then = new Date(2015, 4, 1);
var now = new Date(2015, 5, 19);
// 加法运算
now + then // "Fri Jun 19 2015 00:00:00 GMT+0800 (CST)Fri May 01 2015 00:00:00 GMT+0800 (CST)"
// 减法运算
now - then // 4233600000
```

## 日期对象的方法
> ### 说明：
* Date对象可以直接调用的方法

> ### Date.now() 方法
>> #### 说明：
* now方法返回当前距离1970年1月1日 00:00:00 UTC的毫秒数（Unix时间戳乘以1000）

>> #### 示例：
```javascript
Date.now() // 1364026285194
```

> ### Date.parse() 方法
>> #### 说明：
* parse方法用来解析日期字符串，返回距离1970年1月1日 00:00:00的毫秒数

>> #### 示例：
```javascript
// 以下示例都是返回 807897600000
Date.parse("Aug 9, 1995")
Date.parse("January 26, 2011 13:51:50")
Date.parse("Mon, 25 Dec 1995 13:30:00 GMT")
Date.parse("Mon, 25 Dec 1995 13:30:00 +0430")
Date.parse("2011-10-10")
Date.parse("2011-10-10T14:48:00")
// 如果解析失败，返回NaN
Date.parse("xxx") // NaN
```

> ### Date.UTC() 方法
>> #### 说明：
* 默认情况下，Date对象返回的都是当前时区的时间。Date.UTC方法可以返回UTC时间（世界标准时间）* 该方法返回当前距离1970年1月1日 00:00:00 UTC的毫秒数

>> #### 示例：
```javascript
// 使用的格式
Date.UTC(year, month[, date[, hrs[, min[, sec[, ms]]]]])
Date.UTC(2011,0,1,2,3,4,567) // 1293847384567
```

## 日期实例对象的方法
> ### 说明：
* 需要先实例化Date对象才可以调用的方法

> ### Date.prototype.set 系列方法
>> #### 说明：
* Date对象提供了一系列set方法，用来设置实例对象的各个方面
* Date.prototype.setTime(milliseconds)：设置毫秒时间戳
* Date.prototype.setFullYear(year [, month, date])：设置四位年份
* Date.prototype.setMonth(month [, date])：设置月份（0-11）
* Date.prototype.setDate(date)：设置实例对象对应的每个月的几号（1-31），返回改变后毫秒时间戳
* Date.prototype.setHours(hour [, min, sec, ms])：设置小时（0-23）
* Date.prototype.setMinutes(min [, sec, ms])：设置分钟（0-59）
* Date.prototype.setSeconds(sec [, ms])：设置秒（0-59）
* Date.prototype.setMilliseconds()：设置毫秒（0-999）
* 该方法需要先实例化Date对象

>> #### 示例：
```javascript
var d = new Date ("January 6, 2013");
d // Sun Jan 06 2013 00:00:00 GMT+0800 (CST)
d.setDate(9) // 1357660800000
d // Wed Jan 09 2013 00:00:00 GMT+0800 (CST)
```

>> #### 说明：
* set方法的参数都会自动折算
* 以setDate为例，如果参数超过当月的最大天数，则向下一个月顺延
* 如果参数是负数，表示从上个月的最后一天开始减去的天数

>> #### 示例：
```javascript
var d = new Date("January 6, 2013");
d.setDate(32) // 1359648000000
d // Fri Feb 01 2013 00:00:00 GMT+0800 (CST)
var d = new Date ("January 6, 2013");
d.setDate(-1) // 1356796800000
d // Sun Dec 30 2012 00:00:00 GMT+0800 (CST)
// 使用setDate方法，可以算出今天过后1000天是几月几日
var d = new Date()
d.setDate( d.getDate() + 1000 )
d.toString() // "Tue Feb 13 2018 22:04:10 GMT+0800 (CST)"
```

> ### Date.prototype.get 系列方法
>> #### 说明：
* Date对象提供了一系列get方法，用来获取实例对象某个方面的值
* Date.prototype.getTime()：返回实例对象距离1970年1月1日00:00:00对应的毫秒数，等同于valueOf方法
* Date.prototype.getFullYear()：返回四位的年份
* Date.prototype.getMonth()：返回月份（0表示1月，11表示12月）
* Date.prototype.getDate()：返回实例对象对应每个月的几号（从1开始）
* Date.prototype.getDay()：返回星期，星期日为0，星期一为1，以此类推
* Date.prototype.getHours()：返回小时（0-23）
* Date.prototype.getMinutes()：返回分钟（0-59）
* Date.prototype.getSeconds()：返回秒（0-59）
* Date.prototype.getMilliseconds()：返回毫秒（0-999）
* Date.prototype.getTimezoneOffset()：返回当前时间与UTC的时区差异，以分钟表示，返回结果考虑到了夏令时因素
* 该方法需要先实例化Date对象

>> #### 示例
```javascript
var d = new Date("January 6, 2013");
d.getDate() // 6
d.getMonth() // 0
d.getFullYear() // 2013
d.getTimezoneOffset() // -480
```

> ### Date.prototype.toString() 方法
>> #### 说明：
* toString方法返回一个完整的时间字符串
* 该方法需要先实例化Date对象

>> #### 示例：
```javascript
var today = new Date(1362790014000);
today // Sat Mar 09 2013 08:46:54 GMT+0800 (CST)
today.toString() // "Sat Mar 09 2013 08:46:54 GMT+0800 (CST)"
```

> ### Date.prototype.toUTCString() 方法、Date.prototype.toISOString() 方法
>> #### 说明：
* toUTCString方法返回对应的UTC时间，也就是比北京时间晚8个小时
* toISOString方法返回对应时间的ISO8601写法
* 该方法需要先实例化Date对象

>> #### 示例：
```javascript
var today = new Date(1362790014000);
today.toUTCString() // "Sat, 09 Mar 2013 00:46:54 GMT"
today.toISOString() // "2013-03-09T00:46:54.000Z"
```

> ### Date.prototype.toDateString() 方法、Date.prototype.toTimeString() 方法
>> #### 说明：
* toDateString方法返回日期的字符串形式
* toTimeString方法返回时间的字符串形式
* 该方法需要先实例化Date对象

>> #### 示例：
```javascript
var today = new Date(1362790014000);
today.toDateString() // "Sat Mar 09 2013"
today.toTimeString() // "08:46:54 GMT+0800 (CST)"
```

> ### Date.prototype.toLocalDateString() 方法、Date.prototype.toLocalTimeString() 方法
>> #### 说明：
* toLocalDateString方法返回一个字符串，代表日期的当地写法
* toLocalTimeString方法返回一个字符串，代表时间的当地写法
* 该方法需要先实例化Date对象

>> #### 示例：
```javascript
var today = new Date(1362790014000);
today.toLocaleDateString() // "2013/3/9" or "2013年3月9日"
today.toLocaleTimeString() // "上午8:46:54"
```

> ### Date.prototype.valueOf() 方法
>> #### 说明：
* valueOf方法返回实例对象距离1970年1月1日00:00:00 UTC对应的毫秒数
* 该方法等同于getTime方法
* 该方法需要先实例化Date对象

>> #### 示例：
```javascript
var today = new Date()
today.valueOf() // 1432128774987
today.getTime() // 1432128774987
```

> ### Date.prototype.toJSON() 方法
>> #### 说明：
* toJSON方法返回JSON格式的日期对象
* 该方法需要先实例化Date对象

>> #### 示例：
```javascript
var jsonDate = (new Date()).toJSON();
jsonDate // "2015-05-20T13:36:13.078Z"
```


