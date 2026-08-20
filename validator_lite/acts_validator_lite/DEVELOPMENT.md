# 用例开发指南

## testItems 数据结构

在 `app.js` 的 `testItems` 中注册用例，每个 key 是一条用例：

```javascript
testItems: {
    'text_largeColor': { cat: 'text', status: 'null', help: 'Check if text renders correctly' },
    'api_app':         { cat: 'api', status: 'null', help: 'Verify app.getInfo' },
}
```

| 字段 | 说明 |
|------|------|
| `cat` | 子系统分类，用于导航 |
| `status` | 初始 `'null'`，运行时 `'pass'`/`'fail'` |
| `help` | 帮助文本 |
| `errorDetail` | 可选，失败详情 |

key 命名：组件用 `组件_功能`（`chart_bar`），API 用 `api_子系统_接口`（`api_brightness_value`）。

## 新增用例

以 ArkUI 下新增 `div` 组件测试为例，改 5 个文件：

### 1. app.js — 注册用例

```javascript
'div_layout': { cat: 'text', status: 'null', help: 'Check div layout' }
```

### 2. 子系统列表页 — 添加入口

`pages/ArkUI/common/index/index.js` 的 `todolist` 中添加：

```javascript
{ id: 26, title: 'div', url: 'pages/ArkUI/div/index' },
```

### 3. 创建用例页

`pages/ArkUI/div/index.{hml,js,css}`，参照已有用例页：

```javascript
import router from '@system.router';

export default {
    data: { title: 'div' },
    onInit() { console.info('div onInit'); },
    passClicked() {
        getApp().data.testItems.div_layout.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.div_layout.status = 'fail';
        this.back();
    },
    helpClicked() {
        getApp().data.helpData = {
            step: '操作步骤',
            result: '预期结果',
            url: 'pages/ArkUI/div/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/ArkUI/common/index/index' }); },
    backClicked() { this.back(); }
};
```

### 4. manifest.json + config.json — 注册路由

pages 数组添加 `"pages/ArkUI/div/index"`。

### 5. BUILD.gn — 注册源文件

```gn
"entry/src/main/js/MainAbility/pages/ArkUI/div/index.hml",
"entry/src/main/js/MainAbility/pages/ArkUI/div/index.js",
"entry/src/main/js/MainAbility/pages/ArkUI/div/index.css",
```

## 新增子系统

1. `index/index.hml` — 添加按钮
2. `index/index.js` — `navigateTo` 中添加路由
3. `pages/<子系统>/common/index/` — 创建列表页
4. `app.js` — 注册该子系统下的用例
5. `manifest.json` + `config.json` — 注册路由
6. `BUILD.gn` — 注册源文件

## 串口结果协议

```
[start] start run suites
[report] text_large pass
[report] api_file fail getLocale error: TypeError
[total] 30 2 3
[end] run suites end
```

| status | 报告状态 |
|--------|---------|
| `pass` | Pass |
| `fail` | Fail + `<failure message>` |
| `untested` | Ignored |

## errorDetail

在 catch/fail 回调中写入：

```javascript
getApp().data.testItems.div_layout.errorDetail = 'getLocale error: ' + e;
```

## 用例页模板

### index.hml

```html
<div class="container">
    <div class="content-title">
        <text style="...">用例名</text>
        <input type="button" value="?" onclick="helpClicked" />
    </div>
    <div class="content">
        <!-- 被测组件 -->
    </div>
    <div class="bottom-bt">
        <input type="button" value="pass" onclick="passClicked" />
        <input type="button" value="fail" onclick="failClicked" />
        <input type="button" value="back" onclick="backClicked" />
    </div>
</div>
```

## ACE Lite 注意事项

- `<text>` 用内联 `style`，class 选择器不可靠
- `router.back()` 不可靠，用 `router.replace`
- `<dialog>` 不支持，Help 通过独立页面
- `@system.file` 在部分设备不可用
- Help 页在 `onShow` 中读 `getApp().data.helpData`
