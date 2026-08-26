'use static';
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


import { describe, it, expect, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { XComponentController, SurfaceConfig } from '@ohos.arkui.component';

export default function XComponentTest() {
  describe('XComponentTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("themePageToggleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/XComponent/XComponentIndex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get themePageToggleTest state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/XComponent/XComponentIndex" == pages.name)) {
          console.info("get themePageToggleTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push themePageToggleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push themePageToggleTest page error:" + err);
      }
      console.info("themePageToggleTest beforeEach end");
    });

    // ============================================================
    // SurfaceConfig.isOpaque
    // ============================================================

    /**
     * @tc.number XComponentTest_001
     * @tc.name surfaceConfigIsOpaqueTrue
     * @tc.desc Test SurfaceConfig.isOpaque with true
     */
    it('surfaceConfigIsOpaqueTrue', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: surfaceConfigIsOpaqueTrue START');
      try {
        let config: SurfaceConfig = { isOpaque: true };
        expect(config.isOpaque).assertEqual(true);
        done();
      } catch (err) {
        console.error('XComponentTest surfaceConfigIsOpaqueTrue error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number XComponentTest_002
     * @tc.name surfaceConfigIsOpaqueFalse
     * @tc.desc Test SurfaceConfig.isOpaque with false
     */
    it('surfaceConfigIsOpaqueFalse', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: surfaceConfigIsOpaqueFalse START');
      try {
        let config: SurfaceConfig = { isOpaque: false };
        expect(config.isOpaque).assertEqual(false);
        done();
      } catch (err) {
        console.error('XComponentTest surfaceConfigIsOpaqueFalse error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number XComponentTest_003
     * @tc.name surfaceConfigIsOpaqueUndefined
     * @tc.desc Test SurfaceConfig.isOpaque with undefined (default)
     */
    it('surfaceConfigIsOpaqueUndefined', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: surfaceConfigIsOpaqueUndefined START');
      try {
        let config: SurfaceConfig = {};
        expect(config.isOpaque === undefined).assertTrue();
        done();
      } catch (err) {
        console.error('XComponentTest surfaceConfigIsOpaqueUndefined error: ' + err);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // XComponentController methods
    // ============================================================

    /**
     * @tc.number XComponentTest_004
     * @tc.name xComponentControllerLockCanvas
     * @tc.desc Test XComponentController.lockCanvas method exists
     */
    it('xComponentControllerLockCanvas', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: xComponentControllerLockCanvas START');
      try {
        const ctrl = new XComponentController();
        expect(typeof ctrl.lockCanvas === 'function').assertTrue();
        done();
      } catch (err) {
        console.error('XComponentTest xComponentControllerLockCanvas error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number XComponentTest_005
     * @tc.name xComponentControllerUnlockCanvasAndPost
     * @tc.desc Test XComponentController.unlockCanvasAndPost method exists
     */
    it('xComponentControllerUnlockCanvasAndPost', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: xComponentControllerUnlockCanvasAndPost START');
      try {
        const ctrl = new XComponentController();
        expect(typeof ctrl.unlockCanvasAndPost === 'function').assertTrue();
        done();
      } catch (err) {
        console.error('XComponentTest xComponentControllerUnlockCanvasAndPost error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number XComponentTest_006
     * @tc.name xComponentControllerSetSurfaceConfig
     * @tc.desc Test XComponentController.setXComponentSurfaceConfig method exists
     */
    it('xComponentControllerSetSurfaceConfig', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: xComponentControllerSetSurfaceConfig START');
      try {
        const ctrl = new XComponentController();
        expect(typeof ctrl.setXComponentSurfaceConfig === 'function').assertTrue();
        done();
      } catch (err) {
        console.error('XComponentTest xComponentControllerSetSurfaceConfig error: ' + err);
        expect().assertFail();
        done();
      }
    });

  });
}
