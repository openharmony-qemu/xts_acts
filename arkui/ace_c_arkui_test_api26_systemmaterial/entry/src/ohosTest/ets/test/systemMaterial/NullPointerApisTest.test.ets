/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so';
import { window } from '@kit.ArkUI';

function runCase(name: string, done: Function): void {
  expect(nativeFunc[name]()).assertEqual(0);
  done();
}

export default function nullPointerApisTest() {
  let mainWindowId: number = -1;

  describe('NullPointerApisTest', () => {
    beforeAll(async () => {
      try {
        const stage = globalThis.windowStage as window.WindowStage;
        const win = await stage.getMainWindow();
        mainWindowId = win.getWindowProperties().id;
      } catch (err) {
        console.error('[NullPointerApisTest] getMainWindow failed: ' + JSON.stringify(err));
      }
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_SNAPSHOT_0100
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_SNAPSHOT_0100
     * @tc.desc   GetNodeSnapshotSizeLimitation nullptr out params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_SNAPSHOT_0100', Level.LEVEL1, async (done: Function) => {
      runCase('testGetNodeSnapshotSizeLimitationNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_RENDER_0100
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_RENDER_0100
     * @tc.desc   SetRectShapeOptionValue with nullptr option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_RENDER_0100', Level.LEVEL1, async (done: Function) => {
      runCase('testRenderNodeUtilsSetRectShapeOptionValueNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_RENDER_0200
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_RENDER_0200
     * @tc.desc   SetRoundRectShapeOptionValue with nullptr option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_RENDER_0200', Level.LEVEL1, async (done: Function) => {
      runCase('testRenderNodeUtilsSetRoundRectShapeOptionValueNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_RENDER_0300
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_RENDER_0300
     * @tc.desc   DisposeBlurStyleOption with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_RENDER_0300', Level.LEVEL1, async (done: Function) => {
      runCase('testRenderNodeUtilsDisposeBlurStyleOptionNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_GRADIENT_0100
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_GRADIENT_0100
     * @tc.desc   LinearGradientOptions_Destroy with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_GRADIENT_0100', Level.LEVEL1, async (done: Function) => {
      runCase('testLinearGradientOptionsDestroyNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_GRADIENT_0200
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_GRADIENT_0200
     * @tc.desc   RadialGradientOptions_Destroy with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_GRADIENT_0200', Level.LEVEL1, async (done: Function) => {
      runCase('testRadialGradientOptionsDestroyNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_WINDOW_0100
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_WINDOW_0100
     * @tc.desc   GetKeyEventFilter with nullptr out filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_WINDOW_0100', Level.LEVEL1, async (done: Function) => {
      expect(mainWindowId).not().assertEqual(-1);
      expect(nativeFunc.testNativeWindowManagerGetKeyEventFilterNull001(mainWindowId)).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_WINDOW_0200
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_WINDOW_0200
     * @tc.desc   GetMouseEventFilter with nullptr out filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_WINDOW_0200', Level.LEVEL1, async (done: Function) => {
      expect(mainWindowId).not().assertEqual(-1);
      expect(nativeFunc.testNativeWindowManagerGetMouseEventFilterNull001(mainWindowId)).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_WINDOW_0300
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_WINDOW_0300
     * @tc.desc   GetTouchEventFilter with nullptr out filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_WINDOW_0300', Level.LEVEL1, async (done: Function) => {
      expect(mainWindowId).not().assertEqual(-1);
      expect(nativeFunc.testNativeWindowManagerGetTouchEventFilterNull001(mainWindowId)).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0100
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0100
     * @tc.desc   FrameMetrics_IsFirstDrawFrame with nullptr metrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0100', Level.LEVEL1, async (done: Function) => {
      runCase('testFrameMetricsIsFirstDrawFrameNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0200
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0200
     * @tc.desc   FrameMetrics_GetInputHandlingDuration with nullptr metrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0200', Level.LEVEL1, async (done: Function) => {
      runCase('testFrameMetricsGetInputHandlingDurationNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0300
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0300
     * @tc.desc   FrameMetrics_GetLayoutMeasureDuration with nullptr metrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0300', Level.LEVEL1, async (done: Function) => {
      runCase('testFrameMetricsGetLayoutMeasureDurationNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0400
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0400
     * @tc.desc   FrameMetrics_GetVsyncTimestamp with nullptr metrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_FRAMEMETRICS_0400', Level.LEVEL1, async (done: Function) => {
      runCase('testFrameMetricsGetVsyncTimestampNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_TEXT_0100
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_TEXT_0100
     * @tc.desc   LineSpacingStyle_Destroy with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_TEXT_0100', Level.LEVEL1, async (done: Function) => {
      runCase('testLineSpacingStyleDestroyNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_TEXT_0200
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_TEXT_0200
     * @tc.desc   FontConfigs_GetFontWeightConfigs with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_TEXT_0200', Level.LEVEL1, async (done: Function) => {
      runCase('testFontConfigsGetFontWeightConfigsNull001', done);
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_NULLPTR_TEXT_0300
     * @tc.number SUB_ARKUI_CAPI_NULLPTR_TEXT_0300
     * @tc.desc   TextController_Destroy with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_NULLPTR_TEXT_0300', Level.LEVEL1, async (done: Function) => {
      runCase('testTextControllerDestroyNull001', done);
    });
  });
}
