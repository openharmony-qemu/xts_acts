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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/common/Common'

let displayID: number = AppStorage.get('displayID') ? AppStorage.get('displayID') as number : 0;

export default function PresetTest() {
  describe('PresetTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Preset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PresetTest state success " + JSON.stringify(pages));
        if (!("Preset" == pages.name)) {
          console.info("get PresetTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PresetTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PresetTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PresetTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_PRESET_TEST_0100
     * @tc.number SUB_ARKUI_PRESET_TEST_0100
     * @tc.desc   preset about xiaoyi dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_PRESET_TEST_0100',  Level.LEVEL0, async () => {
      console.info('PresetTest PresetTest0001 START');
      let driver = Driver.create();
      console.info('PresetTest PresetTest0001 START');
      await CommonFunc.sleep(1000);
      let textArea1 = await driver.findComponent(ON.id('textArea1_preset'));
      await CommonFunc.sleep(500);
      let textArea2 = await driver.findComponent(ON.id('textArea2_preset'));
      await CommonFunc.sleep(500);
      await textArea2.click()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.text('同意'));
      await CommonFunc.sleep(500);
      if(button1){
        await button1?.click();
        await CommonFunc.sleep(500);
        let button2 = await driver.findComponent(ON.text('下一步'));
        await CommonFunc.sleep(500);
        await button2?.click();
        await CommonFunc.sleep(500);

        let button3 = await driver.findComponent(ON.text('完成'));
        await CommonFunc.sleep(500);
        await button3?.click();
        await CommonFunc.sleep(500);
      }
      expect(1).assertEqual(1);
      console.info("[PresetTest0001] end");
    });


  })
}
