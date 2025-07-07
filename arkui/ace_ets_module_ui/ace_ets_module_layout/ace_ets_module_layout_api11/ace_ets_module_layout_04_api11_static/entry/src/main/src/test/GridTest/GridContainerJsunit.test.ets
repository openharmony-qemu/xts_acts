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
      resolve('');
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function gridContainerJsunit() {
  describe('gridContainerTest', () => {
    beforeAll(() => {
      console.info("gridContainerJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("gridContainerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridContainer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GridContainer state success " + "");
        if (!("GridContainer" == pages.name)) {
          console.info("get GridContainer state success " + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          // console.info("push GridContainer page success " + "");
        }
      } catch (err) {
        console.error("push GridContainer page error " + JSON.stringify(err));
      }
      await sleep(1);
    });

    afterEach(async () => {
      await sleep(1);
      console.info("GridContainer after each called");
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0830
     * @tc.name testGridContainer010
     * @tc.desc aceEtsTest
     */
    it('testGridContainer010_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer010_static_01 START');
      let strJson = inspector.getInspectorByKey('gridContainer');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual('GridContainer');
     console.info("yr GridContainer0 type: " + JSON.stringify(obj.getString('$type')));
     console.log("yr gridContainer0 obj.$attrs.alignItems-'HorizontalAlign.Start':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testGridContainer010_static_01 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0840
     * @tc.name testGridContainer020
     * @tc.desc aceEtsTest
     */
    it('testGridContainer020_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer020_static_02 START');
      let strJson = inspector.getInspectorByKey('gridContainer1');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.Center');
     console.log("yr gridContainer1 obj.$attrs.alignItems-'HorizontalAlign.Center':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testGridContainer020_static_02 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0850
     * @tc.name testGridContainer030
     * @tc.desc aceEtsTest
     */
    it('testGridContainer030_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer030_static_03 START');
      let strJson = inspector.getInspectorByKey('gridContainer2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.End');
     console.log("yr gridContainer obj.$attrs.alignItems-'HorizontalAlign.End':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testGridContainer030_static_03 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0860
     * @tc.name testGridContainer040
     * @tc.desc aceEtsTest
     */
    it('testGridContainer040_static_04', 0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer040_static_04 START');
      let strJson = inspector.getInspectorByKey('gridContainer3');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.End');
     console.log("yr gridContainer3 obj.$attrs.alignItems-'HorizontalAlign.End':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testGridContainer040_static_04  END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0870
     * @tc.name testGridContainer050
     * @tc.desc aceEtsTest
     */
    it('testGridContainer050_static_05', 0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer050_static_05 START');
      let strJson = inspector.getInspectorByKey('gridContainer4');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     console.log("gridContainer obj.$attrs.sizeType:" + JSON.stringify(obj.getElement('$attrs').getString('sizeType'))); //undefinde
      console.info('testGridContainer050_static_05  END');
      done();
    });
  })
}
