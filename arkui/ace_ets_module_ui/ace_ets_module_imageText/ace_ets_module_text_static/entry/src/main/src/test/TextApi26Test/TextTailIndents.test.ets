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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function TextTailIndentsTest() {
  describe('TextTailIndentsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextTailIndentsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextTailIndentsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextTailIndents',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextTailIndentsTest state pages:" + JSON.stringify(pages));
        if (!("TextTailIndents" == pages.name)) {
          console.info("get TextTailIndentsTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextTailIndentsTest success ");
        }
      } catch (err) {
        console.error("push TextTailIndentsTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   TextTailIndentsTest_0020
     * @tc.number SUB_ACE_TextTailIndentsTest_0020
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.vp(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0020] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_vp20');
      console.info('[TextTailIndentsTest_0020] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('20.00vp');
      console.info('[TextTailIndentsTest_0020] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0030
     * @tc.number SUB_ACE_TextTailIndentsTest_0030
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.px(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0030] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_px20');
      console.info('[TextTailIndentsTest_0030] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('20.00px');
      console.info('[TextTailIndentsTest_0030] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0040
     * @tc.number SUB_ACE_TextTailIndentsTest_0040
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.fp(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0040] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_fp20');
      console.info('[TextTailIndentsTest_0040] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('20.00fp');
      console.info('[TextTailIndentsTest_0040] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0050
     * @tc.number SUB_ACE_TextTailIndentsTest_0050
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.lpx(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0050] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_lpx20');
      console.info('[TextTailIndentsTest_0050] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('20.00lpx');
      console.info('[TextTailIndentsTest_0050] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0060
     * @tc.number SUB_ACE_TextTailIndentsTest_0060
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.vp(0)) boundary zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0060] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_vp0');
      console.info('[TextTailIndentsTest_0060] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('0.00vp');
      console.info('[TextTailIndentsTest_0060] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0070
     * @tc.number SUB_ACE_TextTailIndentsTest_0070
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.vp(-10)) boundary negative treated as default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0070] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_vpNegative');
      console.info('[TextTailIndentsTest_0070] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('0.00px');
      console.info('[TextTailIndentsTest_0070] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0080
     * @tc.number SUB_ACE_TextTailIndentsTest_0080
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.vp(999)) boundary large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0080] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_vpLarge');
      console.info('[TextTailIndentsTest_0080] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('999.00vp');
      console.info('[TextTailIndentsTest_0080] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0110
     * @tc.number SUB_ACE_TextTailIndentsTest_0110
     * @tc.desc   test the attr of Text: tailIndents(Array<LengthMetrics>) multi-line indent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0110] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_arrayMulti');
      console.info('[TextTailIndentsTest_0110] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('10.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('20.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('30.00vp');
      console.info('[TextTailIndentsTest_0110] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0120
     * @tc.number SUB_ACE_TextTailIndentsTest_0120
     * @tc.desc   test the attr of Text: tailIndents([LengthMetrics.vp(15)]) single-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0120] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_arraySingle');
      console.info('[TextTailIndentsTest_0120] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('15.00vp');
      console.info('[TextTailIndentsTest_0120] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0130
     * @tc.number SUB_ACE_TextTailIndentsTest_0130
     * @tc.desc   test the attr of Text: tailIndents with negative value in array treated as default per element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0130', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0130] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_arrayNegative');
      console.info('[TextTailIndentsTest_0130] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('0.00px');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('20.00vp');
      console.info('[TextTailIndentsTest_0130] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0140
     * @tc.number SUB_ACE_TextTailIndentsTest_0140
     * @tc.desc   test the attr of Text: tailIndents(LengthMetrics.percent(0.5)) percentage not supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0140', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0140] START');
      let strJson = inspector.getInspectorByKey('Text_tailIndents_percent');
      console.info('[TextTailIndentsTest_0140] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('0.00px');
      console.info('[TextTailIndentsTest_0140] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0150
     * @tc.number SUB_ACE_TextTailIndentsTest_0150
     * @tc.desc   test the attr of TextModifier: tailIndents(LengthMetrics.vp(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0150', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0150] START');
      let strJson = inspector.getInspectorByKey('TextModifier_tailIndents_vp20');
      console.info('[TextTailIndentsTest_0150] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('20.00vp');
      console.info('[TextTailIndentsTest_0150] END');
      done();
    });

    /**
     * @tc.name   TextTailIndentsTest_0160
     * @tc.number SUB_ACE_TextTailIndentsTest_0160
     * @tc.desc   test the attr of TextModifier: tailIndents(LengthMetrics.px(20))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextTailIndentsTest_0160', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[TextTailIndentsTest_0160] START');
      let strJson = inspector.getInspectorByKey('TextModifier_tailIndents_px20');
      console.info('[TextTailIndentsTest_0160] tailIndents: ' 
        +JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('tailIndents')).assertContain('20.00px');
      console.info('[TextTailIndentsTest_0160] END');
      done();
    });
  })
}
