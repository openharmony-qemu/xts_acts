'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, afterEach, Level, beforeEach } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME_L = 1000;
const SLEEP_TIME_S = 100;

export default function ImageAnimatorInterpolationTest() {
  describe('ImageAnimatorInterpolationTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ImageAnimatorInterpolationTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimator/ImageAnimatorInterpolation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageAnimatorInterpolationTest state pages:" + JSON.stringify(pages));
        if (!("ImageAnimatorInterpolationPage" == pages.name)) {
          console.info("get ImageAnimatorInterpolationTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageAnimatorInterpolationTest page error:" + err);
      }
      console.info("ImageAnimatorInterpolationTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageAnimatorInterpolationTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0100
     * @tc.name     ImageAnimatorInterpolationTest_static_0100
     * @tc.desc     Test ImageAnimator interpolation property set to ImageInterpolation.None
     * @tc.level    LEVEL0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0100 START');
      try {
        await Utils.sleep(SLEEP_TIME_S);
        let strJson = inspector.getInspectorByKey('ia_interpolation_none');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0100] $type: ' + obj.getString('$type'));
        console.info('[static_0100] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('None');
      } catch (err) {
        console.error('[static_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0200
     * @tc.name     ImageAnimatorInterpolationTest_static_0200
     * @tc.desc     Test ImageAnimator interpolation property set to ImageInterpolation.Low
     * @tc.level    LEVEL0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0200 START');
      try {
        await Utils.sleep(SLEEP_TIME_S);
        let strJson = inspector.getInspectorByKey('ia_interpolation_low');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0200] $type: ' + obj.getString('$type'));
        console.info('[static_0200] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0300
     * @tc.name     ImageAnimatorInterpolationTest_static_0300
     * @tc.desc     Test ImageAnimator interpolation property set to ImageInterpolation.Medium
     * @tc.level    LEVEL0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0300 START');
      try {
        await Utils.sleep(SLEEP_TIME_S);
        let strJson = inspector.getInspectorByKey('ia_interpolation_medium');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0300] $type: ' + obj.getString('$type'));
        console.info('[static_0300] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Medium');
      } catch (err) {
        console.error('[static_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0400
     * @tc.name     ImageAnimatorInterpolationTest_static_0400
     * @tc.desc     Test ImageAnimator interpolation property set to ImageInterpolation.High
     * @tc.level    LEVEL0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0400 START');
      try {
        await Utils.sleep(SLEEP_TIME_S);
        let strJson = inspector.getInspectorByKey('ia_interpolation_high');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0400] $type: ' + obj.getString('$type'));
        console.info('[static_0400] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('High');
      } catch (err) {
        console.error('[static_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0500
     * @tc.name     ImageAnimatorInterpolationTest_static_0500
     * @tc.desc     Test ImageAnimator interpolation default value is ImageInterpolation.Low when not set
     * @tc.level    LEVEL0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0500 START');
      try {
        await Utils.sleep(SLEEP_TIME_S);
        let strJson = inspector.getInspectorByKey('ia_interpolation_default');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0500] $type: ' + obj.getString('$type'));
        console.info('[static_0500] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0600
     * @tc.name     ImageAnimatorInterpolationTest_static_0600
     * @tc.desc     Test ImageAnimator interpolation property set to undefined
     * @tc.level    LEVEL0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0600 START');
      try {
        await Utils.sleep(SLEEP_TIME_S);
        let strJson = inspector.getInspectorByKey('ia_interpolation_undefined');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0600] $type: ' + obj.getString('$type'));
        console.info('[static_0600] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  })
}
