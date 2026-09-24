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
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function CounterV2AttrsTest(): void {
  describe('CounterV2AttrsTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('CounterV2AttrsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CounterV2/CounterV2AttrsPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CounterV2AttrsTest state pages:' + JSON.stringify(pages));
        if (!('CounterV2AttrsPage' == pages.name)) {
          console.info('get CounterV2AttrsTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.log('push CounterV2AttrsTest page error:' + err);
      }
      console.info('CounterV2AttrsTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('CounterV2AttrsTest afterEach err: ' + err);
      }
      console.info('CounterV2AttrsTest after each called');
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0100
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0100
     * @tc.desc     direction Direction.Rtl test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[0];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0100] btn0.attrs.direction is: '
          + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
        expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0100 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0200
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0200
     * @tc.desc     direction Direction.Ltr test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[1]
          .getArray('$children')[0]
          .getArray('$children')[0];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0200] btn0.attrs.direction is: '
          + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
        expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0200 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0300
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0300
     * @tc.desc     direction Direction.Auto test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[2]
          .getArray('$children')[0];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0300] btn0.attrs.direction is: '
          + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
        expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0300 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0400
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0400
     * @tc.desc     direction undefined test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0400] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[3]
          .getArray('$children')[0];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0400] btn0.attrs.direction is: '
          + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
        expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0400 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0500
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0500
     * @tc.desc     year month day undefined test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[4]
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[0];
        let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[4]
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[2];
        let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[4]
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[4];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] btn0.attrs.year is: '
          + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityText')));
        expect(btn0.getElement('$attrs').getString('accessibilityText')).assertContain('0001年');
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] btn1.attrs.month is: '
          + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityText')));
        expect(btn1.getElement('$attrs').getString('accessibilityText')).assertContain('一月');
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] btn2.attrs.day is: '
          + JSON.stringify(btn2.getElement('$attrs').getString('accessibilityText')));
        expect(btn2.getElement('$attrs').getString('accessibilityText')).assertContain('一日');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0500 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0600
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0600
     * @tc.desc     year month day 2024/03/18 test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[3]
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[0];
        let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[3]
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[2];
        let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[3]
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[4];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] btn0.attrs.year is: '
          + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityText')));
        expect(btn0.getElement('$attrs').getString('accessibilityText')).assertContain('2025年');
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] btn1.attrs.month is: '
          + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityText')));
        expect(btn1.getElement('$attrs').getString('accessibilityText')).assertContain('三月');
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] btn2.attrs.day is: '
          + JSON.stringify(btn2.getElement('$attrs').getString('accessibilityText')));
        expect(btn2.getElement('$attrs').getString('accessibilityText')).assertContain('十八日');
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0600 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0700
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0700
     * @tc.desc     focusable true test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0700] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[0]
          .getArray('$children')[0];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0700] btn0.attrs.focusable is: '
          + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
        expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(true);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0700 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0700] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0800
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0800
     * @tc.desc     focusable false test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0800] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[5]
          .getArray('$children')[0];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0800] btn0.attrs.focusable is: '
          + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
        expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(false);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0800 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0800] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0900
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0900
     * @tc.desc     focusable undefined test.
     * @tc.type     FUNCTION
     * @tc.size     MediumTest
     * @tc.level    Level0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0900] START');
      try {
        await CommonFunc.sleep(1000);
        let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[6]
          .getArray('$children')[0];
        console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0900] btn0.attrs.focusable is: '
          + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
        expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(true);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.log('SUB_ARKUI_API_CounterV2AttrsTest_static_0900 error: ' + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0900] END');
      done();
    });
  });
}
