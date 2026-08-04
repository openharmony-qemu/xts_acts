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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function CounterV2AttrsTest(): void {
  describe('CounterV2AttrsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CounterV2AttrsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.counter.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("CounterV2AttrsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CounterV2/CounterV2AttrsPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CounterV2AttrsTest state pages:" + JSON.stringify(pages));
        if (!("CounterV2AttrsPage" == pages.name)) {
          console.info("get CounterV2AttrsTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CounterV2AttrsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CounterV2AttrsTest page error:" + err);
      }
      console.info("CounterV2AttrsTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("CounterV2AttrsTest after each called");
    });
     
    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0100
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0100
     * @tc.desc     test direction Direction.Rtl
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[0]
      .getArray('$children')[0]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0100] component btn0.attrs.direction is: " + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
      expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0200
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0200
     * @tc.desc     test direction Direction.Ltr
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0200] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[1]
      .getArray('$children')[0]
      .getArray('$children')[0]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0200] component btn0.attrs.direction is: " + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
      expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0300
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0300
     * @tc.desc     test direction Direction.Auto
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0300] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[2]
      .getArray('$children')[0]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0300] component btn0.attrs.direction is: " + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
      expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0400
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0400
     * @tc.desc     test direction undefined
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0400] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[3]
      .getArray('$children')[0]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0400] component btn0.attrs.direction is: " + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
      expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0500
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0500
     * @tc.desc     test year month day undefined
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] START');
      await CommonFunc.sleep(1000);
      //[n2] 0001年 [n0]
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[4]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[0]
      //[n2] 一月 [n0]
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[4]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[2]
      //[n2] 一日 [n0]
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[4]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[4]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] component btn0.attrs.year is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityText')));
      expect(btn0.getElement('$attrs').getString('accessibilityText')).assertContain('0001年');

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] component btn1.attrs.month is: " + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityText')));
      expect(btn1.getElement('$attrs').getString('accessibilityText')).assertContain('一月');

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] component btn2.attrs.day is: " + JSON.stringify(btn2.getElement('$attrs').getString('accessibilityText')));
      expect(btn2.getElement('$attrs').getString('accessibilityText')).assertContain('一日');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0600
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0600
     * @tc.desc     test year month day 2024/03/18
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] START');
      await CommonFunc.sleep(1000);
      //[n2] 2025年 [n0]
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[3]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[0]
      //[n2] 三月 [n0]
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[3]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[2]
      //[n2] 十八日 [n0]
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[3]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[4]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] component btn0.attrs.year is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityText')));
      expect(btn0.getElement('$attrs').getString('accessibilityText')).assertContain('2025年');

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] component btn1.attrs.month is: " + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityText')));
      expect(btn1.getElement('$attrs').getString('accessibilityText')).assertContain('三月');

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] component btn2.attrs.day is: " + JSON.stringify(btn2.getElement('$attrs').getString('accessibilityText')));
      expect(btn2.getElement('$attrs').getString('accessibilityText')).assertContain('十八日');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0700
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0700
     * @tc.desc     test focusable true
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0700] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[0]
      .getArray('$children')[0]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0700] component btn0.attrs.focusable is: " + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
      expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(true);
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0700] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0800
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0800
     * @tc.desc     test focusable false
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0800] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[5]
      .getArray('$children')[0]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0800] component btn0.attrs.focusable is: " + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
      expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(false);
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0800] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_CounterV2AttrsTest_static_0900
     * @tc.name     SUB_ARKUI_API_CounterV2AttrsTest_static_0900
     * @tc.desc     test focusable undefined
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_CounterV2AttrsTest_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0900] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[6]
      .getArray('$children')[0]

      console.info("[SUB_ARKUI_API_CounterV2AttrsTest_static_0900] component btn0.attrs.focusable is: " + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
      expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(true);
      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_CounterV2AttrsTest_static_0900] END');
      done();
    });

  })
}