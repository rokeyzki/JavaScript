title: underscore源码通读（一）
date: 2015-10-27 20:51:00
tags:
---

> underscore 源码版本 1.8.2



# 起因



很多人向我推荐研究js，可以看看一些第三方js类库的源码，而源码之中最好解读也最简短的就是underscore，它也是我平常比较喜欢的一个库，因为它性价比高：体积小、能力强。打开一看，才1000多行，试着读了一下，确实很值得一看，所以对精彩部分做了一下整理。



# 闭包



整个函数在一个闭包中，避免污染全局变量。通过传入this（其实就是window对象）来改变函数的作用域。和jquery的自执行函数其实是异曲同工之妙。这种传入全局变量的方式一方面有利于代码阅读，另一方面方便压缩。



underscore写法：

```javascript

(function(){ 

    ...

}.call(this));

```

<!-- more --> 

jquery写法：

```javascript

(function(window, undefined) { 

    ...

})(window);

```



# 原型赋值



```javascript

18 var ArrayProto = Array.prototype, ObjProto = Object.prototype, FuncProto = Function.prototype;

```



`Array`,`Object`,`Function` 这些本质都是函数，获取函数原型属性prototype

也是为了便于压缩。简单解释一下，如果代码中要扩展属性，可能这样写



```javascript

Object.prototype.xxx = ...

```



而这种代码是不可压缩的，Object,prototype这些名字改了浏览器就不认得了。



但是上面的代码中创建了ObjProto之后，源生代码经过压缩之后，ObjProto就可能命名成a变量，那么原来的代码就压缩成



```javascript

a.xxx = ...

```



一个小建议就是凡事一段代码被使用两次以上都建议定义变量(函数)，有利于修改和压缩代码。



# 格式



```javascript

29 var

nativeIsArray = Array.isArray,

nativeKeys = Object.keys,

nativeBind = FuncProto.bind,

nativeCreate = Object.create;

```



这种定义的方式省略了多余的var，格式也美观，让我想到了sublime中的一个插件alignment。



# 数据判断



```javascript

1194 _.isElement = function(obj) { 

    return !!(obj && obj.nodeType === 1); 

};

```



判断是否为dom，dom的nodeType属性值为1。这里用!!强转为boolean值



```javascript

1200 _.isArray = nativeIsArray || function(obj) { 

    return toString.call(obj) === '[object Array]'; 

};

```



判断是否为数组。由于Array.isArray函数是ECMAScript 5新增函数，所以为了兼容之前的版本，在原生判断函数不存在的情况下，后面重写了一个判断函数。用call函数来改变作用域可以避免当obj没有toString函数报错的情况。



```javascript

1205 _.isObject = function(obj) { 

    var type = typeof obj; 

    return type === 'function' || type === 'object' && !!obj;

};

```



判断是否为对象。先用typeof判断数据类型。函数也属于对象，但是由于typeof null也是object，所以用!!obj来区分这种情况。



```javascript

1219 if (!_.isArguments(arguments)) {

    _.isArguments = function(obj) { 

        return _.has(obj, 'callee');

    };

}

```



判断是否为arguments,很简单，arguments有个特有属性callee。



```javascript

1239 _.isNaN = function(obj) {

    return _.isNumber(obj) && obj !== +obj; 

};

```



NaN这个值有两个特点：1.它是一个数；2.不等于它自己。



‘+’放在变量前面一般作用是把后面的变量变成一个数，在这里已经判断为一个数仍加上’+’，是为了把var num = new Number()这种没有值的数字也归为NaN。



```javascript

1244 _.isBoolean = function(obj) {

    return obj === true || obj === false || toString.call(obj) === '[object Boolean]';

};

```



是不是以为如果是布尔值不是true就是false？还有第3中情况var b = new Boolean()。b也是布尔值。



```javascript

1254 _.isUndefined = function(obj) {

    return obj === void 0;

};

```



用void 0来表示undefined，非常有意思的小技巧。不过常用方式还是if(xxx)来判断是不是undefined。



eq是underscore的一个内置函数，代码太长，不粘贴了。isEmpty调用了这个函数。整个思路由易到难，先用===比较简单数据，然后用toString来判断是否相等，最后用递归处理复杂的Array、Function和Object对象。



```javascript

1091 if (a === b) return a !== 0 || 1 / a === 1 / b;

```



这里为了区分’+0’和’-0’，因为这两个数对计算结果是有影响的。



```javascript

if (className !== toString.call(b)) return false;

switch (className) { 

        // Strings, numbers, regular expressions, dates, and booleans are compared by value. 

    case '[object RegExp]': 

        // RegExps are coerced to strings for comparison (Note: '' + /a/i === '/a/i')

    case '[object String]': 

        // Primitives and their corresponding object wrappers are equivalent; thus, `"5"` is 

        // equivalent to `new String("5")`. 

        return '' + a === '' + b; 

    case '[object Number]': 

        // `NaN`s are equivalent, but non-reflexive. 

        // Object(NaN) is equivalent to NaN if (+a !== +a) 

        return +b !== +b; 

        // An `egal` comparison is performed for other numeric values. 

        return +a === 0 ? 1 / +a === 1 / b : +a === +b; 

    case '[object Date]': 

    case '[object Boolean]': 

        // Coerce dates and booleans to numeric primitive values. Dates are compared by their 

        // millisecond representations. Note that invalid dates with millisecond representations 

        // of `NaN` are not equivalent. 

        return +a === +b;

}

```



这里是对简单对象进行判断，分为两类，一类是String和RegExp，这种数据直接toString然后判断。另一类是Number、Date和Boolean，通过转换成数字判断。



```javascript

1150 aStack.push(a);

bStack.push(b);

if (areArrays) { 

    length = a.length; 

    if (length !== b.length) return false; 

    while (length--) { 

        if (!eq(a[length], b[length], aStack, bStack)) return false; 

    }

} else { 

    var keys = _.keys(a), key;

    length = keys.length; 

    if (_.keys(b).length !== length) return false; 

    while (length--) { 

        key = keys[length]; 

        if (!(_.has(b, key) && eq(a[key], b[key], aStack, bStack))) return false;   

    }

}

aStack.pop();

bStack.pop();

```



对于数组和对象只能用递归了，同时用aStack和bStack来暂存递归中的子对象。这里一个小技巧的就是先判断数组/属性的长度，如果不相等可以有效地减少递归。

