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
import inspector from '@ohos.arkui.inspector'
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from "../../../../hypium/index.ets";
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextTimerTextShadowTest() {
  describe('TextTimerTextShadowTest', () => {
    beforeAll(() => {
      console.info("TextTimerTextShadowTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/textTimer/TextTimerTextShadow",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });


    /* *
    * @tc.number: TextTimerTextShadowTest_001
    * @tc.name  : TextTimerTextShadowTest_static_001
    * @tc.desc  : To test the TextShadow { radius: 10, color: Color.Red, offsetX: 10, offsetY: 0 }
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextTimerTextShadowTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_static_001 START');
      await CommonFunc.sleep(1000);
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
    * @tc.number: TextTimerTextShadowTest_002
    * @tc.name  : TextTimerTextShadowTest_static_002
    * @tc.desc  : To test the TextShadow { radius: -10, color: '#ff00ff00', offsetX: -10, offsetY: 0 }
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextTimerTextShadowTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_static_002 START');
      await CommonFunc.sleep(1000);
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
    * @tc.number: TextTimerTextShadowTest_003
    * @tc.name  : TextTimerTextShadowTest_static_003
    * @tc.desc  : To test the TextShadow { radius: 50, color: $r('app.color.pink'), offsetX: 0, offsetY: 10 }
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('TextTimerTextShadowTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('TextTimerTextShadowTest_static_003 START');
      await CommonFunc.sleep(1000);
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
