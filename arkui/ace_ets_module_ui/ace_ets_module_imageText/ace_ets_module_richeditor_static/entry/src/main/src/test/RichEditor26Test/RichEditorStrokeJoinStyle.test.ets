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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const SLEEP_TIME: number = 1000;

export default function RichEditorStrokeJoinStyleTest() {
  describe('RichEditorStrokeJoinStyleTest', () => {
    let driver: Driver;
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
    afterAll(() => {
      AppStorage.delete('strokeJoinStyle_miter_join');
      AppStorage.delete('strokeJoinStyle_round_join');
      AppStorage.delete('strokeJoinStyle_bevel_join');
      AppStorage.delete('strokeJoinStyle_default');
      AppStorage.delete('strokeJoinStyle_undefined');
      console.info('RichEditorStrokeJoinStyleTest afterAll');
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_miter_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0100
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_miter_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_miter_join_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_miter_join'));
      expect(btn).not().assertUndefined();
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('strokeJoinStyle_miter_join')).assertEqual('0');
      console.info('[richEditorStrokeJoinStyle_miter_join_0100] END');
      done();
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_round_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0200
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_round_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_round_join_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_round_join'));
      expect(btn).not().assertUndefined();
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('strokeJoinStyle_round_join')).assertEqual('1');
      console.info('[richEditorStrokeJoinStyle_round_join_0100] END');
      done();
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_bevel_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0300
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_bevel_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_bevel_join_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_bevel_join'));
      expect(btn).not().assertUndefined();
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('strokeJoinStyle_bevel_join')).assertEqual('2');
      console.info('[richEditorStrokeJoinStyle_bevel_join_0100] END');
      done();
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test RichEditor strokeJoinStyle property with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_undefined_0100] START');
      driver = Driver.create();
      let btnUndefined = await driver.findComponent(ON.id('btn_strokeJoinStyle_undefined'));
      expect(btnUndefined).not().assertUndefined();
      await (btnUndefined?.click()as Promise<void>);
      await CommonFunc.sleep(500);

      let btnDefault = await driver.findComponent(ON.id('btn_strokeJoinStyle_default'));
      expect(btnDefault).not().assertUndefined();
      await (btnDefault?.click()as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('strokeJoinStyle_undefined')).assertEqual(AppStorage.get<string>('strokeJoinStyle_default'));
      console.info('[richEditorStrokeJoinStyle_undefined_0100] END');
      done();
    });

    /**
     * @tc.name   richEditorStrokeJoinStyle_default_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_DEFAULT_0100
     * @tc.desc   Test RichEditor strokeJoinStyle property without setting value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[richEditorStrokeJoinStyle_default_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_default'));
      expect(btn).not().assertUndefined();
      await (btn?.click()as Promise<void>);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('strokeJoinStyle_default')).assertEqual('undefined');
      console.info('[richEditorStrokeJoinStyle_default_0100] END');
      done();
    });
  });
}