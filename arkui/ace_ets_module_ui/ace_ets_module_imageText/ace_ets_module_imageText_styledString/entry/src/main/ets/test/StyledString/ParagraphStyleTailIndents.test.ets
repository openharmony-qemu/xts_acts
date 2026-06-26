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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { LengthMetrics } from '@kit.ArkUI';

export default function ParagraphStyleTailIndentsTest() {
  describe('ParagraphStyleTailIndentsPageTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
    });

    beforeEach(async (done: Function) => {
      console.info('ParagraphStyleTailIndentsPageTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphStyleTailIndents',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ParagraphStyleTailIndents state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('ParagraphStyleTailIndents' == pages.name)) {
          console.info('get ParagraphStyleTailIndents state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info('push ParagraphStyleTailIndents page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ParagraphStyleTailIndents page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ParagraphStyleTailIndentsPageTest after each called');
    });

    afterAll(() => {
      AppStorage.delete('StyledStringTailIndents_0_tailIndents')
      AppStorage.delete('StyledStringTailIndents_1_tailIndents')
      AppStorage.delete('StyledStringTailIndents_2_tailIndents')
      AppStorage.delete('StyledStringTailIndents_3_tailIndents')
      AppStorage.delete('StyledStringTailIndents_4_tailIndents')
      AppStorage.delete('StyledStringTailIndents_5_tailIndents')
      AppStorage.delete('StyledStringTailIndents_6_tailIndents')
      console.info('ParagraphStyleTailIndentsPageTest afterAll cleanup AppStorage');
    });

    /**
     * @tc.name   paragraphStyleTailIndents_page_0100
     * @tc.number SUB_ARKUI_PARAGRAPHSTYLE_TAILINDENTS_PARAM_0100
     * @tc.desc   Test ParagraphStyle tailIndents property with various configurations via AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('paragraphStyleTailIndents_page_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[paragraphStyleTailIndents_page_0100] START');
      let get = await driver.findComponent(ON.id('textParagraphStyleTailIndentsTest'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);

      console.info('[paragraphStyleTailIndents_page_0100] tailIndents_0: ' + AppStorage.get('StyledStringTailIndents_0_tailIndents'));
      expect(AppStorage.get('StyledStringTailIndents_0_tailIndents')).assertEqual('20');

      console.info('[paragraphStyleTailIndents_page_0100] tailIndents_1: ' + AppStorage.get('StyledStringTailIndents_1_tailIndents'));
      expect(AppStorage.get('StyledStringTailIndents_1_tailIndents')).assertEqual('10,30');

      console.info('[paragraphStyleTailIndents_page_0100] tailIndents_2: ' + AppStorage.get('StyledStringTailIndents_2_tailIndents'));
      expect(AppStorage.get('StyledStringTailIndents_2_tailIndents')).assertEqual('undefined');

      console.info('[paragraphStyleTailIndents_page_0100] tailIndents_3: ' + AppStorage.get('StyledStringTailIndents_3_tailIndents'));
      expect(AppStorage.get('StyledStringTailIndents_3_tailIndents')).assertEqual('undefined');

      console.info('[paragraphStyleTailIndents_page_0100] tailIndents_4: ' + AppStorage.get('StyledStringTailIndents_4_tailIndents'));
      expect(AppStorage.get('StyledStringTailIndents_4_tailIndents')).assertEqual('0');

      console.info('[paragraphStyleTailIndents_page_0100] tailIndents_5: ' + AppStorage.get('StyledStringTailIndents_5_tailIndents'));
      expect(AppStorage.get('StyledStringTailIndents_5_tailIndents')).assertEqual('2147483647');

      console.info('[paragraphStyleTailIndents_page_0100] tailIndents_6: ' + AppStorage.get('StyledStringTailIndents_6_tailIndents'));
      expect(AppStorage.get('StyledStringTailIndents_6_tailIndents')).assertEqual('0');

      console.info('[paragraphStyleTailIndents_page_0100] END');
      done();
    });
  });

  describe('ParagraphStyleTailIndentsApiTest', () => {

    beforeEach(async (done: Function) => {
      console.info('ParagraphStyleTailIndentsApiTest beforeEach start');
      done();
    });

    /**
     * @tc.name   paragraphStyleTailIndents_undefined_vs_default_0100
     * @tc.number SUB_ARKUI_PARAGRAPHSTYLE_TAILINDENTS_UNDEFINED_DEFAULT_PARAM_0100
     * @tc.desc   Test ParagraphStyle tailIndents with undefined should be same as default (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('paragraphStyleTailIndents_undefined_vs_default_0100', Level.LEVEL2, async () => {
      console.info('[paragraphStyleTailIndents_undefined_vs_default_0100] START');
      let undefinedParagraphStyle = new ParagraphStyle({ tailIndents: undefined });
      let defaultParagraphStyle = new ParagraphStyle({});
      let undefinedStyledString = new StyledString('UDEF', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: undefinedParagraphStyle
      }]);
      let defaultStyledString = new StyledString('DEF', [{
        start: 0, length: 3,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: defaultParagraphStyle
      }]);
      let undefinedStyles: Array<SpanStyle> = undefinedStyledString.getStyles(0, undefinedStyledString.length);
      let defaultStyles: Array<SpanStyle> = defaultStyledString.getStyles(0, defaultStyledString.length);
      let undefinedParaAttr: ParagraphStyle = undefinedStyles[0].styledValue as ParagraphStyle;
      let defaultParaAttr: ParagraphStyle = defaultStyles[0].styledValue as ParagraphStyle;
      console.info('[paragraphStyleTailIndents_undefined_vs_default_0100] undefinedParaAttr.tailIndents: ' + JSON.stringify(undefinedParaAttr.tailIndents));
      console.info('[paragraphStyleTailIndents_undefined_vs_default_0100] defaultParaAttr.tailIndents: ' + JSON.stringify(defaultParaAttr.tailIndents));
      expect(undefinedParaAttr.tailIndents).assertEqual(defaultParaAttr.tailIndents);
      console.info('[paragraphStyleTailIndents_undefined_vs_default_0100] END');
    });

    /**
     * @tc.name   paragraphStyleTailIndents_single_0100
     * @tc.number SUB_ARKUI_PARAGRAPHSTYLE_TAILINDENTS_SINGLE_PARAM_0100
     * @tc.desc   Test ParagraphStyle tailIndents with single LengthMetrics value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('paragraphStyleTailIndents_single_0100', Level.LEVEL2, async () => {
      console.info('[paragraphStyleTailIndents_single_0100] START');
      let paragraphStyle = new ParagraphStyle({ tailIndents: LengthMetrics.vp(20) });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length);
      console.info('[paragraphStyleTailIndents_single_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paraAttr: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      console.info('[paragraphStyleTailIndents_single_0100] tailIndents: ' + JSON.stringify(paraAttr.tailIndents));
      expect(paraAttr.tailIndents !== undefined).assertTrue();
      if (paraAttr.tailIndents !== undefined) {
        expect(paraAttr.tailIndents.length).assertEqual(1);
        expect(paraAttr.tailIndents[0]).assertEqual(20);
      }
      console.info('[paragraphStyleTailIndents_single_0100] END');
    });

    /**
     * @tc.name   paragraphStyleTailIndents_array_0100
     * @tc.number SUB_ARKUI_PARAGRAPHSTYLE_TAILINDENTS_ARRAY_PARAM_0100
     * @tc.desc   Test ParagraphStyle tailIndents with Array of LengthMetrics values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('paragraphStyleTailIndents_array_0100', Level.LEVEL2, async () => {
      console.info('[paragraphStyleTailIndents_array_0100] START');
      let paragraphStyle = new ParagraphStyle({ tailIndents: [LengthMetrics.vp(10), LengthMetrics.vp(30)] });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length);
      console.info('[paragraphStyleTailIndents_array_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paraAttr: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      console.info('[paragraphStyleTailIndents_array_0100] tailIndents: ' + JSON.stringify(paraAttr.tailIndents));
      expect(paraAttr.tailIndents !== undefined).assertTrue();
      if (paraAttr.tailIndents !== undefined) {
        expect(paraAttr.tailIndents.length).assertEqual(2);
        expect(paraAttr.tailIndents[0]).assertEqual(10);
        expect(paraAttr.tailIndents[1]).assertEqual(30);
      }
      console.info('[paragraphStyleTailIndents_array_0100] END');
    });

    /**
     * @tc.name   paragraphStyleTailIndents_zero_0100
     * @tc.number SUB_ARKUI_PARAGRAPHSTYLE_TAILINDENTS_BOUNDARY_ZERO_0100
     * @tc.desc   Test ParagraphStyle tailIndents with boundary value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('paragraphStyleTailIndents_zero_0100', Level.LEVEL2, async () => {
      console.info('[paragraphStyleTailIndents_zero_0100] START');
      let paragraphStyle = new ParagraphStyle({ tailIndents: LengthMetrics.vp(0) });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length);
      console.info('[paragraphStyleTailIndents_zero_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paraAttr: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      console.info('[paragraphStyleTailIndents_zero_0100] tailIndents: ' + JSON.stringify(paraAttr.tailIndents));
      expect(paraAttr.tailIndents !== undefined).assertTrue();
      if (paraAttr.tailIndents !== undefined) {
        expect(paraAttr.tailIndents.length).assertEqual(1);
        expect(paraAttr.tailIndents[0]).assertEqual(0);
      }
      console.info('[paragraphStyleTailIndents_zero_0100] END');
    });

    /**
     * @tc.name   paragraphStyleTailIndents_max_0100
     * @tc.number SUB_ARKUI_PARAGRAPHSTYLE_TAILINDENTS_BOUNDARY_MAX_0100
     * @tc.desc   Test ParagraphStyle tailIndents with boundary value INT32_MAX (2147483647)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('paragraphStyleTailIndents_max_0100', Level.LEVEL2, async () => {
      console.info('[paragraphStyleTailIndents_max_0100] START');
      let paragraphStyle = new ParagraphStyle({ tailIndents: LengthMetrics.vp(2147483647) });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length);
      console.info('[paragraphStyleTailIndents_max_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paraAttr: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      console.info('[paragraphStyleTailIndents_max_0100] tailIndents: ' + JSON.stringify(paraAttr.tailIndents));
      expect(paraAttr.tailIndents !== undefined).assertTrue();
      if (paraAttr.tailIndents !== undefined) {
        expect(paraAttr.tailIndents.length).assertEqual(1);
        expect(paraAttr.tailIndents[0]).assertEqual(2147483647);
      }
      console.info('[paragraphStyleTailIndents_max_0100] END');
    });

    /**
     * @tc.name   paragraphStyleTailIndents_negative_0100
     * @tc.number SUB_ARKUI_PARAGRAPHSTYLE_TAILINDENTS_BOUNDARY_NEGATIVE_0100
     * @tc.desc   Test ParagraphStyle tailIndents with negative value (-10), should use default 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('paragraphStyleTailIndents_negative_0100', Level.LEVEL2, async () => {
      console.info('[paragraphStyleTailIndents_negative_0100] START');
      let paragraphStyle = new ParagraphStyle({ tailIndents: LengthMetrics.vp(-10) });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length);
      console.info('[paragraphStyleTailIndents_negative_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paraAttr: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      console.info('[paragraphStyleTailIndents_negative_0100] tailIndents: ' + JSON.stringify(paraAttr.tailIndents));
      if (paraAttr.tailIndents !== undefined) {
        expect(paraAttr.tailIndents.length).assertEqual(1);
        expect(paraAttr.tailIndents[0]).assertEqual(0);
      } else {
        expect(paraAttr.tailIndents).assertEqual(undefined);
      }
      console.info('[paragraphStyleTailIndents_negative_0100] END');
    });

    /**
     * @tc.name   paragraphStyleTailIndents_array_single_element_0100
     * @tc.number SUB_ARKUI_PARAGRAPHSTYLE_TAILINDENTS_ARRAY_SINGLE_PARAM_0100
     * @tc.desc   Test ParagraphStyle tailIndents with array containing single element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL2
     */
    it('paragraphStyleTailIndents_array_single_element_0100', Level.LEVEL2, async () => {
      console.info('[paragraphStyleTailIndents_array_single_element_0100] START');
      let paragraphStyle = new ParagraphStyle({ tailIndents: [LengthMetrics.vp(25)] });
      let styledString = new StyledString('Test', [{
        start: 0, length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: paragraphStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length);
      console.info('[paragraphStyleTailIndents_array_single_element_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.PARAGRAPH_STYLE);
      let paraAttr: ParagraphStyle = styles[0].styledValue as ParagraphStyle;
      console.info('[paragraphStyleTailIndents_array_single_element_0100] tailIndents: ' + JSON.stringify(paraAttr.tailIndents));
      expect(paraAttr.tailIndents !== undefined).assertTrue();
      if (paraAttr.tailIndents !== undefined) {
        expect(paraAttr.tailIndents.length).assertEqual(1);
        expect(paraAttr.tailIndents[0]).assertEqual(25);
      }
      console.info('[paragraphStyleTailIndents_array_single_element_0100] END');
    });
  });
}
