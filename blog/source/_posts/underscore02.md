title: underscore源码通读（二）
date: 2015-10-28 19:55:11
tags:
---

先看一下两个比较重要的内部函数



```javascript

63 var optimizeCb = function(func, context, argCount) {

    if (context === void 0) return func; 

    switch (argCount == null ? 3 : argCount) { 

        case 1: return function(value) { 

            return func.call(context, value); 

        }; 

        case 2: return function(value, other) { 

            return func.call(context, value, other); 

        }; 

        case 3: return function(value, index, collection) { 

            return func.call(context, value, index, collection); 

        }; 

        case 4: return function(accumulator, value, index, collection) { 

            return func.call(context, accumulator, value, index, collection); 

        }; 

    } 

    return function() { 

        return func.apply(context, arguments); 

    }; 

};

```

<!-- more --> 

这个函数是underscore内部很重要的函数，主要用来执行函数并改变所执行函数的作用域，最后加了一个argCount参数来指定参数个数，对参数个数小于等于4的情况进行分类处理。对不同参数的解释大概是：



- 1的情况一般是用在接受单值的情况，比如times,sortedIndex之类的函数。

- 2的情况据说是给比如jQuery,zepto事件绑定，代理什么的，但是在源代码中没有看到被调用。

- 3的情况用于迭代器函数，比如foreach,map,pick等。

- 4的情况用reduce和reduceRight函数。



```javascript

87 var cb = function(value, context, argCount) {

    if (value == null) return _.identity;

    if (_.isFunction(value)) return optimizeCb(value, context, argCount);

    if (_.isObject(value)) return _.matcher(value);

    return _.property(value);

};

```



这也是一个比较常用的内部函数，只是对参数进行了判断：如果是函数则返回上面说到的回调函数；如果是对象则返回一个能判断对象是否相等的函数；默认返回一个获取对象属性的函数。



```javascript

140 _.each = _.forEach = function(obj, iteratee, context) {

    iteratee = optimizeCb(iteratee, context);

    var i, length;

    if (isArrayLike(obj)) {

        for (i = 0, length = obj.length; i < length; i++) {

            iteratee(obj[i], i, obj);

        }

    } else {

        var keys = _.keys(obj);

        for (i = 0, length = keys.length; i < length; i++) {

            iteratee(obj[keys[i]], keys[i], obj);

        }

    }

    

    return obj;

};



// Return the results of applying the iteratee to each element.

_.map = _.collect = function(obj, iteratee, context) {

    iteratee = cb(iteratee, context);

    var keys = !isArrayLike(obj) && _.keys(obj),

    length = (keys || obj).length,

    results = Array(length);

    for (var index = 0; index < length; index++) {

        var currentKey = keys ? keys[index] : index;

        results[index] = iteratee(obj[currentKey], currentKey, obj);

    }



    return results;

};

```



从代码上看，each函数是包括map函数的，map只能处理对象，each可以处理对象和数组。至于forEach和collect在API文档中看不到，应该是为了兼容以前老版本做的别名处理。



```javascript

170 function createReduce(dir) {

    // Optimized iterator function as using arguments.length

    // in the main function will deoptimize the, see #1991.

    function iterator(obj, iteratee, memo, keys, index, length) {

        for (; index >= 0 && index < length; index += dir) {

            var currentKey = keys ? keys[index] : index;

            memo = iteratee(memo, obj[currentKey], currentKey, obj);

        }



        return memo;

    }



    return function(obj, iteratee, memo, context) {

        iteratee = optimizeCb(iteratee, context, 4);

        var keys = !isArrayLike(obj) && _.keys(obj),

        length = (keys || obj).length,

        index = dir > 0 ? 0 : length - 1;

        // Determine the initial value if none is provided.

        if (arguments.length < 3) {

            memo = obj[keys ? keys[index] : index];

            index += dir;

        }

        

        return iterator(obj, iteratee, memo, keys, index, length);

    };

}

```



这个是reduce和reduceRight调用的内部函数，将memo这个变量作为入参传递给iterator

函数，调用自定义的iteratee函数进行循环处理，每次处理完的结果都赋值给memo变量，最后返回memo变量的结果。这里有两个问题



- 为什么这里不按照常理逻辑来写代码而要用闭包呢？闭包大致有这么几个作用：避免命名冲突；私有化变量；变量持久化。这里的作用主要就是变量（函数）持久化，好处就是重复调用的时候不需要再重新创建函数，从而提升执行速度。

- 为什么要用两层闭包呢？第一层闭包持久化iterator函数，调用reduce和reduceRight函数避免重复新建函数。第二层闭包保存keys,index,length这些变量。



```javascript

263 _.invoke = function(obj, method) {

    var args = slice.call(arguments, 2);

    var isFunc = _.isFunction(method);

    return _.map(obj, function(value) {

        var func = isFunc ? method : value[method];

        return func == null ? func : func.apply(value, args);

    });

};

```



这里用slice.call(arguments, 2)来获取后面的不定参数，然后用func.apply(value, args)来传入该参数比较有意思。