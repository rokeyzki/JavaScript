# CSS 变形

## 大纲
> * 变形：transform
* 变形原点：transform-origin

## 变形：transform
> ### 说明
```css
/* == 参数 ==
 * 无样式：none
 * 旋转：rotate(45deg)
 * 缩放：scale(1.5, 2)
 * 倾斜：skew(-10deg, 10deg)
 * 移动：translate(20px, 10px)
 * 继承：inherit
 *
 * == 参数说明 ==
 * rotate(45deg)：
 * - 参数一：正值：根据Y轴顺时针旋转的度数，负值：根据Y轴逆时针旋转的度数，取值范围：-180deg至180deg
 *
 * scale(1.5, 2)：
 * - 参数一：宽度缩放的比例，取值范围：不限
 * - 参数二：高度缩放的比例，取值范围：不限
 *
 * skew(-10deg, 10deg)：
 * - 参数一：正值：根据Y轴向左倾斜的度数，负值根据Y轴向右倾斜的度数，取值范围：90deg至-90deg
 * - 参数二：正值：根据X轴向下倾斜的度数，负值根据X轴向上倾斜的度数，取值范围：-90deg至90deg
 *
 * translate(20px, 10px)：
 * - 参数一：水平方向位移的像素，取值范围：不限
 * - 参数二：垂直方向位移的像素，取值范围：不限
 *
 * == 优先顺序 ==
 * 排序：rotate、scale、skew、translate
 */
transform: ${1:value};
```

## 变形原点：transform-origin
> ### 说明
```css
transform-origin: ${1:20%} ${2:40%};
```
