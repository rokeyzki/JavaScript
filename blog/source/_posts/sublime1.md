title: 我的 Sublime Text 必备插件
date: 2015-11-04 19:52:35
tags:
---

## 常用插件清单 :

* SideBarEnhancements

* HTML-CSS-JS Prettify

* SublimeCodeIntel

* Emmet



## SideBarEnhancements

Sublime Text有一个缺点，当你想使用浏览器浏览你的html页面的时候，你需要在你的文件上点击鼠标右键，选择Open In Browser才可以浏览器浏览，而这是用默认浏览器浏览，如果想用第二个浏览器都没办法. 所以，可以通过SideBarEnhancements这个插件来更方便的浏览



### 第一步 : 安装

通过 `Package Control->Install Package` 搜索 `sidebarenhancements` 安装



### 第二步 : 配置 ( 一 )

右键某html，js，css等文件，找到 `Open With` 然后点击 `Edit Applications`

将里面内容设置为:

<!-- more --> 

```

[

    {"id": "side-bar-files-open-with",

        "children":

        [



            {

                "caption": "Firefox",

                "id": "side-bar-files-open-with-chrome",



                "command": "side_bar_files_open_with",

                "args": {

                            "paths": [],

                            "application": "/Applications/Firefox.app", 

                            //火狐浏览器的路径 Windows中，后缀为.exe

                            "extensions":".*", 

                            "args":[]

                        },

                "open_automatically" : false 

            },



            {

                "caption": "Chrome",

                "id": "side-bar-files-open-with-chrome",



                "command": "side_bar_files_open_with",

                "args": {

                            "paths": [],

                            "application": "/Applications/Chrome.app",

                            //Chrome浏览器的路径 Windows中，后缀为.exe

                            "extensions":".*", 

                            "args":[]

                        },

                "open_automatically" : false

            },

            

            //如果想再添加浏览器，复制下面这个对象，改相应的路径就可以了.

            {

                "caption": "Safari",

                "id": "side-bar-files-open-with-chrome",



                "command": "side_bar_files_open_with",

                "args": {

                            "paths": [],

                            "application": "/Applications/Safari.app",

                            //Safari浏览器的路径 Windows中，后缀为.exe

                            "extensions":".*", 

                            "args":[]

                        },

                "open_automatically" : false 

            }

        

            

        ]

    }

]

```



### 第三步 : 配置 ( 二 )

打开 `Preferences` 里面的 `Key Bindings - User` 把内容修改为:

```

//keys 对应的值就是按键，比如按F2就会用Firefox打开这个页面

[

    { "keys": ["f2"], "command": "side_bar_files_open_with",

            "args": {

                "paths": [],

                "application": "/Applications/Firefox.app", 

                //对应上面的Firefox路径

                "extensions":".*" 

            } 

    },



    { "keys": ["f1"], "command": "side_bar_files_open_with",

            "args": {

                "paths": [],

                "application": "/Applications/Safari.app",

                //对应上面的Safari路径

                "extensions":".*" 

            } 

    },

    

    //如果有新添加的浏览器，只需要把下面这个对象复制一份，路径与新添加的对应就可以了.

    { "keys": ["f4"], "command": "side_bar_files_open_with",

            "args": {

                "paths": [],

                "application": "/Applications/Chrome.app",

                //对应上面的Chrome路径

                "extensions":".*" 

            } 

    }

]

```

现在，`F1` 就是 Safari，`F2` 是Firefox，`F4` 是 Chrome



## HTML-CSS-JS Prettify

### 第一步 : 安装

通过 `Package Control->Install Package` 搜索 `HTML-CSS-JS Prettify` 安装



### 第二步 : 使用

* 选中格式化代码，然后在按 `Cmd+Shift+H` (如果是Windows系统按 `Ctrl+Shift+H`，这两个快捷键是默认的).

* 但是，这时候如果报错sh: node: command not found，说明node没有安装，那么就需要安装node. 安装好后，Linux和Mac不需要做什么更改，而Windows用户则需要配置一下node_path.

* 首先，在菜单栏里点击Preferences点击第一个Browse Packages，然后进入HTML-CSS-JS Prettify文件夹，找到HTMLPrettify.sublime-settings文件，用Sublime Text打开进行更改windows对应的值，就是安装的node的路径



### 第三步 : 配置 ( 快捷键 )

如果对快捷键不满意，可以自己设置 . 打开 `Preferences` 里面的 `Key Bindings - User`，添加内容: `{ "keys": ["alt+q"], "command": "htmlprettify" }` ，当然快捷键你可以自己更改.



### 第四步 : 配置 ( 代码整理样式 )

如果对代码对其效果不满意，可以选择 `Preferences` 里的 `Package Settings` 找到 `HTML/CSS/JS Prettify` 里的 `Set Prettify Preferences` .里面是一些规则的设置. 这个文件就是github(详细设置可到github中看)中提到的.jsbeautifyrc文件



## SublimeCodeIntel

它的功能是代码提示，支持这些语言 : `JavaScript, Mason, XBL, XUL, RHTML, SCSS, Python, HTML, Ruby, Python3, XML, Sass, XSLT, Django,HTML5, Perl, CSS, Twig, Less, Smarty, Node.js, Tcl, TemplateToolkit, PHP` .



它还有一个功能，就是跳转到函数定义的地方



### 第一步 : 安装

通过 `Package Control->Install Package` 搜索 `SublimeCodeIntel` 安装.

(安装过程中非常慢，慢慢等着吧，我挂了VPN快了不少)



### 第二步 : 配置

选择 `Preferences->Package Settings->SublimeCodeIntel->Setting Default`，将其内容全部复制到 `Setting User` 中 . 按 `Command+F` (或者 `ctrl+F` )搜索 `codeintel_selected_catalogs`，将其内容改为如下:

```

"codeintel_selected_catalogs": [

  "HTML5", "HTML", "JavaScript"

],

```



### 第三步 : 使用

* 按 `d` 会提示 `div tag` 选择这个 `div tag` 就会出现 :

```html

<div></div>

```



但输入 `div.class` 或者 `div#id`，按下 `Tab` 会出现下面效果

```html

<div class="class"></div>

<div id="id"></div>

```



这个功能2其实 `Emmet` 也有，但是 `Emmet` 没有功能1的代码提示



## Emmet

`Emmet` (前身为大名鼎鼎的 `Zen Coding` )是一个能大幅度提高前端开发效率的一个工具:



### 第一步 : 安装

通过 `Package Control->Install Package` 搜索 `Emmet` 安装.



### 第二步 : 使用

快速设置 `class` 属性和 `id` 属性，在 `SublimeCodeIntel` 插件功能2就可以了，但是下面的功能 `SublimeCodeIntel` 却没有:

输入 `ul>li*5`，按下 `Tab`，会有如下结果 :

```html

<ul>

    <li></li>

    <li></li>

    <li></li>

    <li></li>

    <li></li>

</ul>

```



更多使用方法可以 **百度**，**Google** 搜索这个插件怎么用，也可以去[官方文档](http://docs.emmet.io/)查看.



### 第三步 : 配置

Emmet还有一个功能，选取相同词，可以一次更改多个词，在mac中默认快捷键是 `Canmand+D` (我记得是，要不然我也不会改键).

我习惯 `Cammand+D(Ctrl+d)` 是删除当前行，所以在 `Preferences->Key Bindings - User` 添加下面这两行:

```

{ "keys": ["command+shift+d"], "command":"find_under_expand" }, { "keys": ["command+d"], "command":"run_macro_file", "args": {"file":"Packages/Default/Delete Line.sublime-macro"} } // 修改过后，command+shift+d就是选取相同的词，command+d删除当前行

```

