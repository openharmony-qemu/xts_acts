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

import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

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
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push ImageAnimatorInterpolationTest page error:" + err);
      }
      console.info("ImageAnimatorInterpolationTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("ImageAnimatorInterpolationTest after each called");
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_DEFAULT_0100
     * @tc.name   ImageAnimatorInterpolationTest_static_0100
     * @tc.desc   Verify default value of interpolation property (not set), expect ImageInterpolation.Low
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0100 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_default');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0100] $type: ' + obj.getString('$type'));
        console.info('[static_0100] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0100
     * @tc.name   ImageAnimatorInterpolationTest_static_0200
     * @tc.desc   Verify interpolation property set to ImageInterpolation.None
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0200 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_none');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0200] $type: ' + obj.getString('$type'));
        console.info('[static_0200] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('None');
      } catch (err) {
        console.error('[static_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0200
     * @tc.name   ImageAnimatorInterpolationTest_static_0300
     * @tc.desc   Verify interpolation property set to ImageInterpolation.Low
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0300 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_low');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0300] $type: ' + obj.getString('$type'));
        console.info('[static_0300] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0300
     * @tc.name   ImageAnimatorInterpolationTest_static_0400
     * @tc.desc   Verify interpolation property set to ImageInterpolation.Medium
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0400 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_medium');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0400] $type: ' + obj.getString('$type'));
        console.info('[static_0400] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Medium');
      } catch (err) {
        console.error('[static_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_PARAM_0400
     * @tc.name   ImageAnimatorInterpolationTest_static_0500
     * @tc.desc   Verify interpolation property set to ImageInterpolation.High
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0500 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_high');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0500] $type: ' + obj.getString('$type'));
        console.info('[static_0500] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('High');
      } catch (err) {
        console.error('[static_0500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_ERROR_0100
     * @tc.name   ImageAnimatorInterpolationTest_static_0600
     * @tc.desc   Verify interpolation property with invalid enum value 99, expect fallback to default Low
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0600 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_invalid_enum');
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

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_ERROR_0200
     * @tc.name   ImageAnimatorInterpolationTest_static_0700
     * @tc.desc   Verify interpolation property with invalid negative value -1, expect fallback to default Low
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0700 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_invalid_negative');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0700] $type: ' + obj.getString('$type'));
        console.info('[static_0700] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_ERROR_0300
     * @tc.name   ImageAnimatorInterpolationTest_static_0800
     * @tc.desc   Verify interpolation property with undefined value, expect fallback to default Low
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0800 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_undefined');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0800] $type: ' + obj.getString('$type'));
        console.info('[static_0800] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0800] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGEANIMATOR_INTERPOLATION_ERROR_0400
     * @tc.name   ImageAnimatorInterpolationTest_static_0900
     * @tc.desc   Verify interpolation property with null value, expect fallback to default Low
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     */
    it('ImageAnimatorInterpolationTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageAnimatorInterpolationTest_static_0900 START');
      try {
        let driver = await Driver.create()
        await CommonFunc.sleep(2000);

        let strJson = inspector.getInspectorByKey('ia_interpolation_null');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[static_0900] $type: ' + obj.getString('$type'));
        console.info('[static_0900] interpolation: ' + obj.getElement('$attrs').getString('interpolation'));
        expect(obj.getString('$type')).assertContain('ImageAnimator');
        expect(obj.getElement('$attrs').getString('interpolation')).assertContain('Low');
      } catch (err) {
        console.error('[static_0900] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
  })
}
