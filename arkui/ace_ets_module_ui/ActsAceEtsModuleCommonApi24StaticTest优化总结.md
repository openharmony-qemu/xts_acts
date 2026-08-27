# ActsAceEtsModuleCommonApi24StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | Ability 统一启动一次 |
| entry/src/main/src/test/Enums/Enums.test.ets | 删除 beforeAll 中的 startAbility 调用；移除 UtilsTest import；移除 beforeAll hypium import；afterEach 及 2 个 it 块的 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/CommonPage/CommonPage.test.ets | 删除 beforeAll 中的 startAbility 调用；移除 UtilsTest import；移除 beforeAll hypium import；afterEach 的 await 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  public onRun: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
  ```
- **修改后**：
  ```typescript
  public onRun: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let cmd = 'aa start -d 0 -a EntryAbility' + ' -b ' + abilityDelegatorArguments.bundleName
    let debug = abilityDelegatorArguments.parameters['-D']
    if (debug == 'true') { cmd += ' -D' }
    let user = abilityDelegatorArguments.parameters['-u'];
    if (user !== undefined) { cmd += ' -u ' + user; }
    hilog.info(domain, tag, 'cmd : %{public}s', cmd);
    abilityDelegator.executeShellCommand(cmd)
    hilog.info(domain, tag, '%{public}s', 'wait for ability ready...');
    setTimeout(() => {
      hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
    }, 4000)
  }
  ```

#### Enums.test.ets
- **修改前**：
  ```typescript
  import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility('com.arkui.ace.ets.module.common.api24.static', 'EntryAbility');
  });
  ...
  afterEach(async (): Promise<void> => {
    clearModuleStorage();
    await Utils.sleep(SLEEP);
  });
  ...
  it('SUB_ArkUI_Enums_Ellipsis_Mode_MULTILINE_START_0100', ..., async (done) => {
    const driver = Driver.create();
    await Utils.sleep(SLEEP);
    await (await driver.findComponent(...))?.click();
    await Utils.sleep(SLEEP);
    expect(...).assertEqual('true');
    done();
  });
  ```
- **修改后**：
  ```typescript
  import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
  // UtilsTest import 已删除
  ...
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ...
  afterEach(async (): Promise<void> => {
    clearModuleStorage();
    try {
      await Utils.sleep(SLEEP);
    } catch (err) {
      console.info('EnumsTest afterEach sleep err: ' + JSON.stringify(err));
    }
  });
  ...
  it('SUB_ArkUI_Enums_Ellipsis_Mode_MULTILINE_START_0100', ..., async (done) => {
    try {
      const driver = Driver.create();
      await Utils.sleep(SLEEP);
      await (await driver.findComponent(...))?.click();
      await Utils.sleep(SLEEP);
      expect(...).assertEqual('true');
      done();
    } catch (e) {
      console.error('EnumsTest MULTILINE_START error: ' + e);
      expect().assertFail();
      done();
    }
  });
  ```

#### CommonPage.test.ets
- **修改前**：
  ```typescript
  import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility('com.arkui.ace.ets.module.common.api24.static', 'EntryAbility');
  });
  ...
  afterEach(async (): Promise<void> => {
    await Utils.sleep(SLEEP);
  });
  ```
- **修改后**：
  ```typescript
  import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
  // UtilsTest import 已删除
  ...
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ...
  afterEach(async (): Promise<void> => {
    try {
      await Utils.sleep(SLEEP);
    } catch (err) {
      console.info('CommonTest afterEach sleep err: ' + JSON.stringify(err));
    }
  });
  ```
  > 注：CommonPage.test.ets 的 2 个 it 块原本已有 try-catch 包裹，无需额外修改。

## 二、Sleep 时长对齐

### 对应非 static 测试套不存在
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_common_api24_static | ace_ets_module_common_api24 | 否 |

### 说明
经目录名推导（去掉 `_static` 后缀）和 it 用例名反向查找（在 `D:\code\newC\xts_acts_2725\arkui` 全库搜索 4 个 static it 用例名），均未找到对应的非 static 测试套。因此无法进行 sleep 时长对齐。

### Static 侧 sleep 记录（仅供参考）
| 文件 | sleep 位置 | 类型 | 时长(ms) |
|---|---|---|---|
| Enums.test.ets | afterEach (line 106) | Utils.sleep(SLEEP) | 1000 |
| Enums.test.ets | it MULTILINE_START (line 123) | Utils.sleep(SLEEP) | 1000 |
| Enums.test.ets | it MULTILINE_START (line 125) | Utils.sleep(SLEEP) | 1000 |
| Enums.test.ets | it MULTILINE_CENTER (line 146) | Utils.sleep(SLEEP) | 1000 |
| Enums.test.ets | it MULTILINE_CENTER (line 148) | Utils.sleep(SLEEP) | 1000 |
| CommonPage.test.ets | afterEach (line 108) | Utils.sleep(SLEEP) | 800 |
| CommonPage.test.ets | it Counter_Text_Color (line 124) | Utils.sleep(SLEEP) | 800 |
| CommonPage.test.ets | it Counter_Text_Overflow_Color (line 146) | Utils.sleep(SLEEP) | 800 |
| Util.test.ets | startAbility 定义内 (line 60) | UtilsTest.msSleep(4000) | 4000 |

### 已对齐
（无 — 非 static 测试套不存在）

### 差异过大（未修改）
（无 — 非 static 测试套不存在）

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| （无） | — | — | — | — |

**已匹配数量：0**

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| Enums.test.ets | SUB_ArkUI_Enums_Ellipsis_Mode_MULTILINE_START_0100 |
| Enums.test.ets | SUB_ArkUI_Enums_Ellipsis_Mode_MULTILINE_CENTER_0200 |
| CommonPage.test.ets | SUB_ArkUI_CommonPage_Input_Counter_Options_Counter_Text_Color_0100 |
| CommonPage.test.ets | SUB_ArkUI_CommonPage_Input_Counter_Options_Counter_Text_Overflow_Color_0200 |

### 仅非 static 存在的用例（static 中无对应）
（无 — 非 static 测试套不存在）

### 汇总
| 类别 | 数量 |
|---|---|
| static it 用例总数 | 4 |
| 非 static it 用例总数 | 0 |
| 已匹配 | 0 |
| 仅 static 存在 | 4 |
| 仅非 static 存在 | 0 |
