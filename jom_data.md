# 时间
Date对象是JavaScript提供的日期和时间的操作接口。它有多种用法。
***

## 时间的概述
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

## 时间的类型转换
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

## 时间的运算
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

## 时间对象的方法

## 时间实例对象的方法


