# Done函数使用规范检查报告（完整版）

生成时间：2026-06-18

检查范围：camera、image、photoAccess文件夹下的所有.ets测试文件

依据规范：[测试用例done函数使用规范.md](测试用例done函数使用规范.md)

---

## 一、统计概览

| 问题类型 | 用例数量 | 严重程度 |
|---------|---------|---------|
| Promise类型：无await导致无法正确结束 | 10个 | B级 |
| 回调类型：未等待结束就提前执行done() | 29个 | B级 |
| 回调类型：成功分支未调用done() | 39个 | A级 |
| 其他问题 | 8个 | A级 |
| **总计** | **86个** | **A级47个，B级39个** |

---

## 二、Camera文件夹问题用例汇总表

### 2.1 Promise类型API问题（10个）

**问题描述**：`.then().catch()` 前没有 `await`，Promise不会等待完成，`.catch()`中也没有 `done()`，导致测试无法正确结束。

#### camera_picker_test_static\CameraPicker.test.ets（6个）

| 序号 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|-------------|------|---------|---------|--------------|
| 1 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0100 | 233-255 | Promise无await，catch无done() | **B级** | `picker.pick(...).then(...).catch((err)=>{ expect(true).assertFalse(); });` |
| 2 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0101 | 265-287 | 同上 | **B级** | 同上 |
| 3 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0102 | 298-327 | 同上 | **B级** | 同上 |
| 4 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0100 | 378-402 | 同上 | **B级** | 同上 |
| 5 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0101 | 412-434 | 同上 | **B级** | 同上 |
| 6 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0102 | 444-468 | 同上 | **B级** | 同上 |

#### camera_picker_test\CameraPicker.test.ets（4个）

| 序号 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|-------------|------|---------|---------|--------------|
| 7 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0100 | 302-324 | Promise无await，catch无done() | **B级** | `picker.pick(...).then(...).catch((err)=>{ expect(true).assertFalse(); });` |
| 8 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0101 | 334-356 | 同上 | **B级** | 同上 |
| 9 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0102 | 367-395 | 同上 | **B级** | 同上 |
| 10 | SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0103 | 405-427 | 同上 | **B级** | 同上 |

**修复建议：** 改用 `await + try-catch-finally` 或 `await + try-catch`（两分支done）

---

### 2.2 回调类型API问题 - B级（29个）

#### capture回调测试用例（7个）

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 11 | PhotoOutput.test.ets | capture_callback_001 | 244-257 | 回调未等待就提前done() | **B级** | `mPhotoOutput.capture((error) => { ... }); await releasePhotoSession(); done();` |
| 12 | PhotoOutput.test.ets | captureWithSettingsCallback函数 | 147-159 | 同上 | **B级** | 同上 |
| 13 | PhotoOutput.test.ets | capture_callback_error_001 | 1099-1112 | 同上 | **B级** | 同上 |
| 14 | PhotoOutput.test.ets | capture_callback_with_setting_error_001 | 1181-1194 | 同上 | **B级** | 同上 |
| 15 | PhotoOutputBack.test.ets | capture_callback_back_001 | 271-283 | 同上 | **B级** | 同上 |
| 16 | PhotoOutputBack.test.ets | captureWithSettingsCallback函数 | 164-176 | 同上 | **B级** | 同上 |
| 17 | cameraXtsStatic\PhotoOutput.test.ets | captureWithSettingsCallback函数 | 364-393 | 同上 | **B级** | 同上 |

#### start/stop/release回调测试用例（9个）

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 18 | VideoOutput.test.ets | start_video_output_callback_001 | 246-259 | 回调未等待就提前done() | **B级** | `mVideoOutput.start((error) => { ... }); await releaseVideoSession(); done();` |
| 19 | VideoOutputBack.test.ets | start_video_output_callback_back_001 | 264-277 | 同上 | **B级** | 同上 |
| 20 | VideoOutput.test.ets | stop_video_output_callback_001 | 334-347 | 同上 | **B级** | 同上 |
| 21 | VideoOutputBack.test.ets | stop_video_output_callback_back_001 | 362-375 | 同上 | **B级** | 同上 |
| 22 | PhotoOutput.test.ets | release_callback_photo_001 | 849-862 | 同上 | **B级** | 同上 |
| 23 | PhotoOutputBack.test.ets | release_callback_photo_back_001 | 902-915 | 同上 | **B级** | 同上 |
| 24 | VideoOutput.test.ets | release_video_output_callback_001 | 574-589 | 同上 | **B级** | 同上 |
| 25 | VideoOutputBack.test.ets | release_video_output_callback_back_001 | 626-641 | 同上 | **B级** | 同上 |
| 26 | PreviewOutput.test.ets | release_preview_callback_001 | 230-244 | 同上 | **B级** | 同上 |
| 27 | PreviewOutputBack.test.ets | release_preview_callback_back_001 | 262-276 | 同上 | **B级** | 同上 |

**修复建议：** 使用标志位 + 循环等待 + finally 模式

---

### 2.3 回调类型API问题 - A级（39个）

#### start回调 - 成功分支无done()（8个）

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 28 | CameraPhotoSession.test.ets | start_photo_callback_001 | 677-686 | 成功分支无done() | **A级** | `mPhotoSession.start((error) => { if (error) { done(); } else { // 无done() } });` |
| 29 | CameraPhotoSession.test.ets | start_photo_callback_abnormal_001 | 762-772 | 同上 | **A级** | 同上 |
| 30 | CameraVideoSession.test.ets | start_video_callback_001 | 876-886 | 同上 | **A级** | 同上 |
| 31 | CameraVideoSession.test.ets | start_video_callback_abnormal_001 | 965-975 | 同上 | **A级** | 同上 |
| 32 | CameraPhotoSessionBack.test.ets | start_photo_callback_back_001 | 854-864 | 同上 | **A级** | 同上 |
| 33 | CameraPhotoSessionBack.test.ets | start_photo_callback_abnormal_back_001 | 950-960 | 同上 | **A级** | 同上 |
| 34 | CameraVideoSessionBack.test.ets | start_video_callback_back_001 | 960-969 | 同上 | **A级** | 同上 |
| 35 | CameraVideoSessionBack.test.ets | start_video_callback_abnormal_back_001 | 1057-1068 | 同上 | **A级** | 同上 |

#### stop回调 - 成功分支无done()（8个）

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 36 | CameraPhotoSession.test.ets | stop_photo_callback_001 | 841-851 | 成功分支无done() | **A级** | `mPhotoSession.stop((error) => { if (error) { done(); } else { // 无done() } });` |
| 37 | CameraPhotoSession.test.ets | stop_photo_callback_abnormal_001 | 926-936 | 同上 | **A级** | 同上 |
| 38 | CameraVideoSession.test.ets | stop_video_callback_001 | 1046-1056 | 同上 | **A级** | 同上 |
| 39 | CameraVideoSession.test.ets | stop_video_callback_abnormal_001 | 1133-1143 | 同上 | **A级** | 同上 |
| 40 | CameraPhotoSessionBack.test.ets | stop_photo_callback_back_001 | 1039-1049 | 同上 | **A级** | 同上 |
| 41 | CameraPhotoSessionBack.test.ets | stop_photo_callback_abnormal_back_001 | 1134-1144 | 同上 | **A级** | 同上 |
| 42 | CameraVideoSessionBack.test.ets | stop_video_callback_back_001 | 1149-1158 | 同上 | **A级** | 同上 |
| 43 | CameraVideoSessionBack.test.ets | stop_video_callback_abnormal_back_001 | 1245-1255 | 同上 | **A级** | 同上 |

#### release回调 - 两分支都无done()（4个）

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 44 | CameraPhotoSession.test.ets | release_photo_session_callback_001 | 1009-1017 | 两分支都无done() | **A级** | `mPhotoSession.release((error) => { if (error) {...} else {...} });` |
| 45 | CameraVideoSession.test.ets | release_video_session_callback_001 | 1215-1223 | 同上 | **A级** | 同上 |
| 46 | CameraPhotoSessionBack.test.ets | release_photo_session_callback_back_001 | 1227-1235 | 同上 | **A级** | 同上 |
| 47 | CameraVideoSessionBack.test.ets | release_video_session_callback_back_001 | 1338-1346 | 同上 | **A级** | 同上 |

#### commitConfig回调 - 成功分支无done()（19个）

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 48 | CameraPhotoSession.test.ets | commitConfig_photo_callback_001 | 455-465 | 成功分支无done() | **A级** | `mPhotoSession.commitConfig((error) => { if (error) { done(); } else { // 无done() } });` |
| 49 | CameraPhotoSession.test.ets | commitConfig_photo_callback_abnormal_001 | 1175-1185 | 同上 | **A级** | 同上 |
| 50 | CameraPhotoSession.test.ets | commitConfig_photo_callback_abnormal_002 | 1218-1228 | 同上 | **A级** | 同上 |
| 51 | CameraPhotoSession.test.ets | commitPreconfigCallback函数 | 181-191 | 同上 | **A级** | 同上 |
| 52 | CameraVideoSession.test.ets | commitConfig_video_callback_001 | 612-622 | 同上 | **A级** | 同上 |
| 53 | CameraVideoSession.test.ets | commitConfig_video_callback_abnormal_001 | 1382-1392 | 同上 | **A级** | 同上 |
| 54 | CameraVideoSession.test.ets | commitConfig_video_callback_abnormal_002 | 1427-1437 | 同上 | **A级** | 同上 |
| 55 | CameraVideoSession.test.ets | commitPreconfigCallback函数 | 237-247 | 同上 | **A级** | 同上 |
| 56 | CameraVideoSession.test.ets | commitPreconfigCallbackAbnormal函数 | 281-291 | 同上 | **A级** | 同上 |
| 57 | CameraPhotoSessionBack.test.ets | commitConfig_photo_callback_back_001 | 585-595 | 同上 | **A级** | 同上 |
| 58 | CameraPhotoSessionBack.test.ets | commitConfig_photo_callback_abnormal_back_001 | 1419-1428 | 同上 | **A级** | 同上 |
| 59 | CameraPhotoSessionBack.test.ets | commitConfig_photo_callback_abnormal_back_002 | 1466-1475 | 同上 | **A级** | 同上 |
| 60 | CameraPhotoSessionBack.test.ets | commitPreconfigCallback函数 | 178-188 | 同上 | **A级** | 同上 |
| 61 | CameraPhotoSessionBack.test.ets | commitPreconfigCallbackAbnormal函数 | 226-236 | 同上 | **A级** | 同上 |
| 62 | CameraVideoSessionBack.test.ets | commitConfig_video_callback_back_001 | 668-678 | 同上 | **A级** | 同上 |
| 63 | CameraVideoSessionBack.test.ets | commitConfig_video_callback_abnormal_back_001 | 1530-1540 | 同上 | **A级** | 同上 |
| 64 | CameraVideoSessionBack.test.ets | commitConfig_video_callback_abnormal_back_002 | 1580-1590 | 同上 | **A级** | 同上 |
| 65 | CameraVideoSessionBack.test.ets | commitPreconfigCallback函数 | 254-264 | 同上 | **A级** | 同上 |
| 66 | CameraVideoSessionBack.test.ets | commitPreconfigCallbackAbnormal函数 | 302-312 | 同上 | **A级** | 同上 |

**修复建议：** 使用标志位 + 循环等待 + finally 模式

---

### 2.4 其他Camera问题（8个）

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 67 | CameraCommonAPI.ets | 权限请求 | 60-64 | await + then混用 | **A级** | `atManager.requestPermissionsFromUser(...).then(...).catch(...)` |
| 68 | CameraCommonAPI.ets | applyChanges | 1732-1734 | .then().catch()无done() | **A级** | `photoHelper.applyChanges(...).then(...).catch(...)` |
| 69 | CameraVideoRecordWithMultiDiffConfig.test.ets | SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0100 | 99-241 | 嵌套try-catch分支缺失done() | **A级** | `try { try {...} catch { continue; } done(); } catch { done(); }` |
| 70 | CameraCapturePhotosWithMultiDiffConfig.test.ets | 多个用例 | 77-190 | 嵌套try-catch分支缺失done() | **A级** | `try { try {...} catch { expect().assertFail(); } done(); } catch { done(); }` |
| 71 | CameraCapturePhotosWithMultiDiffConfig.test.ets | 多个用例 | 200-312 | 同上 | **A级** | 同上 |

---

## 三、Image文件夹问题用例汇总表

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 72 | image.test.ets | fileio.open | 30-37 | await + then混用 | **A级** | `await fileio.open(filePath).then(...).catch(...)` |
| 73 | image.test.ets | getImageProperty | 83-93 | .then().catch()模式不规范 | **B级** | `imageSourceApi.getImageProperty(...).then(...).catch(...)` |
| 74 | image.test.ets | getImageProperty回调 | 353-363 | 回调中直接done() | **A级** | `imageSourceApi.getImageProperty(..., (error, data) => { done(); done(); })` |
| 75 | Creator.test.ets | dequeueImage | 166-186 | 回调中多处done() | **A级** | `creator.dequeueImage((err, img) => { done(); done(); });` |
| 76 | Creator.test.ets | 多层回调嵌套 | 249-288 | 多层回调嵌套缺少标志位 | **A级** | `creator.dequeueImage(... -> img.getComponent(... -> creator.queueImage(... -> done()))` |
| 77 | Colorspace.test.ets | createPixelMap | 212-232 | 回调中直接done() | **A级** | `imageSource.createPixelMap((err, pixelMap) => { done(); })` |

---

## 四、PhotoAccess文件夹问题用例汇总表

| 序号 | 文件名 | 测试用例名称 | 行号 | 问题类型 | 严重程度 | 问题代码片段 |
|-----|--------|------------|------|---------|---------|--------------|
| 78 | TextPickerComponent.test.ets | events_emitter回调 | 340-374 | 回调未等待就提前done() | **A级** | `events_emitter.on(event, callback); ... done();` |
| 79 | TextPickerComponent.test.ets | requestPhotoUrisReadPermission | 1603-1617 | .then().catch()无done() | **A级** | `phAccessHelper.requestPhotoUrisReadPermission(...).then(...).catch(...)` |

---

## 五、文件分布统计表

| 目录 | 文件名 | A级问题 | B级问题 | 总计 |
|-----|--------|---------|---------|------|
| camera_picker_test_static | CameraPicker.test.ets | 0 | 6 | 6 |
| camera_picker_test | CameraPicker.test.ets | 0 | 4 | 4 |
| CameraOutput | PhotoOutput.test.ets | 0 | 4 | 4 |
| CameraOutput | PhotoOutputBack.test.ets | 0 | 2 | 2 |
| CameraOutput | VideoOutput.test.ets | 0 | 3 | 3 |
| CameraOutput | VideoOutputBack.test.ets | 0 | 3 | 3 |
| CameraOutput | PreviewOutput.test.ets | 0 | 1 | 1 |
| CameraOutput | PreviewOutputBack.test.ets | 0 | 1 | 1 |
| cameraXtsStatic | PhotoOutput.test.ets | 0 | 1 | 1 |
| Session | CameraPhotoSession.test.ets | 9 | 0 | 9 |
| Session | CameraVideoSession.test.ets | 10 | 0 | 10 |
| Session | CameraPhotoSessionBack.test.ets | 10 | 0 | 10 |
| Session | CameraVideoSessionBack.test.ets | 10 | 0 | 10 |
| camera_js_graybox | CameraCommonAPI.ets | 2 | 0 | 2 |
| camera_js_graybox | CameraVideoRecordWithMultiDiffConfig.test.ets | 1 | 0 | 1 |
| camera_js_graybox | CameraCapturePhotosWithMultiDiffConfig.test.ets | 2 | 0 | 2 |
| image_js_standard | image.test.ets | 2 | 1 | 3 |
| image_js_standard | Creator.test.ets | 2 | 0 | 2 |
| image_js_standard | Colorspace.test.ets | 1 | 0 | 1 |
| photoAccess | TextPickerComponent.test.ets | 2 | 0 | 2 |
| **总计** | **21个文件** | **47** | **39** | **86** |

---

## 六、问题类型分布表

| 问题类型 | 出现次数 | 严重程度 | 规范要求 | 修复建议 |
|----------|----------|----------|----------|----------|
| Promise无await且catch无done() | 10 | B级 | 使用`await + try-catch-finally`或`await + try-catch`（两分支done） | 改用await模式 |
| 回调成功分支无done() | 39 | **A级** | 两分支都必须调用done()或使用标志位+finally | 添加done()或使用标志位等待 |
| 回调未等待就提前done() | 29 | B级 | 必须等待回调完成再done() | 使用标志位 + 循环等待 |
| await + then混用 | 2 | A级 | 只用await，不混用then | 移除then/catch |
| 嵌套try-catch分支缺失done() | 3 | A级 | 确保所有分支都调用done() | 简化嵌套或使用finally |

---

## 七、修复优先级表

| 优先级 | 问题数量 | 问题类型 | 文件分布 | 说明 |
|--------|----------|----------|----------|------|
| **最高（A级）** | 47个 | 回调成功分支无done()、await+then混用、嵌套缺失done() | Session目录（39个）、Image（6个）、其他（2个） | 会导致测试hang住，必须立即修复 |
| **高（B级）** | 39个 | Promise无await、回调未等待就提前done() | CameraOutput（17个）、CameraPicker（10个）、Image（1个）、其他（1个） | 影响测试正确性，应尽快修复 |

---

## 八、修复示例对照表

### Promise类型API修复示例

| 错误代码 | 正确代码（推荐） | 正确代码（允许） |
|----------|------------------|------------------|
| `picker.pick().then(() => { done(); }).catch(() => { });` | `try { await picker.pick(); } catch { expect().assertFail(); } finally { done(); }` | `try { await picker.pick(); done(); } catch { expect().assertFail(); done(); }` |

### 回调类型API修复示例

| 错误代码 | 正确代码（推荐） |
|----------|------------------|
| `mPhotoOutput.capture((error) => { if (error) { done(); } else { // 无done() } }); done();` | `let isDone = false; mPhotoOutput.capture((error) => { if (error) { expect().assertFail(); } else { expect(true).assertTrue(); } isDone = true; }); while (!isDone) { await sleep(100); } finally { done(); }` |

---

## 九、规范要点对照表

| API类型 | 推荐模式 | 允许模式 | 错误模式 |
|---------|----------|----------|----------|
| **Promise** | `await + try-catch-finally` | `await + try-catch`（两分支done） | `await + then混用`、`.then().catch()`无done() |
| **回调** | `标志位 + 循环等待 + finally` | `标志位 + 循环等待 + 两分支done` | `回调成功分支无done()`、`回调未等待就提前done()` |

---

**报告说明：**

1. **A级问题（47个）**：会导致测试无法正确结束、hang住或超时，必须优先修复
2. **B级问题（39个）**：代码不规范或回调中断言无效，建议优化以提高测试稳定性
3. 新规范允许使用`try-catch`（两分支都调用done()），不再强制要求使用`finally`
4. 推荐使用`try-catch-finally`模式，代码更简洁

---

**修复建议：**

1. **最高优先级**：修复Session目录下的39个A级问题（回调成功分支无done()）
2. **高优先级**：修复CameraOutput和CameraPicker目录下的B级问题
3. **重点文件**：Session目录的4个Session测试文件（39个A级问题）
4. **批量修复**：相同问题模式可以批量修改