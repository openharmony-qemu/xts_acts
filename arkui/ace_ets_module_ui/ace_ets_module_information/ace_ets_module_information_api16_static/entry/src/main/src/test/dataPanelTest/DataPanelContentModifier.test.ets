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

export default function DataPanelContentModifierTest() {
  describe('DataPanelContentModifierTest', () => {
    beforeAll(() => {
      console.info("DataPanelContentModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('DataPanelContentModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dataPanel/DataPanelContentModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DataPanelContentModifierTest state pages:' + JSON.stringify(pages));
        if (!('DataPanelContentModifier' == pages.name)) {
          console.info('get DataPanelContentModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push DataPanelContentModifierTest page error:' + err);
      }
      console.info('DataPanelContentModifierTest beforeEach end');
    });
    /* *
    * @tc.number: DataPanelContentModifierTest_static_001
    * @tc.name  : DataPanelContentModifierTest_static_001
    * @tc.desc  : To test the contentModifier
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('DataPanelContentModifierTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DataPanelContentModifierTest_static_001 START');
      Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('DataPanelContentModifier_max');
      let obj = JSON.parseJsonElement(strJson);
      Utils.sleep(1000);
      console.info("[DataPanelContentModifierTest_static_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Max=140');
      console.info('[DataPanelContentModifierTest_static_001] END');
      done();
    });
  })
}
