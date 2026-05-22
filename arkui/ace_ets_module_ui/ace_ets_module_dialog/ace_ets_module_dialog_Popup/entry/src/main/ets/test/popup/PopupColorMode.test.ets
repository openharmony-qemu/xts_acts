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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
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
import CommonFunc from '../../MainAbility/common/Common';

export default function PopupColorMode() {
  describe('PopupColorMode', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupColorMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PopupColorMode state success ' + JSON.stringify(pages));
        if (!('PopupColorMode' == pages.name)) {
          console.info('get PopupColorMode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push PopupColorMode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PopupColorMode page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PopupColorMode after each called");
    });

    /**
     * @tc.name   PopupColorMode_0100
     * @tc.number SUB_ARKUI_API_PopupColorMode_0100
     * @tc.desc   To test AnchoredColorMode.FOLLOW_SYSTEM
     * @tc.desc   ArkUIAPI 
     * @tc.type   FUNCTION 
     * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2 
    */
    it('PopupColorMode_0100', Level.LEVEL2, async (done: Function) => {
      console.info('PopupColorMode_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('PopupColorMode_FOLLOW_SYSTEM'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('This is a popup with FOLLOW_SYSTEM'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupColorMode_0100 END');
      done();
    });

    /**
     * @tc.name   PopupColorMode_0200
     * @tc.number SUB_ARKUI_API_PopupColorMode_0200
     * @tc.desc   To test AnchoredColorMode.FOLLOW_TARGET
     * @tc.desc   ArkUIAPI 
     * @tc.type   FUNCTION 
     * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2 
    */
    it('PopupColorMode_0200', Level.LEVEL2, async (done: Function) => {
      console.info('PopupColorMode_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('PopupColorMode_FOLLOW_TARGET'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('This is a popup with FOLLOW_TARGET'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupColorMode_0200 END');
      done();
    });

    /**
     * @tc.name   PopupColorMode_0300
     * @tc.number SUB_ARKUI_API_PopupColorMode_0300
     * @tc.desc   To test null should use default value
     * @tc.desc   ArkUIAPI 
     * @tc.type   FUNCTION 
     * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2 
    */
    it('PopupColorMode_0300', Level.LEVEL2, async (done: Function) => {
      console.info('PopupColorMode_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('PopupColorMode_null'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('This is a popup with null'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupColorMode_0300 END');
      done();
    });

    /**
     * @tc.name   PopupColorMode_0400
     * @tc.number SUB_ARKUI_API_PopupColorMode_0400
     * @tc.desc   To test undefined should use default value
     * @tc.desc   ArkUIAPI 
     * @tc.type   FUNCTION 
     * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL2 
    */
    it('PopupColorMode_0400', Level.LEVEL2, async (done: Function) => {
      console.info('PopupColorMode_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('PopupColorMode_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let popupText = await driver.findComponent(ON.text('This is a popup with undefined'));
      expect(popupText != null).assertTrue();
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('PopupColorMode_0400 END');
      done();
    });
  })
}

