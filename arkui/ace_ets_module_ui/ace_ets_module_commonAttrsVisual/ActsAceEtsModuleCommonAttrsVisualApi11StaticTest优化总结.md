# ActsAceEtsModuleCommonAttrsVisualApi11StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 |
|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 |
| imageEffectsTest/backgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；beforeAll 移出 hypium import；it 块 await 包裹 try-catch |
| imageEffectsTest/backgroundEffectJsSuit.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach+it 块 await 包裹 try-catch |
| imageEffectsTest/blendMode1.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量 |
| imageEffectsTest/blendModeTest.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；60 处 await 包裹 try-catch(replaceAll) |
| imageEffectsTest/common.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach+it 块 await 包裹 try-catch(replaceAll+单独) |
| imageEffectsTest/common_ts_ets_api.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach+it 块 await 包裹 try-catch |
| imageEffectsTest/doubleSided.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach await 包裹 try-catch |
| imageEffectsTest/enums.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach+it 块 await 包裹 try-catch |
| imageEffectsTest/ForegroundColorJsSuit.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach+it 块 await 包裹 try-catch |
| imageEffectsTest/hitTestMode.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach+it 块 await 包裹 try-catch |
| imageEffectsTest/hoverEffect.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach+it 块 await 包裹 try-catch |
| imageEffectsTest/ImageEffectsJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach 包裹 try-catch；83 处 it 块 await 包裹 try-catch(脚本) |
| imageEffectsTest/InvertOptionsJsSuit.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；afterEach+it 块 await 包裹 try-catch |
| imageEffectsTest/rotateTest.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；it 块 await 包裹 try-catch |
| imageEffectsTest/shapeTest.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；it 块 await 包裹 try-catch |
| imageEffectsTest/sheetSize1.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；it 块 await 包裹 try-catch |
| imageEffectsTest/transformPointTest.test.ets | 删除 beforeAll 中的 startAbility 调用；清理未使用 import/变量；it 块 await 包裹 try-catch |

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
- **修改前**：每个文件的 `beforeAll` 中调用 `await UtilsTest.startAbility(...)`，且 import 了 `hilog`、`abilityDelegatorRegistry`、`UIAbility`、`common`、`BusinessError`、`UtilsTest` 等未使用模块及 `domain`、`tag`、`testAbilityContext` 等未使用变量
- **修改后**：`beforeAll` 整块删除，Ability 启动已移至 OpenHarmonyTestRunner；未使用 import 和变量已删除；hypium import 中移除 `beforeAll`；standalone await 调用已包裹 try-catch

---

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| transformPointTest.test.ets | transformPointTest.test.ets | it 块第2处 sleep (findComponent 后) | 2000 | 1000 |

### 无需修改（时长一致）
| 文件 | beforeEach sleep | afterEach sleep | it 块 sleep |
|---|---|---|---|
| backgroundEffect.test.ets | 2000 | - | 2000 |
| backgroundEffectJsSuit.test.ets | 2000 | 1000 | 1000 |
| blendMode1.test.ets | 2000 | - | - |
| blendModeTest.test.ets | 2000 | - | 1000 |
| common.test.ets | 2000 | 1000 | 2000/500 |
| common_ts_ets_api.test.ets | 2000 | 1000 | 2000 |
| doubleSided.test.ets | 2000 | 1000 | - |
| enums.test.ets | 2000 | 1000 | 2000 |
| ForegroundColorJsSuit.test.ets | 2000 | 1000 | 1000 |
| hitTestMode.test.ets | 2000 | 1000 | 2000 |
| hoverEffect.test.ets | 2000 | 1000 | 2000 |
| ImageEffectsJsunit.test.ets | 2000 | 2000 | 1000/2000 |
| InvertOptionsJsSuit.test.ets | 2000 | 1000 | 1000 |
| rotateTest.test.ets | 2000 | - | 1000 |
| shapeTest.test.ets | 2000 | - | 1000 |
| sheetSize1.test.ets | 2000 | - | 1000 |

### 差异过大（未修改）
无

---

## 三、it 用例对齐

### 统计
| 类别 | 数量 |
|---|---|
| static it 用例总数 | 102 |
| 非 static it 用例总数 | 110 |
| 已匹配 | 93 |
| 仅 static 存在 | 9 |
| 仅非 static 存在 | 17 |

### 匹配方式明细
| 文件 | static 数 | 非 static 数 | 匹配数 | 匹配方式 |
|---|---|---|---|---|
| backgroundEffect.test.ets | 4 | 5 | 4 | 去_static 精确匹配 |
| backgroundEffectJsSuit.test.ets | 1 | 1 | 1 | 去_static 精确匹配 |
| blendMode1.test.ets | 3 | 3 | 3 | 去_static 精确匹配 |
| blendModeTest.test.ets | 30 | 30 | 27 | 27 去_static 精确匹配 |
| common.test.ets | 8 | 10 | 7 | 2 去_static 精确 + 5 模糊(Levenshtein≤3) |
| common_ts_ets_api.test.ets | 3 | 3 | 3 | 1 去_static 精确 + 1 模糊 + 1 特殊(双重_static) |
| doubleSided.test.ets | 5 | 5 | 0 | 命名规则完全不同，无匹配 |
| enums.test.ets | 1 | 1 | 1 | 去_static 精确匹配 |
| ForegroundColorJsSuit.test.ets | 1 | 1 | 1 | 去_static 精确匹配 |
| hitTestMode.test.ets | 1 | 1 | 1 | 去_static 精确匹配 |
| hoverEffect.test.ets | 2 | 2 | 2 | 去_static 精确匹配 |
| ImageEffectsJsunit.test.ets | 38 | 42 | 38 | 去_static 精确匹配 |
| InvertOptionsJsSuit.test.ets | 1 | 1 | 1 | 去_static 精确匹配 |
| rotateTest.test.ets | 1 | 1 | 1 | 去_static 精确匹配 |
| shapeTest.test.ets | 1 | 1 | 1 | 去_static 精确匹配 |
| sheetSize1.test.ets | 1 | 2 | 1 | 去_static 精确匹配 |
| transformPointTest.test.ets | 1 | 1 | 1 | 去_static 精确匹配 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| blendModeTest.test.ets | blendModeTest_static_0030 |
| blendModeTest.test.ets | blendModeTest_static_0101 |
| blendModeTest.test.ets | blendModeTest_static_0201 |
| common.test.ets | testCommonSlice_static_0018 |
| doubleSided.test.ets | doubleSideJsunit_static_0100 |
| doubleSided.test.ets | doubleSideJsunit_static_0200 |
| doubleSided.test.ets | doubleSideJsunit_static_0300 |
| doubleSided.test.ets | doubleSideJsunit_static_0400 |
| doubleSided.test.ets | doubleSideJsunit_static_0500 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| backgroundEffect.test.ets | backgroundEffectJsunit_0300 |
| blendModeTest.test.ets | blendModeTest_0110Adapt001 |
| blendModeTest.test.ets | blendModeTest_0200Adapt001 |
| blendModeTest.test.ets | blendModeTest_0300Adapt001 |
| common.test.ets | testCommonArea0001 |
| common.test.ets | testCommonTouches0001 |
| common.test.ets | testCommonChangedTouches0001 |
| doubleSided.test.ets | doubleSidedTrueV260001 |
| doubleSided.test.ets | doubleSidedFalseV260002 |
| doubleSided.test.ets | doubleSidedUndefinedV260003 |
| doubleSided.test.ets | doubleSidedDefaultV260004 |
| doubleSided.test.ets | doubleSidedReturnValueV260005 |
| ImageEffectsJsunit.test.ets | testImageEffects003 |
| ImageEffectsJsunit.test.ets | testImageEffects008 |
| ImageEffectsJsunit.test.ets | testImageEffects013 |
| ImageEffectsJsunit.test.ets | testImageEffects033 |
| sheetSize1.test.ets | sheetSize1Jsunit_0200 |

### 备注
- `doubleSided.test.ets` 的 static 和非 static 命名规则完全不同（static 使用 `doubleSideJsunit_static_0X00`，非 static 使用 `doubleSidedXxxV26000X`），导致 0 匹配
- `common.test.ets` 的 static 用例编号（0011-0018）与非 static 编号（0001）不同，但通过模糊匹配（Levenshtein≤3）可匹配 7/8 个
- `blendModeTest.test.ets` 的 static 用例 `blendModeTest_static_0030`/`_0101`/`_0201` 在非 static 中无精确对应（非 static 使用 `_0300`/`_0110`/`_0200Adapt001` 命名）
- `ImageEffectsJsunit.test.ets` 的 static 版本注释掉了 _003/_008/_013/_033 四个用例，非 static 中存在
- `common_ts_ets_api.test.ets` 的 `testcommon_ts_ets_apiPersistProp_static__static_0001` 因原始用例名已含 `_static_`，添加 static 后缀后产生双重 `_static__static_`，需特殊匹配处理
