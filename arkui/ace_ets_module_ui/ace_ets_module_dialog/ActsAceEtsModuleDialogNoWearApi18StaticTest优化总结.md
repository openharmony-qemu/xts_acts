# ActsAceEtsModuleDialogNoWearApi18StaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/dialog/showActionSheetOrder.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫变量，清理未使用 import，包裹 standalone await | ~4s/用例套（原 beforeAll 中 msSleep(4000) 每次执行） |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
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

#### showActionSheetOrder.test.ets
- **删除 beforeAll 块**（原包含 `UtilsTest.startAbility` + `UtilsTest.msSleep(4000)`）
- **删除守卫变量**：无 `isAbilityStarted` 变量（原 beforeAll 无条件启动）
- **删除未使用 import**：`hilog`、`abilityDelegatorRegistry`、`UIAbility`、`common`、`BusinessError`、`UtilsTest`
- **删除未使用模块级变量**：`domain`、`tag`、`testAbilityContext`
- **清理 hypium import**：移除 `beforeAll`
- **包裹 standalone await**：afterEach 中的 `CommonFunc.sleep(1000)` 及 4 个 it 块整体 body 包裹 try-catch
- **保留 `'use static'` 指令**

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 目录名 | 非 static 目录名 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_nowear_api18_static | ace_ets_module_dialog_nowear_api18 | 是 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| - | - | - | - | - |

> 所有 sleep 时长在 static 与非 static 之间已完全一致，无需修改。

### Sleep 对比明细
| 位置 | static (ms) | 非 static (ms) | 差异 (ms) | 是否修改 |
|---|---|---|---|---|
| beforeEach - pushUrl 后 | 2000 | 2000 | 0 | 无需修改 |
| afterEach - 清理后 | 1000 | 1000 | 0 | 无需修改 |
| it_0100 - 初始等待 | 1000 | 1000 | 0 | 无需修改 |
| it_0100 - click 后 ×4 | 500×4 | 500×4 | 0 | 无需修改 |
| it_0200 - 初始等待 | 1000 | 1000 | 0 | 无需修改 |
| it_0200 - click 后 ×4 | 500×4 | 500×4 | 0 | 无需修改 |
| it_0300 - 初始等待 | 1000 | 1000 | 0 | 无需修改 |
| it_0300 - click 后 ×4 | 500×4 | 500×4 | 0 | 无需修改 |
| it_0400 - 初始等待 | 1000 | 1000 | 0 | 无需修改 |
| it_0400 - click 后 ×4 | 500×4 | 500×4 | 0 | 无需修改 |
| ~~beforeAll - msSleep~~ | ~~4000~~ | ~~N/A~~ | ~~-~~ | ~~已删除（第一步处理）~~ |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| - | - | - | - | - | - |

> 无差异过大的 sleep。

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| showActionSheetOrder.test.ets | showActionSheetOrder_static_0100 | showActionSheetOrder.test.ets | showActionSheetOrder_0100 | 去除 _static 后缀精确匹配 |
| showActionSheetOrder.test.ets | showActionSheetOrder_static_0200 | showActionSheetOrder.test.ets | showActionSheetOrder_0200 | 去除 _static 后缀精确匹配 |
| showActionSheetOrder.test.ets | showActionSheetOrder_static_0300 | showActionSheetOrder.test.ets | showActionSheetOrder_0300 | 去除 _static 后缀精确匹配 |
| showActionSheetOrder.test.ets | showActionSheetOrder_static_0400 | showActionSheetOrder.test.ets | showActionSheetOrder_0400 | 去除 _static 后缀精确匹配 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

> 无仅 static 存在的用例。

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

> 无仅非 static 存在的用例。

## 四、汇总

| 指标 | 数量 |
|---|---|
| 修改文件数 | 2 |
| Sleep 对齐数 | 0（已全部一致） |
| it 用例匹配数 | 4 / 4（100%） |
