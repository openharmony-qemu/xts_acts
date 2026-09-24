'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
const SLEEP_TIME_L = 1000;
export default function UIPickerCanLoopModifierTest() {
  describe('UIPickerCanLoopModifierTest', () => {
    beforeEach(async () => {
      console.info('UIPickerCanLoopModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIPickerComponent/UIPickerCanLoopModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get UIPickerCanLoopModifierTest state pages:' + JSON.stringify(pages));
        if (!('UIPickerCanLoopModifier' == pages.name)) {
          console.info('get UIPickerCanLoopModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error('push UIPickerCanLoopModifierTest page error:' + err);
      }
      console.info('UIPickerCanLoopModifierTest beforeEach end');
    });


    /**
     * @tc.number   UIPickerCanLoopModifier_static_001
     * @tc.name     UIPickerCanLoopModifier_static_001
     * @tc.desc     The test does not set the canLoop interface
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerCanLoopModifier_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerM1');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 :string = obj.getElement('$attrs').getString('canLoop');
      expect(obj1).assertEqual('true');
      done();
    });
    /**
     * @tc.number   UIPickerCanLoopModifier_static_002
     * @tc.name     UIPickerCanLoopModifier_static_002
     * @tc.desc     The test sets the canLoop interface to true
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerCanLoopModifier_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerM2');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 :string = obj.getElement('$attrs').getString('canLoop');
      expect(obj1).assertEqual('true');
      done();
    });
    /**
     * @tc.number   UIPickerCanLoopModifier_static_003
     * @tc.name     UIPickerCanLoopModifier_static_003
     * @tc.desc     The test sets the canLoop interface to false
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerCanLoopModifier_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerM3');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 :string = obj.getElement('$attrs').getString('canLoop');
      expect(obj1).assertEqual('false');
      done();
    });
    /**
     * @tc.number   UIPickerCanLoopModifier_static_004
     * @tc.name     UIPickerCanLoopModifier_static_004
     * @tc.desc     The test sets the canLoop interface to undefined
     * @tc.level    Level.LEVEL1
     */
    it('UIPickerCanLoopModifier_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('UIPickerM4');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 :string = obj.getElement('$attrs').getString('canLoop');
      expect(obj1).assertEqual('true');
      done();
    });
  })
}