# Object 模块
对象模块化即JavaScript的面向对象编程（OOP），主要是通过对象来实现OOP中的封装、继承、多态等特性，以达到代码重复使用、提高开发效率、降低维护难度的目的。
***

## 封装
> ### 说明：
* 即将可重复使用的属性、方法封装成父类对象
* 一般情况下建议使用构造函数来封装父类对象

> ### 使用构造函数来封装：
>> ```javascript
/**
 * 构造函数有两种声明方式：
 * 一种为：function ClassName(argumentA, argumentB){ // code }
 * 另一种为：var ClassName = function(argumentA, argumentB){ // code }
 */
var ParentClass = function(argumentA, argumentB){
    // 构造(constructor)属性写法：
    // 构造函数内部的属性(property)在实例化之后就不再关联影响到实例对象.
    this.propertyA = argumentA;
    this.propertyB = '这里是父类的构造属性B：' + argumentB;
    this.propertyC = function(){
        return '这里是父类的构造方法C';
    }
}
// 原型(prototype)属性写法：
// 函数原型(prototype)上的属性(property)在实例化之后就依然会实时关联影响到实例对象.
ParentClass.prototype.propertyD = '这里是父类的原型属性D';
ParentClass.prototype.propertyE = function(){
    return '这里是父类的原型方法E';
};
// 构造函数上的错误属性写法：
// 不能直接在构造函数对象上添加属性，这样添加的属性无法被实例对象所继承.
ParentClass.propertyF = '父类的直接属性F无法被实例对象继承';
ParentClass.propertyG = function(){
    return '父类的直接方法G无法被实例对象继承';
};
```

> ### 使用普通对象来封装：
>> ```javascript
var ParentClass = {
    // 对象(object)属性写法：
    // 普通对象(object)上的属性(property)在实例化之后就依然会实时关联影响到实例对象
    'propertyA':'这里是属性A',
    'propertyB':function(){return '这里是方法B';},
    'propertyC':function(argumentA){return '这里是方法C:' + argumentA;},
    'propertyD':function(argumentA, argumentB){
        this.propertyA = argumentA;
        this.propertyB = '这里是普通对象内置构造函数的属性B' + argumentB;
        this.propertyC = function(){
            return '这里是普通对象内置构造函数的方法C';
        }
    }
};
// 实例化后(instantiate)属性写法：
// 实例化父类对象后，再直接对父类对象添加属性(property)，新增的属性依然会映射添加到实例对象
ParentClass.propertyE = '这里是属性E';
ParentClass.propertyF = function(){
    return '这里是方法F';
};
// 普通对象上的错误属性写法
// 普通对象上不能直接使用原型(prototype)来添加属性，因为普通对象不存在原型属性，一般只有函数存在原型属性
ParentClass.prototype.propertyG = '这里的属性G无法写入';
```

## 继承
> ### 说明：
* 即重复利用父类对象的属性与方法

> ### 对构造函数型父类的继承：
>> ```javascript
/**
 * 子类对(构造函数型)父类的继承分成两部分：
 * 一部分是子类调用父类构造函数
 * 另一部分是子类的原型指向父类的原型
 */
var ChildClass = function(argumentA, argumentB, argumentC){
    ParentClass.call(this, argumentA, argumentB); // 子类调用父类构造函数
    this.propertyH = '这里是子类的构造属性H：' + argumentC;
    this.propertyI = function(){
        return '这里是子类的构造方法I';
    }
}
ChildClass.prototype = Object.create(ParentClass.prototype); // 子类的原型指向父类的原型
ChildClass.prototype.constructor = ChildClass; // 子类的原型的控制器指向自己
// 以下为子类原型的属性设置：
ChildClass.prototype.propertyJ = '这里是子类的原型属性J';
ChildClass.prototype.propertyK = function(){
    return '这里是子类的原型方法K';
}
```

> ### 对普通对象型父类的继承：
>> ```javascript
var ChildClass = Object.create(ParentClass);
ChildClass.propertyH = '这里是属性H';
ChildClass.propertyI = function(){
    return '这里是方法I';
}
```

## 旧案例
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

