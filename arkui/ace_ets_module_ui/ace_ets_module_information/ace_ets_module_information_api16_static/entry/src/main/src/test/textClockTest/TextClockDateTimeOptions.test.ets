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

export default function TextClockDateTimeOptionsTest() {
  describe('TextClockDateTimeOptionsTest', () => {
    beforeAll(() => {
      console.info("DataPanelContentModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('TextClockDateTimeOptionsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textClock/TextClockDateTimeOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextClockDateTimeOptionsTest state pages:' + JSON.stringify(pages));
        if (!('TextClockDateTimeOptions' == pages.name)) {
          console.info('get TextClockDateTimeOptionsTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push TextClockDateTimeOptionsTest page error:' + err);
      }
      console.info('TextClockDateTimeOptionsTest beforeEach end');
    });
    /* *
    * @tc.number: TextClockDateTimeOptionsTest_static_001
    * @tc.name  : TextClockDateTimeOptionsTest_static_001
    * @tc.desc  : To test the dateTimeOptions numeric
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextClockDateTimeOptionsTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextClockDateTimeOptionsTest_static_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('numeric');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextClockDateTimeOptionsTest_static_001 component obj is: ' + obj.getElement('$attrs').getString('dateTimeOptions'));
      expect(obj.getElement('$attrs').getString('dateTimeOptions')).assertEqual('{"hour":"numeric"}');
      console.info('[TextClockDateTimeOptionsTest_static_001] END');
      done();
    });
    /* *
    * @tc.number: TextClockDateTimeOptionsTest_static_002
    * @tc.name  : TextClockDateTimeOptionsTest_static_002
    * @tc.desc  : To test the dateTimeOptions 2-digit
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextClockDateTimeOptionsTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextClockDateTimeOptionsTest_static_002 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('digit');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextClockDateTimeOptionsTest_static_002 component obj is: ' + obj.getElement('$attrs').getString('dateTimeOptions'));
      expect(obj.getElement('$attrs').getString('dateTimeOptions')).assertEqual('{"hour":"2-digit"}');
      console.info('[TextClockDateTimeOptionsTest_static_002] END');
      done();
    });
  })
}
