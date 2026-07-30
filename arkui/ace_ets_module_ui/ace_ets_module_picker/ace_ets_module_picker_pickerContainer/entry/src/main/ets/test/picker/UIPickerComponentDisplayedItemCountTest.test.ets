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

export default function UIPickerComponentDisplayedItemCountTest() {
  describe('UIPickerComponentDisplayedItemCountTest', () => {
    beforeEach(async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/picker/UIPickerComponentDisplayedItemCountTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('UIPickerComponentDisplayedItemCountTest state pages: ' + JSON.stringify(pages));
        if (!('UIPickerComponentDisplayedItemCountTest' == pages.name)) {
          console.info('UIPickerComponentDisplayedItemCountTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push UIPickerComponentDisplayedItemCountTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push UIPickerComponentDisplayedItemCountTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('UIPickerComponentDisplayedItemCountTest after each called');
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0100
     * @tc.name UIPickerComponentDisplayedItemCountTest_0100
     * @tc.desc test displayedItemCount with default value
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0100] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      expect(JSON.parse(strJson1).$attrs.displayedItemCount)
        .assertContain('7');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0200
     * @tc.name UIPickerComponentDisplayedItemCountTest_0200
     * @tc.desc test displayedItemCount with number 2 (even, should become 3)
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0200] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCount2Id');
      console.info("[UIPickerComponentDisplayedItemCountTest_0200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0200] count2 is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson2).$attrs.displayedItemCount)
        .assertContain('3');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0300
     * @tc.name UIPickerComponentDisplayedItemCountTest_0300
     * @tc.desc test displayedItemCount with number 3
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0300] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCount3Id');
      console.info("[UIPickerComponentDisplayedItemCountTest_0300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0300] count3 is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson2).$attrs.displayedItemCount)
        .assertContain('3');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0400
     * @tc.name UIPickerComponentDisplayedItemCountTest_0400
     * @tc.desc test displayedItemCount with number 5
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0400] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCount5Id');
      console.info("[UIPickerComponentDisplayedItemCountTest_0400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0400] count5 is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson2).$attrs.displayedItemCount)
        .assertContain('5');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0500
     * @tc.name UIPickerComponentDisplayedItemCountTest_0500
     * @tc.desc test displayedItemCount with number 7
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0500', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0500] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0500] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCount7Id');
      console.info("[UIPickerComponentDisplayedItemCountTest_0500] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0500] count7 is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson2).$attrs.displayedItemCount)
        .assertContain('7');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0600
     * @tc.name UIPickerComponentDisplayedItemCountTest_0600
     * @tc.desc test displayedItemCount with number 9
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0600', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0600] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0600] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCount9Id');
      console.info("[UIPickerComponentDisplayedItemCountTest_0600] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0600] count9 is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson2).$attrs.displayedItemCount)
        .assertContain('9');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0700
     * @tc.name UIPickerComponentDisplayedItemCountTest_0700
     * @tc.desc test displayedItemCount with even number 4 (should become 5)
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0700', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0700] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0700] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCount4Id');
      console.info("[UIPickerComponentDisplayedItemCountTest_0700] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0700] count4 is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson2).$attrs.displayedItemCount)
        .assertContain('5');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0800
     * @tc.name UIPickerComponentDisplayedItemCountTest_0800
     * @tc.desc test displayedItemCount with even number 8 (should become 9)
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0800', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0800] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0800] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCount8Id');
      console.info("[UIPickerComponentDisplayedItemCountTest_0800] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0800] count8 is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson2).$attrs.displayedItemCount)
        .assertContain('9');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_0900
     * @tc.name UIPickerComponentDisplayedItemCountTest_0900
     * @tc.desc test displayedItemCount with decimal 3.5 (should floor to 3)
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_0900', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0900] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0900] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCountDecimalId');
      console.info("[UIPickerComponentDisplayedItemCountTest_0900] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_0900] decimal is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson2).$attrs.displayedItemCount)
        .assertContain('3');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_1000
     * @tc.name UIPickerComponentDisplayedItemCountTest_1000
     * @tc.desc test displayedItemCount with less than min (1, should use default 7)
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_1000', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_1000] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_1000] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCountLessMinId');
      console.info("[UIPickerComponentDisplayedItemCountTest_1000] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_1000] lessMin is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson1).$attrs.displayedItemCount)
        .assertEqual(JSON.parse(strJson2).$attrs.displayedItemCount);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_1100
     * @tc.name UIPickerComponentDisplayedItemCountTest_1100
     * @tc.desc test displayedItemCount with greater than max (10, should use default 7)
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_1100', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_1100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_1100] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCountGreaterMaxId');
      console.info("[UIPickerComponentDisplayedItemCountTest_1100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_1100] greaterMax is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson1).$attrs.displayedItemCount)
        .assertEqual(JSON.parse(strJson2).$attrs.displayedItemCount);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_1200
     * @tc.name UIPickerComponentDisplayedItemCountTest_1200
     * @tc.desc test displayedItemCount with undefined
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_1200', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_1200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_1200] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCountUndefinedId');
      console.info("[UIPickerComponentDisplayedItemCountTest_1200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_1200] undefined is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson1).$attrs.displayedItemCount)
        .assertEqual(JSON.parse(strJson2).$attrs.displayedItemCount);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UIPICKER_COMPONENT_DISPLAYEDITEMCOUNT_1300
     * @tc.name UIPickerComponentDisplayedItemCountTest_1300
     * @tc.desc test displayedItemCount with null
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('UIPickerComponentDisplayedItemCountTest_1300', Level.LEVEL2, async (done: Function) => {
      console.info('UIPickerComponentDisplayedItemCountTest_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('pickerDisplayedItemCountDefaultId');
      console.info("[UIPickerComponentDisplayedItemCountTest_1300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[UIPickerComponentDisplayedItemCountTest_1300] default is: " + JSON.parse(strJson1).$attrs.displayedItemCount);

      let strJson2 = getInspectorByKey('pickerDisplayedItemCountNullId');
      console.info("[UIPickerComponentDisplayedItemCountTest_1300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[UIPickerComponentDisplayedItemCountTest_1300] null is: " + JSON.parse(strJson2).$attrs.displayedItemCount);

      expect(JSON.parse(strJson1).$attrs.displayedItemCount)
        .assertEqual(JSON.parse(strJson2).$attrs.displayedItemCount);
      done();
    });
  })
}