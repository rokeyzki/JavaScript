# Grammar 错误
用于代码的测试与错误捕捉
***

## 错误的测试和捕捉
> * try 语句允许我们定义在执行时进行错误测试的代码块。
> * catch 语句允许我们定义当 try 代码块发生错误时，所执行的代码块。
> * JavaScript 语句 try 和 catch 是成对出现的。

>> 语法
>> ```javascript
try {
	// 在这里运行测试代码
	adddlert("Welcome guest!");
} catch(err) {
	// 在这里处理错误
	console.log("出现错误：\n\n不存在的函数");
}
```

## 错误类型的自定义
> * throw 语句允许我们创建自定义错误。
> * 正确的技术术语是：抛出（throw）异常（exception）。
> * 如果把 throw 与 try 和 catch 一起使用，那么您能够控制程序流，并生成自定义的错误消息。

>> 语法
>> ```javascript
try {
	// 在这里运行代码
	var x = 11;
	// 定义错误类型
	if(x == "")     throw "值为空";
	if(isNaN(x)) 	throw "不是数字";
	if(x > 10)      throw "太大";
	if(x < 5)       throw "太小";
} catch(err) {
	//在这里处理错误
	console.log("出现错误：\n\n" + err);
}
```
