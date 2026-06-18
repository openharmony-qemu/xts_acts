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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function colorLengthMetrics() {
  describe('colorLengthMetrics', () => {
    beforeEach(async (done: Function) => {
      console.info("colorLengthMetrics beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Graphics/colorLengthMetrics',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get colorLengthMetrics state pages: " + JSON.stringify(pages));
        if (!("colorLengthMetrics" == pages.name)) {
          console.info("get colorLengthMetrics state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push colorLengthMetrics success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push colorLengthMetrics page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   colorMetrics_autoRefresh_0100
     * @tc.number SUB_ARKUI_COLORMETRICS_AUTOREFRESH_0100
     * @tc.desc   Test ColorMetrics autoRefresh property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('colorMetrics_autoRefresh_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[colorMetrics_autoRefresh_0100] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('colorMetrics_autoRefresh_true');
      console.info("[colorMetrics_autoRefresh_0100] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor !== undefined).assertTrue();
      console.info('[colorMetrics_autoRefresh_0100] END');
      done();
    });

    /**
     * @tc.name   colorMetrics_autoRefresh_0200
     * @tc.number SUB_ARKUI_COLORMETRICS_AUTOREFRESH_0200
     * @tc.desc   Test ColorMetrics autoRefresh property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('colorMetrics_autoRefresh_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[colorMetrics_autoRefresh_0200] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('colorMetrics_autoRefresh_false');
      console.info("[colorMetrics_autoRefresh_0200] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor !== undefined).assertTrue();
      console.info('[colorMetrics_autoRefresh_0200] END');
      done();
    });

    /**
     * @tc.name   colorMetrics_autoRefresh_0300
     * @tc.number SUB_ARKUI_COLORMETRICS_AUTOREFRESH_0300
     * @tc.desc   Test ColorMetrics autoRefresh property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('colorMetrics_autoRefresh_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[colorMetrics_autoRefresh_0300] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('colorMetrics_autoRefresh_undefined');
      console.info("[colorMetrics_autoRefresh_0300] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor !== undefined).assertTrue();
      console.info('[colorMetrics_autoRefresh_0300] END');
      done();
    });

    /**
     * @tc.name   colorMetrics_autoRefresh_0400
     * @tc.number SUB_ARKUI_COLORMETRICS_AUTOREFRESH_0400
     * @tc.desc   Test ColorMetrics autoRefresh property with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('colorMetrics_autoRefresh_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[colorMetrics_autoRefresh_0400] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('colorMetrics_autoRefresh_null');
      console.info("[colorMetrics_autoRefresh_0400] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor !== undefined).assertTrue();
      console.info('[colorMetrics_autoRefresh_0400] END');
      done();
    });

    /**
     * @tc.name   lengthMetrics_autoRefresh_0100
     * @tc.number SUB_ARKUI_LENGTHMETRICS_AUTOREFRESH_0100
     * @tc.desc   Test LengthMetrics autoRefresh property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lengthMetrics_autoRefresh_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lengthMetrics_autoRefresh_0100] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lengthMetrics_autoRefresh_true');
      console.info("[lengthMetrics_autoRefresh_0100] padding: " + JSON.stringify(JSON.parse(strJson).$attrs.padding));
      expect(JSON.parse(strJson).$attrs.padding !== undefined).assertTrue();
      console.info('[lengthMetrics_autoRefresh_0100] END');
      done();
    });

    /**
     * @tc.name   lengthMetrics_autoRefresh_0200
     * @tc.number SUB_ARKUI_LENGTHMETRICS_AUTOREFRESH_0200
     * @tc.desc   Test LengthMetrics autoRefresh property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lengthMetrics_autoRefresh_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lengthMetrics_autoRefresh_0200] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lengthMetrics_autoRefresh_false');
      console.info("[lengthMetrics_autoRefresh_0200] padding: " + JSON.stringify(JSON.parse(strJson).$attrs.padding));
      expect(JSON.parse(strJson).$attrs.padding !== undefined).assertTrue();
      console.info('[lengthMetrics_autoRefresh_0200] END');
      done();
    });

    /**
     * @tc.name   lengthMetrics_autoRefresh_0300
     * @tc.number SUB_ARKUI_LENGTHMETRICS_AUTOREFRESH_0300
     * @tc.desc   Test LengthMetrics autoRefresh property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lengthMetrics_autoRefresh_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lengthMetrics_autoRefresh_0300] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lengthMetrics_autoRefresh_undefined');
      console.info("[lengthMetrics_autoRefresh_0300] padding: " + JSON.stringify(JSON.parse(strJson).$attrs.padding));
      expect(JSON.parse(strJson).$attrs.padding !== undefined).assertTrue();
      console.info('[lengthMetrics_autoRefresh_0300] END');
      done();
    });

    /**
     * @tc.name   lengthMetrics_autoRefresh_0400
     * @tc.number SUB_ARKUI_LENGTHMETRICS_AUTOREFRESH_0400
     * @tc.desc   Test LengthMetrics autoRefresh property with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lengthMetrics_autoRefresh_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lengthMetrics_autoRefresh_0400] START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('lengthMetrics_autoRefresh_null');
      console.info("[lengthMetrics_autoRefresh_0400] padding: " + JSON.stringify(JSON.parse(strJson).$attrs.padding));
      expect(JSON.parse(strJson).$attrs.padding !== undefined).assertTrue();
      console.info('[lengthMetrics_autoRefresh_0400] END');
      done();
    });
  })
}