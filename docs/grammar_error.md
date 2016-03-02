# Grammar 异常处理
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
	// 自定义错误类型
	if(x == ""){
  	    throw "null";
    }
    if(isNaN(x)){
  	    throw "no number";
    }
    if(x > 10){
  	    throw "too big";
    }
    if(x < 5){
  	    throw "too small";
    }
    // 无异常时执行的函数
    foo(x);
} catch(err) {
	// 显示未自定义的错误类型
	console.log("出现错误：\n\n" + err);
}
function foo(x){
	console.log(2*x);
}
```
