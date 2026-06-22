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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';


export default function triggerSelectTest() {
  describe('triggerSelectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("triggerSelect beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/triggerSelect',
      }
      try {
        let pages = router.getState();
        console.info("get triggerSelect state pages: " + JSON.stringify(pages));
        if (pages.name !== 'triggerSelect') {
          router.clear();
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push triggerSelect success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push triggerSelect page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_triggerSelect_0100
     * @tc.name      triggerSelect_0100
     * @tc.desc      set api
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     Level 1
     */
    it('triggerSelect_0100', Level.LEVEL1, async (done: Function) => {
      console.info('triggerSelect_0100 START');
      await CommonFunc.sleep(1000);
      await Utils.openSelectMenu('triggerSelect_select', 2000);

      let driver = await Driver.create();
      let menuPt = Utils.getSelectMenuItemPoint('triggerSelect_select', 0);
      await driver.click(menuPt.x, menuPt.y);
      await CommonFunc.sleep(1000);

      let obj: ESObject = JSON.parse(getInspectorByKey('triggerSelectValue'));
      console.info("[triggerSelect_0100] component obj is: " + JSON.stringify(obj));
      console.info("[triggerSelect_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Select index:0Select text:item1');
      console.info('[triggerSelect_0100] END');
      done();
    });
  })
}

