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
ChildClass.prototype.constructor = ChildClass; // 子类的原型的构造函数指向自己
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

## 实例
> ### 构造函数型子类的实例化：
>> ```javascript
// 实例对象
var fooObject = new ChildClass('参数A', '参数B', '参数C');
// 结果：
fooObject.propertyA; // 参数A
fooObject.propertyB; // 这里是父类的构造属性B：参数B
fooObject.propertyC(); // 这里是父类的构造方法C
fooObject.propertyD; // 这里是父类的原型属性D
fooObject.propertyE(); // 这里是父类的原型方法E
fooObject.propertyH; // 这里是子类的构造属性H：参数C
fooObject.propertyI(); // 这里是子类的构造方法I
fooObject.propertyJ; // 这里是子类的原型属性J
fooObject.propertyK(); // 这里是子类的原型方法K
// 检验：
// 获取实例对象的原型
Object.getPrototypeOf(fooObject); // 返回子类
// 获取实例对象的构造函数
fooObject.constructor; // 返回子类构造函数
// 判断对象是否为某个父类子类的实例对象
fooObject instanceof ChildClass; // true
fooObject instanceof ParentClass; // true
// 判断是否为实例对象的原型
ChildClass.prototype.isPrototypeOf(fooObject); // true
ParentClass.prototype.isPrototypeOf(ChildClass.prototype); // true
```

> ### 普通对象型子类的实例化：
>> ```javascript
// 实例对象
var fooObject = Object.create(ChildClass);
// 结果：
fooObject.propertyA; // 这里是属性A
fooObject.propertyB(); // 这里是方法B
fooObject.propertyC('参数'); //  这里是方法C:参数
fooObject.propertyD; // 返回一个构造函数
fooObject.propertyH; // 这里是属性H
fooObject.propertyI(); // 这里是方法I
// 检验：
// 获取实例对象的原型
Object.getPrototypeOf(fooObject); // 返回包含父类的子类对象
// 普通对象不支持 constructor 属性
// 普通对象不支持 instanceo 关键词
// 判断是否为实例对象的原型
ChildClass.isPrototypeOf(fooObject); // true
ParentClass.isPrototypeOf(ChildClass); // true
```
