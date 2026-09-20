/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

export default function coverage0917BatchTest() {
  describe('Coverage0917BatchTest', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] Coverage0917BatchTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/coverage/Coverage0917Batch',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.error('[ARKUI_DYN] Coverage0917BatchTest push error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_PULSE_0100
     * @tc.name SUB_ARKUI_APICOVERAGE0917_PULSE_0100
     * @tc.desc Cover PulseSymbolEffect constructor and symbolEffect binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_PULSE_0100', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('pulseFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_EFFECTSTRAT_0200
     * @tc.name SUB_ARKUI_APICOVERAGE0917_EFFECTSTRAT_0200
     * @tc.desc Cover SymbolGlyph effectStrategy null/undefined/invalid/NONE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_EFFECTSTRAT_0200', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('effectStratFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_RENDERSTRAT_0300
     * @tc.name SUB_ARKUI_APICOVERAGE0917_RENDERSTRAT_0300
     * @tc.desc Cover SymbolGlyph renderingStrategy null/undefined/invalid
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_RENDERSTRAT_0300', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('renderStratFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_SHADER_0400
     * @tc.name SUB_ARKUI_APICOVERAGE0917_SHADER_0400
     * @tc.desc Cover SymbolGlyph shaderStyle empty/null/undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_SHADER_0400', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('shaderFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_KBAVOID_0500
     * @tc.name SUB_ARKUI_APICOVERAGE0917_KBAVOID_0500
     * @tc.desc Cover UIContext setKeyboardAvoidMode null/undefined/invalid
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_KBAVOID_0500', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('kbAvoidFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_TEXTMENU_0600
     * @tc.name SUB_ARKUI_APICOVERAGE0917_TEXTMENU_0600
     * @tc.desc Cover TextMenuController disableSystemServiceMenuItems null/undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_TEXTMENU_0600', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('textMenuFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_TEXTCONTENT_0700
     * @tc.name SUB_ARKUI_APICOVERAGE0917_TEXTCONTENT_0700
     * @tc.desc Cover TextContentControllerBase getTextContentRect/getTextContentLineCount
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_TEXTCONTENT_0700', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('textContentFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_COUNTER_0800
     * @tc.name SUB_ARKUI_APICOVERAGE0917_COUNTER_0800
     * @tc.desc Cover Counter enableDec/enableInc null/undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_COUNTER_0800', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('counterFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_MARQUEE_0900
     * @tc.name SUB_ARKUI_APICOVERAGE0917_MARQUEE_0900
     * @tc.desc Cover Marquee allowScale null/undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_MARQUEE_0900', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('marqueeFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_RICHEDITOR_1000
     * @tc.name SUB_ARKUI_APICOVERAGE0917_RICHEDITOR_1000
     * @tc.desc Cover RichEditor enableKeyboardOnFocus undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_RICHEDITOR_1000', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('richEditorFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_SEARCHTYPE_1100
     * @tc.name SUB_ARKUI_APICOVERAGE0917_SEARCHTYPE_1100
     * @tc.desc Cover Search type null/invalid enum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_SEARCHTYPE_1100', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('searchTypeFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_SPANSHADOW_1200
     * @tc.name SUB_ARKUI_APICOVERAGE0917_SPANSHADOW_1200
     * @tc.desc Cover Span textShadow empty array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_SPANSHADOW_1200', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('spanShadowFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_TEXTCTOR_1300
     * @tc.name SUB_ARKUI_APICOVERAGE0917_TEXTCTOR_1300
     * @tc.desc Cover Text constructor null/undefined/empty/options overloads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_TEXTCTOR_1300', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('textCtorFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_FONTWEIGHT_1400
     * @tc.name SUB_ARKUI_APICOVERAGE0917_FONTWEIGHT_1400
     * @tc.desc Cover Text fontWeight null/undefined/W200-W900
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_FONTWEIGHT_1400', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('fontWeightFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_TEXTSHADOW_1500
     * @tc.name SUB_ARKUI_APICOVERAGE0917_TEXTSHADOW_1500
     * @tc.desc Cover Text textShadow empty array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_TEXTSHADOW_1500', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('textShadowFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_BINDSEL_1600
     * @tc.name SUB_ARKUI_APICOVERAGE0917_BINDSEL_1600
     * @tc.desc Cover Text bindSelectionMenu invalid span/response types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_BINDSEL_1600', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('bindSelFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_TEXTAREATYPE_1700
     * @tc.name SUB_ARKUI_APICOVERAGE0917_TEXTAREATYPE_1700
     * @tc.desc Cover TextArea type invalid enum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_TEXTAREATYPE_1700', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('textAreaTypeFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_TEXTCLOCKSHADOW_1800
     * @tc.name SUB_ARKUI_APICOVERAGE0917_TEXTCLOCKSHADOW_1800
     * @tc.desc Cover TextClock textShadow empty and filled arrays
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_TEXTCLOCKSHADOW_1800', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('textClockShadowFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_TEXTINPUTCONTENT_1900
     * @tc.name SUB_ARKUI_APICOVERAGE0917_TEXTINPUTCONTENT_1900
     * @tc.desc Cover TextInput contentType invalid enum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_TEXTINPUTCONTENT_1900', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('textInputContentFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_TEXTTIMERSHADOW_2000
     * @tc.name SUB_ARKUI_APICOVERAGE0917_TEXTTIMERSHADOW_2000
     * @tc.desc Cover TextTimer textShadow empty and filled arrays
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_TEXTTIMERSHADOW_2000', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('textTimerShadowFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });
  });
}
