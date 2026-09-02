'use static';
/*
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L = 1000;
const SLEEP_TIME_S = 100;

export default function ImageDrawingColorFilterTest() {
  describe('ImageDrawingColorFilterTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageDrawingColorFilterTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageDrawingColorFilterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageDrawingColorFilter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageDrawingColorFilterTest state pages:" + JSON.stringify(pages));
        if (!("ImageDrawingColorFilter" == pages.name)) {
          console.info("get ImageDrawingColorFilterTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageDrawingColorFilterTest page error:" + err);
      }
      console.info("ImageDrawingColorFilterTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageDrawingColorFilterTest after each called");
    });
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0100
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0100
     * @tc.desc     Test DrawingColorFilter with createBlendModeColorFilter using SRC_IN blend mode and red color
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0100 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingColorFilterImage1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0100 colorFilter is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(strJson.length > 0).assertTrue();
      let colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      expect(colorFilterValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0200
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0200
     * @tc.desc     Test DrawingColorFilter with createBlendModeColorFilter using SRC_ATOP blend mode and red color
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0200 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingColorFilterImage2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0200 colorFilter is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(strJson.length > 0).assertTrue();
      let colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      expect(colorFilterValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0300
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0300
     * @tc.desc     Test DrawingColorFilter with createBlendModeColorFilter using SRC_IN blend mode and green color
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0300 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingColorFilterImage3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0300 colorFilter is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(strJson.length > 0).assertTrue();
      let colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      expect(colorFilterValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0400
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0400
     * @tc.desc     Test colorFilter set to undefined (no filter effect)
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0400 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingColorFilterImage4');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0400 colorFilter is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(strJson.length > 0).assertTrue();
      let colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      expect(colorFilterValue).assertEqual('');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0500
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0500
     * @tc.desc     Test DrawingColorFilter dynamically changed from undefined to filter via state variable
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0500 START');
      const driver = Driver.create();
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingColorFilterImage5');
      let obj = JSON.parseJsonElement(strJson);
      let colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0500 initial colorFilter is: ' + colorFilterValue);
      expect(colorFilterValue).assertEqual('');

      const button = await driver.findComponent(ON.id('drawingColorFilterBtn5'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_L);

      strJson = inspector.getInspectorByKey('drawingColorFilterImage5');
      obj = JSON.parseJsonElement(strJson);
      colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0500 after click colorFilter is: ' + colorFilterValue);
      expect(colorFilterValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0600
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0600
     * @tc.desc     Test DrawingColorFilter set via AttributeModifier (set filter)
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0600 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingColorFilterImage6');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0600 colorFilter is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(strJson.length > 0).assertTrue();
      let colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      expect(colorFilterValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0700
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0700
     * @tc.desc     Test DrawingColorFilter set to undefined via AttributeModifier
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0700 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingColorFilterImage7');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0700 colorFilter is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(strJson.length > 0).assertTrue();
      let colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      expect(colorFilterValue).assertEqual('');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0800
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0800
     * @tc.desc     Test Image without colorFilter property (default, no filter)
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0800 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingColorFilterImage8');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGCOLORFILTER_PARAM_0800 colorFilter is: ' + obj.getElement('$attrs').getString('colorFilter'));
      expect(strJson.length > 0).assertTrue();
      let colorFilterValue = obj.getElement('$attrs').getString('colorFilter');
      expect(colorFilterValue).assertEqual('');
      done();
    })
  })
}
