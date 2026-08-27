# ActsAceEtsModuleCommonAttrsVisualUndefinedStaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 统一启动，消除重复启动 |
| entry/src/main/src/test/\*\*/\*.test.ets（共 80 个文件） | 删除 beforeAll 中的 startAbility 调用及 msSleep 守卫；清理 UtilsTest 导入；从 hypium 导入移除 beforeAll；为 it() 块中 420 处 standalone await 补充 try-catch | 每用例节省 ~8s（2×4000ms msSleep） |

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

#### 各 .test.ets 文件（共 80 个）

每个文件执行以下修改：

1. **删除 beforeAll 块**：移除包含 `UtilsTest.startAbility` 及前后 `UtilsTest.msSleep(4000)` 的 beforeAll 块
2. **清理 hypium 导入**：从 `import { describe, beforeAll, beforeEach, it, expect, Level }` 中移除 `beforeAll`
3. **删除 UtilsTest 导入**：移除 `import { UtilsTest } from '../Util.test';`（删除后文件中无其他引用）
4. **补充 try-catch**：为 it() 块中所有未被 try-catch 包裹的 standalone await 调用（如 `await CommonFunc.sleep(...)`、`await (btn?.click() as Promise<void>)` 等）补充 try-catch 错误捕获，共 420 处
5. **保留 `'use static'`**：所有文件开头的 `'use static'` 指令保持不变

> 注：文件中不存在 `isAbilityStarted` 守卫变量、`domain`/`tag`/`testAbilityContext` 模块级变量，以及 `UIAbility`/`BusinessError`/`abilityDelegatorRegistry`/`hilog`/`common` 等额外导入，无需额外清理。

### 修改的 80 个测试文件清单

| 序号 | 文件名 | beforeAll 删除 | UtilsTest 导入删除 | await try-catch 数 |
|---|---|---|---|---|
| 1 | animation.test.ets | ✓ | ✓ | 6 |
| 2 | backdropBlur.test.ets | ✓ | ✓ | 5 |
| 3 | backdropBlurModifier.test.ets | ✓ | ✓ | 5 |
| 4 | backgroundBlurStyle.test.ets | ✓ | ✓ | 5 |
| 5 | backgroundBlurStyleModifier.test.ets | ✓ | ✓ | 5 |
| 6 | backgroundBrightness.test.ets | ✓ | ✓ | 5 |
| 7 | backgroundBrightnessModifier.test.ets | ✓ | ✓ | 5 |
| 8 | backgroundColor.test.ets | ✓ | ✓ | 5 |
| 9 | backgroundColorModifier.test.ets | ✓ | ✓ | 5 |
| 10 | backgroundEffect.test.ets | ✓ | ✓ | 5 |
| 11 | backgroundEffectModifier.test.ets | ✓ | ✓ | 5 |
| 12 | bindSheet.test.ets | ✓ | ✓ | 8 |
| 13 | blendMode.test.ets | ✓ | ✓ | 5 |
| 14 | blendModeModifier.test.ets | ✓ | ✓ | 5 |
| 15 | blur.test.ets | ✓ | ✓ | 5 |
| 16 | blurModifier.test.ets | ✓ | ✓ | 5 |
| 17 | brightness.test.ets | ✓ | ✓ | 5 |
| 18 | brightnessModifier.test.ets | ✓ | ✓ | 5 |
| 19 | clip.test.ets | ✓ | ✓ | 5 |
| 20 | clipModifier.test.ets | ✓ | ✓ | 5 |
| 21 | colorBlend.test.ets | ✓ | ✓ | 5 |
| 22 | colorBlendModifier.test.ets | ✓ | ✓ | 5 |
| 23 | contrast.test.ets | ✓ | ✓ | 5 |
| 24 | contrastModifier.test.ets | ✓ | ✓ | 5 |
| 25 | foregroundEffect.test.ets | ✓ | ✓ | 5 |
| 26 | foregroundEffectModifier.test.ets | ✓ | ✓ | 5 |
| 27 | grayscale.test.ets | ✓ | ✓ | 7 |
| 28 | grayscaleModifier.test.ets | ✓ | ✓ | 5 |
| 29 | hueRotate.test.ets | ✓ | ✓ | 5 |
| 30 | hueRotateModifier.test.ets | ✓ | ✓ | 5 |
| 31 | invert.test.ets | ✓ | ✓ | 5 |
| 32 | invertModifier.test.ets | ✓ | ✓ | 5 |
| 33 | lightUpEffect.test.ets | ✓ | ✓ | 5 |
| 34 | lightUpEffectModifier.test.ets | ✓ | ✓ | 5 |
| 35 | linearGradient.test.ets | ✓ | ✓ | 5 |
| 36 | linearGradientBlur.test.ets | ✓ | ✓ | 5 |
| 37 | linearGradientBlurModifier.test.ets | ✓ | ✓ | 5 |
| 38 | linearGradientModifier.test.ets | ✓ | ✓ | 5 |
| 39 | mask.test.ets | ✓ | ✓ | 5 |
| 40 | maskModifier.test.ets | ✓ | ✓ | 5 |
| 41 | opacity.test.ets | ✓ | ✓ | 5 |
| 42 | opacityModifier.test.ets | ✓ | ✓ | 5 |
| 43 | outline.test.ets | ✓ | ✓ | 5 |
| 44 | outlineColor.test.ets | ✓ | ✓ | 5 |
| 45 | outlineColorModifier.test.ets | ✓ | ✓ | 5 |
| 46 | outlineModifier.test.ets | ✓ | ✓ | 5 |
| 47 | outlineRadius.test.ets | ✓ | ✓ | 5 |
| 48 | outlineRadiusModifier.test.ets | ✓ | ✓ | 5 |
| 49 | outlineStyle.test.ets | ✓ | ✓ | 5 |
| 50 | outlineStyleModifier.test.ets | ✓ | ✓ | 5 |
| 51 | outlineWidth.test.ets | ✓ | ✓ | 5 |
| 52 | outlineWidthModifier.test.ets | ✓ | ✓ | 5 |
| 53 | pixelStretchEffect.test.ets | ✓ | ✓ | 5 |
| 54 | pixelStretchEffectModifier.test.ets | ✓ | ✓ | 5 |
| 55 | radialGradient.test.ets | ✓ | ✓ | 5 |
| 56 | radialGradientModifier.test.ets | ✓ | ✓ | 5 |
| 57 | renderFit.test.ets | ✓ | ✓ | 5 |
| 58 | renderFitModifier.test.ets | ✓ | ✓ | 5 |
| 59 | renderGroup.test.ets | ✓ | ✓ | 5 |
| 60 | renderGroupModifier.test.ets | ✓ | ✓ | 5 |
| 61 | rotate.test.ets | ✓ | ✓ | 5 |
| 62 | rotateModifier.test.ets | ✓ | ✓ | 5 |
| 63 | saturate.test.ets | ✓ | ✓ | 5 |
| 64 | saturateModifier.test.ets | ✓ | ✓ | 5 |
| 65 | scale.test.ets | ✓ | ✓ | 5 |
| 66 | scaleModifier.test.ets | ✓ | ✓ | 5 |
| 67 | sepia.test.ets | ✓ | ✓ | 5 |
| 68 | sepiaModifier.test.ets | ✓ | ✓ | 5 |
| 69 | shadow.test.ets | ✓ | ✓ | 5 |
| 70 | shadowModifier.test.ets | ✓ | ✓ | 5 |
| 71 | sphericalEffect.test.ets | ✓ | ✓ | 5 |
| 72 | sphericalEffectModifier.test.ets | ✓ | ✓ | 5 |
| 73 | sweepGradient.test.ets | ✓ | ✓ | 5 |
| 74 | sweepGradientModifier.test.ets | ✓ | ✓ | 5 |
| 75 | transform.test.ets | ✓ | ✓ | 5 |
| 76 | transformModifier.test.ets | ✓ | ✓ | 5 |
| 77 | translate.test.ets | ✓ | ✓ | 5 |
| 78 | translateModifier.test.ets | ✓ | ✓ | 5 |
| 79 | useShadowBatching.test.ets | ✓ | ✓ | 5 |
| 80 | useShadowBatchingModifier.test.ets | ✓ | ✓ | 5 |

## 二、Sleep 时长对齐

### 对应非 static 测试套不存在

| static 测试套名称 | 推导的非 static 名称 | 是否存在 | 查找方式 |
|---|---|---|---|
| ace_ets_module_commonAttrsVisual_undefined_static | ace_ets_module_commonAttrsVisual_undefined | ❌ 不存在 | 目录名推导 |
| ace_ets_module_commonAttrsVisual_undefined_static | ace_ets_module_commonAttrsVisual1 | ❌ 不匹配 | 同级目录搜索（测试内容不匹配，无 UndefinedTest 用例） |
| ace_ets_module_commonAttrsVisual_undefined_static | （无） | ❌ 不存在 | it 用例名反向查找（GrayscaleUndefinedTest_0100 等在非 static 目录中无匹配） |

**结论**：该 static 测试套没有对应的非 static 测试套，无法进行 sleep 时长对齐。

### 当前 static 测试套 Sleep 分布（参考）

| Sleep 时长 | 出现次数 | 使用场景 |
|---|---|---|
| 1000ms | 328 | it() 块内 inspector 检查、点击后等待 |
| 2000ms | 80 | beforeEach 中 router.pushUrl 后等待页面加载 |

> 注：beforeAll 中的 2×4000ms msSleep（共 160 处）已在第一步中随 beforeAll 块一并删除，每用例节省约 8s。

## 三、it 用例对齐

### 概况

| 维度 | 数量 |
|---|---|
| static it 用例总数 | 80 |
| 非 static it 用例总数 | 0（非 static 测试套不存在） |
| 已匹配用例数 | 0 |
| 仅 static 存在用例数 | 80 |
| 仅非 static 存在用例数 | 0 |

### 仅 static 存在的用例（非 static 中无对应）

由于非 static 测试套 `ace_ets_module_commonAttrsVisual_undefined` 不存在，所有 80 个 static 用例均无对应项。

| 序号 | 文件 | it 用例名称 |
|---|---|---|
| 1 | animation.test.ets | AnimationUndefinedTest_static_0100 |
| 2 | backdropBlur.test.ets | BackdropBlurUndefinedTest_static_0100 |
| 3 | backdropBlurModifier.test.ets | BackdropBlurModifierUndefinedTest_static_0100 |
| 4 | backgroundBlurStyle.test.ets | BackgroundBlurStyleUndefinedTest_static_0100 |
| 5 | backgroundBlurStyleModifier.test.ets | BackgroundBlurStyleModifierUndefinedTest_static_0100 |
| 6 | backgroundBrightness.test.ets | BackgroundBrightnessUndefinedTest_static_0100 |
| 7 | backgroundBrightnessModifier.test.ets | BackgroundBrightnessModifierUndefinedTest_static_0100 |
| 8 | backgroundColor.test.ets | BackgroundColorUndefinedTest_static_0100 |
| 9 | backgroundColorModifier.test.ets | BackgroundColorModifierUndefinedTest_static_0100 |
| 10 | backgroundEffect.test.ets | BackgroundEffectUndefinedTest_static_0100 |
| 11 | backgroundEffectModifier.test.ets | BackgroundEffectModifierUndefinedTest_static_0100 |
| 12 | bindSheet.test.ets | BindSheetUndefinedTest_static_0100 |
| 13 | blendMode.test.ets | BlendModeUndefinedTest_static_0100 |
| 14 | blendModeModifier.test.ets | BlendModeModifierUndefinedTest_static_0100 |
| 15 | blur.test.ets | BlurUndefinedTest_static_0100 |
| 16 | blurModifier.test.ets | BlurModifierUndefinedTest_static_0100 |
| 17 | brightness.test.ets | BrightnessUndefinedTest_static_0100 |
| 18 | brightnessModifier.test.ets | BrightnessModifierUndefinedTest_static_0100 |
| 19 | clip.test.ets | ClipUndefinedTest_static_0100 |
| 20 | clipModifier.test.ets | ClipModifierUndefinedTest_static_0100 |
| 21 | colorBlend.test.ets | ColorBlendUndefinedTest_static_0100 |
| 22 | colorBlendModifier.test.ets | ColorBlendModifierUndefinedTest_static_0100 |
| 23 | contrast.test.ets | ContrastUndefinedTest_static_0100 |
| 24 | contrastModifier.test.ets | ContrastModifierUndefinedTest_static_0100 |
| 25 | foregroundEffect.test.ets | ForegroundEffectModifierTest_static_0100 |
| 26 | foregroundEffectModifier.test.ets | ForegroundEffectModifierUndefinedTest_static_0100 |
| 27 | grayscale.test.ets | GrayscaleUndefinedTest_static_0100 |
| 28 | grayscaleModifier.test.ets | GrayscaleModifierUndefinedTest_static_0100 |
| 29 | hueRotate.test.ets | HueRotateUndefinedTest_static_0100 |
| 30 | hueRotateModifier.test.ets | HueRotateModifierUndefinedTest_static_0100 |
| 31 | invert.test.ets | InvertUndefinedTest_static_0100 |
| 32 | invertModifier.test.ets | InvertModifierUndefinedTest_static_0100 |
| 33 | lightUpEffect.test.ets | LightUpEffectUndefinedTest_static_0100 |
| 34 | lightUpEffectModifier.test.ets | LightUpEffectModifierUndefinedTest_static_0100 |
| 35 | linearGradient.test.ets | LinearGradientUndefinedTest_static_0100 |
| 36 | linearGradientBlur.test.ets | LinearGradientBlurUndefinedTest_static_0100 |
| 37 | linearGradientBlurModifier.test.ets | LinearGradientBlurModifierUndefinedTest_static_0100 |
| 38 | linearGradientModifier.test.ets | LinearGradientModifierUndefinedTest_static_0100 |
| 39 | mask.test.ets | MaskUndefinedTest_static_0100 |
| 40 | maskModifier.test.ets | MaskModifierUndefinedTest_static_0100 |
| 41 | opacity.test.ets | OpacityUndefinedTest_static_0100 |
| 42 | opacityModifier.test.ets | OpacityModifierUndefinedTest_static_0100 |
| 43 | outline.test.ets | OutlineUndefinedTest_static_0100 |
| 44 | outlineColor.test.ets | OutlineColorUndefinedTest_static_0100 |
| 45 | outlineColorModifier.test.ets | OutlineColorModifierUndefinedTest_static_0100 |
| 46 | outlineModifier.test.ets | OutlineModifierUndefinedTest_static_0100 |
| 47 | outlineRadius.test.ets | OutlineRadiusUndefinedTest_static_0100 |
| 48 | outlineRadiusModifier.test.ets | OutlineRadiusModifierUndefinedTest_static_0100 |
| 49 | outlineStyle.test.ets | OutlineStyleUndefinedTest_static_0100 |
| 50 | outlineStyleModifier.test.ets | OutlineStyleModifierUndefinedTest_static_0100 |
| 51 | outlineWidth.test.ets | OutlineWidthUndefinedTest_static_0100 |
| 52 | outlineWidthModifier.test.ets | OutlineWidthModifierUndefinedTest_static_0100 |
| 53 | pixelStretchEffect.test.ets | PixelStretchEffectUndefinedTest_static_0100 |
| 54 | pixelStretchEffectModifier.test.ets | PixelStretchEffectModifierUndefinedTest_static_0100 |
| 55 | radialGradient.test.ets | RadialGradientUndefinedTest_static_0100 |
| 56 | radialGradientModifier.test.ets | RadialGradientModifierUndefinedTest_static_0100 |
| 57 | renderFit.test.ets | RenderFitUndefinedTest_static_0100 |
| 58 | renderFitModifier.test.ets | RenderFitModifierUndefinedTest_static_0100 |
| 59 | renderGroup.test.ets | RenderGroupUndefinedTest_static_0100 |
| 60 | renderGroupModifier.test.ets | RenderGroupModifierUndefinedTest_static_0100 |
| 61 | rotate.test.ets | RotateUndefinedTest_static_0100 |
| 62 | rotateModifier.test.ets | RotateModifierUndefinedTest_static_0100 |
| 63 | saturate.test.ets | SaturateUndefinedTest_static_0100 |
| 64 | saturateModifier.test.ets | SaturateModifierUndefinedTest_static_0100 |
| 65 | scale.test.ets | ScaleUndefinedTest_static_0100 |
| 66 | scaleModifier.test.ets | ScaleModifierUndefinedTest_static_0100 |
| 67 | sepia.test.ets | SepiaUndefinedTest_static_0100 |
| 68 | sepiaModifier.test.ets | SepiaModifierUndefinedTest_static_0100 |
| 69 | shadow.test.ets | ShadowUndefinedTest_static_0100 |
| 70 | shadowModifier.test.ets | ShadowModifierUndefinedTest_static_0100 |
| 71 | sphericalEffect.test.ets | SphericalEffectUndefinedTest_static_0100 |
| 72 | sphericalEffectModifier.test.ets | SphericalEffectModifierUndefinedTest_static_0100 |
| 73 | sweepGradient.test.ets | SweepGradientUndefinedTest_static_0100 |
| 74 | sweepGradientModifier.test.ets | SweepGradientModifierUndefinedTest_static_0100 |
| 75 | transform.test.ets | TransformUndefinedTest_static_0100 |
| 76 | transformModifier.test.ets | TransformModifierUndefinedTest_static_0100 |
| 77 | translate.test.ets | TranslateUndefinedTest_static_0100 |
| 78 | translateModifier.test.ets | TranslateModifierUndefinedTest_static_0100 |
| 79 | useShadowBatching.test.ets | UseShadowBatchingUndefinedTest_static_0100 |
| 80 | useShadowBatchingModifier.test.ets | UseShadowBatchingModifierUndefinedTest_static_0100 |

### 已匹配的用例

无（非 static 测试套不存在，无法匹配）。
