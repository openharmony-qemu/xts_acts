/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function UIPickerComponentItemHeightTest() {
  describe('UIPickerComponentItemHeightTest', () => {
    beforeEach(async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/UIPickerComponentItemHeightTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('UIPickerComponentItemHeightTest state pages: ' + JSON.stringify(pages));
        if (!('UIPickerComponentItemHeightTest' == pages.name)) {
          console.info('UIPickerComponentItemHeightTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push UIPickerComponentItemHeightTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push UIPickerComponentItemHeightTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('UIPickerComponentItemHeightTest after each called');
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0100
     * @tc.name UIPickerComponentItemHeightTest_0100
     * @tc.desc test itemHeight with default value
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0100] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      expect(JSON.parse(strJson1).$attrs.itemHeight)
        .assertContain('40');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0200
     * @tc.name UIPickerComponentItemHeightTest_0200
     * @tc.desc test itemHeight with LengthMetrics vp 40
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0200] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightVp40Id');
      console.info("[UIPickerComponentItemHeightTest_0200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_0200] vp40 is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson2).$attrs.itemHeight)
        .assertContain('40');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0300
     * @tc.name UIPickerComponentItemHeightTest_0300
     * @tc.desc test itemHeight with LengthMetrics vp 50
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0300] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightVp50Id');
      console.info("[UIPickerComponentItemHeightTest_0300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_0300] vp50 is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson2).$attrs.itemHeight)
        .assertContain('50');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0400
     * @tc.name UIPickerComponentItemHeightTest_0400
     * @tc.desc test itemHeight with LengthMetrics vp 64
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0400] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightVp64Id');
      console.info("[UIPickerComponentItemHeightTest_0400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_0400] vp64 is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson2).$attrs.itemHeight)
        .assertContain('64');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0500
     * @tc.name UIPickerComponentItemHeightTest_0500
     * @tc.desc test itemHeight with LengthMetrics px 40
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0500', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0500] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightPx40Id');
      console.info("[UIPickerComponentItemHeightTest_0500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_0500] px40 is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson2).$attrs.itemHeight)
        .assertContain('40');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0600
     * @tc.name UIPickerComponentItemHeightTest_0600
     * @tc.desc test itemHeight with LengthMetrics fp 20
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0600', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0600] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightFp20Id');
      console.info("[UIPickerComponentItemHeightTest_0600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_0600] fp20 is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson1).$attrs.itemHeight)
        .assertEqual(JSON.parse(strJson2).$attrs.itemHeight);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0700
     * @tc.name UIPickerComponentItemHeightTest_0700
     * @tc.desc test itemHeight with less than min value (30vp)
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0700', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0700] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightLessMinId');
      console.info("[UIPickerComponentItemHeightTest_0700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_0700] lessMin is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson1).$attrs.itemHeight)
        .assertEqual(JSON.parse(strJson2).$attrs.itemHeight);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0800
     * @tc.name UIPickerComponentItemHeightTest_0800
     * @tc.desc test itemHeight with greater than max value (70vp)
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0800', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0800] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightGreaterMaxId');
      console.info("[UIPickerComponentItemHeightTest_0800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_0800] greaterMax is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson1).$attrs.itemHeight)
        .assertEqual(JSON.parse(strJson2).$attrs.itemHeight);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_0900
     * @tc.name UIPickerComponentItemHeightTest_0900
     * @tc.desc test itemHeight with undefined
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_0900', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_0900] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_0900] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightUndefinedId');
      console.info("[UIPickerComponentItemHeightTest_0900] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_0900] undefined is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson1).$attrs.itemHeight)
        .assertEqual(JSON.parse(strJson2).$attrs.itemHeight);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_ITEMHEIGHT_1000
     * @tc.name UIPickerComponentItemHeightTest_1000
     * @tc.desc test itemHeight with null
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentItemHeightTest_1000', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentItemHeightTest_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerItemHeightDefaultId');
      console.info("[UIPickerComponentItemHeightTest_1000] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentItemHeightTest_1000] default is: " + JSON.parse(strJson1).$attrs.itemHeight);

      let strJson2 = getInspectorByKey('pickerItemHeightNullId');
      console.info("[UIPickerComponentItemHeightTest_1000] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentItemHeightTest_1000] null is: " + JSON.parse(strJson2).$attrs.itemHeight);

      expect(JSON.parse(strJson1).$attrs.itemHeight)
        .assertEqual(JSON.parse(strJson2).$attrs.itemHeight);
      done();
    });
  })
}