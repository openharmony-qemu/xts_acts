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

export default function TextTimerTextShadowTest() {
  describe('TextTimerTextShadowTest', () => {
    beforeAll(() => {
      console.info("TextTimerTextShadowTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('TextTimerTextShadowTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textTimer/TextTimerTextShadow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextTimerTextShadowTest state pages:' + JSON.stringify(pages));
        if (!('TextTimerTextShadow' == pages.name)) {
          console.info('get TextTimerTextShadowTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push TextTimerTextShadowTest page error:' + err);
      }
      console.info('TextTimerTextShadowTest beforeEach end');
    });
    /* *
    * @tc.number: TextTimerTextShadowTest_static_001
    * @tc.name  : TextTimerTextShadowTest_static_001
    * @tc.desc  : To test the TextShadow { radius: 10, color: Color.Red, offsetX: 10, offsetY: 0 }
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextTimerTextShadowTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_static_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textTimer1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextTimerTextShadowTest_static_001 component obj is: ' + obj.getElement('$attrs').getElement('textShadow'));
      expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual('0.000000');
      console.info('[TextTimerTextShadowTest_static_001] END');
      done();
    });
    /* *
    * @tc.number: TextTimerTextShadowTest_static_002
    * @tc.name  : TextTimerTextShadowTest_static_002
    * @tc.desc  : To test the TextShadow { radius: -10, color: '#ff00ff00', offsetX: -10, offsetY: 0 }
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextTimerTextShadowTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_static_002 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textTimer2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextTimerTextShadowTest_static_002 component obj is: ' + obj.getElement('$attrs').getElement('textShadow'));
      expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual('0.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual('-10.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual('0.000000');
      console.info('[TextTimerTextShadowTest_static_002] END');
      done();
    });
    /* *
    * @tc.number: TextTimerTextShadowTest_static_003
    * @tc.name  : TextTimerTextShadowTest_static_003
    * @tc.desc  : To test the TextShadow { radius: 50, color: $r('app.getString('color').pink'), offsetX: 0, offsetY: 10 }
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextTimerTextShadowTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_static_003 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('textTimer3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('TextTimerTextShadowTest_static_003 component obj is: ' + obj.getElement('$attrs').getElement('textShadow'));
      expect(obj.getElement('$attrs').getElement('textShadow').getString('radius')).assertEqual('50.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('color')).assertEqual('#FFFF00FF');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetX')).assertEqual('0.000000');
      expect(obj.getElement('$attrs').getElement('textShadow').getString('offsetY')).assertEqual('10.000000');
      console.info('[TextTimerTextShadowTest_static_003] END');
      done();
    });
  })
}
