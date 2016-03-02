title: underscore源码通读（三）
date: 2015-10-29 21:02:14
tags:
---

后面的代码真是越看越难理解，经常需要结合内部/接口函数一起，所以采用跳读的方式解析，基本按照模块由易到难的顺序解析。



```javascript

456  _.initial = function(array, n, guard) {

    return slice.call(array, 0, Math.max(0, array.length - (n == null || guard ? 1 : n)));

};

```



这个guard参数说是保证默认返回第一个值，不过我看了很久觉得意义不大，猜测可能是以前的接口。这里的slice = Array.prototype.slice。这里有两个地方比较好，一是用Array的原型函数来处理array参数，这样可以避免判断array是否数组，二是用max来避免超出数组长度。

<!-- more --> 

```javascript

671 _.range = function(start, stop, step) {

    if (arguments.length <= 1) {

        stop = start || 0;

        start = 0;

    }

    step = step || 1;



    var length = Math.max(Math.ceil((stop - start) / step), 0);

    var range = Array(length);



    for (var idx = 0; idx < length; idx++, start += step) {

        range[idx] = start;

    }



    return range;

};

```



这个函数本什没有什么特别的，只不过我在调用的时候将step赋值为小数，就出现了javascript著名的精度问题。网上应该有不少的解决方案，这里提供一种目前我在项目中用到的解决方法：将数字转为字符串在去小数点之后转为整数进行计算，计算完成后转字符串加上小数点再转成小数，举个例子



```

1.11 ==> "1.11" ==> "111" ==> 111

2.2 ==> "2.2" ==> "220" ==> 220

111+220 ==> 331 ==> "331" ==> "3.31" ==> 3.31

```



数组代码看得累了，从后面的看起吧~



```javascript

1269 _.noConflict = function() {

    root._ = previousUnderscore;

    return this;

};

```



这个让渡函数其实原理比较简单，就是初始化underscore前 previousUnderscore=window._

对原有对象进行储存，如果需要让渡避免冲突，则进行还原同时返回当前underscore对象。再来看看JQuery的实现原理：



```javascript

noConflict: function( deep ) {

    if ( window.$ === jQuery ) {

        window.$ = _$;

    }



    if ( deep && window.jQuery === jQuery ) {

        window.jQuery = _jQuery;

    }



    return jQuery;

}

```



刚开始看的时候犯2了，函数可以用===来比较？不是只能比较简单的数据对象？呵呵，其实这个是通过引用地址来判断的，因为之前初始化的时候window.$=JQuery 所以$会指向JQuery的地址，所以可以这样判断。后面一个if考虑到JQuery这个变量名也被占用的时候，也进行让渡，最后返回JQuery对象。可能是考虑多版本的情况吧~



```javascript

1487  _.mixin = function(obj) {

    _.each(_.functions(obj), function(name) {

        var func = _[name] = obj[name];

        _.prototype[name] = function() {

            var args = [this._wrapped];

            push.apply(args, arguments);

            return result(this, func.apply(_, args));

        };

    });

};



// Add all of the Underscore functions to the wrapper object.

_.mixin(_);

```



这个用于扩展underscore自身的接口函数，通过循环遍历对象来浅拷贝对象属性。这里考虑到函数的实例化，所以一方面将函数作为内部函数使用，同时扩展到prototype属性上。考虑得比较周全。



```javascript

1469  _.chain = function(obj) {

    var instance = _(obj);

    instance._chain = true;

    return instance;

};

```



这个函数让underscore支持链式调用，链式调用写起来很美观，但是调试略显不方便。结合之前的代码来看，underscore实现链式调用的基本原理是：将参数缓存在内部属性_wrapped中，调用函数时传入该属性值，执行后返回当前this指针。直到执行value函数时返回_wraped中的值。