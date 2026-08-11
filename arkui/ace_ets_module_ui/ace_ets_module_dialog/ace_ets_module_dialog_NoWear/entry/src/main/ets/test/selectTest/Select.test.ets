/*
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function SelectTest() {
  describe('SelectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SelectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/Select',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SelectTest state pages: " + JSON.stringify(pages));
        if (!("Select" == pages.name)) {
          console.info("get SelectTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SelectTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectTest page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });


    /*
     *@tc.number ArkUX_Select_Visual_0030
     *@tc.name   ArkUX_Select_Visual_0030
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to 200
     */
    it('ArkUX_Select_Visual_0030', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0030 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let buttonS = await driver.findComponent(ON.id('ArkUX_Select_Visual_0030'));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ArkUX_Select_Visual_0030');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("ArkUX_Select_Visual_0030 obj is: " + JSON.stringify(obj));
      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 300) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 300) <= 2).assertTrue();

      console.info('ArkUX_Select_Visual_0030 END ');
      done();
    });

    /*
     *@tc.number ArkUX_Select_Visual_0040
     *@tc.name   ArkUX_Select_Visual_0040
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to 400
     */
    it('ArkUX_Select_Visual_0040', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0040 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let buttonS = await driver.findComponent(ON.id('ArkUX_Select_Visual_0040'));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ArkUX_Select_Visual_0040');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("ArkUX_Select_Visual_0040 obj is: " + JSON.stringify(obj));
      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 600) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 600) <= 2).assertTrue();

      console.info('ArkUX_Select_Visual_0040 END ');
      done();
    });

    /*
     *@tc.number ArkUX_Select_Visual_0050
     *@tc.name   ArkUX_Select_Visual_0050
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to FIT_TRIGGER and 600
     */
    it('ArkUX_Select_Visual_0050', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0050 START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let buttonS = await driver.findComponent(ON.id('ArkUX_Select_Visual_0050'));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ArkUX_Select_Visual_0050');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("ArkUX_Select_Visual_0050 obj is: " + JSON.stringify(obj));
      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 900) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 900) <= 2).assertTrue();

      console.info('ArkUX_Select_Visual_0050 END ');
      done();
    });

    /*
     *@tc.number ArkUX_Select_Visual_0060
     *@tc.name   ArkUX_Select_Visual_0060
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to FIT_CONTENT and 600
     */
    it('ArkUX_Select_Visual_0060', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0060 START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let buttonS = await driver.findComponent(ON.id('ArkUX_Select_Visual_0060'));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ArkUX_Select_Visual_0060');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("ArkUX_Select_Visual_0060 obj is: " + JSON.stringify(obj));

      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 1200) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 1200) <= 2).assertTrue();

      console.info('ArkUX_Select_Visual_0060 END ');
      done();
    });

    /*
     *@tc.number ArkUX_Select_Visual_0070
     *@tc.name   ArkUX_Select_Visual_0070
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to default value
     */
    it('ArkUX_Select_Visual_0070', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Select_Visual_0070 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let buttonS = await driver.findComponent(ON.id('ArkUX_Select_Visual_0070'));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ArkUX_Select_Visual_0070');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("ArkUX_Select_Visual_0070 obj is: " + JSON.stringify(obj));
      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 1500) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 1500) <= 2).assertTrue();

      console.info('ArkUX_Select_Visual_0070 END ');
      done();
    });
	
  })
}