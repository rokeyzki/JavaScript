### Page
* 打开：window.open()

```javascript
window.open('http://oulve.com');
```

* 关闭：window.close();

```javascript
window.close();
```

### AJAX
* 实例

```javascript
var xhr = new XMLHttpRequest();
```

* GET

```javascript
xhr.open("GET", "url?a=1&b=2", true);
xhr.send();
```

* POST

```javascript
xhr.open("POST", "url", true);
xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhr.send("a=1&b=2");
```

* 监听

```javascript
xhr.onreadystatechange = function(){
  if(this.readyState == 4){
    if(this.status == 200){
      console.log(JSON.parse(this.responseText));
    }else{
      console.log("error: " + this.status);
    }
  }
};
```

### URI
* 编码：window.encodeURIComponent()

```javascript
encodeURI(url);
encodeURIComponent(value);
```

* 解码：window.decodeURIComponent()

```javascript
decodeURI(url);
decodeURIComponent(value);
```

### Data
* 临时：window.sessionStorage()

```javascript
sessionStorage.foo = 123;
console.log(sessionStorage.foo);
```

* 永久：window.localStorage()

```javascript
localStorage.foo = 123;
console.log(localStorage.foo);
```

### Timer
* 延迟：window.setTimeout()

```javascript
var foo = setTimeout("alert(1)", 3000);
clearTimeout(foo);
```

* 间隔：window.setInterval()

```javascript
var foo = setInterval(function(){
  alert(1);
}, 3000);
clearInterval(foo);
```

### History
* 历史：window.history

```javascript
history.go(1);
history.go(0);
history.go(-1);
```
