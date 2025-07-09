/**
 * Copyright (c) 2025 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../hypium/index';
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
// import screenshot from '@ohos.screenshot';
import image from '@ohos.multimedia.image';
import window from '@ohos.window';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
import { UIContext } from "@ohos.arkui.UIContext";
import { Alignment } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import { Alignment } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
async function imageComparisonAssert(left: number, top: number) {
  let theWinTop:number = 0;
  let theWinLeft:number = 0;
  let isTrue:boolean = true
  try {
    // let winTop = window.getLastWindow(globalThis.abilityContext);
    const uiContext = new UIContext();
    let winTop = AppStorage.get<Promise<window.Window>>("messageManager", Type.from<Promise<window.Window>>());
    winTop?.then((data:window.Window) => {
      let windowClass: window.Window = data;
      console.info('Succeeded in obtaining the top window. Data: ' + data);
      let properties = windowClass.getWindowProperties();
      console.info('Succeeded in obtaining the window properties. Data: ' + properties.windowRect.top);
      theWinTop = properties.windowRect.top + top
      theWinLeft = properties.windowRect.left + left + uiContext.vp2px(10)
      console.info('theWinTop:' + theWinTop + 'theWinLeft:' + theWinLeft);
    }).catch((err: Error) => {
      console.error('Failed to obtain the top window. Cause: ' + err);
    });
  } catch (exception:Error) {
    console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
  }
  // await CommonFunc.sleep(3000);
  // let screenshotOptions: screenshot.ScreenshotOptions = {
  //   "screenRect": {
  //     "left": theWinLeft,
  //     "top": theWinTop,
  //     "width": 50,
  //     "height": 50
  //   },
  //   "imageSize": {
  //     "width": 50,
  //     "height": 50
  //   },
  //   "rotation": 0,
  //   "displayId": 0
  // };
  // try {
    // screenshot.save(screenshotOptions, (err: BusinessError, pixelMap: image.PixelMap) => {
    //   if (err) {
    //     console.log('Failed to save screenshot. Code: ' + JSON.stringify(err));
    //     isTrue = false;
    //     return isTrue;
    //   }
    //   console.log('Succeeded in saving sreenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
    //   let PixelBytesNumber = pixelMap.getPixelBytesNumber();
    //   const color = new ArrayBuffer(PixelBytesNumber);
    //   pixelMap.readPixelsToBuffer(color, (err, res) => {
    //     if (err) {
    //       console.log('Failed to read image pixel data.' + err);
    //       isTrue = false;
    //     } else {
    //       let bufferArr = new Uint8Array(color);
    //       console.info('bufferArr',bufferArr)
    //       for (let i = 0; i < bufferArr.length; i += 40) {
    //         if (bufferArr[i] != 255 || bufferArr[i + 1] != 0 || bufferArr[i + 2] != 0) {
    //           isTrue = false;
    //           break;
    //         }
    //       }
    //     }
    //   })
    //   pixelMap.release();
    //   return isTrue;
    // });
  // } catch (exception:Error) {
  //   console.error('Failed to save screenshot. Code: ' + JSON.stringify(exception));
  //   isTrue = false;
  // };
  await CommonFunc.sleep(5000);
  return isTrue;
}

export default function Stack_ZIndex() {
  describe('Stack_ZIndex_Test', () => {
    beforeAll(() => {
      console.info("Stack_ZIndex_Test beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      console.info("Stack_ZIndex beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_zIndex",
      };
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get Stack_ZIndex state pages:" + JSON.stringify(pages));
        if (!("stack_zIndex" == pages.name)) {
          console.info("get Stack_ZIndex pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Stack_ZIndex page result:" + JSON.stringify(result));
        }
      } catch (err:Error) {
        console.error("push Stack_ZIndex page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_ZIndex beforeEach end");
    });
    afterEach(async ():Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("Stack_ZIndex after each called");
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0400
     * @tc.name testStackZIndexWithAlignmentStart
     * @tc.desc The stack component sets alignContent to Alignment.Start and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentStart] START');
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let num = await imageComparisonAssert(0, theTop);
      await CommonFunc.sleep(1000);
      console.log('[testStackZIndexWithAlignmentStart] num is', num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.left is', Stack_ZIndex_01.left);
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_011.left) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_012.left) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0500
     * @tc.name testStackZIndexWithAlignmentCenter
     * @tc.desc The stack component sets alignContent to Alignment.Center and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentCenter] START');
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let theLeft: number = Stack_ZIndex_012.left;
      let num = await imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(1000);
      console.log('[testStackZIndexWithAlignmentCenter] num is', num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_011.left - Stack_ZIndex_01.left is', Stack_ZIndex_011.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_011.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_011.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.left - Stack_ZIndex_01.left is', Stack_ZIndex_012.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_012.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentCenter] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0600
     * @tc.name testStackZIndexWithAlignmentEnd
     * @tc.desc The stack component sets alignContent to Alignment.End and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentEnd] START');
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let theLeft: number = Stack_ZIndex_012.left;
      let num = await imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(1000);
      console.log('[testStackZIndexWithAlignmentEnd] num is', num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.right is', Stack_ZIndex_01.right);
      expect(Math.abs((Stack_ZIndex_01.right) - (Stack_ZIndex_011.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_ZIndex_01.right) - (Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.top - Stack_ZIndex_01.top is', Stack_ZIndex_011.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_011.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.top - Stack_ZIndex_01.top is', Stack_ZIndex_012.top - Stack_ZIndex_01.top);
      expect(Math.abs(Math.round(Stack_ZIndex_012.top - Stack_ZIndex_01.top) -
      Math.round(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentEnd] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0700
     * @tc.name testStackZIndexWithAlignmentBottomStart
     * @tc.desc The stack component sets alignContent to Alignment.BottomStart and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentBottomStart] START');
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let num = await imageComparisonAssert(0, theTop);
      await CommonFunc.sleep(1000);
      console.log('[testStackZIndexWithAlignmentBottomStart] num is', num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.left is', Stack_ZIndex_01.left);
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_011.left) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.left - Stack_ZIndex_012.left) <= 1).assertTrue();
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottomStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0800
     * @tc.name testStackZIndexWithAlignmentBottom
     * @tc.desc The stack component sets alignContent to Alignment.Bottom and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentBottom] START');
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let theLeft: number = Stack_ZIndex_012.left;
      let num = await imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(3000);
      console.log('[testStackZIndexWithAlignmentBottom] num is', num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs((Stack_ZIndex_01.bottom) - (Stack_ZIndex_011.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_ZIndex_01.bottom) - (Stack_ZIndex_012.bottom)) <= 1).assertTrue();
      console.log('Stack_ZIndex_011.left - Stack_ZIndex_01.left is', Stack_ZIndex_011.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_011.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_011.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_012.left - Stack_ZIndex_01.left is', Stack_ZIndex_012.left - Stack_ZIndex_01.left);
      expect(Math.abs(Math.round(Stack_ZIndex_012.left - Stack_ZIndex_01.left) -
      Math.round(Stack_ZIndex_01.right - Stack_ZIndex_012.right)) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottom] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0900
     * @tc.name testStackZIndexWithAlignmentBottomEnd
     * @tc.desc The stack component sets alignContent to Alignment.BottomEnd and sets the zIndex of
     *               the first subcomponent
     */
    it('testStackZIndexWithAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackZIndexWithAlignmentBottomEnd] START');
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_ZIndex_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      let Stack_ZIndex_011: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_011');
      let Stack_ZIndex_012: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_012');
      let Stack_ZIndex_01: RectValue = CommonFunc.getComponentRect('Stack_ZIndex_01');
      let Stack_ZIndex_01_width = Stack_ZIndex_01.right - Stack_ZIndex_01.left;
      let Stack_ZIndex_01_height = Stack_ZIndex_01.bottom - Stack_ZIndex_01.top;
      let theTop: number = Stack_ZIndex_012.top;
      let theLeft: number = Stack_ZIndex_012.left;
      let num = await imageComparisonAssert(theLeft, theTop);
      await CommonFunc.sleep(3000);
      console.log('[testStackZIndexWithAlignmentBottomEnd] num is', num);
      expect(num).assertEqual(true);
      console.log('Stack_ZIndex_01.bottom is', Stack_ZIndex_01.bottom);
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_011.bottom) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.bottom - Stack_ZIndex_012.bottom) <= 1).assertTrue();
      console.log('Stack_ZIndex_01.right is', Stack_ZIndex_01.right);
      expect(Math.abs(Stack_ZIndex_01.right - Stack_ZIndex_011.right) <= 1).assertTrue();
      expect(Math.abs(Stack_ZIndex_01.right - Stack_ZIndex_012.right) <= 1).assertTrue();
      console.log('Stack_ZIndex_01_height is', Stack_ZIndex_01_height);
      console.log('Stack_ZIndex_01_width is', Stack_ZIndex_01_width);
      console.log('Stack_ZIndex_011.bottom - Stack_ZIndex_011.top is', Stack_ZIndex_011.bottom - Stack_ZIndex_011.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.bottom - Stack_ZIndex_011.top - Stack_ZIndex_01_height * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.bottom - Stack_ZIndex_012.top is', Stack_ZIndex_012.bottom - Stack_ZIndex_012.top);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.bottom - Stack_ZIndex_012.top - Stack_ZIndex_01_height * 0.5)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_011.right - Stack_ZIndex_011.left is', Stack_ZIndex_011.right - Stack_ZIndex_011.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_011.right - Stack_ZIndex_011.left - Stack_ZIndex_01_width * 0.7)) <= 1)
        .assertTrue();
      console.log('Stack_ZIndex_012.right - Stack_ZIndex_012.left is', Stack_ZIndex_012.right - Stack_ZIndex_012.left);
      expect(Math.floor(Math.abs(Stack_ZIndex_012.right - Stack_ZIndex_012.left - Stack_ZIndex_01_width * 0.5)) <= 1)
        .assertTrue();
      console.info('[testStackZIndexWithAlignmentBottomEnd] END');
      done();
    });
  })
}
