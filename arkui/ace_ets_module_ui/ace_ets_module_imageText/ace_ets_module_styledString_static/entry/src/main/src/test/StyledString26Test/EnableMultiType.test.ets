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

import { describe, it, expect, beforeAll, beforeEach, afterAll, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';
import {
  DecorationStyle, StyledString, StyledStringKey, SpanStyle, TextDecorationType
} from '@kit.ArkUI';

export default function EnableMultiTypeTest() {
  describe('EnableMultiTypePageTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("EnableMultiTypePageTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.styledString.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('EnableMultiTypePageTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/EnableMultiTypeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("EnableMultiTypePageTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "EnableMultiTypeTest") {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("EnableMultiTypePageTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterAll(() => {
      AppStorage.delete('StyledStringEnableMultiType_0_enableMultiType')
      AppStorage.delete('StyledStringEnableMultiType_1_enableMultiType')
      AppStorage.delete('StyledStringEnableMultiType_2_enableMultiType')
      AppStorage.delete('StyledStringEnableMultiType_3_enableMultiType')
      console.info('EnableMultiTypePageTest afterAll cleanup AppStorage');
    });

    /**
     * @tc.name   enableMultiType_page_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_ENABLEMULTITYPE_PARAM_0100
     * @tc.desc   Test DecorationStyle enableMultiType property with various configurations via AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('enableMultiType_page_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[enableMultiType_page_0100] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btnEnableMultiTypeTest'));
      await CommonFunc.sleep(500);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      console.info('[enableMultiType_page_0100] enableMultiType_0: '
        + AppStorage.get<String>('StyledStringEnableMultiType_0_enableMultiType'));
      expect(AppStorage.get<String>('StyledStringEnableMultiType_0_enableMultiType')).assertEqual('true');

      console.info('[enableMultiType_page_0100] enableMultiType_1: '
        + AppStorage.get<String>('StyledStringEnableMultiType_1_enableMultiType'));
      expect(AppStorage.get<String>('StyledStringEnableMultiType_1_enableMultiType')).assertEqual('false');

      console.info('[enableMultiType_page_0100] enableMultiType_2: '
        + AppStorage.get<String>('StyledStringEnableMultiType_2_enableMultiType'));
      expect(AppStorage.get<String>('StyledStringEnableMultiType_2_enableMultiType')).assertEqual('undefined');

      console.info('[enableMultiType_page_0100] enableMultiType_3: '
        + AppStorage.get<String>('StyledStringEnableMultiType_3_enableMultiType'));
      expect(AppStorage.get<String>('StyledStringEnableMultiType_3_enableMultiType')).assertEqual('undefined');

      console.info('[enableMultiType_page_0100] END');
      done();
    });
  });

  describe('EnableMultiTypeApiTest', () => {
    beforeEach(async (done: () => void): Promise<void> => {
      console.info('EnableMultiTypeApiTest beforeEach start');
      done();
    });

    /**
     * @tc.name   enableMultiType_true_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_ENABLEMULTITYPE_PARAM_0200
     * @tc.desc   Test DecorationStyle enableMultiType with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('enableMultiType_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[enableMultiType_true_0100] START');
      let decoStyle = new DecorationStyle({ type: TextDecorationType.LineThrough }, { enableMultiType: true });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.DECORATION,
        styledValue: decoStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[enableMultiType_true_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.DECORATION);
      let decoAttr: DecorationStyle = styles[0].styledValue as DecorationStyle;
      expect(decoAttr.options!.enableMultiType).assertEqual(true);
      console.info('[enableMultiType_true_0100] END');
      done();
    });

    /**
     * @tc.name   enableMultiType_false_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_ENABLEMULTITYPE_PARAM_0300
     * @tc.desc   Test DecorationStyle enableMultiType with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('enableMultiType_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[enableMultiType_false_0100] START');
      let decoStyle = new DecorationStyle({ type: TextDecorationType.Underline }, { enableMultiType: false });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.DECORATION,
        styledValue: decoStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[enableMultiType_false_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.DECORATION);
      let decoAttr: DecorationStyle = styles[0].styledValue as DecorationStyle;
      expect(decoAttr.options!.enableMultiType).assertEqual(false);
      console.info('[enableMultiType_false_0100] END');
      done();
    });

    /**
     * @tc.name   enableMultiType_undefined_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_ENABLEMULTITYPE_PARAM_0400
     * @tc.desc   Test DecorationStyle enableMultiType with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('enableMultiType_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[enableMultiType_undefined_0100] START');
      let decoStyle = new DecorationStyle({ type: TextDecorationType.Overline }, { enableMultiType: undefined });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.DECORATION,
        styledValue: decoStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[enableMultiType_undefined_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.DECORATION);
      let decoAttr: DecorationStyle = styles[0].styledValue as DecorationStyle;
      expect(decoAttr.options!.enableMultiType).assertEqual(undefined);
      console.info('[enableMultiType_undefined_0100] END');
      done();
    });

    /**
     * @tc.name   enableMultiType_default_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_ENABLEMULTITYPE_DEFAULT_0100
     * @tc.desc   Test DecorationStyle enableMultiType without setting, options should be undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('enableMultiType_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[enableMultiType_default_0100] START');
      let decoStyle = new DecorationStyle({ type: TextDecorationType.LineThrough });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.DECORATION,
        styledValue: decoStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[enableMultiType_default_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.DECORATION);
      let decoAttr: DecorationStyle = styles[0].styledValue as DecorationStyle;
      expect(decoAttr.options).assertEqual(undefined);
      console.info('[enableMultiType_default_0100] END');
      done();
    });
  });
}
