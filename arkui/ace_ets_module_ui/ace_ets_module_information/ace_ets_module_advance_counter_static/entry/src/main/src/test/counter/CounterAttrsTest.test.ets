'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';

import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function CounterAttrsTest(): void {
  describe('CounterAttrsTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('CounterAttrsTest beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/counter/CounterAttrsPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        const pages = routerInstance.getState();
        console.info('get CounterAttrsTest state pages:' + JSON.stringify(pages));
        if (!('CounterAttrsPage' === pages.name)) {
          console.info('get CounterAttrsTest pages.name:' + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('push CounterAttrsTest page error:' + err);
      }
      console.info('CounterAttrsTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest afterEach error:' + err);
      }
      console.info('CounterAttrsTest after each called');
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0010
     * @tc.name     CounterAttrsTest_static_001
     * @tc.desc     test direction Direction.Rtl.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_001] START');
      try {
        await CommonFunc.sleep(1000);

        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0];

        const direction: string = btn0.getElement('$attrs').getString('direction');
        console.info('[CounterAttrsTest_static_001] component btn0.attrs.direction is: ' + JSON.stringify(direction));
        expect(direction).assertEqual('Direction.Rtl');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_001 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_001] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0020
     * @tc.name     CounterAttrsTest_static_002
     * @tc.desc     test direction Direction.Ltr.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_002] START');
      try {
        await CommonFunc.sleep(1000);

        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0];

        const direction: string = btn0.getElement('$attrs').getString('direction');
        console.info('[CounterAttrsTest_static_002] component btn0.attrs.direction is: ' + JSON.stringify(direction));
        expect(direction).assertEqual('Direction.Ltr');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_002 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_002] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0030
     * @tc.name     CounterAttrsTest_static_003
     * @tc.desc     test direction Direction.Auto.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_003] START');
      try {
        await CommonFunc.sleep(1000);

        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0];

        const direction: string = btn0.getElement('$attrs').getString('direction');
        console.info('[CounterAttrsTest_static_003] component btn0.attrs.direction is: ' + JSON.stringify(direction));
        expect(direction).assertEqual('Direction.Auto');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_003 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_003] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0040
     * @tc.name     CounterAttrsTest_static_004
     * @tc.desc     test direction undefined.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_004] START');
      try {
        await CommonFunc.sleep(1000);

        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[3]
        .getArray('$children')[0];

        const direction: string = btn0.getElement('$attrs').getString('direction');
        console.info('[CounterAttrsTest_static_004] component btn0.attrs.direction is: ' + JSON.stringify(direction));
        expect(direction).assertEqual('Direction.Auto');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_004 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_004] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0050
     * @tc.name     CounterAttrsTest_static_005
     * @tc.desc     test year month day undefined.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_005] START');
      try {
        await CommonFunc.sleep(1000);
        // [n2] 0001年 [n0]
        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[4]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0];
        // [n2] 一月 [n0]
        const btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[4]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2];
        // [n2] 一日 [n0]
        const btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[4]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[4];

        const yearText: string = btn0.getElement('$attrs').getString('accessibilityText');
        console.info('[CounterAttrsTest_static_005] component btn0.attrs.year is: ' + JSON.stringify(yearText));
        expect(yearText).assertContain('0001年');

        const monthText: string = btn1.getElement('$attrs').getString('accessibilityText');
        console.info('[CounterAttrsTest_static_005] component btn1.attrs.month is: ' + JSON.stringify(monthText));
        expect(monthText).assertContain('一月');

        const dayText: string = btn2.getElement('$attrs').getString('accessibilityText');
        console.info('[CounterAttrsTest_static_005] component btn2.attrs.day is: ' + JSON.stringify(dayText));
        expect(dayText).assertContain('一日');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_005 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_005] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0060
     * @tc.name     CounterAttrsTest_static_006
     * @tc.desc     test year month day 2024/03/18.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_006] START');
      try {
        await CommonFunc.sleep(1000);
        // [n2] 2025年 [n0]
        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[3]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0];
        // [n2] 三月 [n0]
        const btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[3]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2];
        // [n2] 十八日 [n0]
        const btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[3]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[4];

        const yearText: string = btn0.getElement('$attrs').getString('accessibilityText');
        console.info('[CounterAttrsTest_static_006] component btn0.attrs.year is: ' + JSON.stringify(yearText));
        expect(yearText).assertContain('2025年');

        const monthText: string = btn1.getElement('$attrs').getString('accessibilityText');
        console.info('[CounterAttrsTest_static_006] component btn1.attrs.month is: ' + JSON.stringify(monthText));
        expect(monthText).assertContain('三月');

        const dayText: string = btn2.getElement('$attrs').getString('accessibilityText');
        console.info('[CounterAttrsTest_static_006] component btn2.attrs.day is: ' + JSON.stringify(dayText));
        expect(dayText).assertContain('十八日');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_006 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_006] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0070
     * @tc.name     CounterAttrsTest_static_007
     * @tc.desc     test focusable true.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_007] START');
      try {
        await CommonFunc.sleep(1000);

        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0];

        const focusable: boolean = btn0.getElement('$attrs').getBoolean('focusable');
        console.info('[CounterAttrsTest_static_007] component btn0.attrs.focusable is: ' + JSON.stringify(focusable));
        expect(focusable).assertEqual(true);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_007 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_007] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0080
     * @tc.name     CounterAttrsTest_static_008
     * @tc.desc     test focusable false.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_008] START');
      try {
        await CommonFunc.sleep(1000);

        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[5]
        .getArray('$children')[0];

        const focusable: boolean = btn0.getElement('$attrs').getBoolean('focusable');
        console.info('[CounterAttrsTest_static_008] component btn0.attrs.focusable is: ' + JSON.stringify(focusable));
        expect(focusable).assertEqual(false);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_008 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_008] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_ACE_ETS_MODULE_COUNTER_ATTRS_0090
     * @tc.name     CounterAttrsTest_static_009
     * @tc.desc     test focusable undefined.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('CounterAttrsTest_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_009] START');
      try {
        await CommonFunc.sleep(1000);

        const btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[6]
        .getArray('$children')[0];

        const focusable: boolean = btn0.getElement('$attrs').getBoolean('focusable');
        console.info('[CounterAttrsTest_static_009] component btn0.attrs.focusable is: ' + JSON.stringify(focusable));
        expect(focusable).assertEqual(true);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterAttrsTest_static_009 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[CounterAttrsTest_static_009] END');
      done();
    });

  });
}
