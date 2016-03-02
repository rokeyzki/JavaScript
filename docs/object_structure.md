# Object 结构
对象是属性的无序集合，每个属性都有一个字符串的 key 和对应的 value 来存放一个原始类型数据或对象类型数据，同时每个对象都存在自己的原型。
***

## 对象结构示例
> 示例1 代码
> ```javascript
// 创建一个父类对象 fooA
function fooA(){}
// 给父类对象 fooA 的原型（即prototype）添加属性 z
fooA.prototype.z = 3;
// 实例化父类对象 fooA 为实例对象 fooB
var fooB = new fooA();
fooB.x = 1;
fooB.y = 2;
```
> 示例1 输出
> ```javascript
console.log(fooB.x); // 1
console.log(fooB.y); // 2
console.log(fooB.z); // 3
// 获取实例对象 fooB 的对象类型
console.log(typeof fooB.toString); // 'function'
// 判断实例对象 fooB 的属性 z 是否存在
console.log('z' in fooB); // true
// 判断实例对象 fooB 的属性 z 是否存在于它本身（即非继承于原型链上的对象）
console.log(fooB.hasOwnProperty('z')); // false
```
> 通过示例1可以看出一个实例对象的结构：

> 1. 第一层：实例对象（如 fooB）及它的对象属性
> 2. 第二层：实例对象的原型（即prototype）指向父类对象（如 fooA）及它的对象原型属性
> 3. 第三层：父类对象的原型（即prototype）指向元祖对象（即 Object）及它的对象原型属性
> 4. 第四层：元祖对象的原型（即Object.prototype）指向 null

> 以上即为一个实例对象的原型链结构
