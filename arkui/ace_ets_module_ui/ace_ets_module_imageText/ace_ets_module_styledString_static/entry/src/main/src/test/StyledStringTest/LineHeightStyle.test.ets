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

import { describe, it, expect, beforeAll, afterEach, afterAll, Level, beforeEach } from '../../../../hypium/index';
import { LengthMetrics,
LineHeightStyle,
StyledStringKey,
SpanStyle,
StyledString,
TextStyle,
Color } from '@kit.ArkUI';

import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';

export default function LineHeightStyleTest() {
  describe('LineHeightStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("LineHeightStyleTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.styledString.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("LineHeightStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringIndex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("LineHeightStyleTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "StyledStringIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("push LineHeightStyleTest page error:" + err);
        expect().assertFail();
      }
      console.info("LineHeightStyleTest beforeEach end");
    });
    /**
     * @tc.name   lineHeightStyle_multiple_normal_0100
     * @tc.number SUB_ARKUI_LINEHEIGHTSTYLE_MULTIPLE_0100
     * @tc.desc   Test LineHeightStyle with lineHeightMultiple (1.5)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightStyle_multiple_normal_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineHeightStyle_multiple_normal_0100] START');
      let lineHeightStyle = new LineHeightStyle(LengthMetrics.vp(25), 1.5);
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: lineHeightStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineHeightStyle_multiple_normal_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineHeightStyle_multiple_normal_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_HEIGHT);
      let lineHeightStyleResult: LineHeightStyle = styles[0].styledValue as LineHeightStyle;
      console.info("[lineHeightStyle_multiple_normal_0100] lineHeight is: " + lineHeightStyleResult.lineHeight);
      console.info("[lineHeightStyle_multiple_normal_0100] lineHeightMultiple is: " + lineHeightStyleResult.lineHeightMultiple);
      expect(lineHeightStyleResult.lineHeight).assertEqual(25);
      if (lineHeightStyleResult.lineHeightMultiple != undefined && lineHeightStyleResult.lineHeightMultiple != null) {
        console.info("[lineHeightStyle_multiple_normal_0100] lineHeightMultiple value is: " + lineHeightStyleResult.lineHeightMultiple);
        expect(lineHeightStyleResult.lineHeightMultiple).assertEqual(1.5);
      } else {
        console.log('[lineHeightStyle_multiple_normal_0100] lineHeightMultiple is null or undefined');
        expect().assertFail();
      }
      console.info('[lineHeightStyle_multiple_normal_0100] END');
      done();
    })
    /**
     * @tc.name   lineHeightStyle_multiple_normal_0200
     * @tc.number SUB_ARKUI_LINEHEIGHTSTYLE_MULTIPLE_0200
     * @tc.desc   Test LineHeightStyle with lineHeightMultiple (2.0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightStyle_multiple_normal_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineHeightStyle_multiple_normal_0200] START');
      let lineHeightStyle = new LineHeightStyle(LengthMetrics.vp(25), 2.0);
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: lineHeightStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineHeightStyle_multiple_normal_0200] styles is: " + JSON.stringify(styles));
      console.info("[lineHeightStyle_multiple_normal_0200] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_HEIGHT);
      let lineHeightStyleResult: LineHeightStyle = styles[0].styledValue as LineHeightStyle;
      console.info("[lineHeightStyle_multiple_normal_0200] lineHeight is: " + lineHeightStyleResult.lineHeight);
      console.info("[lineHeightStyle_multiple_normal_0200] lineHeightMultiple is: " + lineHeightStyleResult.lineHeightMultiple);
      expect(lineHeightStyleResult.lineHeight).assertEqual(25);
      if (lineHeightStyleResult.lineHeightMultiple != undefined && lineHeightStyleResult.lineHeightMultiple != null) {
        console.info("[lineHeightStyle_multiple_normal_0200] lineHeightMultiple value is: " + lineHeightStyleResult.lineHeightMultiple);
        expect(lineHeightStyleResult.lineHeightMultiple).assertEqual(2.0);
      } else {
        console.log('[lineHeightStyle_multiple_normal_0200] lineHeightMultiple is null or undefined');
        expect().assertFail();
      }
      console.info('[lineHeightStyle_multiple_normal_0200] END');
      done();
    })

    /**
     * @tc.name   lineHeightStyle_multiple_zero_0100
     * @tc.number SUB_ARKUI_LINEHEIGHTSTYLE_MULTIPLE_0300
     * @tc.desc   Test LineHeightStyle with lineHeightMultiple 0 (should equal to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightStyle_multiple_zero_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineHeightStyle_multiple_zero_0100] START');
      let lineHeightStyle = new LineHeightStyle(LengthMetrics.vp(25), 0);
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: lineHeightStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineHeightStyle_multiple_zero_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineHeightStyle_multiple_zero_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_HEIGHT);
      let lineHeightStyleResult: LineHeightStyle = styles[0].styledValue as LineHeightStyle;
      console.info("[lineHeightStyle_multiple_zero_0100] lineHeight is: " + lineHeightStyleResult.lineHeight);
      console.info("[lineHeightStyle_multiple_zero_0100] lineHeightMultiple is: " + lineHeightStyleResult.lineHeightMultiple);
      expect(lineHeightStyleResult.lineHeight).assertEqual(25);
      if (lineHeightStyleResult.lineHeightMultiple != undefined && lineHeightStyleResult.lineHeightMultiple != null) {
        console.info("[lineHeightStyle_multiple_zero_0100] lineHeightMultiple value is: " + lineHeightStyleResult.lineHeightMultiple);
        expect(lineHeightStyleResult.lineHeightMultiple).assertEqual(0);
      } else {
        console.log('[lineHeightStyle_multiple_zero_0100] lineHeightMultiple is null or undefined');
        expect().assertFail();
      }
      console.info('[lineHeightStyle_multiple_zero_0100] END');
      done();
    })

    /**
     * @tc.name   lineHeightStyle_multiple_negative_0100
     * @tc.number SUB_ARKUI_LINEHEIGHTSTYLE_MULTIPLE_0400
     * @tc.desc   Test LineHeightStyle with negative lineHeightMultiple (should not take effect)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightStyle_multiple_negative_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineHeightStyle_multiple_negative_0100] START');
      let lineHeightStyle = new LineHeightStyle(LengthMetrics.vp(25), -1);
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: lineHeightStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineHeightStyle_multiple_negative_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineHeightStyle_multiple_negative_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_HEIGHT);
      let lineHeightStyleResult: LineHeightStyle = styles[0].styledValue as LineHeightStyle;
      console.info("[lineHeightStyle_multiple_negative_0100] lineHeight is: " + lineHeightStyleResult.lineHeight);
      console.info("[lineHeightStyle_multiple_negative_0100] lineHeightMultiple is: " + lineHeightStyleResult.lineHeightMultiple);
      expect(lineHeightStyleResult.lineHeight).assertEqual(25);
      if (lineHeightStyleResult.lineHeightMultiple != undefined && lineHeightStyleResult.lineHeightMultiple != null) {
        console.info("[lineHeightStyle_multiple_negative_0100] lineHeightMultiple value is: " + lineHeightStyleResult.lineHeightMultiple);
        expect().assertFail();
      } else {
        console.log('[lineHeightStyle_multiple_negative_0100] lineHeightMultiple is null or undefined, negative value should not take effect');
        expect(lineHeightStyleResult.lineHeightMultiple).assertEqual(undefined);
      }
      console.info('[lineHeightStyle_multiple_negative_0100] END');
      done();
    })

    /**
     * @tc.name   lineHeightStyle_no_multiple_0100
     * @tc.number SUB_ARKUI_LINEHEIGHTSTYLE_MULTIPLE_0600
     * @tc.desc   Test LineHeightStyle without lineHeightMultiple parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightStyle_no_multiple_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineHeightStyle_no_multiple_0100] START');
      let lineHeightStyle = new LineHeightStyle(LengthMetrics.vp(25));
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: lineHeightStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineHeightStyle_no_multiple_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineHeightStyle_no_multiple_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_HEIGHT);
      let lineHeightStyleResult: LineHeightStyle = styles[0].styledValue as LineHeightStyle;
      console.info("[lineHeightStyle_no_multiple_0100] lineHeight is: " + lineHeightStyleResult.lineHeight);
      console.info("[lineHeightStyle_no_multiple_0100] lineHeightMultiple is: " + lineHeightStyleResult.lineHeightMultiple);
      expect(lineHeightStyleResult.lineHeight).assertEqual(25);
      if (lineHeightStyleResult.lineHeightMultiple != undefined && lineHeightStyleResult.lineHeightMultiple != null) {
        console.info("[lineHeightStyle_no_multiple_0100] lineHeightMultiple value is: " + lineHeightStyleResult.lineHeightMultiple);
        expect().assertFail();
      } else {
        console.log('[lineHeightStyle_no_multiple_0100] lineHeightMultiple is null or undefined, which is valid');
        expect(lineHeightStyleResult.lineHeightMultiple).assertEqual(undefined);
      }
      console.info('[lineHeightStyle_no_multiple_0100] END');
      done();
    })
    /**
     * @tc.name   lineHeightStyle_multiple_small_0100
     * @tc.number SUB_ARKUI_LINEHEIGHTSTYLE_MULTIPLE_0700
     * @tc.desc   Test LineHeightStyle with small lineHeightMultiple (0.5)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightStyle_multiple_small_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineHeightStyle_multiple_small_0100] START');
      let lineHeightStyle = new LineHeightStyle(LengthMetrics.vp(25), 0.5);
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: lineHeightStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineHeightStyle_multiple_small_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineHeightStyle_multiple_small_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_HEIGHT);
      let lineHeightStyleResult: LineHeightStyle = styles[0].styledValue as LineHeightStyle;
      console.info("[lineHeightStyle_multiple_small_0100] lineHeight is: " + lineHeightStyleResult.lineHeight);
      console.info("[lineHeightStyle_multiple_small_0100] lineHeightMultiple is: " + lineHeightStyleResult.lineHeightMultiple);
      expect(lineHeightStyleResult.lineHeight).assertEqual(25);
      if (lineHeightStyleResult.lineHeightMultiple != undefined && lineHeightStyleResult.lineHeightMultiple != null) {
        console.info("[lineHeightStyle_multiple_small_0100] lineHeightMultiple value is: " + lineHeightStyleResult.lineHeightMultiple);
        expect(lineHeightStyleResult.lineHeightMultiple).assertEqual(0.5);
      } else {
        console.log('[lineHeightStyle_multiple_small_0100] lineHeightMultiple is null or undefined');
        expect().assertFail();
      }
      
      console.info('[lineHeightStyle_multiple_small_0100] END');
      done();
    })
    /**
     * @tc.name   lineHeightStyle_mixed_0100
     * @tc.number SUB_ARKUI_LINEHEIGHTSTYLE_MIXED_0100
     * @tc.desc   Test LineHeightStyle mixed with other styles (FONT)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightStyle_mixed_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineHeightStyle_mixed_0100] START');
      let lineHeightStyle = new LineHeightStyle(LengthMetrics.vp(30) as LengthMetrics, 1.8);
      let textStyle = new TextStyle({ fontColor: Color.Green });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: lineHeightStyle
      }, {
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineHeightStyle_mixed_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineHeightStyle_mixed_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(2);
      let lineHeightStyleFound = false;
      let textStyleFound = false;
      for (let style of styles) {
        if (style.styledKey === StyledStringKey.LINE_HEIGHT) {
          lineHeightStyleFound = true;
          let lineHeightStyleResult: LineHeightStyle = style.styledValue as LineHeightStyle;
          console.info("[lineHeightStyle_mixed_0100] lineHeight is: " + lineHeightStyleResult.lineHeight);
          console.info("[lineHeightStyle_mixed_0100] lineHeightMultiple is: " + lineHeightStyleResult.lineHeightMultiple);
          
          expect(lineHeightStyleResult.lineHeight).assertEqual(30);
          if (lineHeightStyleResult.lineHeightMultiple != undefined && lineHeightStyleResult.lineHeightMultiple != null) {
            expect(lineHeightStyleResult.lineHeightMultiple).assertEqual(1.8);
          }
        } else if (style.styledKey === StyledStringKey.FONT) {
          textStyleFound = true;
        }
      } 
      expect(lineHeightStyleFound).assertEqual(true);
      expect(textStyleFound).assertEqual(true);
      console.info('[lineHeightStyle_mixed_0100] END');
      done();
    })

  })
}