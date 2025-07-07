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

export default function columnSplitJsunit() {


  describe('columnSplitTest', () => {
    beforeAll(() => {
      console.info("columnSplitTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.nowear.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("columnSplitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnSplit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get columnSplitTest state pages:" + "");
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get columnSplitTest pages.name:" + "");
          //let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push columnSplitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnSplitTest page error:" + err);
      }
      console.info("columnSplitTest beforeEach end");
      //done();
    });


    afterEach(async () => {
      await sleep(1);
      console.info("ColumnSplit after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0700
     * @tc.name testColumnSplit010
     * @tc.desc aceEtsTest
     */
    it('testColumnSplit_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('new columnSplit0 START');
      let strJson = inspector.getInspectorByKey('columnSplit');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ColumnSplit');
      console.info("yr ColumnSplit0 type: " + JSON.stringify(obj.getString('$type')));
      console.log("yr columnSplit0 obj.$resizable-'true':" + JSON.stringify(obj.getElement('$attrs').getString('resizable')));
      expect(obj.getElement('$attrs').getString('resizeable')).assertEqual('true');
      console.info('new columnSplit0 END');
      done();
    })

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0710
     * @tc.name testColumnSplit020
     * @tc.desc aceEtsTest
     */
    it('testColumnSplit_static_020', 0, async (done: () => void): Promise<void> => {
      console.info('new columnSplit1 START');
      let strJson = inspector.getInspectorByKey('columnSplit1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("yr columnSplit obj.$resizable-'false':" + JSON.stringify(obj.getElement('$attrs').getString('resizable')));
      expect(obj.getElement('$attrs').getString('resizeable')).assertEqual('false');
      console.info('new columnSplit1 END');
      done();
    })
  })
}
