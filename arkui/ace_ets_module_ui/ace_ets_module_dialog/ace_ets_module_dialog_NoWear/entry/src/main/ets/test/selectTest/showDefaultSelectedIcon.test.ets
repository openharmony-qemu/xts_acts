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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component} from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
const SLEEP_TIME = 1000;

export default function showDefaultSelectedIconTest() {
  describe('showDefaultSelectedIconTest', () => {
    beforeEach(async (done: Function) => {
      console.info("showDefaultSelectedIcon beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/showDefaultSelectedIcon',
      }
      router.clear();
      let pages = router.getState();
      console.info("get showDefaultSelectedIconTest state pages: " + JSON.stringify(pages));
      if (!("showDefaultSelectedIcon" == pages.name)) {
        console.info("get showDefaultSelectedIconTest state pages.name: " + JSON.stringify(pages.name));
        let result = await router.push(options);
        console.info("push showDefaultSelectedIconTest success: " + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_Select_showDefaultSelectedIcon_0100
     * @tc.number SUB_ACE_Select_showDefaultSelectedIcon_0100
     * @tc.desc   set showDefaultSelectedIcon:false,levelUniqueId: Normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_Select_showDefaultSelectedIcon_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0100 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('showDefaultSelectedIconButton'));
      await Utils.sleep(SLEEP_TIME);
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let selectValue = getInspectorByKey('select');
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0100 ' + JSON.stringify(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon));
      expect(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon).assertEqual('false'); 
      await Utils.sleep(SLEEP_TIME);
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_Select_showDefaultSelectedIcon_0200
     * @tc.number SUB_ACE_Select_showDefaultSelectedIcon_0200
     * @tc.desc   set showDefaultSelectedIcon:true,levelUniqueId: Normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_Select_showDefaultSelectedIcon_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0200 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('showDefaultSelectedIconButton'));
      await Utils.sleep(SLEEP_TIME);
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let selectValue = getInspectorByKey('select');
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0200' + JSON.stringify(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon));
      expect(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon).assertEqual('true');
      await Utils.sleep(SLEEP_TIME);
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_Select_showDefaultSelectedIcon_0300
     * @tc.number SUB_ACE_Select_showDefaultSelectedIcon_0300
     * @tc.desc   set showDefaultSelectedIcon:undefined,levelUniqueId: Abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_Select_showDefaultSelectedIcon_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0300 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('showDefaultSelectedIconButton'));
      await Utils.sleep(SLEEP_TIME);
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let selectValue = getInspectorByKey('select');
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0300' + JSON.stringify(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon));
      expect(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon).assertEqual('false');
      await Utils.sleep(SLEEP_TIME);
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_Select_showDefaultSelectedIcon_0400
     * @tc.number SUB_ACE_Select_showDefaultSelectedIcon_0400
     * @tc.desc   set showDefaultSelectedIcon:undefined,levelUniqueId: Abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ACE_Select_showDefaultSelectedIcon_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0400 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('showDefaultSelectedIconButton'));
      await Utils.sleep(SLEEP_TIME);
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let selectValue = getInspectorByKey('select');
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0400' + JSON.stringify(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon));
      expect(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon).assertEqual('false');
      await Utils.sleep(SLEEP_TIME);
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0400 END');
      done();
    });
  })
}