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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function RichEditorStrokeJoinStyleTest() {
  describe('RichEditorStrokeJoinStyleTest', () => {
    let driver: Driver;

    beforeEach(async (done: Function) => {
      console.info("RichEditorStrokeJoinStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/RichEditorStrokeJoinStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStrokeJoinStyleTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorStrokeJoinStyle" == pages.name)) {
          console.info("get RichEditorStrokeJoinStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorStrokeJoinStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStrokeJoinStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterAll(async () => {
      AppStorage.delete('strokeJoinStyle_miter_join');
      AppStorage.delete('strokeJoinStyle_round_join');
      AppStorage.delete('strokeJoinStyle_bevel_join');
      AppStorage.delete('strokeJoinStyle_null');
      AppStorage.delete('strokeJoinStyle_default');
      AppStorage.delete('strokeJoinStyle_undefined');
    })

    /**
     * @tc.name   richEditorStrokeJoinStyle_miter_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0100
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_miter_join_0100', Level.LEVEL2, async () => {
      console.info('[richEditorStrokeJoinStyle_miter_join_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_miter_join'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let strokeJoinStyle: string | undefined = AppStorage.get('strokeJoinStyle_miter_join');
      console.info('[richEditorStrokeJoinStyle_miter_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('0');
      console.info('[richEditorStrokeJoinStyle_miter_join_0100] END');
    })

    /**
     * @tc.name   richEditorStrokeJoinStyle_round_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0200
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_round_join_0100', Level.LEVEL2, async () => {
      console.info('[richEditorStrokeJoinStyle_round_join_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_round_join'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let strokeJoinStyle: string | undefined = AppStorage.get('strokeJoinStyle_round_join');
      console.info('[richEditorStrokeJoinStyle_round_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('1');
      console.info('[richEditorStrokeJoinStyle_round_join_0100] END');
    })

    /**
     * @tc.name   richEditorStrokeJoinStyle_bevel_join_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_ENUM_0300
     * @tc.desc   Test RichEditor strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_bevel_join_0100', Level.LEVEL2, async () => {
      console.info('[richEditorStrokeJoinStyle_bevel_join_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_bevel_join'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let strokeJoinStyle: string | undefined = AppStorage.get('strokeJoinStyle_bevel_join');
      console.info('[richEditorStrokeJoinStyle_bevel_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('2');
      console.info('[richEditorStrokeJoinStyle_bevel_join_0100] END');
    })

    /**
     * @tc.name   richEditorStrokeJoinStyle_null_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_PARAM_0100
     * @tc.desc   Test RichEditor strokeJoinStyle property with null value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[richEditorStrokeJoinStyle_null_0100] START');
      driver = Driver.create();
      let btnNull = await driver.findComponent(ON.id('btn_strokeJoinStyle_null'));
      expect(btnNull).not().assertUndefined();
      await btnNull.click();
      await CommonFunc.sleep(500);

      let btnDefault = await driver.findComponent(ON.id('btn_strokeJoinStyle_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);

      let strokeJoinStyleNull: string | undefined = AppStorage.get('strokeJoinStyle_null');
      let strokeJoinStyleDefault: string | undefined = AppStorage.get('strokeJoinStyle_default');

      console.info('[richEditorStrokeJoinStyle_null_0100] strokeJoinStyleNull: ' + strokeJoinStyleNull);
      console.info('[richEditorStrokeJoinStyle_null_0100] strokeJoinStyleDefault: ' + strokeJoinStyleDefault);

      expect(strokeJoinStyleNull).assertEqual(strokeJoinStyleDefault);
      console.info('[richEditorStrokeJoinStyle_null_0100] END');
    })

    /**
     * @tc.name   richEditorStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test RichEditor strokeJoinStyle property with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[richEditorStrokeJoinStyle_undefined_0100] START');
      driver = Driver.create();
      let btnUndefined = await driver.findComponent(ON.id('btn_strokeJoinStyle_undefined'));
      expect(btnUndefined).not().assertUndefined();
      await btnUndefined.click();
      await CommonFunc.sleep(500);

      let btnDefault = await driver.findComponent(ON.id('btn_strokeJoinStyle_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);

      let strokeJoinStyleUndefined: string | undefined = AppStorage.get('strokeJoinStyle_undefined');
      let strokeJoinStyleDefault: string | undefined = AppStorage.get('strokeJoinStyle_default');

      console.info('[richEditorStrokeJoinStyle_undefined_0100] strokeJoinStyleUndefined: ' + strokeJoinStyleUndefined);
      console.info('[richEditorStrokeJoinStyle_undefined_0100] strokeJoinStyleDefault: ' + strokeJoinStyleDefault);

      expect(strokeJoinStyleUndefined).assertEqual(strokeJoinStyleDefault);
      console.info('[richEditorStrokeJoinStyle_undefined_0100] END');
    })

    /**
     * @tc.name   richEditorStrokeJoinStyle_default_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STROKEJOINSTYLE_DEFAULT_0100
     * @tc.desc   Test RichEditor strokeJoinStyle property without setting value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('richEditorStrokeJoinStyle_default_0100', Level.LEVEL2, async () => {
      console.info('[richEditorStrokeJoinStyle_default_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_strokeJoinStyle_default'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);

      let strokeJoinStyle: string | undefined = AppStorage.get('strokeJoinStyle_default');
      console.info('[richEditorStrokeJoinStyle_default_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('0');
      console.info('[richEditorStrokeJoinStyle_default_0100] END');
    })
  })
}