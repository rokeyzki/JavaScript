# BOM 请求
请求主要指通过AJAX指定发送HTTP请求，Ajax指的是不刷新页面，发出异步请求，向服务器端要求数据，然后再进行处理的方法
***

## XMLHttpRequest对象
> ### 说明：
* XMLHttpRequest对象用于从JavaScript发出HTTP请求，下面是典型用法

> ### 示例：
```javascript
// 新建一个XMLHttpRequest实例对象
var xhr = new XMLHttpRequest();
// 指定通信过程中状态改变时的回调函数
xhr.onreadystatechange = function(){
    // 通信成功时，状态值为4
    var completed = 4;
    if(xhr.readyState === completed){
        if(xhr.status === 200){
            // 处理服务器发送过来的数据
        }else{
            // 处理错误
        }
    }
};
// open方式用于指定HTTP动词、请求的网址、是否异步（true表示异步，false表示同步）
xhr.open('GET', '/endpoint', true);
// 发送HTTP请求
xhr.send(null);
```

## AJAX在早期浏览器上的使用
> ### 客户端：
```html
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>早期浏览器上的AJAX DEMO</title>
</head>
<body>
    <script>
        function Ajax(type, url, data, success, failed){
            // 创建ajax对象
            var xhr = null;
            if(window.XMLHttpRequest){
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP')
            }
            var type = type.toUpperCase();
            if(typeof data == 'object'){
                var str = '';
                for(var key in data){
                    str += key+'='+data[key]+'&';
                }
                data = str.replace(/&$/, '');
            }
            if(type == 'GET'){
                if(data){
                    xhr.open('GET', url + '?' + data, true);
                } else {
                    // 用于清除缓存
                    var random = Math.random();
                    xhr.open('GET', url + '?t=' + random, true);
                }
                xhr.send();
            } else if(type == 'POST'){
                xhr.open('POST', url, true);
                // 如果需要像 html 表单那样 POST 数据，请使用 setRequestHeader() 来添加 http 头。
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send(data);
            }
            // 处理返回数据
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4){
                    if(xhr.status == 200){
                        success(eval('(' + xhr.responseText + ')')); // 兼容低版本IE
                    } else {
                        if(failed){
                            failed(xhr.status);
                        }
                    }
                }
            }
        }
        /* DEMO start */
        // 测试本域调用
        var sendData = {type:'local', name:'asher', sex:'male'};
        Ajax('post', '1.php', sendData, function(data){
            console.log(data);
            alert(data.one);
        }, function(error){
            console.log(error);
        });
        /* DEMO end */
    </script>
</body>
</html>
```

> ### 服务端（PHP）：
```php
<?php
$resArray = array();
// 获取前端请求数据
$type = $_REQUEST['type'];
$name = $_REQUEST['name'];
$sex = $_REQUEST['sex'];
// sleep(3);
$resArray['one'] = $type;
$resArray['two'] = 'resData:: '.$name.' - '.$sex;
// 返回后端处理数据
echo json_encode($resArray);
```

## AJAX在现代浏览器上的使用一：普通请求
> ### 客户端：
```html
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>现代浏览器上的AJAX DEMO</title>
</head>
<body>
    <script>
        function Ajax(type, url, data, success, failed){
            // 创建ajax对象
            var xhr = new XMLHttpRequest();
            xhr.responseType = 'json'; // XHR2 推荐写法，需要客户端支持H5
            var type = type.toUpperCase();
            if(type == 'GET'){
                if(typeof data == 'object'){
                    var str = '';
                    for(var key in data){
                        str += key+'='+data[key]+'&';
                    }
                    data = str.replace(/&$/, '');
                }
                if(data){
                    xhr.open('GET', url + '?' + data, true);
                } else {
                    // 用于清除缓存
                    var random = Math.random();
                    xhr.open('GET', url + '?t=' + random, true);
                }
                xhr.send();
            }else if(type == 'POST'){
                if(typeof data == 'object'){
                    var form = new FormData();
                    for(var key in data){
                        form.append(key, data[key]);
                    }
                    data = form;
                }
                xhr.open('POST', url, true);
                xhr.send(data);
            }
            // 处理返回数据
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4){
                    if(xhr.status == 200){
                        success(xhr.response); // XHR2 推荐写法，使用xhr.response，不使用xhr.responseText
                    } else {
                        if(failed){
                            failed(xhr.status);
                        }
                    }
                }
            }
        }
        /* DEMO start */
        // 测试本域POST调用
        var sendData = {type:'local-post', name:'asher', sex:'male'};
        Ajax('post', '2.php', sendData, function(data){
            console.log(data);
            alert(data.one);
        }, function(error){
            console.log(error);
        });
        // 测试本域GET调用
        var sendData = {type:'local-get', name:'asher', sex:'male'};
        Ajax('get', '2.php', sendData, function(data){
            console.log(data);
            alert(data.one);
        }, function(error){
            console.log(error);
        });
        // 测试跨域POST调用
        var sendData = {type:'cross-post', name:'asher', sex:'male'};
        Ajax('post', 'http://127.0.0.1/AJAX/demo/2/2.php', sendData, function(data){
            console.log(data);
            alert(data.one);
        }, function(error){
            console.log(error);
        });
        // 测试跨域GET调用
        var sendData = {type:'cross-get', name:'asher', sex:'male'};
        Ajax('get', 'http://127.0.0.1/AJAX/demo/2/2.php', sendData, function(data){
            console.log(data);
            alert(data.one);
        }, function(error){
            console.log(error);
        });
        /* DEMO end */
    </script>
</body>
</html>
```

> ### 服务端（PHP）：
```php
<?php
header('Access-Control-Allow-Origin:*'); // 加了这句才支持现代浏览器的跨域AJAX通信请求，并且需要重启服务器，星号表示接受所有主机的AJAX请求
// header('Access-Control-Allow-Originhttp://api.zhihu.com');
$resArray = array();
// 获取前端请求数据
$type = $_REQUEST['type'];
$name = $_REQUEST['name'];
$sex = $_REQUEST['sex'];
// sleep(3);
$resArray['one'] = $type;
$resArray['two'] = 'resData:: '.$name.' - '.$sex;
// 返回后端处理数据
echo json_encode($resArray);
```

## AJAX在现代浏览器上的使用二：文件上传
> ### 客户端：
```html
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>文件上传的AJAX DEMO</title>
</head>
<body>
    <input type="file" id="file-select" multiple/>
    <button type="submit" onclick="upload();">上传</button>
    <script>
        function Ajax(type, url, data, success, failed){
            // 创建ajax对象
            var xhr = new XMLHttpRequest();
            xhr.responseType = 'json'; // XHR2 推荐写法，需要客户端支持H5
            var type = type.toUpperCase();
            if(type == 'GET'){
                if(typeof data == 'object'){
                    var str = '';
                    for(var key in data){
                        str += key+'='+data[key]+'&';
                    }
                    data = str.replace(/&$/, '');
                }
                if(data){
                    xhr.open('GET', url + '?' + data, true);
                } else {
                    // 用于清除缓存
                    var random = Math.random();
                    xhr.open('GET', url + '?t=' + random, true);
                }
                xhr.send();
            }else if(type == 'POST'){
                if(typeof data == 'object'){
                    var form = new FormData();
                    for(var key in data){
                        form.append(key, data[key]);
                    }
                    data = form;
                }
                xhr.open('POST', url, true);
                xhr.send(data);
            }
            // 处理返回数据
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4){
                    if(xhr.status == 200){
                        success(xhr.response); // XHR2 推荐写法，使用xhr.response，不使用xhr.responseText
                    } else {
                        if(failed){
                            failed(xhr.status);
                        }
                    }
                }
            }
        }
        /* DEMO start */
        // 测试本域文件上传
        function upload(){
            var file = document.getElementById('file-select').files[0];
            var sendData = {img:file};
            Ajax('post', '3.php', sendData, function(data){
                console.log(data);
                alert(data.name);
            }, function(error){
                console.log(error);
            });
        }
        /* DEMO end */
    </script>
</body>
</html>
```

> ### 服务端（PHP）：
```php
<?php
$picname = $_FILES['img']['name'];
$picsize = $_FILES['img']['size'];
if ($picname != "") {
    if ($picsize > 512000) { // 限制上传大小
        echo '图片大小不能超过500k';
        exit;
    }
    $type = strstr($picname, '.'); // 限制上传格式
    if ($type != ".gif" && $type != ".jpg") {
        echo '图片格式不对！';
        exit;
    }
    $rand = rand(100, 999);
    $pics = date("YmdHis") . $rand . $type; // 命名图片名称
    // 上传图片的保存路径
    $pic_path = "files/". $pics;
    move_uploaded_file($_FILES['img']['tmp_name'], $pic_path);
}
$size = round($picsize/1024,2); // 转换成kb
$arr = array(
    'name'=>$picname,
    'pic'=>$pics,
    'size'=>$size
);
echo json_encode($arr); // 输出json数据
```

## AJAX在现代浏览器上的使用三：进度显示
> ### 客户端：
```html
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>显示进度的AJAX DEMO</title>
</head>
<body>
    <input type="file" id="file-select" multiple/>
    <button type="submit" onclick="upload();">上传</button>
    <progress id="upload" min="0" max="100" value="0">0% complete</progress>
    <progress id="download" min="0" max="100" value="0">0% complete</progress>
    <script>
        function Ajax(type, url, data, success, failed){
            // 创建ajax对象
            var xhr = new XMLHttpRequest();
            xhr.responseType = 'json'; // XHR2 推荐写法，需要客户端支持H5
            var type = type.toUpperCase();
            if(type == 'GET'){
                if(typeof data == 'object'){
                    var str = '';
                    for(var key in data){
                        str += key+'='+data[key]+'&';
                    }
                    data = str.replace(/&$/, '');
                }
                if(data){
                    xhr.open('GET', url + '?' + data, true);
                } else {
                    // 用于清除缓存
                    var random = Math.random();
                    xhr.open('GET', url + '?t=' + random, true);
                }
                xhr.send();
            }else if(type == 'POST'){
                if(typeof data == 'object'){
                    var form = new FormData();
                    for(var key in data){
                        form.append(key, data[key]);
                    }
                    data = form;
                }
                xhr.open('POST', url, true);
                /* 添加进度监听事件 start */
                // 上传进度
                var uploadProgressBar = document.querySelector('#upload');
                xhr.upload.onprogress = function(e) {
                    console.log('开始上传：' + e.lengthComputable);
                    if(e.lengthComputable){
                        console.log('可以显示上传进度');
                        uploadProgressBar.value = (e.loaded / e.total) * 100;
                        uploadProgressBar.textContent = uploadProgressBar.value; // Fallback for unsupported browsers.
                    }else{
                        console.log('不可显示上传进度');
                    }
                    console.log('上传结束');
                };
                // 下载进度
                var downloadProgressBar = document.querySelector('#download');
                xhr.onprogress = function(e) {
                    console.log('开始下载：' + e.lengthComputable);
                    if(e.lengthComputable){
                        console.log('可以显示下载进度');
                        downloadProgressBar.value = (e.loaded / e.total) * 100;
                        downloadProgressBar.textContent = downloadProgressBar.value; // Fallback for unsupported browsers.
                    }else{
                        console.log('不可显示下载进度');
                    }
                    console.log('下载结束');
                }
                /* 添加进度监听事件 end */
                xhr.send(data);
            }
            // 处理返回数据
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4){
                    if(xhr.status == 200){
                        success(xhr.response); // XHR2 推荐写法，使用xhr.response，不使用xhr.responseText
                    } else {
                        if(failed){
                            failed(xhr.status);
                        }
                    }
                }
            }
        }
        /* DEMO start */
        // 测试上传下载的进度显示
        function upload(){
            var file = document.getElementById('file-select').files[0];
            var sendData = {img:file};
            Ajax('post', '4.php', sendData, function(data){
                console.log(data);
                alert(data.name);
            }, function(error){
                console.log(error);
            });
        }
        /* DEMO end */
    </script>
</body>
</html>
```

> ### 服务端（PHP）：
```php
<?php
$picname = $_FILES['img']['name'];
$picsize = $_FILES['img']['size'];
if ($picname != "") {
    if ($picsize > 512000) { // 限制上传大小
        echo '图片大小不能超过500k';
        exit;
    }
    $type = strstr($picname, '.'); // 限制上传格式
    if ($type != ".gif" && $type != ".jpg") {
        echo '图片格式不对！';
        exit;
    }
    $rand = rand(100, 999);
    $pics = date("YmdHis") . $rand . $type; // 命名图片名称
    // 上传图片的保存路径
    $pic_path = "files/". $pics;
    move_uploaded_file($_FILES['img']['tmp_name'], $pic_path);
}
$size = round($picsize/1024,2); // 转换成kb
$arr = array(
    'name'=>$picname,
    'pic'=>$pics,
    'size'=>$size
);
echo json_encode($arr); // 输出json数据
```

## 类库 jQuery - AJAX
> ### 客户端：
```html
<!DOCTYPE html>
<html lang="zh-cmn-hans">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
</head>
<body>
  <div class="loading" style="display:none;position:absolute;top:50%;left:50%;">
    <p>加载中。。。</p>
  </div>
  <!-- Post form -->
  <div class="ex1">
    <p>show post</p>
    <button type='button'>click</button>
  </div>
  <!-- Get form -->
  <div class="ex2">
    <p>show get</p>
    <button type='button'>click</button>
  </div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script>
    $(document).ready(function(){
      // 设置是否异步
      $.ajaxSetup({
        async : false // true为异步方式、false为同步方式，默认为true
      });
      // Post req
      $(".ex1 button").click(function(){
        $(".loading").show();
        $.post("http://127.0.0.1:3000/users",{id:"s11111pot", name:"haha"},function(data){
          data = eval('(' + data + ')');
          htmlContent = '';
          htmlContent += '<p><b>' + data['title'] + '</b></p>';
          for (var i = 0; i < data['content'].length; i++) {
            htmlContent += '<p style="color:red;">' + data['content'][i] + '</p>';
          };
          $(".ex1 p").html(htmlContent);
          $(".loading").hide();
        });
      });
      // Get req
      $(".ex2 button").click(function(){
        $(".loading").show();
        var id   = "22222get",
            name = "xixi";
        $.get("http://127.0.0.1:3000/users/"+id+"/"+name,'',function(data){
          $(".ex2 p").html(data);
          $(".loading").hide();
        });
      });
    });
  </script>
</body>
</html>
```

> ### 服务端（NodeJS:Koa）：
```javascript
// router.js
var app     = require('koa')(), // 框架内核
    router  = require('koa-router')(), // 路由中间件
    cors    = require('koa-cors'), // 支持跨域ajax中间件
    koaBody = require('koa-body')(); // 增强body中间件，获取post数据需要使用koa-body中间件，获取get数据则不需要使用koa-body中间件
// Get route
router.get('/users/:id/:name',
  function *(next) {
    console.log('g1');
    // console.log(this);
    console.log(this.params); // { id: 17, name: "Alex" }
    this.user = this.params.id;
    yield next;
  },
  function *(next) {
    console.log('g2');
    console.log(this.user+', '+this.params.name);
    this.body = JSON.stringify('some message: '+this.user+', '+this.params.name);
    yield next;
  },
  function *(next) {
    console.log('g3');
    // this.redirect('http://google.com'); // 页面跳转至谷歌 PS：不要在ajax处理逻辑中使用
  }
);
// Post route
router.post('/users', koaBody,
  function *(next) {
    console.log('p1');
    console.log(this.request.body); // { id: 17, name: "Alex" } PS: 数据采用x-www-form格式
    this.user = this.request.body.id;
    yield next;
  },
  function *(next) {
    console.log('p2');
    console.log(this.user+', '+this.request.body.name);
    var arr = {'title': 'some message: '+this.user+' : '+this.request.body.name, 'content': ['内容一', '内容二', '内容三']};
    this.body = JSON.stringify(arr);
  }
);
// 配置应用
app.use(cors());
app.use(router.routes());
// 监听3000端口
app.listen(3000);
console.log('koa ajax start');
```
