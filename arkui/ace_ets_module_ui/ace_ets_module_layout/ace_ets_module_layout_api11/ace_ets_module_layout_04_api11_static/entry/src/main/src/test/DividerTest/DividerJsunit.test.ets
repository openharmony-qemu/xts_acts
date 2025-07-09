/*
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


import { afterEach, beforeEach, describe, expect, it, beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import { LineCapStyle } from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function dividerJsunit() {
  describe('dividerTest', () => {
    beforeAll(() => {
      console.info("dividerJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/Divider',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get divider state success " + "");
        if (!("Divider" == pages.name)) {
          console.info("get divider state success " + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000)

          // console.info("push divider page success " + "");
        }
      } catch (err) {
        console.error("push divider page error " + JSON.stringify(err));
      }
      await sleep(1);
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Divider after each called");
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0750
     * @tc.name testDividerGetInspectorByKey010_static_01
     * @tc.desc aceEtsTest
     */
    it('testDividerGetInspectorByKey010_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('testDividerGetInspectorByKey010_static_01 START');
      let strJson = inspector.getInspectorByKey('divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("cd divider component obj is: " + JSON.stringify(obj));
     console.log("cd divider type" + JSON.stringify(obj.getString('$type')));
     console.log("cd divider color" + JSON.stringify(obj.getElement('$attrs').getString('color')));
     expect(obj.getString('$type')).assertEqual('Divider')
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFF0000')
     console.info(" divider component obj is: " + JSON.stringify(obj));
     console.log("cd divider strokeWidth" + JSON.stringify(obj.getElement('$attrs').getString('strokeWidth')));
     console.log("cd divider vertical" + JSON.stringify(obj.getElement('$attrs').getString('vertical')));
     console.log("cd divider lineCap" + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual("7.00vp")
     expect(obj.getElement('$attrs').getString('vertical')).assertEqual('true')
     expect((obj.getElement('$attrs').getString('lineCap')) == 'LineCapStyle.Square')
      console.info('testDividerGetInspectorByKey010_static_01 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0760
     * @tc.name testDividerGetInspectorByKey020_static_02
     * @tc.desc aceEtsTest
     */
    it('testDividerGetInspectorByKey020_static_02', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('divider1');
     let obj = JSON.parseJsonElement(strJson);
     console.info(" divider1 component obj is: " + JSON.stringify(obj));
     console.log("cd divider1 vertical" + JSON.stringify(obj.getElement('$attrs').getString('vertical')));
     console.log("cd divider1 lineCap" + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect(obj.getElement('$attrs').getString('vertical')).assertEqual('false');
     expect((obj.getElement('$attrs').getString('lineCap')) == 'LineCapStyle.Round');
      console.info('testDividerGetInspectorByKey020_static_02 END');
      done();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0770
     * @tc.name testDividerGetInspectorByKey030_static_03
     * @tc.desc aceEtsTest
     */
    it('testDividerGetInspectorByKey030_static_03', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('divider2');
     let obj = JSON.parseJsonElement(strJson);
     console.info(" divider2 component obj is: " + JSON.stringify(obj));
     console.log("cd divider2 lineCap" + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect((obj.getElement('$attrs').getString('lineCap')) == 'LineCapStyle.Square')
      console.info('testDividerGetInspectorByKey030_static_03 END');
      done();
    });
  })
}
