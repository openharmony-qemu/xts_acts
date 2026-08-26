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
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push themePageToggleTest page error:" + err);
      }
      console.info("themePageToggleTest beforeEach end");
    });

    /**
     * @tc.name   XComponentTest_0100
     * @tc.number SUB_ARKUI_API_XComponentTest_0100
     * @tc.desc   ArkUIApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentTest_0100', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: XComponentTest_0100 START');
      try {
        let config: SurfaceConfig = { isOpaque: true };
        expect(config.isOpaque).assertEqual(true);
        done();
      } catch (err) {
        console.error('XComponentTest XComponentTest_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   XComponentTest_0200
     * @tc.number SUB_ARKUI_API_XComponentTest_0200
     * @tc.desc   ArkUIApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentTest_0200', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: XComponentTest_0200 START');
      try {
        let config: SurfaceConfig = { isOpaque: false };
        expect(config.isOpaque).assertEqual(false);
        done();
      } catch (err) {
        console.error('XComponentTest XComponentTest_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   XComponentTest_0300
     * @tc.number SUB_ARKUI_API_XComponentTest_0300
     * @tc.desc   ArkUIApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentTest_0300', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: XComponentTest_0300 START');
      try {
        let config: SurfaceConfig = {};
        expect(config.isOpaque === undefined).assertTrue();
        done();
      } catch (err) {
        console.error('XComponentTest XComponentTest_0300 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   XComponentTest_0400
     * @tc.number SUB_ARKUI_API_XComponentTest_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentTest_0400', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: XComponentTest_0400 START');
      try {
        const ctrl = new XComponentController();
        expect(typeof ctrl.lockCanvas === 'function').assertTrue();
        done();
      } catch (err) {
        console.error('XComponentTest XComponentTest_0400 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   XComponentTest_0500
     * @tc.number SUB_ARKUI_API_XComponentTest_0500
     * @tc.desc   ArkUIApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentTest_0500', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: XComponentTest_0500 START');
      try {
        const ctrl = new XComponentController();
        expect(typeof ctrl.unlockCanvasAndPost === 'function').assertTrue();
        done();
      } catch (err) {
        console.error('XComponentTest XComponentTest_0500 error: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   XComponentTest_0600
     * @tc.number SUB_ARKUI_API_XComponentTest_0600
     * @tc.desc   ArkUIApi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentTest_0600', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: XComponentTest_0600 START');
      try {
        const ctrl = new XComponentController();
        expect(typeof ctrl.setXComponentSurfaceConfig === 'function').assertTrue();
        done();
      } catch (err) {
        console.error('XComponentTest XComponentTest_0600 error: ' + err);
        expect().assertFail();
        done();
      }
    });

  });
}
