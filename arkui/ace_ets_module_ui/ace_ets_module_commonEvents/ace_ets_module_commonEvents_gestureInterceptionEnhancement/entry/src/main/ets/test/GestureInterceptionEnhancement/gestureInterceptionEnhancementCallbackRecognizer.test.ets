/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function gestureInterceptionEnhancementCallbackRecognizerTest() {
  describe('gestureInterceptionEnhancementCallbackRecognizerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gestureInterceptionEnhancementCallbackRecognizerTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GestureInterceptionEnhancement/tabsInterceptionEnhancementcallbackRecognizerTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureInterceptionEnhancementCallbackRecognizerTest state pages: " + JSON.stringify(pages));
        if (!("tabsInterceptionEnhancementcallbackRecognizerTest" == pages.name)) {
          console.info("get tabsInterceptionEnhancementcallbackRecognizerTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsInterceptionEnhancementcallbackRecognizerTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsInterceptionEnhancementcallbackRecognizerTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

     afterEach(async () => {
      await CommonFunc.sleep(1500);
    });

    /**
     * @tc.name     gestureInterceptionEnhancementCallbackRecognizerTest_0010Adapt002
     * @tc.number tabsInterceptionEnhancementcallbackRecognizerTest_0010
     * @tc.desc   test the Recognizer callBackData when invoke gesture Interception Enhancement interface (exposeInnerGesture value true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureInterceptionEnhancementCallbackRecognizerTest_0010Adapt002', Level.LEVEL0, async (done: Function) => {
        console.info(' gestureInterceptionEnhancementCallbackRecognizerTest_0010 START');
        let driver: Driver = await Driver.create()
        await CommonFunc.sleep(1500);
        let blueTab = await driver.findComponent(ON.text('blue and pink'));
        await blueTab.click();
        await CommonFunc.sleep(1500);
        let swipeArea = CommonFunc.getComponentRectOnScreen('secondTabsContent');
        let top = swipeArea.top;
        let right = swipeArea.right;
        let left = swipeArea.left;
        let bottom = swipeArea.bottom;
        let height = bottom - top;
        let width = right - left;
        console.info(
          `[Adapt002] secondTabsContent rect left=${left} right=${right} top=${top} bottom=${bottom}`
        );
        expect(width > 0).assertTrue();
        expect(height > 0).assertTrue();
        await CommonFunc.sleep(1000);
        await driver.swipe(
          Math.round(left + width * 0.8), Math.round(top + height / 2),
          Math.round(left + width * 0.2), Math.round(top + height / 2)
        );
        await CommonFunc.sleep(2500);
        await driver.swipe(
          Math.round(left + width * 0.8), Math.round(top + height / 2),
          Math.round(left + width * 0.2), Math.round(top + height / 2)
        );
        await CommonFunc.sleep(2500);
        await driver.swipe(
          Math.round(left + width * 0.8), Math.round(top + height / 2),
          Math.round(left + width * 0.2), Math.round(top + height / 2)
        );
        await CommonFunc.sleep(2500);
         let strJson = getInspectorByKey('eventceshi');
         let obj: ESObject = JSON.parse(strJson);
         let content: string = obj.$attrs.content as string;
         console.info("[ gestureInterceptionEnhancementCallbackRecognizerTest_0010 ] content: " + content);
         expect(content.startsWith('{')).assertTrue();
         let obj2 : ESObject = JSON.parse(content);
         console.info("gestureInterceptionEnhancementCallbackRecognizerTest" + obj2.type);
         console.info("gestureInterceptionEnhancementCallbackRecognizerTest" + obj2.tag);
         console.info("gestureInterceptionEnhancementCallbackRecognizerTest" + obj2.isBuildIn);
         console.info("gestureInterceptionEnhancementCallbackRecognizerTest" + obj2.isEnabled);
         console.info("gestureInterceptionEnhancementCallbackRecognizerTest" + obj2.getState);
         console.info("gestureInterceptionEnhancementCallbackRecognizerTest" + obj2.getId);
         console.info("gestureInterceptionEnhancementCallbackRecognizerTest" + obj2.isValid);
         expect(obj2.tag).assertEqual("");
         expect(obj2.type == 2).assertTrue();
         expect(obj2.isBuildIn).assertTrue();
         expect(obj2.isEnabled).assertTrue();
         expect(obj2.getState == 1)
         expect(obj2.getId).assertEqual("");
         expect(obj2.isValid).assertTrue();
        let strJson2 = getInspectorByKey('eventArray');
        let objA: ESObject = JSON.parse(strJson2);
        let contentA: string = objA.$attrs.content as string;
        console.info("[ gestureInterceptionEnhancementCallbackRecognizerTest_0010 ] contentA: " + contentA);
        expect(contentA.startsWith('[')).assertTrue();
        let objAA : ESObject = JSON.parse(contentA);
        expect(objAA[0].tag).assertEqual("");
        expect(objAA[0].type == 2).assertTrue();
        expect(objAA[0].isBuildIn).assertTrue();
        expect(objAA[0].isEnabled).assertTrue();
        expect(objAA[0].getState == 1)
        expect(objAA[0].getId).assertEqual("");
        expect(objAA[0].isValid).assertTrue();
        expect(objAA[1].tag).assertEqual("");
        expect(objAA[1].type == 2).assertTrue();
        expect(objAA[1].isBuildIn).assertTrue();
        expect(objAA[1].isEnabled).assertTrue();
        expect(objAA[1].getState == 1)
        expect(objAA[1].getId).assertEqual("");
        expect(objAA[1].isValid).assertTrue();
        done();
    });

  })
}

