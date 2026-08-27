# ActsAceDialogStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/Dialog.test.ets | 删除 beforeAll 中的 msSleep(4000)×2 及 startAbility 调用，清理 UtilsTest/startAbility 导入 | ~8s |

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

#### Dialog.test.ets
- **修改前**：
  ```typescript
  import { ..., beforeAll } from '../../../hypium/index';
  import { UtilsTest, startAbility } from './Util.test'
  ...
  beforeAll(async (): Promise<void> => {
    console.info("DialogTest beforeEach start");
    await UtilsTest.msSleep(4000)
    await startAbility("com.example.Dialog.static", "EntryAbility")
    await UtilsTest.msSleep(4000)
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // UtilsTest/startAbility 导入已删除
  // beforeAll 从 hypium 导入中移除
  // beforeEach 中 router 操作已有 try...catch，无需额外包裹
  // it 块内使用 setTimeout + try...catch，无 standalone await 需包裹
  ```

## 二、Sleep 时长对齐

### 已对齐
无（static 与非 static 的 sleep 时长一致）

### 已一致（无需修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) |
|---|---|---|---|---|
| Dialog.test.ets | Dialog.test.ets | it ArkUX_Dialog_Visual_0060 - setTimeout | 500 | 500 |

### 差异过大（未修改）
无

### 备注
- static beforeAll 原有 `UtilsTest.msSleep(4000)×2`（共 8000ms）已在第一步中随 beforeAll 删除。非 static 版本无 beforeAll，不存在对应 sleep。

## 三、it 用例对齐

### 已匹配的用例（1/1 全部匹配）

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| Dialog.test.ets | ArkUX_Dialog_Visual_0060 | Dialog.test.ets | ArkUX_Dialog_Visual_0060 | 移除 _static 后缀 |

### it 名称重命名记录
| 文件 | 修改前 | 修改后 |
|---|---|---|
| Dialog.test.ets | ArkUX_Dialog_Visual_static_0060 | ArkUX_Dialog_Visual_0060 |

已将 static 版本中 `ArkUX_Dialog_Visual_static_0060`（含 @tc.number、@tc.name、@tc.desc、it() 调用及 console.info 中所有引用）重命名为 `ArkUX_Dialog_Visual_0060`，与非 static 完全一致。

### 仅 static 存在的用例（非 static 中无对应）
无

### 仅非 static 存在的用例（static 中无对应）
无
