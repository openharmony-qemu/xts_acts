/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function richEditorImageSpanStyleResizableTest() {
  describe('richEditorImageSpanStyleResizableTest', () => {
    let driver: Driver;

    beforeEach(async (done: Function) => {
      console.info('richEditorImageSpanStyleResizableTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/RichEditorImageSpanStyleResizable',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('RichEditorImageSpanStyleResizable' == pages.name)) {
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push RichEditorImageSpanStyleResizable success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RichEditorImageSpanStyleResizable page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterAll(async () => {
      AppStorage.delete('imageSpanStyle_resizable_slice');
      AppStorage.delete('imageSpanStyle_resizable_default');
      AppStorage.delete('imageSpanStyle_resizable_null');
      AppStorage.delete('imageSpanStyle_resizable_undefined');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_SLICE_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_SLICE_0100
     * @tc.desc   Test RichEditorImageSpanStyle/Result.resizable with slice options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_SLICE_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_SLICE_0100] START');
      driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btn_imageSpanStyle_resizable_slice'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await CommonFunc.sleep(500);
      let value: string | undefined = AppStorage.get('imageSpanStyle_resizable_slice');
      console.info('[slice] value: ' + value);
      expect(value).not().assertUndefined();
      expect(value !== 'no_span').assertTrue();
      expect(value !== 'no_style').assertTrue();
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_SLICE_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_NULL_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_NULL_0100
     * @tc.desc   Test RichEditorImageSpanStyle.resizable null equals default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_NULL_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_NULL_0100] START');
      driver = Driver.create();
      let btnNull = await driver.findComponent(ON.id('btn_imageSpanStyle_resizable_null'));
      expect(btnNull).not().assertUndefined();
      await btnNull.click();
      await CommonFunc.sleep(500);
      let btnDefault = await driver.findComponent(ON.id('btn_imageSpanStyle_resizable_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);
      let nullVal: string | undefined = AppStorage.get('imageSpanStyle_resizable_null');
      let defaultVal: string | undefined = AppStorage.get('imageSpanStyle_resizable_default');
      console.info('[null] ' + nullVal + ' default ' + defaultVal);
      expect(nullVal).assertEqual(defaultVal);
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_NULL_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_UNDEFINED_0100
     * @tc.desc   Test RichEditorImageSpanStyle.resizable undefined equals default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_UNDEFINED_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_UNDEFINED_0100] START');
      driver = Driver.create();
      let btnUndef = await driver.findComponent(ON.id('btn_imageSpanStyle_resizable_undefined'));
      expect(btnUndef).not().assertUndefined();
      await btnUndef.click();
      await CommonFunc.sleep(500);
      let btnDefault = await driver.findComponent(ON.id('btn_imageSpanStyle_resizable_default'));
      expect(btnDefault).not().assertUndefined();
      await btnDefault.click();
      await CommonFunc.sleep(500);
      let undefVal: string | undefined = AppStorage.get('imageSpanStyle_resizable_undefined');
      let defaultVal: string | undefined = AppStorage.get('imageSpanStyle_resizable_default');
      console.info('[undefined] ' + undefVal + ' default ' + defaultVal);
      expect(undefVal).assertEqual(defaultVal);
      console.info('[SUB_ARKUI_RICHEDITOR_IMAGESPANSTYLE_RESIZABLE_UNDEFINED_0100] END');
    });
  });
}
