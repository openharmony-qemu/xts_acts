# ActsCheckboxStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/Checkbox.test.ets | 删除 beforeAll 中的 startAbility/msSleep 调用及守卫，清理未使用 import | ~8s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  ```
- **修改后**：
  ```typescript
  let cmd = 'aa start -d 0 -a EntryAbility' + ' -b ' + abilityDelegatorArguments.bundleName
  let debug = abilityDelegatorArguments.parameters['-D']
  if (debug == 'true') {
    cmd += ' -D'
  }
  let user = abilityDelegatorArguments.parameters['-u'];
  if (user !== undefined) {
    cmd += ' -u ' + user;
  }
  hilog.info(domain, tag, 'cmd : %{public}s', cmd);
  abilityDelegator.executeShellCommand(cmd)
  hilog.info(domain, tag, '%{public}s', 'wait for ability ready...');
  setTimeout(() => {
    hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }, 4000)
  ```

#### Checkbox.test.ets
- **修改前**：
  ```typescript
  import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
  import { UtilsTest, startAbility } from './Util.test.ets';
  ...
  beforeAll(async (): Promise<void> => {
    console.info("CheckboxTest beforeEach start");
    await UtilsTest.msSleep(4000);
    await startAbility("com.example.Checkbox.static", "EntryAbility");
    await UtilsTest.msSleep(4000);
  });
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, it, expect, Level } from '../../../hypium/index';
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- **清理的未使用 import**：`UtilsTest`、`startAbility`（from './Util.test.ets'）；`beforeAll`、`afterEach`、`afterAll`（from hypium）
- **保留的 import**：`router`、`Router`、`AppStorage`、`inspector`（均有引用）

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| - | - | - | - | - |

> 无需对齐的 sleep。static 的 beforeAll 中原有两处 `UtilsTest.msSleep(4000)` 已在第一步随 beforeAll 删除。beforeEach 和 it 块中无 sleep 调用（使用 setTimeout(500)），与非 static 一致。

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| - | - | - | - | - | - |

### 对应非 static 测试套
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_component_Checkbox_static | ace_ets_component_Checkbox | 是 |

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| Checkbox.test.ets | ArkUX_CheckBox_Visual_static_0110 | Checkbox.test.ets | ArkUX_CheckBox_Visual_0110 | 去除 _static 后缀 |
| Checkbox.test.ets | ArkUX_CheckBox_Visual_static_0120 | Checkbox.test.ets | ArkUX_CheckBox_Visual_0120 | 去除 _static 后缀 |
| Checkbox.test.ets | ArkUX_CheckBox_Visual_static_0130 | Checkbox.test.ets | ArkUX_CheckBox_Visual_0130 | 去除 _static 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

**匹配统计：static 3 个用例，非 static 3 个用例，已匹配 3 对。**
