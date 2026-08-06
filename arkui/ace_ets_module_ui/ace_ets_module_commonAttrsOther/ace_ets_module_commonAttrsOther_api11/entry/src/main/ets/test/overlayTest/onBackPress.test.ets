/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'

export default function onBackPress() {
  describe('onBackPress', () => {
    beforeEach(async (done: Function) => {
      console.info("onBackPress beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/overlay/onBackPress',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onBackPress state pages: " + JSON.stringify(pages));
        if (!("onBackPress" == pages.name)) {
          console.info("get onBackPress state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onBackPress page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onBackPress page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    /**
     * @tc.name   onBackPress_0100
     * @tc.number onBackPress_0100
     * @tc.desc   onBackPress_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onBackPress_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[onBackPress_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let buttonT = await driver.findComponent(ON.id('testT'));
      await CommonFunc.sleep(1500);
      await buttonT.click();
      await CommonFunc.sleep(1500);
      let buttonS = await driver.findComponent(ON.id('show'));
      await buttonS.click();
      await CommonFunc.sleep(1500);
      let buttonClose = await driver.findComponent(ON.text('关闭'));
      expect(buttonClose).not().assertUndefined();
      await CommonFunc.sleep(1500);
      await buttonClose.click();
      console.info('[onBackPress_0100] END');
      done();
    });

    /**
     * @tc.name   onBackPress_0200
     * @tc.number onBackPress_0200
     * @tc.desc   onBackPress_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onBackPress_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[onBackPress_0200] START');
      
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let buttonF = await driver.findComponent(ON.id('testF'));
      await CommonFunc.sleep(1500);
      await buttonF.click();
      await CommonFunc.sleep(1500);
      let buttonS = await driver.findComponent(ON.id('show'));
      await buttonS.click();
      await CommonFunc.sleep(1500);
      let buttonClose = await driver.findComponent(ON.text('关闭'));
      expect(buttonClose).not().assertUndefined();
      await CommonFunc.sleep(1500);
      await buttonClose.click();
      console.info('onBackPress_0200 END');
      done();
    });

    /**
     * @tc.name   onBackPress_0300
     * @tc.number onBackPress_0300
     * @tc.desc   onBackPress_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onBackPress_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[overLayJsunit_0300] START');
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let buttonU = await driver.findComponent(ON.id('testU'));
      await CommonFunc.sleep(1500);
      await buttonU.click();
      await CommonFunc.sleep(1500);
      let buttonS = await driver.findComponent(ON.id('show'));
      await buttonS.click();
      await CommonFunc.sleep(1500);
      let buttonClose = await driver.findComponent(ON.text('关闭'));
      expect(buttonClose).not().assertUndefined();
      await CommonFunc.sleep(1500);
      await buttonClose.click();
      console.info('overLayJsunit_0300 END');
      done();
    });

  })
}