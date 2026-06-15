/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CustomEnvTest() {
  describe('CustomEnvTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomEnvTest setup start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomEnv/CustomEnv',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get current pages:' + JSON.stringify(pages));
        if (!('CustomEnv' == pages.name)) {
          console.info('get CustomEnvTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CustomEnvTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomEnvTest page error:' + err);
      }
      console.info('CustomEnvTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvTest after each called');
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0100
     * @tc.name      CustomEnvTest_0100
     * @tc.desc      Testing CustomEnvTest use string
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0100] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_1 = await (await driver.findComponent(ON.id('text1'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0100] component text_1: ' + text_1);
      expect(text_1).assertEqual('string：string pass')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0200
     * @tc.name      CustomEnvTest_0200
     * @tc.desc      Testing CustomEnvTest use number
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0200] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_2 = await (await driver.findComponent(ON.id('text2'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0200] component text_2: ' + text_2);
      expect(text_2).assertEqual('number：123')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0300
     * @tc.name      CustomEnvTest_0300
     * @tc.desc      Testing CustomEnvTest use boolean
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0300] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_3 = await (await driver.findComponent(ON.id('text3'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0300] component text_3: ' + text_3);
      expect(text_3).assertEqual('boolean：false')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0400
     * @tc.name      CustomEnvTest_0400
     * @tc.desc      Testing CustomEnvTest use undefined
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0400] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_4 = await (await driver.findComponent(ON.id('text4'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0400] component text_4: ' + text_4);
      expect(text_4).assertEqual('undefined：undefined')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0500
     * @tc.name      CustomEnvTest_0500
     * @tc.desc      Testing CustomEnvTest use null
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0500] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_5 = await (await driver.findComponent(ON.id('text5'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0500] component text_5: ' + text_5);
      expect(text_5).assertEqual('null：null')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0500] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0600
     * @tc.name      CustomEnvTest_0600
     * @tc.desc      Testing CustomEnvTest use zero
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0600] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_6 = await (await driver.findComponent(ON.id('text6'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0600] component text_6: ' + text_6);
      expect(text_6).assertEqual('0：0')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0600] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0700
     * @tc.name      CustomEnvTest_0700
     * @tc.desc      Testing CustomEnvTest use negative
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0700', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0700] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_7 = await (await driver.findComponent(ON.id('text7'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0700] component text_7: ' + text_7);
      expect(text_7).assertEqual('负数：-456')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0700] END');
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0800
     * @tc.name      CustomEnvTest_0800
     * @tc.desc      Testing CustomEnvTest use enum
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0800] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_8 = await (await driver.findComponent(ON.id('text8'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0800] component text_8: ' + text_8);
      expect(text_8).assertEqual('enum：enum1')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0800] END');
      done();
    });

        /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_0900
     * @tc.name      CustomEnvTest_0900
     * @tc.desc      Testing CustomEnvTest use union
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_0900', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_0900] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_9 = await (await driver.findComponent(ON.id('text9'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_0900] component text_9: ' + text_9);
      expect(text_9).assertEqual('联合：union pass')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_0900] END');
      done();
    });

        /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_1000
     * @tc.name      CustomEnvTest_1000
     * @tc.desc      Testing CustomEnvTest use build in
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_1000', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_1000] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_10 = await (await driver.findComponent(ON.id('text10'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_1000] component text_10: ' + text_10);
      expect(text_10).assertEqual('build in：1,2,3,newvalue,newvalue,newvalue,newvalue,newvalue,newvalue,newvalue,newvalue,newvalue,newvalue')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_1000] END');
      done();
    });

        /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_1100
     * @tc.name      CustomEnvTest_1100
     * @tc.desc      Testing CustomEnvTest use class
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_1100', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_1100] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_11 = await (await driver.findComponent(ON.id('text11'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_1100] component text_11: ' + text_11);
      expect(text_11).assertEqual('class：id=456, username=更新后的类实例')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_1100] END');
      done();
    });

        /**
     * @tc.number    SUB_ARKUI_COMPONENT_STATE_CUSTOMENV_1200
     * @tc.name      CustomEnvTest_1200
     * @tc.desc      Testing CustomEnvTest use object
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('CustomEnvTest_1200', Level.LEVEL0, async (done: Function) => {
      console.info('[CustomEnvTest_1200] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let btn: Component = await driver.findComponent(ON.id('CustomEnvBtn'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);

      let text_12 = await (await driver.findComponent(ON.id('text12'))).getText();
      await CommonFunc.sleep(1000);
      console.info('[CustomEnvTest_1200] component text_12: ' + text_12);
      expect(text_12).assertEqual('object：初始对象值')
      await CommonFunc.sleep(1000);

      console.info('[CustomEnvTest_1200] END');
      done();
    });
  })
}