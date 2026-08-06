'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
import { UIUtils } from '@kit.ArkUI';

export default function SVDeepListenObservedAndObjectlinkTest(): void {
  describe('SVDeepListenObservedAndObjectlinkTest', () => {
    beforeAll(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/stateVariableDeepListen/SVDeepListenObservedAndObjectlink",
      }
      try {
        const svDeepListenTest = AppStorage.get<Router>("router") as Router;
        svDeepListenTest.clear();
        let pages: router.RouterState = svDeepListenTest.getState();
        if (!("SVDeepListenObservedAndObjectlink" == pages.name)) {
          svDeepListenTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SVDeepListenObservedAndObjectlink page error:" + err);
      }
    });

    beforeEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0100
     * @tc.number SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0100
     * @tc.desc   Test @Observed and @ObjectLink deep listener - verify second level property change triggers UI update in both parent and child components
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0100] START');

      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(2000);

      // Step1: Verify initial state - bag.book.name is 'JS'
      let strJson = inspector.getInspectorByKey('indexText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Index: JS');
      console.info('[SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0100] Step1: Initial state verified - bag.book.name is JS');

      // Step2: Click changeBagBookNameButton to change second level property bag.book.name from 'JS' to 'TS'
      // This should trigger UI update in parent component (Index) due to deep listener
      let button = await driver.findComponent(ON.id('changeBagBookNameButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('indexText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Index: TS');
      console.info('[SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0100] Step2: After click changeBagBookNameButton - bag.book.name changed to TS');

      console.info('[SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0200
     * @tc.number SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0200
     * @tc.desc   Test @Observed and @ObjectLink deep listener - verify second level property change triggers UI update in child component (BookCard)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0200] START');

      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(2000);

      // Step1: Verify initial state - BookCard shows book.name as 'JS'
      let strJson = inspector.getInspectorByKey('bookCardText');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('BookCard: TS');

      // Step2: Click BookCard's changeBookNameButton to change book.name from 'JS' to 'C++'
      // This should trigger UI update in BookCard child component due to @ObjectLink
      let button = await driver.findComponent(ON.id('changeBookNameButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      strJson = inspector.getInspectorByKey('bookCardText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('BookCard: C++');
      console.info('[SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0200] Step2: After click changeBookNameButton - BookCard shows C++');

      // Step3: Verify parent component (Index) also reflects this change since Book is shared reference
      strJson = inspector.getInspectorByKey('indexText');
      obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Index: C++');
      console.info('[SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0200] Step3: Parent Index component also updated to C++');

      console.info('[SUB_ARUI_SVDeepListenObservedAndObjectlinkTest_static_0200] END');
      done();
    });
  });
}