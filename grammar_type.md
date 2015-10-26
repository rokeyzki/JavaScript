# Grammar 数据类型
五种原始类型，N种对象类型
***

## 数据类型的种类
> ### 五种原始类型
>> 1. undefined
>> 2. null
>> 3. boolean 布尔
>> 4. number 数值
>> 5. string 字符

> ### N种对象类型
>> 1. function 函数
>> 2. array 数组
>> 3. date 日期
>> 4. ...

## 数据类型的判断
> ### 基本判断
>> #### 说明：
* 使用typeof，能区分原始类型与对象类型
* 使用typeof，可以细分全部原始类型数据（undefined、null、boolean、string、number）
* 使用typeof，只能细分部分对象类型数据（object、function）

>> #### 示例：
```javascript
typeof 123 === 'number';
typeof NaN === 'number';
typeof '' === 'string';
typeof (typeof 123) === 'string';
typeof true === 'boolean';
typeof xxx === 'undefined';
typeof {空或者不空都可} === 'object';
typeof [空或者不空都可] === 'object';
typeof new Date() === 'object'; // Boolean(), Number(), String()同理
typeof function(){} === 'function';
```

> ### 精细判断
>> #### 说明：
* 自定义`_typeof()`函数，用于支持所有JS数据类型的判断（undefined、null、boolean、string、number、function、array、date、regexp、object、error）

>> #### 示例：
```javascript
// _typeof()函数写法
var class2type = {} ;
"Boolean Number String Function Array Date RegExp Object Error".split(" ").forEach(function(e,i){
    class2type[ "[object " + e + "]" ] = e.toLowerCase();
}) ;
function _typeof(obj){
    if ( obj == null ){
        return String( obj );
    }
    return typeof obj === "object" || typeof obj === "function" ?
        class2type[ class2type.toString.call(obj) ] || "object" :
        typeof obj;
}
// 使用结果
_typeof(new String()) // "string"
_typeof("123") // "string"
_typeof(new RegExp()) // "regexp"
_typeof(null) // "null"
```

