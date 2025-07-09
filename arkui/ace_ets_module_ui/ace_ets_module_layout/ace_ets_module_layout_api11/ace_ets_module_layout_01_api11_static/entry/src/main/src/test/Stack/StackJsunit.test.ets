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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function StackJsunit() {
  describe('StackTest', () => {
    beforeAll(() => {
      console.info("StackJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("StackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StackTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get StackTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StackTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackTest page error:" + err);
      }
      console.info("StackTest beforeEach end");
    });
   

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Stack after each called");
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1110
     * @tc.name testStackGetInspectorByKey_static_010
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('testGetInspectorByKey START');
      let strJson = inspector.getInspectorByKey('stack');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack component obj is: " + JSON.stringify(obj));
      console.log("cd stack type" + JSON.stringify(obj.getString('$type')));
      console.log("cd stack alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      console.info('cd stackGetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1120
     * @tc.name testStackGetInspectorByKey_static_020
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_020', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack1 component obj is: " + JSON.stringify(obj));
      console.log("cd stack1 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      console.info('cd stack1GetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1130
     * @tc.name testStackGetInspectorByKey_static_030
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_030', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack2 component obj is: " + JSON.stringify(obj));
      console.log("cd stack2 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      console.info('cd stack2GetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1140
     * @tc.name testStackGetInspectorByKey_static_040
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_040', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack3 component obj is: " + JSON.stringify(obj));
      console.log("cd stack3 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      console.info('cd stack3GetInspectorByKey END');
      done();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1150
     * @tc.name testStackGetInspectorByKey_static_050
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_050', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack4 component obj is: " + JSON.stringify(obj));
      console.log("cd stack4 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      console.info('cd stack4GetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1160
     * @tc.name testStackGetInspectorByKey_static_060
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_060', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack5 component obj is: " + JSON.stringify(obj));
      console.log("cd stack5 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      console.info('cd stack5GetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1170
     * @tc.name testStackGetInspectorByKey_static_070
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_070', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack6 component obj is: " + JSON.stringify(obj));
      console.log("cd stack6 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top');
      console.info('cd stack6GetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1180
     * @tc.name testStackGetInspectorByKey_static_080
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_080', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack7');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack7 component obj is: " + JSON.stringify(obj));
      console.log("cd stack7 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart');
      console.info('cd stack7GetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1190
     * @tc.name testStackGetInspectorByKey_static_090
     * @tc.desc aceEtsTest
     */
    it('testStackGetInspectorByKey_static_090', 0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack8');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack8 component obj is: " + JSON.stringify(obj));
      console.log("cd stack8 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd');
      console.info('cd stack8GetInspectorByKey END');
      done();
    });
  })
}
