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

import router from '@ohos.router';
import { describe, beforeAll, afterEach, it, expect, Level } from "@ohos/hypium";
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils';

export default function DisplayModeInSubWindowTest() {
  describe('DisplayModeInSubWindowTest', () => {

    beforeAll(async (done: Function) => {
      console.info("[DisplayModeInSubWindowTest] beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DialogDisplayMode/DisplayModeInSubWindowTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("[DisplayModeInSubWindowTest] get state success " + JSON.stringify(pages));
        if (!("DisplayModeInSubWindowTestPage" == pages.name)) {
          console.info("[DisplayModeInSubWindowTest] page name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("[DisplayModeInSubWindowTest] push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("[DisplayModeInSubWindowTest] push page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
    });

    /**
     * @tc.name   DisplayModeInSubWindowTest_DialogDisplayMode_0100
     * @tc.number SUB_ARKUI_API_DisplayModeInSubWindow_DialogDisplayMode_0100
     * @tc.desc   Test DialogDisplayMode.SCREEN_BASED enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DisplayModeInSubWindowTest_DialogDisplayMode_0100', Level.LEVEL0, async (done: Function) => {
      console.info('DisplayModeInSubWindowTest_DialogDisplayMode_0100 START');
      expect(DialogDisplayMode.SCREEN_BASED).assertEqual(0);
      console.info('DialogDisplayMode.SCREEN_BASED = ' + DialogDisplayMode.SCREEN_BASED);
      done();
    });

    /**
     * @tc.name   DisplayModeInSubWindowTest_DialogDisplayMode_0200
     * @tc.number SUB_ARKUI_API_DisplayModeInSubWindow_DialogDisplayMode_0200
     * @tc.desc   Test DialogDisplayMode.WINDOW_BASED enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DisplayModeInSubWindowTest_DialogDisplayMode_0200', Level.LEVEL0, async (done: Function) => {
      console.info('DisplayModeInSubWindowTest_DialogDisplayMode_0200 START');
      expect(DialogDisplayMode.WINDOW_BASED).assertEqual(1);
      console.info('DialogDisplayMode.WINDOW_BASED = ' + DialogDisplayMode.WINDOW_BASED);
      done();
    });

    
     

    

   

    

    /**
     * @tc.name   DisplayModeInSubWindowTest_Menu_0300
     * @tc.number SUB_ARKUI_API_DisplayModeInSubWindow_Menu_0300
     * @tc.desc   Test showActionMenu with showInSubWindow=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DisplayModeInSubWindowTest_Menu_0300', Level.LEVEL0, async (done: Function) => {
      console.info('DisplayModeInSubWindowTest_Menu_0300 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let trueBtn = await driver.findComponent(ON.id('trueBtn'));
      await trueBtn.click();
      await Utils.sleep(1000);
      let dialog1 = await driver.findComponent(ON.text('弹窗SCREEN_BASED'));
      await dialog1.click();
      await Utils.sleep(1000);
      let str1 = await driver.findComponent(ON.text('确认'));
      expect(str1).not().assertUndefined();
      await str1.click();
      await Utils.sleep(1000);
      let dialog2 = await driver.findComponent(ON.text('弹窗WINDOW_BASED'));
      await dialog2.click();
      await Utils.sleep(1000);
      let str2 = await driver.findComponent(ON.text('确认'));
      expect(str2).not().assertUndefined();
      await str2.click();
      await Utils.sleep(1000);


      console.info('DisplayModeInSubWindowTest_Menu_0300 END');
      done();
    });

    /**
     * @tc.name   DisplayModeInSubWindowTest_Menu_0400
     * @tc.number SUB_ARKUI_API_DisplayModeInSubWindow_Menu_0400
     * @tc.desc   Test showActionMenu with showInSubWindow=false
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DisplayModeInSubWindowTest_Menu_0400', Level.LEVEL0, async (done: Function) => {
      console.info('DisplayModeInSubWindowTest_Menu_0400 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let falseBtn = await driver.findComponent(ON.id('falseBtn'));
      await falseBtn.click();
      await Utils.sleep(1000);
      let dialog1 = await driver.findComponent(ON.text('弹窗SCREEN_BASED'));
      await dialog1.click();
      await Utils.sleep(1000);
      let str1 = await driver.findComponent(ON.text('确认'));
      expect(str1).not().assertUndefined();
      await str1.click();
      await Utils.sleep(1000);
      let dialog2 = await driver.findComponent(ON.text('弹窗WINDOW_BASED'));
      await dialog2.click();
      await Utils.sleep(1000);
      let str2 = await driver.findComponent(ON.text('确认'));
      expect(str2).not().assertUndefined();
      await str2.click();
      await Utils.sleep(1000);

      console.info('DisplayModeInSubWindowTest_Menu_0400 END');
      done();
    });
    
  })
}