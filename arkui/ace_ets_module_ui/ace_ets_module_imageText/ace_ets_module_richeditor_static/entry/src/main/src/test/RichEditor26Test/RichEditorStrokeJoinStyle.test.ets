'use static'
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const SLEEP_TIME: number = 1000;

export default function RichEditorStrokeJoinStyleTest() {
  describe('RichEditorStrokeJoinStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RichEditorStrokeJoinStyleTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('RichEditorStrokeJoinStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor26/RichEditorStrokeJoinStyle',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info('RichEditorStrokeJoinStyleTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'RichEditorStrokeJoinStyle') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('RichEditorStrokeJoinStyleTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(() => {
      console.info('RichEditorStrokeJoinStyleTest afterEach');
    });

    afterAll(() => {
      console.info('RichEditorStrokeJoinStyleTest afterAll');
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_miter_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0100
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorStrokeJoinStyle_miter_join_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_miter_join_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_miter_join'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson: string = inspector.getInspectorByKey('text_strokeJoinStyle_miter_join');
        expect(strJson.length > 0).assertTrue();
        let content: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorStrokeJoinStyle_miter_join_0100] content: ' + content);
        expect(content.includes('0')).assertTrue();

        console.info('[richEditorStrokeJoinStyle_miter_join_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorStrokeJoinStyle_miter_join_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_round_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0200
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorStrokeJoinStyle_round_join_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_round_join_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_round_join'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson: string = inspector.getInspectorByKey('text_strokeJoinStyle_round_join');
        expect(strJson.length > 0).assertTrue();
        let content: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorStrokeJoinStyle_round_join_0100] content: ' + content);
        expect(content.includes('1')).assertTrue();

        console.info('[richEditorStrokeJoinStyle_round_join_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorStrokeJoinStyle_round_join_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_bevel_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0300
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorStrokeJoinStyle_bevel_join_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_bevel_join_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_bevel_join'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson: string = inspector.getInspectorByKey('text_strokeJoinStyle_bevel_join');
        expect(strJson.length > 0).assertTrue();
        let content: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorStrokeJoinStyle_bevel_join_0100] content: ' + content);
        expect(content.includes('2')).assertTrue();

        console.info('[richEditorStrokeJoinStyle_bevel_join_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorStrokeJoinStyle_bevel_join_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_null_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_PARAM_0100
     * @tc.desc   Test RichEditor strokeJoinStyle property with null value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorStrokeJoinStyle_null_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_null_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btnNull = await driver.findComponent(ON.id('btn_strokeJoinStyle_null'));
        expect(btnNull).not().assertUndefined();
        await btnNull.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let btnDefault = await driver.findComponent(ON.id('btn_strokeJoinStyle_default'));
        expect(btnDefault).not().assertUndefined();
        await btnDefault.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let nullStrJson: string = inspector.getInspectorByKey('text_strokeJoinStyle_null');
        expect(nullStrJson.length > 0).assertTrue();
        let nullContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(nullStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorStrokeJoinStyle_null_0100] nullContent: ' + nullContent);

        let defaultStrJson: string = inspector.getInspectorByKey('text_strokeJoinStyle_default');
        expect(defaultStrJson.length > 0).assertTrue();
        let defaultContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(defaultStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorStrokeJoinStyle_null_0100] defaultContent: ' + defaultContent);

        expect(nullContent).assertEqual(defaultContent);

        console.info('[richEditorStrokeJoinStyle_null_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorStrokeJoinStyle_null_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test RichEditor strokeJoinStyle property with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorStrokeJoinStyle_undefined_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_undefined_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btnUndefined = await driver.findComponent(ON.id('btn_strokeJoinStyle_undefined'));
        expect(btnUndefined).not().assertUndefined();
        await btnUndefined.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let btnDefault = await driver.findComponent(ON.id('btn_strokeJoinStyle_default'));
        expect(btnDefault).not().assertUndefined();
        await btnDefault.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let undefinedStrJson: string = inspector.getInspectorByKey('text_strokeJoinStyle_undefined');
        expect(undefinedStrJson.length > 0).assertTrue();
        let undefinedContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(undefinedStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorStrokeJoinStyle_undefined_0100] undefinedContent: ' + undefinedContent);

        let defaultStrJson: string = inspector.getInspectorByKey('text_strokeJoinStyle_default');
        expect(defaultStrJson.length > 0).assertTrue();
        let defaultContent: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(defaultStrJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorStrokeJoinStyle_undefined_0100] defaultContent: ' + defaultContent);

        expect(undefinedContent).assertEqual(defaultContent);

        console.info('[richEditorStrokeJoinStyle_undefined_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorStrokeJoinStyle_undefined_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_default_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_DEFAULT_0100
     * @tc.desc   Test RichEditor strokeJoinStyle property without setting value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('richEditorStrokeJoinStyle_default_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_default_0100] START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(SLEEP_TIME);

        let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_default'));
        expect(btn).not().assertUndefined();
        await btn.click();
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson: string = inspector.getInspectorByKey('text_strokeJoinStyle_default');
        expect(strJson.length > 0).assertTrue();
        let content: string = JSON.stringifyJsonElement(
          JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content'));
        console.info('[richEditorStrokeJoinStyle_default_0100] content: ' + content);
        expect(content.includes('0')).assertTrue();

        console.info('[richEditorStrokeJoinStyle_default_0100] END');
        done();
      } catch (error) {
        console.error('[richEditorStrokeJoinStyle_default_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });
  });
}