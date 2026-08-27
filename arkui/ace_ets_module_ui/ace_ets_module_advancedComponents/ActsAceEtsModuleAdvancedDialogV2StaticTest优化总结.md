# ActsAceEtsModuleAdvancedDialogV2StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/dialogV2/alertDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialogV2/confirmDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialogV2/customContentDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialogV2/dialogV2ButtonOptionTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialogV2/loadingDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialogV2/selectDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |
| entry/src/main/src/test/dialogV2/tipsDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 import，包裹 try-catch | ~4s |

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
    await UtilsTest.startAbility("com.acts.arkui.advancedDialogV2.test.static", "EntryAbility")
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
| ace_ets_module_advancedDialogV2_static | ace_ets_module_advancedDialogV2_nowear | 存在 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| selectDialogTest.test.ets | selectDialogTest.test.ets | it_static_0100 首个 sleep | 1000 | 2000 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|

> 无差异过大的 sleep。

### 非对应文件说明
| static 文件 | 非 static 对应文件 | 说明 |
|---|---|---|
| dialogV2ButtonOptionTest.test.ets | 无 | 非 static 测试套中无 dialogV2ButtonOptionTest.test.ets，仅有 popoverDialogTest.test.ets |

### Sleep 对齐明细

#### beforeEach 中的 sleep
| static 文件 | 非 static 文件 | static sleep(ms) | 非 static sleep(ms) | 差异 | 处理 |
|---|---|---|---|---|---|
| alertDialogTest.test.ets | alertDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| confirmDialogTest.test.ets | confirmDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| customContentDialogTest.test.ets | customContentDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| dialogV2ButtonOptionTest.test.ets | 无 | 2000 | N/A | N/A | 无对应文件 |
| loadingDialogTest.test.ets | loadingDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| selectDialogTest.test.ets | selectDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |
| tipsDialogTest.test.ets | tipsDialogTest.test.ets | 2000 | 2000 | 0 | 无需修改 |

#### afterEach 中的 sleep
| static 文件 | 非 static 文件 | static sleep(ms) | 非 static sleep(ms) | 差异 | 处理 |
|---|---|---|---|---|---|
| alertDialogTest.test.ets | alertDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| confirmDialogTest.test.ets | confirmDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| customContentDialogTest.test.ets | customContentDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| dialogV2ButtonOptionTest.test.ets | 无 | 1000 | N/A | N/A | 无对应文件 |
| loadingDialogTest.test.ets | loadingDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| selectDialogTest.test.ets | selectDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |
| tipsDialogTest.test.ets | tipsDialogTest.test.ets | 1000 | 1000 | 0 | 无需修改 |

#### it 块中的 sleep
| static 文件 | 非 static 文件 | static it 用例 | static sleep 序列(ms) | 非 static sleep 序列(ms) | 差异 | 处理 |
|---|---|---|---|---|---|---|
| alertDialogTest.test.ets | alertDialogTest.test.ets | _static_0100 | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| confirmDialogTest.test.ets | confirmDialogTest.test.ets | _static_0100 | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| customContentDialogTest.test.ets | customContentDialogTest.test.ets | _static_0100 | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| dialogV2ButtonOptionTest.test.ets | 无 | _static_0100 | 2000, 1000, 1000 | N/A | N/A | 无对应文件 |
| loadingDialogTest.test.ets | loadingDialogTest.test.ets | _static_0100 | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| selectDialogTest.test.ets | selectDialogTest.test.ets | _static_0100 | **1000**, 1000, 1000 | **2000**, 1000, 1000 | 1000 | **已修改** |
| selectDialogTest.test.ets | selectDialogTest.test.ets | _static_0200 | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| tipsDialogTest.test.ets | tipsDialogTest.test.ets | _static_0100 | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |
| tipsDialogTest.test.ets | tipsDialogTest.test.ets | _static_0200 | 2000, 1000, 1000 | 2000, 1000, 1000 | 0 | 无需修改 |

### Sleep 时长对齐总计
- 已对齐: 1 个（selectDialogTest_static_0100 首个 sleep: 1000ms → 2000ms）
- 差异过大未修改: 0 个
- 无对应非 static 文件: 1 个（dialogV2ButtonOptionTest.test.ets）

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| alertDialogTest.test.ets | alertDialogTest_static_0100 | alertDialogTest.test.ets | alertDialogTest_0100 | 去除_static后缀 |
| confirmDialogTest.test.ets | confirmDialogTest_static_0100 | confirmDialogTest.test.ets | confirmDialogTest_0100 | 去除_static后缀 |
| customContentDialogTest.test.ets | customContentDialogTest_static_0100 | customContentDialogTest.test.ets | customContentDialogTest_0100 | 去除_static后缀 |
| loadingDialogTest.test.ets | loadingDialogTest_static_0100 | loadingDialogTest.test.ets | loadingDialogTest_0100 | 去除_static后缀 |
| selectDialogTest.test.ets | selectDialogTest_static_0100 | selectDialogTest.test.ets | selectDialogTest_0100 | 去除_static后缀 |
| selectDialogTest.test.ets | selectDialogTest_static_0200 | selectDialogTest.test.ets | selectDialogTest_0200 | 去除_static后缀 |
| tipsDialogTest.test.ets | tipsDialogTest_static_0100 | tipsDialogTest.test.ets | tipsDialogTest_0100 | 去除_static后缀 |
| tipsDialogTest.test.ets | tipsDialogTest_static_0200 | tipsDialogTest.test.ets | tipsDialogTest_0200 | 去除_static后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| dialogV2ButtonOptionTest.test.ets | dialogV2ButtonOptionTest_static_0100 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| popoverDialogTest.test.ets | popoverDialogTest_0100 |

### it 用例对齐总计
- 已匹配: 8 个
- 仅 static 存在: 1 个
- 仅非 static 存在: 1 个
