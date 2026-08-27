'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import inspector from '@ohos.arkui.inspector'
import { describe, beforeEach, it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Driver,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { FrameNode } from "@ohos.arkui.node"

export default function GetFrameNodeByUniqueIdTest() {
  describe('GetFrameNodeByUniqueIdTest', () => {
    beforeEach(async () => {
      console.info("GetFrameNodeByUniqueIdTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/GetFrameNodeByUniqueId",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get GetFrameNodeByUniqueIdTest state pages: " + JSON.stringify(pages));
        if (!("GetFrameNodeByUniqueId" == pages.name)) {
          console.info("get GetFrameNodeByUniqueIdTest state pages.name: " + JSON.stringify(pages.name));
          
          await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push GetFrameNodeByUniqueIdTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   GetFrameNodeByUniqueIdTest_0100
     * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYUNIQUEID_0100
     * @tc.desc   Test FrameNode.getFrameNodeByUniqueId with valid uniqueId and verify property change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeByUniqueIdTest_0100', Level.LEVEL0, async () => {
      try {
        console.info('[GetFrameNodeByUniqueIdTest_0100] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);

        let strJson = inspector.getInspectorByKey('GetFrameNodeByUniqueId_testNode');
        let obj= JSON.parseJsonElement(strJson);
        console.info("[GetFrameNodeByUniqueIdTest_0100] obj width is: " + obj.getElement('$attrs').getString('width'));
        console.info("[GetFrameNodeByUniqueIdTest_0100] obj height is: " + obj.getElement('$attrs').getString('height'));
        expect(obj.getElement('$attrs').getString('width')).assertEqual('100.00vp');
        expect(obj.getElement('$attrs').getString('height')).assertEqual('50.00vp');

        console.info('GetFrameNodeByUniqueIdTest_0100 click GetFrameNodeByUniqueId_testValidButton');
        let button = await driver.findComponent(ON.id('GetFrameNodeByUniqueId_testValidButton'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        // return value is not null
        expect(AppStorage.get<FrameNode | null>('getFrameNodeByUniqueIdValidResult')).not().assertNull();
        AppStorage.delete('getFrameNodeByUniqueIdValidResult');

        let strJsonAfter = inspector.getInspectorByKey('GetFrameNodeByUniqueId_testNode');
        let objAfter= JSON.parseJsonElement(strJsonAfter);
        console.info("[GetFrameNodeByUniqueIdTest_0100] objAfter width is: " + objAfter.getElement('$attrs').getString('width'));
        console.info("[GetFrameNodeByUniqueIdTest_0100] objAfter height is: " + objAfter.getElement('$attrs').getString('height'));
        expect(objAfter.getElement('$attrs').getString('width')).assertEqual('120.00vp');
        expect(objAfter.getElement('$attrs').getString('height')).assertEqual('60.00vp');

        console.info('[GetFrameNodeByUniqueIdTest_0100] END');
        done();
      } catch (error) {
        console.error('[GetFrameNodeByUniqueIdTest_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
      * @tc.name   GetFrameNodeByUniqueIdTest_0200
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYUNIQUEID_0200
      * @tc.desc   Test FrameNode.getFrameNodeByUniqueId with non-existent uniqueId returns null
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByUniqueIdTest_0200', Level.LEVEL0, async () => {
      try {
        console.info('[GetFrameNodeByUniqueIdTest_0200] START');
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);

        console.info('GetFrameNodeByUniqueIdTest_0200 click GetFrameNodeByUniqueId_testNonExistentButton');
        let button = await driver.findComponent(ON.id('GetFrameNodeByUniqueId_testNonExistentButton'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        expect(AppStorage.get<FrameNode | null>('getFrameNodeByUniqueIdNonExistentResult')).assertNull();
        AppStorage.delete('getFrameNodeByUniqueIdNonExistentResult');

        console.info('[GetFrameNodeByUniqueIdTest_0200] END');
        done();
      } catch (error) {
        console.error('[GetFrameNodeByUniqueIdTest_0200] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })
  })
}
