## 类库 Lodash - 数据类型 - 判断方法
### empty

```javascript
var foo = null;
if(foo) {
  console.log('非空')
} else {
  console.log('空')
}
// => '空'
```

### boolean

```javascript
console.log(typeof true); // => 'boolean'
```

### number

```javascript
console.log(typeof 123); // => 'number'
// 判断整数
console.log(_.isInteger(1)) // => true
console.log(_.isInteger(-1)) // => true
console.log(_.isInteger(0)) // => true
console.log(_.isInteger(0.1)) // => false
```

### string

```javascript
console.log(typeof 'abc'); // => 'string'
```

### undefined

```javascript
console.log(typeof undefined); // => 'undefined'
console.log(typeof null); // => 'object'
```

### null

```javascript
console.log(_.isNull(undefined)); // false
console.log(_.isNull(null)); // true
```

### object

```javascript
console.log(typeof {}); // => 'object'
console.log(typeof []); // => 'object'
console.log(typeof new Date()); // => 'object'
// 判断空对象
var foo = {};
if(typeof foo == 'object' && _.size(foo) == 0) console.log('空对象');
```

### array

```javascript
console.log(Array.isArray({})) // false
console.log(Array.isArray([])) // true
```

### date

```javascript
console.log(_.isDate({})) // false
console.log(_.isDate(new Date())) // true
```

## 类库 Lodash - 字符串 - 转义方法
### escape

```javascript
var foo = _.escape('<script>');
console.log(foo); // => '&lt;script&gt;'
```

### unescape

```javascript
var foo = _.unescape('&lt;script&gt;');
console.log(foo); // => '<script>'
```

### truncate

```javascript
var foo = _.truncate('hello world', {
  'length': 3+5
});
console.log(foo); // => 'hello...'
```

### parseInt

```javascript
var foo = _.parseInt('08');
console.log(foo); // => 8
```

## 类库 Lodash - 字符串 - 格式方法
### camelCase

```javascript
_.camelCase('Foo Bar');
// => 'fooBar'
_.camelCase('--foo-bar');
// => 'fooBar'
_.camelCase('__foo_bar__');
// => 'fooBar'
```

### snakeCase

```javascript
_.snakeCase('Foo Bar');
// => 'foo_bar'
_.snakeCase('fooBar');
// => 'foo_bar'
_.snakeCase('--foo-bar');
// => 'foo_bar'
```

### kebabCase

```javascript
_.kebabCase('Foo Bar');
// => 'foo-bar'
_.kebabCase('fooBar');
// => 'foo-bar'
_.kebabCase('__foo_bar__');
// => 'foo-bar'
```

### startCase

```javascript
_.startCase('--foo-bar');
// => 'Foo Bar'
_.startCase('fooBar');
// => 'Foo Bar'
_.startCase('__foo_bar__');
// => 'Foo Bar'
```

### capitalize

```javascript
_.capitalize('loDash');
// => 'Lodash'
```

### lowerFirst

```javascript
_.lowerFirst('JQuery');
// => 'jQuery'
```

### upperFirst

```javascript
_.upperFirst('javaScript');
// => 'JavaScript'
```

## 类库 Lodash - 字符串 - 填充方法
### padStart

```javascript
var foo = _.padStart('abc', 6, '_-');
console.log(foo); // => '_-_abc'
```

### padEnd

```javascript
var foo = _.padEnd('abc', 6, '_-');
console.log(foo); // => 'abc_-_'
```

## 类库 Lodash - 字符串 - 移除方法
### trimStart

```javascript
var foo = _.trimStart('_-_abc', '_-');
console.log(foo); // => 'abc'
```

### trimEnd

```javascript
var foo = _.trimEnd('abc_-_', '-_');
console.log(foo); // => 'abc'
```

## 类库 Lodash - 集合 - 链式方法
### chain

```javascript
var users = [
  { 'user': 'barney',  'age': 36 },
  { 'user': 'fred',    'age': 40 },
  { 'user': 'pebbles', 'age': 12 }
];
var youngest = _.chain(users)
  .sortBy('age')
  .map(function(o) {
    return o.user + ' is ' + o.age;
  })
  .head()
  .value();
console.log(youngest); // => 'pebbles is 12'
```

## 类库 Lodash - 集合 - 遍历方法
### forEach

```javascript
_.forEach({ 'a': 1, 'b': 2 }, function(value, key) {
  console.log(key);
});
// => Logs 'a' then 'b' (iteration order is not guaranteed).
```

### forEachRight

```javascript
_.forEachRight([1, 2], function(value) {
  console.log(value);
});
// => Logs `2` then `1`.
```

## 类库 Lodash - 集合 - 映射方法
### map

```javascript
function square(n) {
  return n * n;
}
_.map([4, 8], square);
// => [16, 64]
```

### flatMap

```javascript
function duplicate(n) {
  return [n, n];
}
_.flatMap([1, 2], duplicate);
// => [1, 1, 2, 2]
```

### flatMapDepth

```javascript
function duplicate(n) {
  return [[[n, n]]];
}
_.flatMapDepth([1, 2], duplicate, 2);
// => [[1, 1], [2, 2]]
```

### flatMapDeep

```javascript
function duplicate(n) {
  return [[[n, n]]];
}
_.flatMapDeep([1, 2], duplicate);
// => [1, 1, 2, 2]
```

### invokeMap

```javascript
_.invokeMap([[5, 1, 7], [3, 2, 1]], 'sort');
// => [[1, 5, 7], [1, 2, 3]]
_.invokeMap([123, 456], String.prototype.split, '');
// => [['1', '2', '3'], ['4', '5', '6']]
```

## 类库 Lodash - 集合 - 归类方法
### countBy

```javascript
_.countBy([6.1, 4.2, 6.3], Math.floor);
// => { '4': 1, '6': 2 }
```

### groupBy

```javascript
_.groupBy([6.1, 4.2, 6.3], Math.floor);
// => { '4': [4.2], '6': [6.1, 6.3] }
```

### keyBy

```javascript
var array = [
  { 'dir': 'left', 'code': 97 },
  { 'dir': 'right', 'code': 100 }
];
_.keyBy(array, 'dir');
// => { 'left': { 'dir': 'left', 'code': 97 }, 'right': { 'dir': 'right', 'code': 100 } }
_.keyBy(array, function(o) {
  return String.fromCharCode(o.code);
});
// => { 'a': { 'dir': 'left', 'code': 97 }, 'd': { 'dir': 'right', 'code': 100 } }
```

### partition

```javascript
var users = [
  { 'user': 'barney',  'age': 36, 'active': false },
  { 'user': 'fred',    'age': 40, 'active': true },
  { 'user': 'pebbles', 'age': 1,  'active': false }
];
_.partition(users, function(o) { return o.active; });
// => objects for [['fred'], ['barney', 'pebbles']]
_.partition(users, { 'age': 1, 'active': false });
// => objects for [['pebbles'], ['barney', 'fred']]
_.partition(users, ['active', false]);
// => objects for [['barney', 'pebbles'], ['fred']]
```

## 类库 Lodash - 集合 - 查找方法
### find

```javascript
var users = [
  { 'user': 'barney',  'age': 36, 'active': true },
  { 'user': 'fred',    'age': 40, 'active': false },
  { 'user': 'pebbles', 'age': 1,  'active': true }
];
_.find(users, function(o) { return o.age < 40; });
// => object for 'barney'
_.find(users, { 'age': 1, 'active': true });
// => object for 'pebbles'
_.find(users, ['active', false]);
// => object for 'fred'
_.find(users, 'active');
// => object for 'barney'
```

### findLast

```javascript
_.findLast([1, 2, 3, 4], function(n) {
  return n % 2 == 1;
});
// => 3
```

## 类库 Lodash - 集合 - 过滤方法
### filter

```javascript
var users = [
  { 'user': 'barney', 'age': 36, 'active': true },
  { 'user': 'fred',   'age': 40, 'active': false }
];
_.filter(users, function(o) { return !o.active; });
// => objects for ['fred']
_.filter(users, { 'age': 36, 'active': true });
// => objects for ['barney']
_.filter(users, ['active', false]);
// => objects for ['fred']
_.filter(users, 'active');
// => objects for ['barney']
```

### reject

```javascript
var users = [
  { 'user': 'barney', 'age': 36, 'active': false },
  { 'user': 'fred',   'age': 40, 'active': true }
];
_.reject(users, function(o) { return !o.active; });
// => objects for ['fred']
_.reject(users, { 'age': 40, 'active': true });
// => objects for ['barney']
_.reject(users, ['active', false]);
// => objects for ['fred']
_.reject(users, 'active');
// => objects for ['barney']
```

## 类库 Lodash - 集合 - 随机方法
### sample

```javascript
_.sample([1, 2, 3, 4]);
// => 2
```

### sampleSize

```javascript
_.sampleSize([1, 2, 3], 2);
// => [3, 1]
_.sampleSize([1, 2, 3], 4);
// => [2, 3, 1]
```

## 类库 Lodash - 集合 - 迭代方法
### reduce

```javascript
_.reduce([1, 2], function(sum, n) {
  return sum + n;
}, 0);
// => 3
```

### reduceRight

```javascript
var array = [[0, 1], [2, 3], [4, 5]];
_.reduceRight(array, function(flattened, other) {
  return flattened.concat(other);
}, []);
// => [4, 5, 2, 3, 0, 1]
```

## 类库 Lodash - 集合 - 排序方法
### shuffle

```javascript
_.shuffle([1, 2, 3, 4]);
// => [4, 1, 3, 2]
```

### sortBy

```javascript
var users = [
  { 'user': 'fred',   'age': 48 },
  { 'user': 'barney', 'age': 36 },
  { 'user': 'fred',   'age': 40 },
  { 'user': 'barney', 'age': 34 }
];
_.sortBy(users, ['user', 'age']);
// => objects for [['barney', 34], ['barney', 36], ['fred', 40], ['fred', 48]]
```

### orderBy

```javascript
var users = [
  { 'user': 'fred',   'age': 48 },
  { 'user': 'barney', 'age': 34 },
  { 'user': 'fred',   'age': 40 },
  { 'user': 'barney', 'age': 36 }
];
_.orderBy(users, ['user', 'age'], ['asc', 'desc']);
// => objects for [['barney', 36], ['barney', 34], ['fred', 48], ['fred', 40]]
```

## 类库 Lodash - 集合 - 判断方法
### every

```javascript
var users = [
  { 'user': 'barney', 'age': 36, 'active': false },
  { 'user': 'fred',   'age': 40, 'active': false }
];
_.every(users, { 'user': 'barney', 'active': false });
// => false
_.every(users, ['active', false]);
// => true
_.every(users, 'active');
// => false
```

### includes

```javascript
_.includes([1, 2, 3], 1);
// => true
_.includes([1, 2, 3], 1, 2);
// => false
_.includes({ 'a': 1, 'b': 2 }, 1);
// => true
_.includes('abcd', 'bc');
// => true
```

### some

```javascript
var users = [
  { 'user': 'barney', 'active': true },
  { 'user': 'fred',   'active': false }
];
_.some(users, { 'user': 'barney', 'active': false });
// => false
_.some(users, ['active', false]);
// => true
_.some(users, 'active');
// => true
```

## 类库 Lodash - 集合 - 属性方法
### size

```javascript
_.size([1, 2, 3]);
// => 3
_.size({ 'a': 1, 'b': 2 });
// => 2
```

## 类库 Lodash - 函数 - 参数方法
### ary

```javascript
function foo() {
  _.map(arguments, function(v){
    console.log(v);
  })
}
foo(1, 2, 3, 4, 5, 6); // => 1, 2, 3, 4, 5, 6
var fooAry = _.ary(foo2, 3);
fooAry(1, 2, 3, 4, 5, 6); // => 1, 2, 3
```

### flip

```javascript
function foo() {
  _.map(arguments, function(v){
    console.log(v);
  })
}
foo(1, 2, 3, 4, 5, 6); // => 1, 2, 3, 4, 5, 6
var fooFlip = _.flip(foo); // 创建一个翻转接收参数的函数
fooFlip(6, 5, 4, 3, 2, 1); // => 1, 2, 3, 4, 5, 6
```

### partial

```javascript
function foo(x, y){
  return `${x} ${y}`;
}
var fooPartial = _.partial(foo, 'hello');
console.log(fooPartial('world')); // hello world
var fooPartial = _.partial(foo, _, 'hello'); // 使用_占位符
console.log(fooPartial('world')); // world hello
```

### overArgs

```javascript
function doubled(n) {
  return n * 2;
}
function square(n) {
  return n * n;
}
var fooOverArgs = _.overArgs(function(x, y) {
  return `square：${x}、doubled：${y}`;
}, square, doubled);
console.log(fooOverArgs(3, 4)); // => square：9、doubled：8
```

## 类库 Lodash - 函数 - 次数方法
### once

```javascript
function foo(type, x){
  return `${type}:${x}`;
}
var fooOnce = _.once(foo);
console.log(fooOnce('once', 1)); // => once:1
console.log(fooOnce('once', 2)); // => once:1
console.log(fooOnce('once', 3)); // => once:1
console.log(fooOnce('once', 4)); // => once:1
console.log(fooOnce('once', 5)); // => once:1
```

### before

```javascript
function foo(type, x){
  return `${type}:${x}`;
}
var fooBefore = _.before(3, foo);
console.log(fooBefore('before', 1)); // => before:1
console.log(fooBefore('before', 2)); // => before:2
console.log(fooBefore('before', 3)); // => before:2
console.log(fooBefore('before', 4)); // => before:2
console.log(fooBefore('before', 5)); // => before:2
```

### after

```javascript
function foo(type, x){
  return `${type}:${x}`;
}
var fooAfter = _.after(3, foo);
console.log(fooAfter('after', 1)); // => undefined
console.log(fooAfter('after', 2)); // => undefined
console.log(fooAfter('after', 3)); // => after:3
console.log(fooAfter('after', 4)); // => after:4
console.log(fooAfter('after', 5)); // => after:5
```

## 类库 Lodash - 函数 - 时间方法
### delay

```javascript
function foo(x){
  alert(x);
}
_.delay(foo, 3000, '1'); // 延迟3000毫秒后执行
_.delay(foo, 2000, '2'); // 前一个delay执行完后，再延迟2000毫秒后执行
_.delay(foo, 1000, '3'); // 前两个delay执行完后，再延迟1000毫秒后执行
```

### debounce

```javascript
function foo(x){
  alert(x);
}
var fooDebounce = _.debounce(foo, 3000);
fooDebounce('test'); // 延迟3000毫秒后执行，并且接下去3000毫秒内不再执行相同函数
fooDebounce('test'); // 不执行
fooDebounce('test'); // 不执行
fooDebounce('test'); // 不执行
fooDebounce('test'); // 不执行
```

### throttle

```javascript
function foo(x){
  alert(x);
}
var fooThrottle = _.throttle(foo, 3000, { 'trailing': false }); // 一定要添加参数{ 'trailing': false }
fooThrottle('test'); // 立即执行，并且接下去3000毫秒内不再执行相同函数
fooThrottle('test'); // 不执行
fooThrottle('test'); // 不执行
fooThrottle('test'); // 不执行
fooThrottle('test'); // 不执行
```

## 类库 Lodash - 函数 - 结果方法
### memoize

```javascript
function foo(sign){
  var date = new Date();
  return `${sign}: ${date.getTime()}`;
}
var fooMemoize = _.memoize(foo);
console.log(fooMemoize(1)); // => 1: 1476798452391
console.log(fooMemoize.cache.get(1)) // 1: 1476798452391（查看参数为1时的函数缓存）
_.delay(function(){
  console.log(fooMemoize(1)); // => 1: 1476798452391（函数结果缓存）
  fooMemoize.cache.delete(1); // 清除参数为1时的函数缓存
  console.log(fooMemoize(1)); // => 1: 1476798455395（生成新的函数缓存）
}, 3000);
```