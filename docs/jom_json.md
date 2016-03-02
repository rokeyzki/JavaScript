# JOM 格式
JSON格式（JavaScript Object Notation的缩写）是一种用于数据交换的文本格式
***

## 格式的标准
> ### 说明：
* 数组或对象的每个成员的值，可以是简单值，也可以是复合值
* 简单值分为四种：字符串、数值（必须以十进制表示）、布尔值和null（NaN, Infinity, -Infinity和undefined都会被转为null）。
* 复合值分为两种：符合JSON格式的对象和符合JSON格式的数组
* 数组或对象最后一个成员的后面，不能加逗号
* 数组或对象之中的字符串必须使用双引号，不能使用单引号
* 对象的成员名称必须使用双引号

> ### 示例：
```javascript
// 以下是合格的JSON值
["one", "two", "three"]
{ "one": 1, "two": 2, "three": 3 }
{"names": ["张三", "李四"] }
[ { "name": "张三"}, {"name": "李四"} ]
// 以下是不合格的JSON值
{ name: "张三", 'age': 32 }  // 属性名必须使用双引号
[32, 64, 128, 0xFFF] // 不能使用十六进制值
{ "name": "张三", age: undefined } // 不能使用undefined
{ "name": "张三",
    "birthday": new Date('Fri, 26 Aug 2011 07:13:10 GMT'),
    "getName": function() {
        return this.name;
    }
} // 不能使用函数和日期对象
```

## 格式对象的方法
> ### 说明：
* JSON对象可以直接调用的方法

> ### JSON.stringify() 方法
>> #### 说明
* JSON.stringify方法用于将一个对象转为JSON字符串
* 转换后的字符串符合JSON格式，并且可以被JSON.parse方法还原

>> #### 示例
```javascript
JSON.stringify("abc") // '"abc"'
JSON.stringify(1) // "1"
JSON.stringify(false) // "false"
JSON.stringify([]) // "[]"
JSON.stringify({}) // "{}"
JSON.stringify([1, "false", false]) // '[1,"false",false]'
JSON.stringify({ name: "张三" }) // '{"name":"张三"}'
```

>> #### 示例
```javascript
// JSON.stringify方法还可以接受一个数组参数，指定需要转成字符串的属性
JSON.stringify({ a:1, b:2 }, ['a']) // '{"a":1}'
```

>> #### 示例
```javascript
// 如果JSON.stringify方法处理的对象，包含一个toJSON方法，则它会使用这个方法得到一个值，然后再将这个值转成字符串，而忽略其他成员
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

> ### JSON.parse() 方法
>> #### 说明
* JSON.parse方法用于将JSON字符串转化还原成对象

>> #### 示例
```javascript
JSON.parse('{}') // {}
JSON.parse('true') // true
JSON.parse('"foo"') // "foo"
JSON.parse('[1, 5, "false"]') // [1, 5, "false"]
JSON.parse('null') // null
var o = JSON.parse('{"name":"张三"}');
o.name // 张三
```

>> #### 示例
```javascript
// 如果传入的字符串不是有效的JSON格式，JSON.parse方法将报错
JSON.parse("'String'") // SyntaxError: Unexpected token ILLEGAL
// 上面代码中，双引号字符串中是一个单引号字符串，因为单引号字符串不符合JSON格式，所以报错
```
