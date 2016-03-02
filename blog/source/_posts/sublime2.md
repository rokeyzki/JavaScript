title: 在SublimeText上搭建ReactJS开发环境
date: 2015-11-05 20:51:28
tags:
---

## 编辑器选择

最近在学习ReactJS，这东西确实不错，但是在实际开发中却有很多问题。不是ReactJS本身的问题，而是开发环境，目前而言并没发现一个真正完美支持JSX语法的编辑器或IDE，这对于ReactJS开发者来说无疑是一个很头疼的事情，以往所习惯的码字方式都要改变，基本上要纯手打，虽然纯手打可以帮助记忆代码，但在工作效率上却就会大打折扣。



### HBuilder

之前一直用的是DCloud研发的[Hbuilder](http://www.dcloud.io/)来做WEB开发，可能很多人都不熟悉这个工具，简单说就是一个国产的WEB开发专用的IDE，集成了很多功能，习惯了之后工作效率确实提升不少。但Hbuilder在第三方插件方面比较弱，ReactJS的相关插件一个都没有，于是我只能换编辑器了。

<!-- more --> 

### Atom

现在的编辑器也很多，这里就不一一列举了。就目前我了解的来说，支持JSX语法高亮、代码提示以及代码校验的插件不多。Atom上有一个比较完善的ReactJS插件[ATOM REACT](http://orktes.github.io/atom-react/)，试用了一下，确实功能挺多，让我小激动了一下。但是Atom的性能却让我很不爽，首先是内存占用太大，我用的OSX，内存一下飙到900M+，一个IDE都没这么占内存。其次就是编辑较大的文件就会卡顿，那敲代码的延迟感简直不能忍，于是我放弃了Atom，可惜了这么好的一个插件。



### SublimeText

这个编辑器就不多说明了，做WEB开发的多少都了解一些，我之前用过一段时间的SublimeText，觉得找插件很麻烦，就投靠了可以一次搞定的HBuilder。现在重新启用了这个神器，因为我找到了几个很棒的ReactJS插件，下面就来具体说说。



## SublimeText插件

做ReactJS开发最需要的无疑是这两条：语法高亮、代码提示，如果能够想Emmet那样自动扩展就更好了，这里我可以告诉你，确实可以实现。



### 语法高亮

[Babel-Sublime](https://github.com/babel/babel-sublime)插件很好的支持了JSX语法的高亮显示，连包裹在组件中的HTML标签都能实现高亮显示，具体的插件安装以及设置方法就不多说了，自行看GitHub上的介绍吧，很简单。



### 代码提示

[Sublime-React](https://github.com/reactjs/sublime-react)插件严格的说并不是一个代码提示插件，而是一个类似于Emmet的自动扩展代码插件，只需要简单敲几个字母然后按下**TAB**键就能自动扩展成你想要的完整代码片段，效果如下图所示。



![Sublime-React](http://7xnvp3.com1.z0.glb.clouddn.com/1055563878-563aee89c4438_articlex.gif)



```

//支持的代码片段如下

cdm→  componentDidMount: fn() { ... }

cdup→  componentDidUpdate: fn(pp, ps) { ... }

cs→  var cx = React.addons.classSet;

cwm→  componentWillMount: fn() { ... }

cwr→  componentWillReceiveProps: fn(np) { ... }

cwu→  componentWillUpdate: fn(np, ns) { ... }

cwun→  componentWillUnmount: fn() { ... }

cx→  cx({ ... })

fdn→  React.findDOMNode(...)

fup→  forceUpdate(...)

gdp→  getDefaultProps: fn() { return {...} } 

gis→  getInitialState: fn() { return {...} } 

ism→  isMounted()

props→  this.props.

pt→  propTypes { ... }

rcc→  component skeleton

refs→  this.refs.

ren→  render: fn() { return ... }

scu→  shouldComponentUpdate: fn(np, ns) { ... }

sst→  this.setState({ ... })

state→  this.state.

```



### JSX中使用Emmet

虽然上面这个插件可以实现JSX的代码扩展，但是在JSX中包裹的HTML却不能直接支持Emmet，需要通过安装其他插件以及修改相应设置来实现。首先是安装需要的插件：**RegReplace**和**Chain Of Command**，直接在插件库中搜索安装即可。接下来就是设置了，先在 `KeyBinding – Users` 中插入下面这段代码：

```

{

    "keys": ["tab"],

    "command": "expand_abbreviation_by_tab", 

    "context": [{

        "operand": "source.js", 

        "operator": "equal", 

        "match_all": true, 

        "key": "selector"

    },{

        "key": "preceding_text", 

        "operator": "regex_contains", 

        "operand": "(\\b(a\\b|div|span|p\\b|button)(\\.\\w*|>\\w*)?)", 

        "match_all": true

    },{

        "key": "selection_empty", 

        "operator": "equal", 

        "operand": true, 

        "match_all": true

    }]

}

```

这样就实现了在JSX中按TAB键来扩展HTML片段了，但是JSX中的HTML和标准的HTML又有不同的地方，就是HTML中的 `class`，在JSX中是 `className`，所以这里就需要修改RegReplace的设置，找到 `Packagea Setting --> Reg Replace --> Settings-User`，插入下面这段代码：

```

{

    "replacements": {

        "js_class": {

            "find": " class=\"",

            "replace": " className=\"",

            "greedy": true,

            "case": false

        }

    }

}

```

这样就大功告成了，开始快乐的学习ReactJS吧~~！欢迎各位大神来补充。