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

import { describe, it, expect, Level, beforeAll, beforeEach  } from '@ohos/hypium-binary/src/main/indexStatic';
import {
  TextStyle,
  StyledStringKey,
  SpanStyle,
  StyledString,
  StrokeJoinStyle
} from '@kit.ArkUI';

import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';

export default function StyledStringStrokeJoinStyleTest() {
  describe('StyledStringStrokeJoinStyleTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("StyledStringStrokeJoinStyleTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.styledString.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("StyledStringStrokeJoinStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/StyledStringIndex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("StyledStringStrokeJoinStyleTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "StyledStringIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("push StyledStringStrokeJoinStyleTest page error:" + err);
        expect().assertFail();
      }
      console.info("StyledStringStrokeJoinStyleTest beforeEach end");
    });
    /**
     * @tc.name   styledStringStrokeJoinStyle_miter_join_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_STROKEJOINSTYLE_ENUM_0100
     * @tc.desc   Test StyledString strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringStrokeJoinStyle_miter_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringStrokeJoinStyle_miter_join_0100] START');
      let textStyle = new TextStyle({
        strokeJoinStyle: StrokeJoinStyle.MITER_JOIN
      });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringStrokeJoinStyle_miter_join_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      if (textStyleResult.strokeJoinStyle != undefined) {
        console.info('[styledStringStrokeJoinStyle_miter_join_0100] strokeJoinStyle: ' + textStyleResult.strokeJoinStyle);
        expect(textStyleResult.strokeJoinStyle).assertEqual(0);
      } else {
        console.log('[styledStringStrokeJoinStyle_miter_join_0100] strokeJoinStyle is undefined');
        expect().assertFail();
      }
      console.info('[styledStringStrokeJoinStyle_miter_join_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringStrokeJoinStyle_round_join_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_STROKEJOINSTYLE_ENUM_0200
     * @tc.desc   Test StyledString strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringStrokeJoinStyle_round_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringStrokeJoinStyle_round_join_0100] START');
      let textStyle = new TextStyle({
        strokeJoinStyle: StrokeJoinStyle.ROUND_JOIN
      });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringStrokeJoinStyle_round_join_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      if (textStyleResult.strokeJoinStyle != undefined) {
        console.info('[styledStringStrokeJoinStyle_round_join_0100] strokeJoinStyle: ' + textStyleResult.strokeJoinStyle);
        expect(textStyleResult.strokeJoinStyle).assertEqual(1);
      } else {
        console.log('[styledStringStrokeJoinStyle_round_join_0100] strokeJoinStyle is undefined');
        expect().assertFail();
      }
      console.info('[styledStringStrokeJoinStyle_round_join_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringStrokeJoinStyle_bevel_join_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_STROKEJOINSTYLE_ENUM_0300
     * @tc.desc   Test StyledString strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringStrokeJoinStyle_bevel_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringStrokeJoinStyle_bevel_join_0100] START');
      let textStyle = new TextStyle({
        strokeJoinStyle: StrokeJoinStyle.BEVEL_JOIN
      });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringStrokeJoinStyle_bevel_join_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      if (textStyleResult.strokeJoinStyle != undefined) {
        console.info('[styledStringStrokeJoinStyle_bevel_join_0100] strokeJoinStyle: ' + textStyleResult.strokeJoinStyle);
        expect(textStyleResult.strokeJoinStyle).assertEqual(2);
      } else {
        console.log('[styledStringStrokeJoinStyle_bevel_join_0100] strokeJoinStyle is undefined');
        expect().assertFail();
      }
      console.info('[styledStringStrokeJoinStyle_bevel_join_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test StyledString strokeJoinStyle property with undefined value, should restore to default value MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringStrokeJoinStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringStrokeJoinStyle_undefined_0100] START');
      let textStyle = new TextStyle({
        strokeJoinStyle: undefined
      });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringStrokeJoinStyle_undefined_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      expect(textStyleResult.strokeJoinStyle).assertEqual(undefined);
      console.info('[styledStringStrokeJoinStyle_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringStrokeJoinStyle_default_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_STROKEJOINSTYLE_DEFAULT_0100
     * @tc.desc   Test StyledString strokeJoinStyle property without setting, should be default value MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringStrokeJoinStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringStrokeJoinStyle_default_0100] START');
      let textStyle = new TextStyle({});
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info('[styledStringStrokeJoinStyle_default_0100] styles: ' + JSON.stringify(styles));
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      expect(textStyleResult.strokeJoinStyle).assertEqual(undefined);
      console.info('[styledStringStrokeJoinStyle_default_0100] END');
      done();
    })
  })
}