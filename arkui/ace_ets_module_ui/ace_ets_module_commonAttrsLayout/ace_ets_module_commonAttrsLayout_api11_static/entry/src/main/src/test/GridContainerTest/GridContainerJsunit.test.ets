
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { vp2px } from '@ohos.arkui.component';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function girdContainerJsunit() {
  describe('girdContainerTest', () => {
    beforeAll(() => {
      console.info("girdContainerTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(() => {
      console.info("girdContainerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridContainer/gridContainer'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get girdContainer state pages:" + JSON.stringify(pages));
        if (!("gridContainer" == pages.name)) {
          console.info("get girdContainer state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // await Utils.sleep(2000);
          // console.info("push girdContainer page result:" + JSON.stringify(result));
        }
      } catch (err:BusinessError) {
        console.error("push girdContainer page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("girdContainer after each called");
    });
    /**
     * @tc.number    testGirdContainer01_static
     * @tc.name      testGirdContainer01_static
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testGirdContainer01_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGirdContainer01] START');
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('gridContainer');
      console.info("[testGirdContainer01] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$type')).assertEqual('GridContainer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('columns')).assertEqual('12');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('sizeType')).assertEqual('SizeType.XS');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('gutter')).assertEqual('10.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('margin')).assertEqual('20.00vp');
      console.info('testGirdContainer01 END');
      done()
    });

    /**
     * @tc.number    testGirdContainer02_static
     * @tc.name      testGirdContainer02_static
     * @tc.desc      test the type of Search: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('testGirdContainer02_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testEllipse02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "sizeType": 'SM'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 109,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testGirdContainer02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err:BusinessError) {
        console.log("[testGirdContainer02] change component data error: " + err.message);
      }
      await Utils.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('gridContainer');
      console.info("[testGirdContainer02] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('sizeType')).assertEqual('SizeType.SM');
      console.info('testGirdContainer02 END');
      done()
    });
  })
}
