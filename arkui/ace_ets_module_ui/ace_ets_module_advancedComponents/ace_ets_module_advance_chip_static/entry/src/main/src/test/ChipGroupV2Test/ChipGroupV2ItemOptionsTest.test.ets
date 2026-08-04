'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function ChipGroupV2ItemOptionsTest(): void {
  describe('ChipGroupV2ItemOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('ChipGroupV2ItemOptionsTest beforeEach start');
      await UtilsTest.startAbility('com.arkui.ace.advance.chip.static', 'EntryAbility')

    });

    beforeEach(async (): Promise<void> => {
      console.info('ChipGroupV2ItemOptionsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroupV2/ChipGroupV2ItemOptionsPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ChipGroupV2ItemOptionsTest state pages:' + JSON.stringify(pages));
        if (!('ChipGroupV2ItemOptionsPage' == pages.name)) {
          console.info('get ChipGroupV2ItemOptionsTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ChipGroupV2ItemOptionsTest page error:' + err);
      }
      console.info('ChipGroupV2ItemOptionsTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('ChipGroupV2ItemOptionsTest after each called');
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100
     * @tc.name     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100
     * @tc.desc     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      let btn0 = tree.getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100] component btn0.attrs.accessibilityDescription is: ' +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn0.getElement('$attrs').getString('accessibilityDescription'))
        .assertEqual('accessibilityDescription_str');
      await CommonFunc.sleep(1000);

      let btn1 = tree.getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[1]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100] component btn1.attrs.accessibilityDescription is: ' +
      JSON.stringify(btn1.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn1.getElement('$attrs').getString('accessibilityDescription')).assertEqual('');
      await CommonFunc.sleep(1000);

      let btn2 = tree.getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100] component btn2.attrs.accessibilityDescription is: ' +
      JSON.stringify(btn2.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn2.getElement('$attrs').getString('accessibilityDescription')).assertEqual('');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200
     * @tc.name     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200
     * @tc.desc     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200] START');
      await CommonFunc.sleep(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      let btn0 = tree.getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200] component btn0.attrs.accessibilityLevel is: ' +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      await CommonFunc.sleep(1000);

      let btn1 = tree.getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[1]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200] component btn1.attrs.accessibilityLevel is: ' +
      JSON.stringify(btn1.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn1.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');
      await CommonFunc.sleep(1000);

      let btn2 = tree.getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200] component btn2.attrs.accessibilityLevel is: ' +
      JSON.stringify(btn2.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn2.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no');
      await CommonFunc.sleep(1000);

      let btn3 = tree.getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[3]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200] component btn3.attrs.accessibilityLevel is: ' +
      JSON.stringify(btn3.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn3.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0300
     * @tc.name     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0300
     * @tc.desc     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0300] START');
      await CommonFunc.sleep(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      let btn0 = tree.getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0300] component btn0.attrs.accessibilityLevel is: ' +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no-hide-descendants');
      await CommonFunc.sleep(1000);

      let btn1 = tree.getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[1]
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0300] component btn1.attrs.accessibilityLevel is: ' +
      JSON.stringify(btn1.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn1.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400
     * @tc.name     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400
     * @tc.desc     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400] START');
      await CommonFunc.sleep(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      let btn0 = tree.getArray("$children")[0]
        .getArray('$children')[3]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400] component btn0.attrs.padding.left is: " +
      JSON.parseJsonElement(btn0.getElement('$attrs').getString('padding')).getString('left'));
      let result = JSON.parseJsonElement(btn0.getElement('$attrs').getString('padding')).getString('left');
      expect(result).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);

      let btn1 = tree.getArray("$children")[0]
        .getArray('$children')[3]
        .getArray("$children")[0]

      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400] component btn1.attrs.padding.top is: " +
      JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('top'));
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400] component btn1.attrs.padding.bottom is: " +
      JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('bottom'));

      let result1 = JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('top');
      let result2 = JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('bottom');
      expect(result1).assertEqual('20.00vp');
      expect(result2).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);

      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500
     * @tc.name     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500
     * @tc.desc     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500] START');
      await CommonFunc.sleep(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      let btn0 = tree.getArray("$children")[0]
        .getArray('$children')[4]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500] component btn0.attrs.padding.left is: " +
      JSON.parseJsonElement(btn0.getElement('$attrs').getString('padding')).getString('left'));
      let result = JSON.parseJsonElement(btn0.getElement('$attrs').getString('padding')).getString('left');
      expect(result).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);

      let btn1 = tree.getArray("$children")[0]
        .getArray('$children')[4]
        .getArray("$children")[0]

      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500] component btn1.attrs.padding.top is: " +
      JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('top'));
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500] component btn1.attrs.padding.bottom is: " +
      JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('bottom'));

      let result1 = JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('top');
      let result2 = JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('bottom');
      expect(result1).assertEqual('20.00vp');
      expect(result2).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);

      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600
     * @tc.name     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600
     * @tc.desc     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600] START');
      await CommonFunc.sleep(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      let btn0 = tree.getArray("$children")[0]
        .getArray('$children')[5]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600] component btn0.attrs.padding.left is: " +
      JSON.parseJsonElement(btn0.getElement('$attrs').getString('padding')).getString('left'));
      let result = JSON.parseJsonElement(btn0.getElement('$attrs').getString('padding')).getString('left');
      expect(result).assertEqual('16.00vp');
      await CommonFunc.sleep(1000);

      let btn1 = tree.getArray("$children")[0]
        .getArray('$children')[5]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600] component btn1.attrs.padding.top is: " +
      JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('top'));
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600] component btn1.attrs.padding.bottom is: " +
      JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('bottom'));

      let result1 = JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('top');
      let result2 = JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('bottom');
      expect(result1).assertEqual('14.00vp');
      expect(result2).assertEqual('14.00vp');
      await CommonFunc.sleep(1000);

      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700
     * @tc.name     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700
     * @tc.desc     SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700] START');
      await CommonFunc.sleep(1000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);

      let btn0 = tree.getArray("$children")[0]
        .getArray('$children')[6]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700] component btn0.attrs.padding.left is: " +
      JSON.parseJsonElement(btn0.getElement('$attrs').getString('padding')).getString('left'));
      let result = JSON.parseJsonElement(btn0.getElement('$attrs').getString('padding')).getString('left');
      expect(result).assertEqual('16.00vp');
      await CommonFunc.sleep(1000);

      let btn1 = tree.getArray("$children")[0]
        .getArray('$children')[6]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700] component btn1.attrs.padding.top is: " +
      JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('top'));
      console.info("[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700] component btn1.attrs.padding.bottom is: " +
      JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('bottom'));

      let result1 = JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('top');
      let result2 = JSON.parseJsonElement(btn1.getElement('$attrs').getString('padding')).getString('bottom');
      expect(result1).assertEqual('14.00vp');
      expect(result2).assertEqual('14.00vp');
      await CommonFunc.sleep(1000);

      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsTest_static_0700] END');
      done();
    });

  })
}