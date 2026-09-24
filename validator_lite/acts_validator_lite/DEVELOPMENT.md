# 用例开发指南

## 当前页面结构

| 子系统 | 页面路径 | 测试项数 | 布局 |
|--------|---------|---------|------|
| ArkUI | `ArkUI/ui_basic/index` | 7（text/opacity/chart/input/slider/progress/qrcode） | list-item 合并 |
| ArkUI | `ArkUI/ui_advanced/index` | 11（animator/picker/swiper/image/switch/event/app/config/timer×2） | list-item 合并 |
| ArkUI | `ArkUI/chart/line/index` | 1（chart_line） | list-item 单项 |
| ArkUI | `ArkUI/marquee/index` | 1（marquee） | 原始 div 布局 |
| PowerManager | `PowerManager/power/index` | 3（battery/brightness_value/brightness_mode） | list-item 合并 |
| Sensors | `Sensors/index/index` | 7（vibrator/acc/gyro/step/baro/hr/onbody） | list-item 合并 |
| Location | `Location/index/index` | 2（location_info/location_subscribe） | list-item 合并 |
| Communication | `Communication/nfc/index` | 1（nfc） | list-item 单项 |
| DistributedData | `DistributedData/storage/index` | 1（storage） | list-item 单项 |
| FileManagement | `FileManagement/file/index` | 1（file） | list-item 单项 |
| Startup | `Startup/deviceInfo/index` | 1（deviceinfo） | list-item 单项 |

> marquee 因动画在 `<list-item>` 内不生效，保留原始 div 布局，仅 pass/fail 改为 toggle 变色。

## testItems 数据结构

在 `app.js` 的 `testItems` 中注册用例（当前 38 项）：

```javascript
testItems: {
    'text_largeColor': { cat: 'text', status: 'null', help: 'Check if text renders correctly' },
    'api_app':         { cat: 'api', status: 'null', help: 'Verify app.getInfo' },
}
```

| 字段 | 说明 |
|------|------|
| `cat` | 子系统分类，用于导航 |
| `status` | 初始 `'null'`；运行时 `'pass'`/`'fail'`；设备不支持时保持 `'null'`（报告记 `untested`） |
| `help` | 帮助文本；API 用例建议标注 `require SystemCapability.xxx` |
| `errorDetail` | 可选，失败/不支持原因；**进报告必须 ASCII** |

key 命名：组件用 `组件_功能`（`chart_bar`），API 用 `api_子系统_接口`（`api_brightness_value`）。

## pass/fail 按钮 toggle 模式

所有用例的 pass/fail 按钮采用 toggle（再点恢复初始）：

```javascript
data: {
    xPassColor: '#555555', xFailColor: '#555555',  // 初始灰色
},
passX() {
    if (getApp().data.testItems['key'].status === 'pass') {
        getApp().data.testItems['key'].status = 'null';
        this.xPassColor = '#555555'; this.xFailColor = '#555555';   // 恢复灰色
    } else {
        getApp().data.testItems['key'].status = 'pass';
        this.xPassColor = '#4caf50'; this.xFailColor = '#555555';   // pass 变绿
    }
},
failX() {
    if (getApp().data.testItems['key'].status === 'fail') {
        getApp().data.testItems['key'].status = 'null';
        this.xFailColor = '#555555'; this.xPassColor = '#555555';   // 恢复灰色
    } else {
        getApp().data.testItems['key'].status = 'fail';
        this.xFailColor = '#f44336'; this.xPassColor = '#555555';   // fail 变红
    }
}
```

- pass/fail 不再立即跳转，back 按钮单独导航
- 误点后可再点恢复，对用户友好

## list-item 布局模板

### index.hml

```html
<div class="container">
    <div class="content-title">
        <text class="title">子系统名</text>
        <input type="button" value="?" class="backBtnHelp" onclick="helpClicked" />
    </div>
    <list class="scroll-area">
        <list-item class="litem" style="height:230px;">
            <text class="box-title">测试点名称</text>
            <text class="tip" show="{{!supported}}">{{ tip }}</text>   <!-- 不支持提示，橙色 -->
            <text class="result">{{ resultText }}</text>              <!-- 回显信息 -->
            <text class="status-text">状态: {{ statusMsg }}</text>
            <div class="op-row">
                <input class="opBtn" type="button" value="操作" onclick="someOperate" />
            </div>
            <div class="pf-row">
                <input class="pfBtn" style="background-color:{{xPassColor}};" type="button" value="pass" onclick="passX" />
                <input class="pfBtn" style="background-color:{{xFailColor}};" type="button" value="fail" onclick="failX" />
            </div>
        </list-item>
    </list>
    <div class="bottom-bt">
        <input type="button" value="back" class="button" onclick="backClicked" />
    </div>
</div>
```

### 关键 CSS

```css
.container { width: 100%; height: 100%; flex-direction: column; align-items: center; padding-top: 10px; background-color: #000000; }
.scroll-area { width: 94%; height: 60%; }
.litem { width: 100%; border-width: 2px; border-color: #4caf50; background-color: #1c1c1c; flex-direction: column; align-items: center; margin-bottom: 12px; }
.box-title { width: 100%; color: #4caf50; font-size: 15px; text-align: center; margin-top: 6px; margin-bottom: 4px; }
.tip { width: 90%; color: #ff9800; font-size: 12px; text-align: center; margin: 4px 0; }
.result { width: 92%; color: #cccccc; font-size: 13px; text-align: center; margin: 4px 0; min-height: 18px; }
.status-text { color: #4caf50; font-size: 14px; margin: 2px 0; }
.op-row { width: 92%; height: 40px; flex-direction: row; justify-content: space-around; align-items: center; flex-wrap: wrap; margin: 6px 0; }
.opBtn { width: 30%; height: 36px; font-size: 12px; margin: 2px; }
.pf-row { width: 70%; height: 40px; flex-direction: row; justify-content: space-around; align-items: center; margin-top: 6px; margin-bottom: 12px; }
.pfBtn { width: 45%; height: 36px; font-size: 13px; color: #ffffff; }
.content-title { width: 90%; height: 50px; flex-direction: row; justify-content: center; align-items: center; margin-bottom: 4px; }
.backBtnHelp { width: 44px; height: 44px; font-size: 24px; margin-left: 8px; }
.bottom-bt { width: 60%; height: 42px; flex-direction: row; justify-content: center; align-items: center; }
.button { width: 50%; height: 38px; font-size: 14px; color: #ffffff; }
.button:active { background-color: blueviolet; }
```

### list-item 高度计算

每个 list-item 需设固定高度。计算方式：内容高度 + 预留空间（约 31-34px）。

常见内容高度参考：
- box-title: ~25px
- tip: ~20px
- result（空）: 18px（min-height）
- result（12 行文本）: ~212px
- status-text: ~20px
- op-row: 52px（40px + 6px×2）
- pf-row: 58px（40px + 6px + 12px）
- border: 4px

## 新增用例

以 ArkUI 下新增测试项为例，改 5 个文件：

### 1. app.js — 注册用例

```javascript
'new_test': { cat: 'component', status: 'null', help: 'Verify new test' }
```

### 2. 合并页面 JS — 添加 data + 方法

在对应合并页（`ui_basic` 或 `ui_advanced`）的 `index.js` 中添加 data 属性和 pass/fail toggle 方法。

### 3. 合并页面 HML — 添加 list-item

```html
<list-item class="litem" style="height:230px;">
    <text class="box-title">新测试 new_test</text>
    <text class="result">{{ newText }}</text>
    <text class="status-text">状态: {{ newStatus }}</text>
    <div class="op-row">
        <input class="opBtn" type="button" value="操作" onclick="newOperate" />
    </div>
    <div class="pf-row">
        <input class="pfBtn" style="background-color:{{nPassColor}};" type="button" value="pass" onclick="passN" />
        <input class="pfBtn" style="background-color:{{nFailColor}};" type="button" value="fail" onclick="failN" />
    </div>
</list-item>
```

### 4. config.json + manifest.json — 注册路由

两个文件的 `pages` 数组都需添加页面路径。

### 5. BUILD.gn — 注册源文件

```gn
"entry/src/main/js/MainAbility/pages/ArkUI/ui_basic/index.css",
"entry/src/main/js/MainAbility/pages/ArkUI/ui_basic/index.hml",
"entry/src/main/js/MainAbility/pages/ArkUI/ui_basic/index.js",
```

## 新增子系统

1. `index/index.hml` — 添加首页按钮
2. `index/index.js` — `navigateTo` 中添加路由
3. `pages/<子系统>/index/index.{js,hml,css}` — 创建用例页（list-item 布局）
4. `app.js` — 注册该子系统下的用例
5. `config.json` + `manifest.json` — 注册路由
6. `BUILD.gn` — 注册源文件

## 不支持能力处理（canIUse 前置判定）

用例若依赖可选系统能力，在不支持设备上应跳过（untested）。统一模式：

```javascript
data: {
    supported: false,
    xxxTip: '',        // 每个测试点独立的 tip（橙色显示）
    xxxMsg: '',        // 状态回显
},
onInit() {
    this.supported = canIUse('SystemCapability.xxx');
    if (!this.supported) {
        this.xxxTip = '当前设备不支持 SystemCapability.xxx，本用例跳过（勿点 pass/fail）';
        getApp().data.testItems['api_xxx'].errorDetail = 'unsupported: SystemCapability.xxx';
    }
},
xxxOperate() {
    if (!this.supported) { this.xxxMsg = '当前设备不支持'; return; }
    try { /* 被测 API */ }
    catch (e) { this.xxxMsg = 'error: ' + e; }
}
```

HML 中每个测试点 list-item 内加独立 tip：

```html
<text class="tip" show="{{!supported}}">{{ xxxTip }}</text>
```

规则：
- **syscap 来源**：被测接口 d.ts 的 `@syscap`
- **`canIUse` 无需 import**：lite 全局函数
- **status 保持 `'null'`**：不主动设 pass/fail，报告记 `untested`
- **errorDetail 必须 ASCII**：中文在串口 GBK 解码下会截断
- **tipMsg 每个测试点独立**：避免页面级 tip 在多测试点时产生二义性
- **tip 用 `.tip` 类（橙色 `#ff9800`）**：与其他子系统一致

## 串口结果协议

`index/index.js` 的 `generateReport()` → `_outputReportLines()` 逐条 `console.info` 输出，间隔 100ms：

```
[start] start run suites
[report_start]
[report] text_largeColor pass
[report] api_file fail writeText error: TypeError
[report] api_battery untested unsupported: SystemCapability.PowerManager.BatteryManager.Lite
[total] 38 5 2
[report_end]
[end] run suites end
```

> setTimeout 间隔为 100ms（曾用 500ms 导致 29 项 × 500ms = 14.5s，用户提前按回车终止测试，只采集到部分用例）。

## 需同步更新的文件清单

新增/修改用例时，以下文件需同步检查：

| 文件 | 用途 |
|------|------|
| `app.js` | testItems 注册 |
| `manifest.json` | 页面路由注册 |
| `config.json` | 页面路由注册（与 manifest.json 保持一致） |
| `BUILD.gn` | 源文件列表（ninja 依赖来源） |
| `index/index.js` | 首页 navigateTo 路由 |
| 对应子系统 `common/index/index.js` | 子菜单列表（ArkUI 专属） |

> **三个路由文件必须一致**：`manifest.json`、`config.json`、`BUILD.gn` 的页面列表必须完全匹配，否则编译报 `missing and no known rule to make it`。修改后需删除 `out/.../toolchain.ninja` 让 GN 重新生成。

## ACE Lite 注意事项

- `<text>` 标题用内联 `style` 设尺寸/字号更稳；容器、按钮等用 class
- `router.back()` 不可靠，用 `router.replace`
- `<dialog>` 不支持，Help 通过独立页面
- Help 页在 `onShow` 中读 `getApp().data.helpData`
- **`<list-item>` 内 `<marquee>` 不生效**：marquee 页面保留原始 div 布局
- **合并页面 list-item 不宜过多**：18 项合并页在 ipcamera 设备上闪退（内存/view 节点上限），拆为 `ui_basic`（7 项）+ `ui_advanced`（11 项）两个页面
- **`show` 属性在 `<marquee>` 上不可靠**：不要用 `show` 切换 marquee 元素
