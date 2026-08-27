# ActsAceEtsModuleCommonAttrsVisualApi14StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | Ability 启动统一至 Runner，全测试套只启动一次 |
| entry/src/main/src/test/background/backgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；删除未使用 import 和模块级变量；beforeAll 从 hypium import 中移除；3 处 standalone await 包裹 try-catch | ~4s |
| entry/src/main/src/test/background/backgroundBlurStyle.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；删除未使用 import 和模块级变量；beforeAll 从 hypium import 中移除；3 处 standalone await 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
  abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  ```
- **修改后**：
  ```typescript
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
  ```

#### backgroundEffect.test.ets
- **修改前**：
  ```typescript
  import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '...';
  import hilog from '@ohos.hilog'
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  import UIAbility from '@ohos.app.ability.UIAbility';
  import common from '@ohos.app.ability.common';
  import { BusinessError } from '@ohos.base';
  import { UtilsTest } from '../Util.test';

  let domain: number = 0x0000;
  let tag: string = 'testTag';
  let testAbilityContext: common.UIAbilityContext;

  describe('backgroundEffectTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api14.static", "EntryAbility")
    });
    ...
    await CommonFunc.sleep(1000);  // standalone, no try-catch
  ```
- **修改后**：
  ```typescript
  import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '...';
  // beforeAll, hilog, abilityDelegatorRegistry, UIAbility, common, BusinessError, UtilsTest 已删除
  // domain, tag, testAbilityContext 已删除
  // beforeAll 块已删除
  ...
  try {
    await CommonFunc.sleep(1000);
  } catch (err) {
    console.info('backgroundEffectTest_static_0100 sleep err: ' + JSON.stringify(err));
  }
  ```

#### backgroundBlurStyle.test.ets
- 同 backgroundEffect.test.ets，删除 beforeAll/startAbility、未使用 import/变量，3 处 await 包裹 try-catch

## 二、Sleep 时长对齐

### 非 static 测试套
- 非 static 目录：`ace_ets_module_commonAttrsVisual_api14`
- 存在：是

### 已对齐（无差异，无需修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| backgroundEffect.test.ets | backgroundEffect.test.ets | it() sleep #1 | 1000 | 1000 | 0 |
| backgroundEffect.test.ets | backgroundEffect.test.ets | it() sleep #2 | 1000 | 1000 | 0 |
| backgroundBlurStyle.test.ets | backgroundBlurStyle.test.ets | it() sleep #1 | 1000 | 1000 | 0 |
| backgroundBlurStyle.test.ets | backgroundBlurStyle.test.ets | it() sleep #2 | 1000 | 1000 | 0 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) | 说明 |
|---|---|---|---|---|---|---|
| backgroundEffect.test.ets | backgroundEffect.test.ets | beforeEach pushUrl 后 | 无 | 2000 | - | static beforeEach 使用非 await 的 pushUrl 无 sleep；非 static 有 sleep(2000)。属结构性差异，非时长对齐范围 |
| backgroundEffect.test.ets | backgroundEffect.test.ets | it() console.log 后 | 1000 | 无 | - | static it() 第 3 处 sleep(1000) 在非 static 中无对应项 |
| backgroundBlurStyle.test.ets | backgroundBlurStyle.test.ets | beforeEach pushUrl 后 | 无 | 2000 | - | 同上 |
| backgroundBlurStyle.test.ets | backgroundBlurStyle.test.ets | it() console.log 后 | 1000 | 无 | - | 同上 |

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| backgroundEffect.test.ets | backgroundEffectTest_static_0100 | backgroundEffect.test.ets | backgroundEffectTest_0100 | 去除 _static 后缀精确匹配 |
| backgroundBlurStyle.test.ets | backgroundBlurStyleTest_static_0100 | backgroundBlurStyle.test.ets | backgroundBlurStyleTest_0100 | 去除 _static 后缀精确匹配 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| 无 | - |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| backgroundImageOption.test.ets | backgroundImageOption_0100 |

## 总结
- **修改文件数**：3（OpenHarmonyTestRunner.ets + backgroundEffect.test.ets + backgroundBlurStyle.test.ets）
- **Sleep 对齐数**：0（所有匹配位置 sleep 时长一致，无需修改）
- **it 用例匹配数**：2（全部通过去除 _static 后缀精确匹配）
