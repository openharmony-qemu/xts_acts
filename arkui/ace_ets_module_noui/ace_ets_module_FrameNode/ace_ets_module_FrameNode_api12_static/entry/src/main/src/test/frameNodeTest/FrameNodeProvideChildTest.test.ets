'use static';

/*
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

import inspector from '@ohos.arkui.inspector';
import { describe, beforeEach, afterEach, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ChildrenCountMode, ExpandMode } from 'arkui.FrameNode';

export default function FrameNodeProvideChildTest() {
  describe('FrameNodeProvideChildTest', () => {
    beforeEach(async () => {
      console.info("createFrameNodesUIContextInt beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/FrameNodeProvideChild",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get FrameNodeProvideChild state pages: " + JSON.stringify(pages));
        if (!("FrameNodeProvideChild" == pages.name)) {
          console.info("get FrameNodeProvideChild state pages.name: " + JSON.stringify(pages.name));

          await router.pushUrl(options)
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push FrameNodeProvideChild page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   FrameNodeProvideChildTest_0100
     * @tc.number SUB_ArkUI_Ace_FrameNodeProvideChildTest_0100
     * @tc.desc   add ArkUI static api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FrameNodeProvideChildTest_0100', Level.LEVEL1, async (done: ()=>void) => {
      try {
        console.info('[FrameNodeProvideChildTest_0100] START');
        let driver = Driver.create()
        await CommonFunc.sleep(2000);

        let button = await driver.findComponent(ON.id('getUndefinedStatic'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        let button1 = await driver.findComponent(ON.id('getChildCountDefaultStatic'));
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        let button2 = await driver.findComponent(ON.id('getChildCount(ALL_EXPAND)Static'));
        await (button2?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        let button3 = await driver.findComponent(ON.id('getChildCount(ONLY_EXPANDED)Static'));
        await (button3?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        let button4 = await driver.findComponent(ON.id('getChildCount(ALL_NOT_EXPAND)Static'));
        await (button4?.click() as Promise<void>);
        await CommonFunc.sleep(2000);

        let button5 = await driver.findComponent(ON.id('getChildWithLazyExpandStatic'));
        await (button5?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson1 = inspector.getInspectorByKey('FrameNodeProvideChildTextStatic');

        let button6 = await driver.findComponent(ON.id('getChildWithLazyNotExpandStatic'));
        await (button6?.click() as Promise<void>);
        await CommonFunc.sleep(2000);
        let strJson2 = inspector.getInspectorByKey('FrameNodeProvideChildTextStatic');

        expect(ExpandMode.LAZY_EXPAND).assertEqual(2);
        expect(ExpandMode.LAZY_NOT_EXPAND).assertEqual(3);

        expect(ChildrenCountMode.ALL_EXPAND).assertEqual(0);
        expect(ChildrenCountMode.ONLY_EXPANDED).assertEqual(1);
        expect(ChildrenCountMode.ALL_NOT_EXPAND).assertEqual(2);

        console.info('[FrameNodeProvideChildTest_0100] END');
        done();
      } catch (error) {
        console.error('[FrameNodeProvideChildTest_0100] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

  })
}
