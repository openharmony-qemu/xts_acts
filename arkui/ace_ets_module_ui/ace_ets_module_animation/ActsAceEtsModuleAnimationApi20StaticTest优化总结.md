# ActsAceEtsModuleAnimationApi20StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 整个测试套仅启动一次 Ability |
| entry/src/main/src/test/ParticleEmitter.test.ets | 删除 beforeAll 中的 startAbility 调用、UtilsTest 导入、beforeAll 导入；afterEach/it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/RippleFieldsTest.test.ets | 删除 beforeAll 中的 startAbility 调用、UtilsTest 导入、beforeAll 导入；afterEach/it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/VelocityFieldsTest.test.ets | 删除 beforeAll 中的 startAbility 调用、UtilsTest 导入、beforeAll 导入；afterEach/it 中 await 包裹 try-catch | ~4s |

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
  import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
  import { UtilsTest } from './Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility("com.arkui.ace.animation20.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
  // UtilsTest 导入已删除
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- **await 包裹 try-catch**：afterEach 中的 `await CommonFunc.sleep(1000)` 和 it 块整体 body 均包裹 try-catch

---

## 二、Sleep 时长对齐

### 非 static 测试套信息
| static 测试套 | 推导的非 static 目录 | 是否存在 |
|---|---|---|
| ace_ets_module_animation_api20_static | ace_ets_module_animation_api20 | 是 |

### 文件对应关系
| static 文件 | 非 static 文件 | 是否匹配 |
|---|---|---|
| ParticleEmitter.test.ets | ParticleEmitter.test.ets | 是 |
| RippleFieldsTest.test.ets | （无对应文件） | 否 |
| VelocityFieldsTest.test.ets | （无对应文件） | 否 |

### 已对齐（无需修改，值已一致）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) |
|---|---|---|---|---|
| ParticleEmitter.test.ets | ParticleEmitter.test.ets | beforeEach CommonFunc.sleep | 2000 | 2000 |
| ParticleEmitter.test.ets | ParticleEmitter.test.ets | afterEach CommonFunc.sleep | 1000 | 1000 |
| ParticleEmitter.test.ets | ParticleEmitter.test.ets | it 第1个 CommonFunc.sleep | 1000 | 1000 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| ParticleEmitter.test.ets | ParticleEmitter.test.ets | it driver.delayMs | 4000 | 1000 | 3000 |

> 注：`driver.delayMs` 属于 UiTest Driver 方法，非 sleep/msSleep/Utils.sleep/CommonFunc.sleep 类别，仅作记录参考。

### 单边 sleep（仅 static 存在）
| static 文件 | sleep 位置 | 时长(ms) | 说明 |
|---|---|---|---|
| ParticleEmitter.test.ets | it 第2个 CommonFunc.sleep | 1000 | 非 static 无此 sleep |
| RippleFieldsTest.test.ets | beforeEach CommonFunc.sleep | 2000 | 无非 static 对应文件 |
| RippleFieldsTest.test.ets | afterEach CommonFunc.sleep | 1000 | 无非 static 对应文件 |
| RippleFieldsTest.test.ets | it 第1个 CommonFunc.sleep | 1000 | 无非 static 对应文件 |
| RippleFieldsTest.test.ets | it 第2个 CommonFunc.sleep | 1000 | 无非 static 对应文件 |
| VelocityFieldsTest.test.ets | beforeEach CommonFunc.sleep | 2000 | 无非 static 对应文件 |
| VelocityFieldsTest.test.ets | afterEach CommonFunc.sleep | 1000 | 无非 static 对应文件 |
| VelocityFieldsTest.test.ets | it 第1个 CommonFunc.sleep | 1000 | 无非 static 对应文件 |
| VelocityFieldsTest.test.ets | it 第2个 CommonFunc.sleep | 1000 | 无非 static 对应文件 |

### Sleep 对齐统计
- 已对齐（值已一致）：3 处
- 差异过大未修改：1 处（driver.delayMs，非 sleep 类别）
- 单边 sleep：9 处

---

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| ParticleEmitter.test.ets | ParticleEmitter_static_001 | ParticleEmitter.test.ets | ParticleEmitter_001 | 去除 _static 后缀完全匹配 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| RippleFieldsTest.test.ets | RippleFieldsTest_static_001 |
| VelocityFieldsTest.test.ets | VelocityFieldsTest_static_001 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| FrameNodeAnimation.test.ets | FrameNodeAnimation_001 |
| FrameNodeAnimation.test.ets | FrameNodeAnimation_002 |
| FrameNodeAnimation.test.ets | FrameNodeAnimation_003 |
| FrameNodeAnimationPage.test.ets | FrameNodeAnimationPage_001 |
| FrameNodeAnimationPage.test.ets | FrameNodeAnimationPage_002 |
| FrameNodeAnimationPage.test.ets | FrameNodeAnimationPage_003 |
| FrameNodeAnimationPage.test.ets | FrameNodeAnimationPage_004 |
| FrameNodeAnimationPage.test.ets | FrameNodeAnimationPage_005 |
| FrameNodeAnimationPage.test.ets | FrameNodeAnimationPage_006 |
| TestSweepGradientOptions.test.ets | TestSweepGradientOptions_001 |
| TransitionEdgeTest.test.ets | TransitionEdgeTest_001 |
| Vector2TTest.test.ets | Vector2TTest_001 |

### it 用例对齐统计
- 已匹配：1 个
- 仅 static 存在：2 个
- 仅非 static 存在：12 个

---

## 优化总结

| 优化项 | 数量 |
|---|---|
| 修改文件数 | 4 |
| Sleep 已对齐 | 3 处（值已一致，无需修改） |
| Sleep 差异过大未修改 | 1 处 |
| 单边 sleep | 9 处 |
| it 用例已匹配 | 1 个 |
| it 用例仅 static 存在 | 2 个 |
| it 用例仅非 static 存在 | 12 个 |
