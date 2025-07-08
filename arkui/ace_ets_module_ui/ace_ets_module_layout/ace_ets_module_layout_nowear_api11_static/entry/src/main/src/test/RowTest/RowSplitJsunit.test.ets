/*
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


import { afterEach, beforeAll, beforeEach, describe, expect, it } from '../../../../hypium/index.ets';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok");
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}


export default function rowSplitJsunit() {

  describe('RowSplitTest', () => {
    beforeAll(() => {
      console.info("RowSplitTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.nowear.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("RowSplitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/RowSplit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RowSplitTest state pages:" + "");
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get RowSplitTest pages.name:" + "");
          //let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push RowSplitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowSplitTest page error:" + err);
      }
      console.info("RowSplitTest beforeEach end");
      //done();
    });


    afterEach(async () => {
      await sleep(1);
      console.info("RowSplit after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1010
     * @tc.name testRowSplitGetInspectorByKey010
     * @tc.desc aceEtsTest
     */
    it('testRowSplitGetInspectorByKey_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('testGetInspectorByKey START');
      let strJson = inspector.getInspectorByKey('rowSplit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd rowSplit component obj is: " + JSON.stringify(obj));
      console.log("cd rowSplit type" + JSON.stringify(obj.getString('$type')));
      console.log("cd rowSplit  resizeable" + JSON.stringify(obj.getElement('$attrs').getString('resizeable')));
      expect(obj.getString('$type')).assertEqual('RowSplit');
      expect(obj.getElement('$attrs').getString('resizeable')).assertEqual('false');
      console.info('cd RowSplitInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1020
     * @tc.name testRowSplitGetInspectorByKey020
     * @tc.desc aceEtsTest
     */
    it('testRowSplitGetInspectorByKey_static_020', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('rowSplit1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd rowSplit1 component obj is: " + JSON.stringify(obj));
      console.log("cd rowSplit1  resizeable" + JSON.stringify(obj.getElement('$attrs').getString('resizeable')));
      expect(obj.getElement('$attrs').getString('resizeable')).assertEqual('true');
      console.info('cd RowSplit1InspectorByKey END');
      done();
    });
  })
}
