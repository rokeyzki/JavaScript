# Object 模块
对象模块化即JavaScript的面向对象编程（OOP），主要是通过对象来实现OOP中的封装、继承、多态等特性，以达到代码重复使用、提高开发效率、降低维护难度的目的。
***

## 封装
> 说明：
* 即将可重复使用的属性、方法封装成父类对象

> 示例：
>> ```javascript
function Person(name, age){
    this.name = name;
    this.age = age;
}
Person.test1 = '测试1';
Person.test2 = function(){
    console.log('测试2');
};
Person.prototype.LEGS_NUM = 2;
Person.prototype.ARMS_NUM = 2;
Person.prototype.hi = function(){
    // console.log('你好，我叫' + this.name + '，我今年' + this.age + '岁了。');
    return '你好，我叫' + this.name + '，我今年' + this.age + '岁了。';
};
Person.prototype.walk = function(){
    console.log(this.name + '在散步...');
};
```

>> ```javascript
function Person(name, age){
    this.name = name;
    this.age = age;
}
Person.test1 = '测试1';
Person.test2 = function(){
    console.log('测试2');
};
Person.prototype.LEGS_NUM = 2;
Person.prototype.ARMS_NUM = 2;
Person.prototype.hi = function(){
    // console.log('你好，我叫' + this.name + '，我今年' + this.age + '岁了。');
    return '你好，我叫' + this.name + '，我今年' + this.age + '岁了。';
};
Person.prototype.walk = function(){
    console.log(this.name + '在散步...');
};
/*
 * 父类子类的继承分成两部分：
 * 一部分是子类调用父类构造函数，
 * 另一部分是子类的原型指向父类的原型。
 */
function Student(name, age, className){
    Person.call(this, name, age); // 子类调用父类构造函数
    this.className = className;
}
// 子类的原型指向父类的原型
Student.prototype = Object.create(Person.prototype);
Student.prototype.constructor = Student;
Student.prototype.hi2 = function(){
    // console.log('你好，我叫' + this.name + '，我今年' + this.age + '岁了，我来自' + this.className);
    console.log(this.hi() + '我来自' + this.className) // 你好，我叫小明，我今年15岁了。我来自二年级三班
};
Student.prototype.learn = function(subject){
    console.log(this.name + '在' + this.className +'学习' + subject);
};
// 示例化
var xiaoMing = new Student('小明', '15', '二年级三班');
console.log(xiaoMing instanceof Student); // true
console.log(xiaoMing instanceof Person); // true
xiaoMing.hi2(); // 你好，我叫小明，我今年15岁了，我来自二年级三班
console.log(xiaoMing.LEGS_NUM); // 2
xiaoMing.walk(); // 小明在散步...
xiaoMing.learn('数学'); // 小明在二年级三班学习数学
var xiaoHong = new Person('小红', '14');
console.log(xiaoHong instanceof Student); // false
console.log(xiaoHong instanceof Person); // true
xiaoHong.hi(); // 你好，我叫小红，我今年14岁了。
xiaoHong.walk(); // 小红在散步...
// 只能继承构造函数或原型中的属性与方法，其他方式都是变成undefined
console.log(xiaoHong.test1); // undefined
xiaoHong.test2(); // undefined is not a function
```

