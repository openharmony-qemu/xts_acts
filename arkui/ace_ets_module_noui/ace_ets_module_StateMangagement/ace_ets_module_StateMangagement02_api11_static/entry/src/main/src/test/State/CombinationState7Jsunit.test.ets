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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function CombinationState7Jsunit() {
  describe('CombinationState7Jsunit', () => {
    beforeAll(() => {
      console.info("CombinationState7Jsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("CombinationState7Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/CombinationState7',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<common.Context>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CombinationState7Jsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get CombinationState7Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CombinationState7Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CombinationState7Jsunit page error:" + err);
      }
      console.info("CombinationState7Jsunit beforeEach end");
    });

    it('CombinationState7Jsunit_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[CombinationState7Jsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('SubState_text1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState7Jsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[CombinationState7Jsunit_static_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("@State:1");

      let strJson1 = inspector.getInspectorByKey('SubState_text2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState7Jsunit_static_0100] component obj is: " + JSON.stringify(obj1));
      console.info("[CombinationState7Jsunit_static_0100] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@State:2");
      console.info('[CombinationState7Jsunit_static_0100] END');
      done();
    });

    it('CombinationState7Jsunit_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[CombinationState7Jsunit_static_0200] START');
      let strJson = inspector.getInspectorByKey('SubProp_text1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState7Jsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[CombinationState7Jsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("@Prop:1");

      let strJson1 = inspector.getInspectorByKey('SubProp_text2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState7Jsunit_static_0200] component obj is: " + JSON.stringify(obj1));
      console.info("[CombinationState7Jsunit_static_0200] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@Prop:2");
      console.info('[CombinationState7Jsunit_static_0200] END');
      done();
    });

    it('CombinationState7Jsunit_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('[CombinationState7Jsunit_static_0300] START');
      let strJson = inspector.getInspectorByKey('SubProvide_text1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState7Jsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[CombinationState7Jsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("@Provide:1");

      let strJson1 = inspector.getInspectorByKey('SubProvide_text2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState7Jsunit_static_0300] component obj is: " + JSON.stringify(obj1));
      console.info("[CombinationState7Jsunit_static_0300] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@Provide:2");
      console.info('[CombinationState7Jsunit_static_0300] END');
      done();
    });

    it('CombinationState7Jsunit_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('[CombinationState7Jsunit_static_0400] START');
      let strJson = inspector.getInspectorByKey('SubLink_text1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState7Jsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[CombinationState7Jsunit_static_0400] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("@Link:1");

      let strJson1 = inspector.getInspectorByKey('SubLink_text2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState7Jsunit_static_0400] component obj is: " + JSON.stringify(obj1));
      console.info("[CombinationState7Jsunit_static_0400] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@Link:2");
      console.info('[CombinationState7Jsunit_static_0400] END');
      done();
    });
  })
}
