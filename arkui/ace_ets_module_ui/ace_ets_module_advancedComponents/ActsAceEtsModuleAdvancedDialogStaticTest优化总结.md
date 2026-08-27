# ActsAceEtsModuleAdvancedDialogStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/dialog/alertDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/counter/counterDirection.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialog/confirmDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialog/customContentDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialog/loadingDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialog/selectDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialog/tipsDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |

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
  if (debug == 'true') { cmd += ' -D' }
  let user = abilityDelegatorArguments.parameters['-u'];
  if (user !== undefined) { cmd += ' -u ' + user; }
  abilityDelegator.executeShellCommand(cmd)
  setTimeout(() => {
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }, 4000)
  ```

#### 各 .test.ets 文件
- **修改前**：
  ```typescript
  import {UtilsTest,startAbility} from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility("com.acts.arkui.advancedDialog.test.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // import {UtilsTest,startAbility} 行已删除
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // beforeAll 从 hypium import 中移除
  // afterEach 中的 await Utils.sleep(1000) 包裹 try-catch
  // it 块中的 standalone await 调用包裹 try-catch
  ```

### 修改文件总计
- OpenHarmonyTestRunner.ets: 1 个
- .test.ets 文件: 7 个
- **总计: 8 个文件**

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_advancedDialog_static | ace_ets_module_advanceDialog | 存在 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|

> 所有 sleep 时长已与非 static 一致，无需修改。

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|

> 无差异过大的 sleep。

### 非对应文件说明
| static 文件 | 非 static 对应文件 | 说明 |
|---|---|---|
| counter/counterDirection.test.ets | 无 | 非 static 测试套中不存在 counter 子目录，无对应文件 |

### Sleep 对齐明细

#### beforeEach 中的 sleep
| static 文件 | 非 static 文件 | static sleep(ms) | 非 static sleep(ms) | 差异 | 处理 |
|---|---|---|---|---|---|
| alertDialogTest.test.ets | alertDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| confirmDialogTest.test.ets | confirmDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| customContentDialogTest.test.ets | customContentDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| loadingDialogTest.test.ets | loadingDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| selectDialogTest.test.ets | selectDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| tipsDialogTest.test.ets | tipsDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |

#### afterEach 中的 sleep
| static 文件 | 非 static 文件 | static sleep(ms) | 非 static sleep(ms) | 差异 | 处理 |
|---|---|---|---|---|---|
| alertDialogTest.test.ets | alertDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| confirmDialogTest.test.ets | confirmDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| customContentDialogTest.test.ets | customContentDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| loadingDialogTest.test.ets | loadingDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| selectDialogTest.test.ets | selectDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| tipsDialogTest.test.ets | tipsDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |

#### it 块中的 sleep（每个 it 用例）
| static 文件 | 非 static 文件 | static sleep 序列(ms) | 非 static sleep 序列(ms) | 差异 | 处理 |
|---|---|---|---|---|---|
| alertDialogTest.test.ets | alertDialogTest.test.ets | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| confirmDialogTest.test.ets | confirmDialogTest.test.ets | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| customContentDialogTest.test.ets | customContentDialogTest.test.ets | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| loadingDialogTest.test.ets | loadingDialogTest.test.ets | 2000, 1000, 1000, 1000 | 2000, 1000, 1000 | 多1个sleep | static额外sleep保留 |
| selectDialogTest.test.ets | selectDialogTest.test.ets | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| tipsDialogTest.test.ets (0100-0300) | tipsDialogTest.test.ets (0100-0300) | 2000, 1000, 1000 (每个) | 2000, 1000, 1000 (每个) | 0 | 无需修改 |

### Sleep 时长对齐总计
- 已对齐: 0 个（所有 sleep 已一致）
- 差异过大未修改: 0 个
- 无对应非 static 文件: 1 个（counterDirection.test.ets）

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| alertDialogTest.test.ets | alertDialogTest_static_0100 | alertDialogTest.test.ets | alertDialogTest_0100 | 去除_static后缀 |
| confirmDialogTest.test.ets | confirmDialogTest_static_0100 | confirmDialogTest.test.ets | confirmDialogTest_0100 | 去除_static后缀 |
| customContentDialogTest.test.ets | customContentDialogTest_static_0100 | customContentDialogTest.test.ets | customContentDialogTest_0100 | 去除_static后缀 |
| loadingDialogTest.test.ets | loadingDialogTest_static_0100 | loadingDialogTest.test.ets | loadingDialogTest_0100 | 去除_static后缀 |
| selectDialogTest.test.ets | selectDialogTest_static_0100 | selectDialogTest.test.ets | selectDialogTest_0100 | 去除_static后缀 |
| tipsDialogTest.test.ets | tipsDialogTest_static_0100 | tipsDialogTest.test.ets | tipsDialogTest_0100 | 去除_static后缀 |
| tipsDialogTest.test.ets | tipsDialogTest_static_0200 | tipsDialogTest.test.ets | tipsDialogTest_0200 | 去除_static后缀 |
| tipsDialogTest.test.ets | tipsDialogTest_static_0300 | tipsDialogTest.test.ets | tipsDialogTest_0300 | 去除_static后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| tipsDialogTest.test.ets | tipsDialogTest_static_0400 |
| tipsDialogTest.test.ets | tipsDialogTest_static_0500 |
| tipsDialogTest.test.ets | tipsDialogTest_static_0600 |
| counterDirection.test.ets | testCounterDirection_static_0100 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|

### it 用例对齐总计
- 已匹配: 8 个
- 仅 static 存在: 4 个
- 仅非 static 存在: 0 个
