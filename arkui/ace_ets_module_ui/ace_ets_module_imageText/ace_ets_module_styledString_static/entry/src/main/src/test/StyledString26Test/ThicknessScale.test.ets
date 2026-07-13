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
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';
import {
  DecorationStyle, StyledString, StyledStringKey, SpanStyle, TextDecorationType
} from '@kit.ArkUI';

export default function ThicknessScaleTest() {
  describe('ThicknessScalePageTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ThicknessScalePageTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.styledString.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('ThicknessScalePageTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ThicknessScaleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("ThicknessScalePageTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "ThicknessScaleTest") {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("ThicknessScalePageTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterAll(() => {
      AppStorage.delete('StyledStringThicknessScale_0_thicknessScale')
      AppStorage.delete('StyledStringThicknessScale_1_thicknessScale')
      AppStorage.delete('StyledStringThicknessScale_2_thicknessScale')
      AppStorage.delete('StyledStringThicknessScale_3_thicknessScale')
      console.info('ThicknessScalePageTest afterAll cleanup AppStorage');
    });

    /**
     * @tc.name   thicknessScale_page_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_THICKNESSSCALE_PARAM_0100
     * @tc.desc   Test DecorationStyle thicknessScale property with various configurations via AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('thicknessScale_page_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[thicknessScale_page_0100] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btnThicknessScaleTest'));
      await CommonFunc.sleep(500);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      console.info('[thicknessScale_page_0100] thicknessScale_0: '
        + AppStorage.get<String>('StyledStringThicknessScale_0_thicknessScale'));
      expect(AppStorage.get<String>('StyledStringThicknessScale_0_thicknessScale')).assertEqual('2');

      console.info('[thicknessScale_page_0100] thicknessScale_1: '
        + AppStorage.get<String>('StyledStringThicknessScale_1_thicknessScale'));
      expect(AppStorage.get<String>('StyledStringThicknessScale_1_thicknessScale')).assertEqual('0');

      console.info('[thicknessScale_page_0100] thicknessScale_2: '
        + AppStorage.get<String>('StyledStringThicknessScale_2_thicknessScale'));
      expect(AppStorage.get<String>('StyledStringThicknessScale_2_thicknessScale')).assertEqual('undefined');

      console.info('[thicknessScale_page_0100] thicknessScale_3: '
        + AppStorage.get<String>('StyledStringThicknessScale_3_thicknessScale'));
      expect(AppStorage.get<String>('StyledStringThicknessScale_3_thicknessScale')).assertEqual(undefined);

      console.info('[thicknessScale_page_0100] END');
      done();
    });
  });

  describe('ThicknessScaleApiTest', () => {
    beforeEach(async (done: () => void): Promise<void> => {
      console.info('ThicknessScaleApiTest beforeEach start');
      done();
    });

    /**
     * @tc.name   thicknessScale_positive_number_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_THICKNESSSCALE_PARAM_0200
     * @tc.desc   Test DecorationStyle thicknessScale with positive number value 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('thicknessScale_positive_number_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[thicknessScale_positive_number_0100] START');
      let decoStyle = new DecorationStyle({ type: TextDecorationType.LineThrough, thicknessScale: 2 });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.DECORATION,
        styledValue: decoStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[thicknessScale_positive_number_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.DECORATION);
      let decoAttr: DecorationStyle = styles[0].styledValue as DecorationStyle;
      expect(decoAttr.thicknessScale).assertEqual(2);
      console.info('[thicknessScale_positive_number_0100] END');
      done();
    });

    /**
     * @tc.name   thicknessScale_zero_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_THICKNESSSCALE_PARAM_0300
     * @tc.desc   Test DecorationStyle thicknessScale with boundary value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('thicknessScale_zero_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[thicknessScale_zero_0100] START');
      let decoStyle = new DecorationStyle({ type: TextDecorationType.LineThrough, thicknessScale: 0 });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.DECORATION,
        styledValue: decoStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[thicknessScale_zero_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.DECORATION);
      let decoAttr: DecorationStyle = styles[0].styledValue as DecorationStyle;
      expect(decoAttr.thicknessScale).assertEqual(0);
      console.info('[thicknessScale_zero_0100] END');
      done();
    });

    /**
     * @tc.name   thicknessScale_undefined_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_THICKNESSSCALE_PARAM_0400
     * @tc.desc   Test DecorationStyle thicknessScale with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('thicknessScale_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[thicknessScale_undefined_0100] START');
      let decoStyle = new DecorationStyle({ type: TextDecorationType.LineThrough, thicknessScale: undefined });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.DECORATION,
        styledValue: decoStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[thicknessScale_undefined_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.DECORATION);
      let decoAttr: DecorationStyle = styles[0].styledValue as DecorationStyle;
      expect(decoAttr.thicknessScale).assertEqual(undefined);
      console.info('[thicknessScale_undefined_0100] END');
      done();
    });

    /**
     * @tc.name   thicknessScale_default_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_THICKNESSSCALE_DEFAULT_0100
     * @tc.desc   Test DecorationStyle thicknessScale without setting, should be undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('thicknessScale_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[thicknessScale_default_0100] START');
      let decoStyle = new DecorationStyle({ type: TextDecorationType.LineThrough });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.DECORATION,
        styledValue: decoStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[thicknessScale_default_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.DECORATION);
      let decoAttr: DecorationStyle = styles[0].styledValue as DecorationStyle;
      expect(decoAttr.thicknessScale).assertEqual(undefined);
      console.info('[thicknessScale_default_0100] END');
      done();
    });
  });
}
