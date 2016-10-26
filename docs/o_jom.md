### Module
* 上游 a.js

```javascript
// 逻辑
const name = 'Charles';
const year = 1989;
// 出口
export { name, year };
```

* 中游 b.js

```javascript
// 入口
import { name as myName, year } from './a';
// 逻辑
const moduleB = {
  name: myName,
  year,
  getInfo() {
    return `${myName}: ${year}`;
  },
};
// 出口
export default moduleB; // 如果模块只有一个输出值，就使用export default moduleB，否则使用export {one, two, three}
```

* 下游 c.js

```javascript
// 入口
import theB from './b';
// 逻辑
console.log(theB.year);
console.log(theB.getInfo());
```

### Boolean
* 声明
    * const foo = true;

### RegExp
* 声明
    * const foo = /xyz/g;
* 方法
    * RegExp.prototype.test()
    * RegExp.prototype.exec()

### Number
* 声明
    * const foo = 123;
* 方法
    * Number.prototype.toString()
    * Number.prototype.toFixed()

### Math
* 方法
    * Math.random()
    * Math.round()
    * Math.floor()
    * Math.ceil()
    * Math.abs()
    * Math.max()
    * Math.min()

### String
* 声明
    * const foo = "abc";
* 方法
    * String.prototype.concat()
    * String.prototype.trim()
    * String.prototype.split()
    * String.prototype.replace()
    * String.prototype.toLowerCase()
    * String.prototype.toUpperCase()
    * String.prototype.substr()
    * String.prototype.search()
    * String.prototype.indexOf()
    * String.prototype.lastIndexOf()

### JSON
* 声明
    * 'false' of '123' or '"abc"'
    * 'undefined' or 'null'
    * '[1,2,3]' or '{"a":1, "b":2}'
* 方法
    * JSON.stringify(obj)
    * JSON.parse(json)

### Object
* 声明

```javascript
// ES3
const foo = {
  a: 1, 
  b: function(x) {
    return x;
  },
};
// ES6
const foo = {
  a: 1, 
  b(x) {
    return x;
  },
};
```

* 方法
    * Object.assign()

```javascript
const a = {x:1, y:2};
const b = {x:3, z:4};
Object.assign(a, b);
console.dir(a); // {y:2, x:3, z:4};
```

### Function
* 声明
    * 命名函数表达式：function foo(){};
    * 变量函数表达式：
        * const foo = function(x){return x;};
        * `[ES6]` const foo = (x) => {return x;};
    * 即调函数表达式：
        * (function(){})();
        * (function(){}());
        * !function(){}();
        * new function(){}();
    * 首类函数表达式：return function(){};
* 参数
    * a = a || 1;
    * `[ES6]` function foo(a = 1) 
    * const a = arguments[0]? arguments[0]: 1;
    * `[ES6]` function foo(...arguments)
    * `[ES6]` foo(...arrayName)
* 类型

```javascript
// 普通函数
function foo(){
  return 1;
}
```
 
```javascript
// 内调函数
function foo(x){
  if(x > 2){
    return foo(x-1) + foo(x-2);
  }else{
    return 1;
  }
}
foo(3);
```

```javascript
// 闭包函数
function foo(x){
  return function(){
    return x++;
  }
}
const test = foo(1);
test();
```

```javascript
// 构造函数
function Foo(){
  this.one = 1;
}
const foo = new Foo();
```

* class

```javascript
// 闭包函数
let math = function(){ // 封装
  const _flag = 10;
  return {
    add: function(x, y){
      return x + y + _flag;
    }
  };
};
math = (function(m){ // 继承
  m.minus = function(x, y){
    return x - y;
  };
  return m;
})(math || {});
math.minus(1, 2); // 多态
```

```javascript
// 构造函数
function ParentClass(a, b){ // 封装
  this.A = a;
  this.B = function(){
    return b;
  };
}
ParentClass.prototype.X = 1;
ParentClass.prototype.Y = function(){
  return 2;
};
function ChildClass(a, b, c, d){ // 继承
  ParentClass.call(this, a, b);
  this.C = c;
  this.D = function(){
    return d;
  };
}
ChildClass.prototype = Object.create(ParentClass.prototype);
ChildClass.prototype.constructor = ChildClass.prototype;
const foo = new ChildClass(1, 2, 3, 4); // 多态
```

```javascript
// ES6
class ParentClass { // 封装
  constructor(a, b) {
    this.parentA = a;
    this.parentB = function () {
      return b;
    };
  }
  static parentC() {
    return '静态方法，支持直接调用';
  }
  set parentD(value) {
    this.parentA += value;
  }
  get parentD() {
    return this.parentA;
  }
}
console.log(ParentClass.parentC());
class ChildClass extends ParentClass { // 继承
  constructor(a, b, c, d) {
    super(a, b);
    this.childA = c;
    this.childB = function () {
      return d;
    };
  }
  static childC() {
    return `子类静态方法: ${super.parentC()}`;
  }
}
console.log(ChildClass.childC());
const foo = new ChildClass(1, 2, 3); // 多态
foo.parentD = 4;
console.log(foo.parentD);
```

* async

```javascript
function step(x) {
  return new Promise((resolve, reject) => {
    function handler(value) {
      if (value >= 5) resolve(value);
      else reject(value);
    }
    setInterval(() => {
      handler(+x);
    }, 3000);
  });
}
async function group() {
  console.log('start');
  await step(5).then((v) => { console.info(`then: ${v}`); })
    .catch((v) => { console.error(`catch: ${v}`); });
  await step(4).then(
      (v) => { console.info(`then: ${v}`); }, 
      (v) => { console.error(`catch: ${v}`); }
    );
  await step(4).then((v) => { console.info(`then: ${v}`); });
  await step(5).then((v) => { console.info(`then: ${v}`); });
  console.log('end');
}
group();
```

* 方法
    * Function.prototype.call(obj, 1, 2)
    * Function.prototype.apply(obj, [1, 2])
    * Function.prototype.bind(obj, 1, 2)

### Array
* 声明
    * const foo = [1, 2, 3];
* 属性
    * Array.prototype.length
* 方法
    * Array.isArray()
    * Array.prototype.converse()
    * Array.prototype.unshift()
    * Array.prototype.shift()
    * Array.prototype.push()
    * Array.prototype.pop()
    * Array.prototype.concat()
    * Array.prototype.join()
    * Array.prototype.slice()
    * Array.prototype.splice()

### Date
* 声明
    * const foo = new Date();
    * const foo = new Date(1234567890);
    * const foo = new Date("1234-05-06");
* 获取方法
    * Date.prototype.getTime()
    * Date.prototype.getFullYear()
    * Date.prototype.getMonth() + 1
    * Date.prototype.getDate()
    * Date.prototype.getHours()
    * Date.prototype.getMinutes()
    * Date.prototype.getSeconds()
    * Date.prototype.toString()
    * Date.prototype.getDay()
* 设置方法
    * Date.prototype.setTime(Date.prototype.getTime() + 1000)
    * Date.prototype.setFullYear()
    * Date.prototype.setMonth()
    * Date.prototype.setDate()
    * Date.prototype.setHours()
    * Date.prototype.setMinutes()
    * Date.prototype.setSeconds()

### Lodash
