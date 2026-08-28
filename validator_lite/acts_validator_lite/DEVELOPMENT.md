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
| `status` | 初始 `'null'`；运行时 `'pass'`/`'fail'`；设备不支持该能力时保持 `'null'`（报告记 `untested`） |
| `help` | 帮助文本；API 用例建议标注 `require SystemCapability.xxx; auto-skip as untested if unsupported` |
| `errorDetail` | 可选，失败/不支持原因；**进报告必须 ASCII**（见「不支持能力处理」） |

key 命名：组件用 `组件_功能`（`chart_bar`），API 用 `api_子系统_接口`（`api_brightness_value`）。

## 新增用例

以 ArkUI 下新增 `div` 组件测试为例，改 5 个文件：

### 1. app.js — 注册用例

```javascript
'div_layout': { cat: 'text', status: 'null', help: 'Check div layout' }
```

### 2. 子系统列表页 — 添加入口

`pages/ArkUI/common/index/index.js` 的 `todolist` 中添加（单用例子系统如 Communication/FileManagement 无列表页，直接在 `index/index.js` 的 `navigateTo` 路由里指向用例页）：

```javascript
{ id: 26, title: 'div', url: 'pages/ArkUI/div/index' },
```

### 3. 创建用例页

`pages/ArkUI/div/index.{hml,js,css}`，参照已有用例页（完整模板见文末「用例页模板」；涉及可选能力的用例须按「不支持能力处理」加 `canIUse` 判定）：

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

### 4. config.json — 注册路由

`entry/src/main/config.json` 的 `js[0].pages` 数组添加 `"pages/ArkUI/div/index"`。

### 5. BUILD.gn — 注册源文件

```gn
"entry/src/main/js/MainAbility/pages/ArkUI/div/index.hml",
"entry/src/main/js/MainAbility/pages/ArkUI/div/index.js",
"entry/src/main/js/MainAbility/pages/ArkUI/div/index.css",
```

## 新增子系统

1. `index/index.hml` — 添加按钮
2. `index/index.js` — `navigateTo` 中添加路由
3. `pages/<子系统>/common/index/` — 创建列表页（单用例子系统可省略，路由直接指向用例页）
4. `app.js` — 注册该子系统下的用例
5. `config.json` — 注册路由
6. `BUILD.gn` — 注册源文件

## 串口结果协议

`index/index.js` 的 `generateReport()` → `_outputReportLines()` 逐条 `console.info` 输出，由 xdevice `ValidatorLiteDriver` 解析：

```
[start] start run suites
[report] text_largeColor pass
[report] api_file fail writeText error: TypeError
[report] api_battery untested unsupported: SystemCapability.PowerManager.BatteryManager.Lite
[total] 30 1 1
[end] run suites end
```

格式：`[report] <key> <status> [errorDetail]`，其中 `errorDetail` 为 `testItems[key].errorDetail`。

| status | 报告状态 | XML 落点 |
|--------|---------|---------|
| `pass` | Pass | `<testcase result="true">` |
| `fail` | Fail | `<testcase result="false"><failure message="..."/></testcase>` |
| `untested` | Ignored | `<testcase result="untested" message="..."/>`（有 errorDetail 时附原因） |

> `untested` 的 `errorDetail` 会被驱动写为 testcase 的 `message` 属性，进入可视化 `data.js` 的第 5 字段。故不支持场景务必给 `errorDetail`（ASCII），否则报告只见 Ignored 无原因。

## errorDetail

两类写入场景：

1. **接口失败**（catch / fail 回调）：
   ```javascript
   getApp().data.testItems.api_file.errorDetail = 'writeText error: ' + e;
   ```
2. **能力不支持**（见下节，`canIUse` 判定后写 ASCII 原因）。

## 不支持能力处理（canIUse 前置判定）

用例若依赖**可选系统能力**（NFC / 电池 / 亮度等），在不支持设备上应跳过（untested）而非判 fail。统一模式：

```javascript
import router from '@system.router';
import cardEmulation from '@ohos.nfc.cardEmulation';

export default {
    data: {
        hceService: null, value: '', statusMsg: '',
        supported: false,          // 能力是否支持
        tipMsg: '',                // 屏幕操作指引（不支持时填）
    },
    onInit() {
        // 1. syscap 取自被测接口 d.ts 的 @syscap
        this.supported = canIUse('SystemCapability.Communication.NFC.CardEmulation');
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.Communication.NFC.CardEmulation';  // 屏幕中文回显
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            getApp().data.testItems['api_nfc'].errorDetail =
                'unsupported: SystemCapability.Communication.NFC.CardEmulation';                 // 报告用，必须 ASCII
        }
    },
    nfcOperate() {
        // 2. 每个操作入口前置拦截，避免在不支持设备上调用 API（抛 801）
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.Communication.NFC.CardEmulation';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            return;
        }
        try { /* 被测 API */ }
        catch (e) {
            getApp().data.testItems['api_nfc'].errorDetail = 'nfcOperate error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },
    helpClicked() {
        getApp().data.helpData = {
            // 3. 帮助页写清三分支
            step: '进入页面自动通过 canIUse 检测 SystemCapability.Communication.NFC.CardEmulation；支持时点击读卡按钮，不支持时直接点 back 跳过',
            result: '读卡显示 success → 点 pass；读卡报错 → 点 fail；设备不支持该能力 → 点 back（记为 untested）',
            url: 'pages/Communication/nfc/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    // passClicked / failClicked / back 同基础模板
};
```

规则：

- **syscap 来源**：被测接口 d.ts 的 `@syscap`。例：`@ohos.nfc.cardEmulation.d.ts` → `SystemCapability.Communication.NFC.CardEmulation`；`@system.battery.d.ts` → `SystemCapability.PowerManager.BatteryManager.Lite`；`@system.brightness.d.ts` → `SystemCapability.PowerManager.DisplayPowerManager.Lite`。
- **`canIUse` 无需 import**：它是 lite 全局函数（`interface/sdk-js/api/common/lite/global.d.ts`，`@famodelonly`、`@since 8`），与 `getApp`/`setTimeout` 同列。
- **status 保持 `'null'`**：不主动设 pass/fail，报告记 `untested`（Ignored）并附 errorDetail 原因；操作员点 `back` 即可。
- **errorDetail 必须 ASCII**：`[report]` 行经串口/hilog → xdevice 采集，中文在 GBK 解码下会截断（如「不支持」→「不支」）；`statusMsg`/`tipMsg` 是 HAP 内 UTF-8 渲染，可中文。故只把进报告的 `errorDetail` 写成 `unsupported: SystemCapability.xxx`。
- **tipMsg 布局**：放在 `.content` **外**、标题栏下方（ACE Lite 固定高度容器内子元素易溢出、被下方按钮遮挡）；支持时 `tipMsg` 为空串，仅留小间距。CSS 用 `.content-tip`（橙色 `#FF6B00`、16px，醒目）。
- **帮助三分支**：`success → pass`；`报错 → fail`；`不支持 → back（untested）`，不要笼统只写「通过点 Pass，失败点 Fail」。

已按此模式处理的用例：`api_nfc`、`api_battery`、`api_brightness_value`、`api_brightness_mode`、`api_configuration`。

> 注：`api_configuration` 的 syscap 是 `SystemCapability.ArkUI.ArkUI.Lite`（ArkUI 轻量基座本身），凡能运行本 FA lite 应用的设备基本都支持，`canIUse` 在实践中恒为 true，判定更多是结构一致与防御性。

## 用例页模板

### index.hml

```html
<div class="container">
    <div class="content-title">
        <text style="width:150px;height:50px;text-align:center;font-size:16px;">用例名</text>
        <input type="button" value="?" class="backBtnHelp" onclick="helpClicked" />
    </div>
    <text class="content-tip">{{ tipMsg }}</text>   <!-- 不支持提示；支持时为空 -->
    <div class="content">
        <!-- 被测组件 / 操作回显区 -->
    </div>
    <div class="bottom-bt">
        <input type="button" value="操作" class="button-operate" onclick="someOperate" />   <!-- 可选 -->
    </div>
    <div class="bottom-bt">
        <input type="button" value="pass" class="button" onclick="passClicked" />
        <input type="button" value="fail" class="button" onclick="failClicked" />
        <input type="button" value="back" class="button" onclick="backClicked" />
    </div>
</div>
```

涉及可选能力的用例，js 须按「不支持能力处理」加 `canIUse` 判定与操作守卫，并补 `supported`/`tipMsg` 数据字段。

### .content-tip（css）

```css
.content-tip {
    width: 90%;
    font-size: 16px;
    color: #FF6B00;
    text-align: center;
    margin: 4px 0;
    padding: 0 10px;
}
```

## ACE Lite 注意事项

- `<text>` 标题用内联 `style` 设尺寸/字号更稳（class 在部分 `<text>` 上表现不一致）；容器、按钮、提示行等用 class 正常。
- `router.back()` 不可靠，用 `router.replace`。
- `<dialog>` 不支持，Help 通过独立页面。
- `@system.file` 在部分设备不可用。
- Help 页在 `onShow` 中读 `getApp().data.helpData`。
- ACE Lite 不支持可靠的条件渲染（`if=`/`show=`），用「数据绑定空串」模拟：支持时字段为 `''` 不渲染可见内容，不支持时填值。
