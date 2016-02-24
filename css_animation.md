# CSS 动画

## 大纲
> * 设定：animation
* 规则：@keyframes

## 设定：animation
> ### 说明
```css
/* == 参数 ==
 * 默认值：动画名称(必填) 动画时长(必填) 动画速度曲线 动画延迟 动画播放次数 动画轮流反向播放
 *
 * == 详细说明 ==
 * 1.动画名称：none
 * 2.动画时长：none
 * - 无：none
 * - 秒：1s
 * - 毫秒：2ms
 * 3.动画速度曲线：ease
 * - 普通：ease
 * - 匀速：linear
 * - 起慢：ease-in
 * - 尾慢：ease-out
 * 4.动画延迟：none
 * - 无：none
 * - 秒：1s
 * - 毫秒：2ms
 * 5.动画播放次数：1
 * - 次数：8
 * - 无限：infinite
 * 6.动画轮流反向播放：normal
 * - 正常：normal
 * - 来回：alternate
 */
position: relative;
animation: ${1:value};
```

## 规则：@keyframes
```css
@keyframes ${1:name} {
  ${2:0}% {
    ${3:background-color: #FF984C;}
  }
  ${4:25}% {
    ${5:background-color: #FF73A5;}
  }
  ${6:50}% {
    ${7:background-color: #9264FF;}
  }
  ${8:75}% {
    ${9:background-color: #51A8FF;}
  }
  ${10:100}% {
    ${11:background-color: #5BFF91;}
  }
}
```
