# Grammar 函数
编写可重复使用的代码块
***

## 函数的编写
> * 函数就是包裹在花括号中的代码块，前面使用了关键词 function。
> * JavaScript 对大小写敏感。关键词 function 必须是小写的，并且必须以与函数名称相同的大小写来调用函数。
> * 当您声明函数时，请把参数作为变量来声明，可以发送任意多的参数，由逗号 (,) 分隔。
> * 通过使用 return 语句就可以实现函数将值返回调用它的地方。

>> 语法1
>> ```javascript
function example(a, b)
{
	var a = arguments[0] ? arguments[0] : 1; // 设置参数a的默认值为1
    var b = arguments[1] ? arguments[1] : 2; // 设置参数b的默认值为2
    return a + b;
}
```

>> 语法2
>> ```javascript
function example()
{
	var a = arguments[0] ? arguments[0] : 1; // 设置参数a的默认值为1
    var b = arguments[1] ? arguments[1] : 2; // 设置参数b的默认值为2
    return a + b;
}
```

>> 语法3
>> ```javascript
function example(a, b)
{
	a = a || 1; // 设置参数a的默认值为1
	b = b || 2; // 设置参数b的默认值为2
    return a + b;
}
```

>> 语法4
>> ```javascript
function example(a, b)
{
	if(!a) a = 1; // 设置参数a的默认值为1
	if(!b) b = 2; // 设置参数b的默认值为2
	return a + b;
}
```
