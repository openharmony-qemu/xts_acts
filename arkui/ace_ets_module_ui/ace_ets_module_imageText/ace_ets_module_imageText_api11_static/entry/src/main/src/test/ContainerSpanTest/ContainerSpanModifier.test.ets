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

import { describe, beforeEach, it, expect, Level,beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function ContainerSpanModifierTest() {
  describe('ContainerSpanModifierTest', () => {
    beforeAll(() => {
      console.info("ContainerSpanModifierTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ContainerSpanModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/ContainerSpanModifierTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ContainerSpanModifierTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ContainerSpanModifierTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ContainerSpanModifierTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContainerSpanModifierTest page error:" + err);
      }
      console.info("ContainerSpanModifierTest beforeEach end");
    });

    /**
     * @tc.number SUB_ACE_ContainerSpanModifierTest_static_0010
     * @tc.name ContainerSpanModifierTest_static_0010
     * @tc.desc test ContainerSpanModifier: radius
     * @tc.level: Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ContainerSpanModifierTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContainerSpanModifierTest_static_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContainerSpanModifier_get_radius');
      const obj = JSON.parseJsonElement(strJson);
      console.info("[ContainerSpanModifierTest_static_0010] textBackgroundStyle: " +
      JSON.stringify(obj.getElement('$attrs').getElement('textBackgroundStyle').getElement('radius')));
      expect(obj.getElement('$attrs').getElement('textBackgroundStyle').getElement('radius').getString('topLeft'))
        .assertEqual('12.00vp');
      expect(obj.getElement('$attrs').getElement('textBackgroundStyle').getElement('radius').getString('topRight'))
        .assertEqual('12.00vp');
      expect(obj.getElement('$attrs').getElement('textBackgroundStyle').getElement('radius').getString('bottomLeft'))
        .assertEqual('12.00vp');
      expect(obj.getElement('$attrs').getElement('textBackgroundStyle').getElement('radius').getString('bottomRight'))
        .assertEqual('12.00vp');
      console.info('[ContainerSpanModifierTest_static_0010] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ContainerSpanModifierTest_static_0020
     * @tc.name ContainerSpanModifierTest_static_0020
     * @tc.desc test type of ContainerSpanInstance: undefined
     * @tc.level: Level 1
     * @tc.type :
     * @tc.size :
     */
    it('ContainerSpanModifierTest_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContainerSpanModifierTest_static_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContainerSpanModifier_get_type');
      const obj = JSON.parseJsonElement(strJson);
      console.info("[ContainerSpanModifierTest_static_0020] ContainerSpanInstance type is: " +
      JSON.stringify(obj.getElement('$attrs').getString('text')));
      expect(obj.getElement('$attrs').getString('text')).assertEqual(undefined);
      console.info('[ContainerSpanModifierTest_static_0020] END');
      done();
    });
  })
}