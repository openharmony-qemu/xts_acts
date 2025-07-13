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
import router from '@ohos.router';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function GaugeContentModifier() {
  describe('GaugeContentModifier', () => {
    beforeAll(() => {
      console.info("GaugeContentModifier beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/component/GaugeContentModifier",
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

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('GaugeContentModifier after each called');
    });
    /*
    * @tc.number     : GaugeContentModifier_static_001
    * @tc.name       : GaugeContentModifier_static_001
    * @tc.desc       : test GaugeContentModifier_static_001
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_001] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier01');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_001] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('value:60');
      expect(obj.getElement('$attrs').getString('content')).assertEqual('value:60');
      console.info('[GaugeContentModifier_static_001] END');
    });
    /*
    * @tc.number     : GaugeContentModifier_static_002
    * @tc.name       : GaugeContentModifier_static_002
    * @tc.desc       : test GaugeContentModifier_static_002
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_002', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_001] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier02');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_002] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('min:0');
      console.info('[GaugeContentModifier_static_002] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_003
    * @tc.name       : GaugeContentModifier_static_003
    * @tc.desc       : test GaugeContentModifier_static_003
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_003', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_003] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier03');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_003] obj3 is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('max:100');
      console.info('[GaugeContentModifier_static_003] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_004
    * @tc.name       : GaugeContentModifier_static_004
    * @tc.desc       : test GaugeContentModifier_static_004
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_004', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_004] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier04');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_004] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('startAngle:20');
      console.info('[GaugeContentModifier_static_004] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_005
    * @tc.name       : GaugeContentModifier_static_005
    * @tc.desc       : test GaugeContentModifier_static_005
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_005', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_005] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier05');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_005] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('endAngle:180');
      console.info('[GaugeContentModifier_static_005] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_006
    * @tc.name       : GaugeContentModifier_static_006
    * @tc.desc       : test GaugeContentModifier_static_006
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_006', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_006] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier06');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_006] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('colors:#ff000000');
      console.info('[GaugeContentModifier_static_006] END');
      done();
    });
    /*
     * @tc.number     : GaugeContentModifier_static_007
     * @tc.name       : GaugeContentModifier_static_007
     * @tc.desc       : test GaugeContentModifier_static_007
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('GaugeContentModifier_static_007', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_007] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier07');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_007] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('strokeWidth:20');
      console.info('[GaugeContentModifier_static_007] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_008
    * @tc.name       : GaugeContentModifier_static_008
    * @tc.desc       : test GaugeContentModifier_static_008
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_008', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_008] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier08');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_008] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('width:100');
      console.info('[GaugeContentModifier_static_008] END');
      done();
    });

    /*
    * @tc.number     : GaugeContentModifier_static_009
    * @tc.name       : GaugeContentModifier_static_009
    * @tc.desc       : test GaugeContentModifier_static_009
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_009', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_009] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier09');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_009] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('height:100');
      console.info('[GaugeContentModifier_static_009] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_010
    * @tc.name       : GaugeContentModifier_static_010
    * @tc.desc       : test GaugeContentModifier_static_010
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_010] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier10');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_010] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('sizeWidth:100');
      console.info('[GaugeContentModifier_static_010] END');
      done();
    });

    /*
    * @tc.number     : GaugeContentModifier_static_011
    * @tc.name       : GaugeContentModifier_static_011
    * @tc.desc       : test GaugeContentModifier_static_011
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_011', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_011] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier11');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_011] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('sizeHeight:100');
      console.info('[GaugeContentModifier_static_011] END');
      done();
    });

    /*
    * @tc.number     : GaugeContentModifier_static_012
    * @tc.name       : GaugeContentModifier_static_012
    * @tc.desc       : test GaugeContentModifier_static_012
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_012', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_012] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier12');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_012] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('padding:20');
      console.info('[GaugeContentModifier_static_012] END');
      done();
    });

    /*
    * @tc.number     : GaugeContentModifier_static_013
    * @tc.name       : GaugeContentModifier_static_013
    * @tc.desc       : test GaugeContentModifier_static_013
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_013', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_013] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier13');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_013] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('margin:10');
      console.info('[GaugeContentModifier_static_013] END');
      done();
    });

    /*
    * @tc.number     : GaugeContentModifier_static_014
    * @tc.name       : GaugeContentModifier_static_014
    * @tc.desc       : test GaugeContentModifier_static_014
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_014', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_014] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier14');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_014] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('layoutWeight:5');
      console.info('[GaugeContentModifier_static_014] END');
      done();
    });

    /*
    * @tc.number     : GaugeContentModifier_static_015
    * @tc.name       : GaugeContentModifier_static_015
    * @tc.desc       : test GaugeContentModifier_static_015
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_015', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_015] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier15');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_015] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('constraintSizeMinWidth:1');
      console.info('[GaugeContentModifier_static_015] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_016
    * @tc.name       : GaugeContentModifier_static_016
    * @tc.desc       : test GaugeContentModifier_static_016
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_016', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_016] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier16');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_016] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('constraintSizeMaxWidth:100');
      console.info('[GaugeContentModifier_static_016] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_017
    * @tc.name       : GaugeContentModifier_static_017
    * @tc.desc       : test GaugeContentModifier_static_017
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_017', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_017] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier17');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_017] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('constraintSizeMinHeight:1');
      console.info('[GaugeContentModifier_static_017] END');
      done();
    });
    /*
    * @tc.number     : GaugeContentModifier_static_018
    * @tc.name       : GaugeContentModifier_static_018
    * @tc.desc       : test GaugeContentModifier_static_018
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('GaugeContentModifier_static_018', 0, async (done: () => void): Promise<void> => {
      console.info('[GaugeContentModifier_static_018] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier18');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_static_018] obj is: ' + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('constraintSizeMaxHeight:100');
      console.info('[GaugeContentModifier_static_018] END');
      done();
    });
  })
}