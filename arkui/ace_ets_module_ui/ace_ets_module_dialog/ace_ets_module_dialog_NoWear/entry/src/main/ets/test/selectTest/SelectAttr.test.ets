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
import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from "../../MainAbility/common/Common";
import { Driver, ON ,MouseButton} from '@ohos.UiTest';


export default function SelectAttr() {
  describe('SelectAttr', () => {
    beforeEach(async (done: Function) => {
      console.info("SelectAttr beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/SelectAttr',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SelectAttr state success " + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        await CommonFunc.sleep(2000);
        console.info("push SelectAttr page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push SelectAttr page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SelectAttr after each called");
    });


    /*
    * @tc.number      SelectAttr_001
    * @tc.name        SelectAttr_001
    * @tc.desc        SelectAttr OptionWidthMode.FIT_TRIGGER test
    * @tc.level       Level 2
    */
    it('SelectAttr_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SelectAttr_001] START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('SelectAttr_Select'));
      await btn1.click()
      await CommonFunc.sleep(3000);

      let strJson1 = getInspectorByKey('SelectAttr_Select');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[SelectAttr_001] obj1 is: " + JSON.stringify(obj1));

      let obj2: Record<string, ESObject> = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[SelectAttr_001] obj2 is: " + JSON.stringify(obj2));
      let width = parseFloat(obj2.$children[1].$children[0].$attrs.width.slice(0,-2))
      let width1 = parseFloat(obj1.$attrs.width.slice(0,-2))
      expect(Math.floor(Math.abs(width - width1)) <= 1).assertTrue();
      console.info('[SelectAttr_001] END');
      done();
    });

  })
}


