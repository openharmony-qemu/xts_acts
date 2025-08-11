/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
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
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function ProgressContentModifierTest() {
  describe('ProgressContentModifierTest', () => {
    beforeAll(() => {
      console.info("ProgressContentModifierTest beforeAll start");
      UtilsTest.msSleep(4000)
      UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility")
      UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('ProgressContentModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progress/ProgressContentModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ProgressContentModifierTest state pages:' + JSON.stringify(pages));
        if (!('ProgressContentModifier' == pages.name)) {
          console.info('get ProgressContentModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push ProgressContentModifierTest page error:' + err);
      }
      console.info('ProgressContentModifierTest beforeEach end');
    });
    /* *
    * @tc.number: ProgressContentModifierTest_static_001
    * @tc.name  : ProgressContentModifierTest_static_001
    * @tc.desc  : To test the contentModifier
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressContentModifierTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressContentModifierTest_static_001 START');
      Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('ProgressContentModifier_total');
      let obj = JSON.parseJsonElement(strJson);
      Utils.sleep(1000);
      console.info("[ProgressContentModifierTest_static_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Current progress is：0/3');
      console.info('[ProgressContentModifierTest_static_001] END');
      done();
    });
  })
}
