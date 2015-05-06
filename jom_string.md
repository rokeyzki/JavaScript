# 字符串
***

## 字符串的包装对象
> ### 说明：
* String对象是JavaScript原生提供的三个包装对象之一，用来生成字符串的包装对象实例

> ### 示例：
```javascript
var s = new String("abc");
typeof s // "object"
s.valueOf() // "abc"
// 暂不介绍fromCharCode()、charCodeAt() 等字符编码相关的方法
```

## 字符串的属性
> ### length 属性
>> #### 说明：
* 该属性返回字符串的长度

>> #### 示例：
```javascript
"abc".length // 3
```

## 字符串的普通方法
> ### charAt 方法
>> #### 说明：
* charAt方法返回一个字符串的给定位置的字符，位置从0开始编号

>> #### 示例：
```javascript
var s = "abc";
s.charAt(1); // "b"
s.charAt(s.length - 1); // "c"
```

>> #### 示例：
```javascript
// 这个方法可以用数组下标替代
"abc"[1]; // "b"
```

> ### concat 方法
>> #### 说明：
* concat方法用于连接两个字符串
* 使用该方法后，原字符串不受影响，返回一个新字符串

>> #### 示例：
```javascript
var s1 = "abc";
var s2 = "def";
s1.concat(s2); // "abcdef"
s1; // "abc"
```

>> #### 示例：
```javascript
// 该方法可以接受多个字符串
"a".concat("b","c"); // "abc"
```

> ### substr 方法
>> #### 说明：
* substr方法用于截取字符串，生成子字符串
* 第一个参数是子字符串的开始位置
* 第二个参数是子字符串的长度

>> #### 示例：
```javascript
"Hello World".substr(3); // "lo World"
```

>> #### 示例：
```javascript
"Hello World".substr(3,7) // "lo Worl"
```

>> #### 示例：
```javascript
/*
 * 对于substr方法，如果参数为负
 * 负数出现在第一个参数，表示从尾部开始计算的字符位置
 * 负数出现在第二个参数，将被转为0
 */
"Hello World".substr(-2); // "ld"
"Hello World".substr(4,-2); // ""
```

> ### slice 方法、substring 方法
>> #### 说明：
* slice方法、substring方法也是用于截取字符串，生成子字符串
* 第一个参数是子字符串的开始位置
* 第二个参数是子字符串的结束位置
* slice方法与substring方法的区别在于，slice方法的两个参数按递增排序，substring方法的两个参数可以调换顺序

>> #### 示例：
```javascript
"Hello World".slice(3); // "lo World"
"Hello World".substring(3); // "lo World"
```

>> #### 示例：
```javascript
"Hello World".slice(3,7); // "lo W"
"Hello World".slice(7,3); // ""
"Hello World".substring(3,7); // "lo W"
"Hello World".substring(7,3); // "lo W"
```

>> #### 示例：
```javascript
/*
 * 对于slice方法，如果参数为负
 * 表示字符位置从尾部开始计算
 */
"Hello World".slice(-2) // "ld"
"Hello World".slice(4,-2); // "o Wor"
/*
 * 对于substring方法，如果参数为负
 * 会自动将负数转为0
 */
"Hello World".substring(-2); // "Hello World" 等于："Hello World".substring(0);
"Hello World".substring(4,-2); // "Hell" 等于："Hello World".substring(4, 0);
```

> ### indexOf 方法、lastIndexOf 方法
>> #### 说明：
* indexOf方法、lastIndexOf方法都是用于确定一个字符串在另一个字符串中的位置
* 如果返回-1，就表示不匹配
* indexOf方法与lastIndexOf方法的区别在于，indexOf从字符串头部开始匹配，lastIndexOf从尾部开始匹配

>> #### 示例：
```javascript
"hello world".indexOf("o"); // 4
"hello world".lastIndexOf("o"); // 7
```

>> #### 示例：
```javascript
/*
 * indexOf方法、lastIndexOf方法也可以接受第二个参数
 * 对于indexOf，表示从该位置开始向后匹配
 * 对于lastIndexOf，表示从该位置起向前匹配
 */
"hello world".indexOf("o", 6); // 7
"hello world".lastIndexOf("o", 6); // 4
```

> ### trim 方法
>> #### 说明：
* 该方法用于去除字符串两端的空格
* 该方法返回一个新字符串，不改变原字符串

>> #### 示例：
```javascript
"  hello world  ".trim(); // "hello world"
```

> ### toLowerCase 方法、toUpperCase 方法
>> #### 说明：
* toLowerCase方法、toUpperCase方法都是用于转换字符串的大小写
* toLowerCase方法与toUpperCase方法的区别在于，toLowerCase用于将字符串转为小写，toUpperCase用于将字符串转为大写

>> #### 示例：
```javascript
"Hello World".toLowerCase(); // "hello world"
"Hello World".toUpperCase(); // "HELLO WORLD"
```

> ### localeCompare 方法
>> #### 说明：
* 该方法用于比较两个字符串
* 它返回一个数字
* 如果小于0，表示第一个字符串小于第二个字符串
* 如果等于0，表示两者相等
* 如果大于0，表示第一个字符串大于第二个字符串
* 该方法提供的比较字符串的方法，考虑了默认的本地排序规则

>> #### 示例：
```javascript
'apple'.localeCompare('banana'); // -1
'apple'.localeCompare('apple'); // 0
```

## 字符串的正则方法
