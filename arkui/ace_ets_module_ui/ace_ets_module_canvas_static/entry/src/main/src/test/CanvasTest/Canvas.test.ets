/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import {
  RenderingContextSettings,
  CanvasRenderingContext2D,
  DrawingRenderingContext,
  LengthMetricsUnit
} from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function CanvasTest() {
  describe('CanvasTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CanvasTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.canvas.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("CanvasTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Canvas/CanvasIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("CanvasTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "CanvasIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("CanvasTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("CanvasTest after each called");
    });

    /**
     * @tc.number CanvasTest_001
     * @tc.name renderingContextSettings_antialias_default
     * @tc.desc Test RenderingContextSettings antialias getter returns default value (false or undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('renderingContextSettings_antialias_default', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_antialias_default START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let settings = new RenderingContextSettings();
        let val = settings.antialias;
        console.info('CanvasTest: antialias default = ' + val);
        expect(val === false || val === undefined).assertTrue();
        console.info('CanvasTest execute: renderingContextSettings_antialias_default END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_antialias_default error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_002
     * @tc.name renderingContextSettings_antialias_setTrue
     * @tc.desc Test RenderingContextSettings antialias setter with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('renderingContextSettings_antialias_setTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_antialias_setTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let settings = new RenderingContextSettings();
        settings.antialias = true;
        let val = settings.antialias;
        console.info('CanvasTest: antialias after set true = ' + val);
        expect(val).assertEqual(true);
        console.info('CanvasTest execute: renderingContextSettings_antialias_setTrue END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_antialias_setTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_003
     * @tc.name renderingContextSettings_antialias_setFalse
     * @tc.desc Test RenderingContextSettings antialias setter with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('renderingContextSettings_antialias_setFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_antialias_setFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let settings = new RenderingContextSettings(true);
        settings.antialias = false;
        let val = settings.antialias;
        console.info('CanvasTest: antialias after set false = ' + val);
        expect(val).assertEqual(false);
        console.info('CanvasTest execute: renderingContextSettings_antialias_setFalse END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_antialias_setFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_004
     * @tc.name renderingContextSettings_antialias_setUndefined
     * @tc.desc Test RenderingContextSettings antialias setter with undefined resets to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('renderingContextSettings_antialias_setUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_antialias_setUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let settings = new RenderingContextSettings(true);
        settings.antialias = undefined;
        let val = settings.antialias;
        console.info('CanvasTest: antialias after set undefined = ' + val);
        expect(val === undefined || val === false).assertTrue();
        console.info('CanvasTest execute: renderingContextSettings_antialias_setUndefined END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_antialias_setUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_005
     * @tc.name renderingContextSettings_constructor_antialias_true
     * @tc.desc Test RenderingContextSettings constructor with antialias=true, getter returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('renderingContextSettings_constructor_antialias_true', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextSettings_constructor_antialias_true START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let settings = new RenderingContextSettings(true);
        let val = settings.antialias;
        console.info('CanvasTest: constructor antialias=true, get = ' + val);
        expect(val).assertEqual(true);
        console.info('CanvasTest execute: renderingContextSettings_constructor_antialias_true END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextSettings_constructor_antialias_true error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_006
     * @tc.name renderingContextOptions_antialias_via_settings
     * @tc.desc Test RenderingContextOptions antialias (optional boolean) used via RenderingContextSettings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('renderingContextOptions_antialias_via_settings', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: renderingContextOptions_antialias_via_settings START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let settingsTrue = new RenderingContextSettings(true);
        let settingsFalse = new RenderingContextSettings(false);
        console.info('CanvasTest: settings true antialias=' + settingsTrue.antialias + ' false antialias=' + settingsFalse.antialias);
        expect(settingsTrue.antialias).assertEqual(true);
        expect(settingsFalse.antialias === false || settingsFalse.antialias === undefined).assertTrue();
        console.info('CanvasTest execute: renderingContextOptions_antialias_via_settings END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: renderingContextOptions_antialias_via_settings error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_007
     * @tc.name canvasRenderingContext2D_canvas_getter
     * @tc.desc Test CanvasRenderingContext2D.canvas getter returns null when unbound to Canvas component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canvasRenderingContext2D_canvas_getter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: canvasRenderingContext2D_canvas_getter START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let settings = new RenderingContextSettings(true);
        let ctx = new CanvasRenderingContext2D(settings);
        let canvasNode = ctx.canvas;
        console.info('CanvasTest: canvas getter = ' + canvasNode);
        expect(canvasNode === null || canvasNode === undefined).assertTrue();
        console.info('CanvasTest execute: canvasRenderingContext2D_canvas_getter END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: canvasRenderingContext2D_canvas_getter error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_008
     * @tc.name drawingRenderingContext_size_getter
     * @tc.desc Test DrawingRenderingContext.size getter returns a Size object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('drawingRenderingContext_size_getter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: drawingRenderingContext_size_getter START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let ctx = new DrawingRenderingContext();
        let size = ctx.size;
        console.info('CanvasTest: size = ' + JSON.stringify(size));
        expect(size != null).assertTrue();
        console.info('CanvasTest execute: drawingRenderingContext_size_getter END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: drawingRenderingContext_size_getter error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_009
     * @tc.name drawingRenderingContext_canvas_getter
     * @tc.desc Test DrawingRenderingContext.canvas getter returns undefined when unbound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('drawingRenderingContext_canvas_getter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: drawingRenderingContext_canvas_getter START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let ctx = new DrawingRenderingContext();
        let drawCanvas = ctx.canvas;
        console.info('CanvasTest: drawing canvas getter = ' + drawCanvas);
        expect(drawCanvas === undefined || drawCanvas === null).assertTrue();
        console.info('CanvasTest execute: drawingRenderingContext_canvas_getter END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: drawingRenderingContext_canvas_getter error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_010
     * @tc.name drawingRenderingContext_constructor_withUnit
     * @tc.desc Test DrawingRenderingContext constructor with LengthMetricsUnit parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('drawingRenderingContext_constructor_withUnit', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: drawingRenderingContext_constructor_withUnit START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let ctx = new DrawingRenderingContext(LengthMetricsUnit.DEFAULT);
        let size = ctx.size;
        console.info('CanvasTest: drawing ctx with unit, size = ' + JSON.stringify(size));
        expect(ctx != null).assertTrue();
        expect(size != null).assertTrue();
        console.info('CanvasTest execute: drawingRenderingContext_constructor_withUnit END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: drawingRenderingContext_constructor_withUnit error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CanvasTest_011
     * @tc.name canvasParams_unit_via_ctx2d_constructor
     * @tc.desc Test CanvasParams unit property via CanvasRenderingContext2D constructor with LengthMetricsUnit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canvasParams_unit_via_ctx2d_constructor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CanvasTest execute: canvasParams_unit_via_ctx2d_constructor START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let settings = new RenderingContextSettings(true);
        let ctx = new CanvasRenderingContext2D(settings, LengthMetricsUnit.DEFAULT);
        console.info('CanvasTest: ctx2d with unit = ' + ctx);
        expect(ctx != null).assertTrue();
        console.info('CanvasTest execute: canvasParams_unit_via_ctx2d_constructor END');
        done();
      } catch (error) {
        console.error('CanvasTest execute: canvasParams_unit_via_ctx2d_constructor error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
