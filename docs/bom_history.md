# BOM 历史
浏览器窗口有一个history对象，用来保存浏览历史
***

## 历史的属性
> ### length 属性
>> #### 说明：
* length属性记录history对象的数目，例如某窗口先后访问了三个地址，那么history对象就包括三项，length属性等于3

>> #### 示例：
```javascript
history.length // 3
```

> ### state 属性
>> #### 说明：
* state属性保存当前页面的state对象

>> #### 示例：
```javascript
history.pushState({page: 1}, "title 1", "?page=1");
history.state // {page: 1}
```

## 历史的方法
> ### history.forward() 方法
>> #### 说明：
* forward()：移动到下一个访问页面，等同于浏览器的前进键

>> #### 示例：
```javascript
history.forward();
```

> ### history.back() 方法
>> #### 说明：
* back()：移动到上一个访问页面，等同于浏览器的后退键

>> #### 示例：
```javascript
history.back();
```

> ### history.go() 方法
>> #### 说明：
* 接受一个整数作为参数，移动到该整数指定的页面，比如：go(1)相当于forward()，go(-1)相当于back()，go(0)相对于刷新当前页面

>> #### 示例：
```javascript
history.go(-2);
```

> ### history.pushState() 方法
>> #### 说明：
* HTML5为history对象添加的新方法，用来在浏览历史中添加和修改记录
* history.pushState方法接受三个参数，依次为：
* 1、state：一个与指定网址相关的状态对象，popstate事件触发时，该对象会传入回调函数。如果不需要这个对象，此处可以填null
* 2、title：新页面的标题，但是所有浏览器目前都忽略这个值，因此这里可以填null
* 3、url：新的网址，必须与当前页面处在同一个域。浏览器的地址栏将显示这个网址
* 注意，pushState方法不会触发页面刷新

>> #### 示例：
```javascript
// 暂无示例
```


> ### history.replaceState() 方法
>> #### 说明：
* HTML5为history对象添加的新方法，用来在浏览历史中添加和修改记录
* history.replaceState方法的参数与pushState方法一模一样，区别是它修改浏览历史中当前页面的值

>> #### 示例：
```javascript
// 暂无示例
```

