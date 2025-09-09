/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * *     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium';
import router from '@ohos.router';
import {Alignment} from '@ohos.arkui.component'
import  CommonFunc from '../../../../ets/MainAbility/common/Common';
import  RectValue from '../../../../ets/MainAbility/common/Rect';
import {MessageManager} from '../../../../ets/MainAbility/common/MessageManager'

import image from '@ohos.multimedia.image';
import window from '@ohos.window';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  Router } from '@ohos.arkui.UIContext';
import { BusinessError } from '@ohos.base';
import { UtilsTest,startAbility } from '../../Util.test'
import inspector from '@ohos.arkui.inspector';

/*async function imageComparisonAssert(left: number, top: number) {
  let theWinTop = 0;
  let theWinLeft = 0;
  let isTrue = true
  try {
    let winTop = window.getLastWindow(globalThis.abilityContext);
    winTop.then((data) => {
      let windowClass: window.Window = data;
      console.info('Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
      let properties = windowClass.getWindowProperties();
      console.info('Succeeded in obtaining the window properties. Data: ' + properties.windowRect.top);
      theWinTop = properties.windowRect.top + top
      theWinLeft = properties.windowRect.left + left + UIContext.getFocusedUIContext()!.vp2px(10)
      console.info('theWinTop:' + theWinTop + 'theWinLeft:' + theWinLeft);
    }).catch((err: BusinessError) => {
      console.error('Failed to obtain the top window. Cause: ' + err);
    });
  } catch (exception) {
    console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
  }
  await CommonFunc.sleep(3000);
  let screenshotOptions: screenshot.ScreenshotOptions = {
    "screenRect": {
      "left": theWinLeft,
      "top": theWinTop,
      "width": 50,
      "height": 50
    },
    "imageSize": {
      "width": 50,
      "height": 50
    },
    "rotation": 0,
    "displayId": 0
  };
  try {
    screenshot.save(screenshotOptions, (err: BusinessError, pixelMap: image.PixelMap) => {
      if (err) {
        console.log('Failed to save screenshot. Code: ' + JSON.stringify(err));
        isTrue = false;
        return isTrue;
      }
      console.log('Succeeded in saving sreenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
      let PixelBytesNumber = pixelMap.getPixelBytesNumber();
      const color = new ArrayBuffer(PixelBytesNumber);
      pixelMap.readPixelsToBuffer(color, (err, res) => {
        if (err) {
          console.log('Failed to read image pixel data.' + err);
          isTrue = false;
        } else {
          let bufferArr = new Uint8Array(color);
          console.info('bufferArr',bufferArr)
          for (let i = 0; i < bufferArr.length; i += 40) {
            if (bufferArr[i] != 255 || bufferArr[i + 1] != 0 || bufferArr[i + 2] != 0) {
              isTrue = false;
              break;
            }
          }
        }
      })
      pixelMap.release();
      return isTrue;
    });
  } catch (exception) {
    console.error('Failed to save screenshot. Code: ' + JSON.stringify(exception));
    isTrue = false;
  }
  ;
  await CommonFunc.sleep(5000);
  return isTrue;
}*


export default function Stack_ZIndex() {
  describe('Stack_ZIndex_Test', () => {
    beforeAll(async () => {
      console.info("stack_alignContent beforeEach start");
      
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    })
    beforeEach(async (): Promise<void> =>  {
      console.info("Stack_ZIndex beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_zIndex",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get Stack_ZIndex state pages:" + JSON.stringify(pages));
        if (!("stack_zIndex" == pages?.name)) {
          console.info("get Stack_ZIndex pages.name:" + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Stack_ZIndex page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Stack_ZIndex after each called");
    });
   */

/*


/*
     * @tc.number   testStackZIndexWithAlignmentStart
     * @tc.name     testStackZIndexWithAlignmentStart
     * @tc.desc     testStackZIndexWithAlignmentStart
     * @tc.level    Level.LEVEL0
     */























/*let num = await imageComparisonAssert(0, theTop);
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
    

    
   */

/*


/*
     * @tc.number   testStackZIndexWithAlignmentCenter
     * @tc.name     testStackZIndexWithAlignmentCenter
     * @tc.desc     testStackZIndexWithAlignmentCenter
     * @tc.level    Level.LEVEL0
     */



















/*let num = await imageComparisonAssert(theLeft, theTop);
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
      done();*

    
   */

/*


/*
     * @tc.number   testStackZIndexWithAlignmentEnd
     * @tc.name     testStackZIndexWithAlignmentEnd
     * @tc.desc     testStackZIndexWithAlignmentEnd
     * @tc.level    Level.LEVEL0
     */



















/* let num = await imageComparisonAssert(theLeft, theTop);
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
      done();*

    
   */

/*


/*
     * @tc.number   testStackZIndexWithAlignmentBottomStart
     * @tc.name     testStackZIndexWithAlignmentBottomStart
     * @tc.desc     testStackZIndexWithAlignmentBottomStart
     * @tc.level    Level.LEVEL0
     */


















/*let num = await imageComparisonAssert(0, theTop);
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
      done();*

    
    */

/*


/*
     * @tc.number   testStackZIndexWithAlignmentBottom
     * @tc.name     testStackZIndexWithAlignmentBottom
     * @tc.desc     testStackZIndexWithAlignmentBottom
     * @tc.level    Level.LEVEL0
     */



















/*let num = await imageComparisonAssert(theLeft, theTop);
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
      done();*

    
  */
/*  *
     * @tc.number SUB_ACE_STACK_ZINDEX_TEST_0900
     * @tc.name testStackZIndexWithAlignmentBottomEnd
     * @tc.desc The stack component sets alignContent to Alignment.BottomEnd and sets the zIndex of
     *               the first subcomponent*


    */
/*


/*
     * @tc.number   testStackZIndexWithAlignmentBottomEnd
     * @tc.name     testStackZIndexWithAlignmentBottomEnd
     * @tc.desc     testStackZIndexWithAlignmentBottomEnd
     * @tc.level    Level.LEVEL0
     */



















/*let num = await imageComparisonAssert(theLeft, theTop);
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
      done();*



}
*/
