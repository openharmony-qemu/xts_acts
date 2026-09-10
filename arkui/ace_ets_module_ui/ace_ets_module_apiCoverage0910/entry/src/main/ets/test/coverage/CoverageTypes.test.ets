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
import { Driver, ON } from '@ohos.UiTest';

export default function coverageTypesTest() {
  describe('CoverageTypesTest', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] CoverageTypesTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/coverage/CoverageTypes',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.error('[ARKUI_DYN] CoverageTypesTest push error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_DIALOGOPTIONS_0100
     * @tc.name SUB_ARKUI_APICOVERAGE0910_DIALOGOPTIONS_0100
     * @tc.desc Cover DialogOptionsCornerRadius/BorderWidth/BorderColor/BorderStyle/Shadow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_DIALOGOPTIONS_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let node = getInspectorByKey('dialogOptFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_MATRIX2D_0200
     * @tc.name SUB_ARKUI_APICOVERAGE0910_MATRIX2D_0200
     * @tc.desc Cover Matrix2D constructors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_MATRIX2D_0200', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('matrixFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_COMMONSTATE_0300
     * @tc.name SUB_ARKUI_APICOVERAGE0910_COMMONSTATE_0300
     * @tc.desc Cover PromptActionCommonState / CommonController state alias
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_COMMONSTATE_0300', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('commonCtrlFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_TRIGGERCLICK_0400
     * @tc.name SUB_ARKUI_APICOVERAGE0910_TRIGGERCLICK_0400
     * @tc.desc Cover ButtonTriggerClickCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_TRIGGERCLICK_0400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let node = getInspectorByKey('triggerClickFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('bound');
      let btn = getInspectorByKey('btnTrigger');
      expect(btn.length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_RADIOCB_0500
     * @tc.name SUB_ARKUI_APICOVERAGE0910_RADIOCB_0500
     * @tc.desc Cover OnRadioChangeCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_RADIOCB_0500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(500);
      let node = getInspectorByKey('radioFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('bound');
      let radio = getInspectorByKey('radioCoverage');
      expect(radio.length > 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0910_TRANSITION_0600
     * @tc.name SUB_ARKUI_APICOVERAGE0910_TRANSITION_0600
     * @tc.desc Cover TransitionEffects / TransitionFinishCallback / RenderFit.BOTTOM
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0910_TRANSITION_0600', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('transitionFlag');
      let content: string = JSON.stringify(JSON.parse(node).$attrs.content);
      expect(content.indexOf('ready') >= 0 || content.indexOf('in') >= 0 ||
        content.indexOf('out') >= 0).assertTrue();
      let target: string = getInspectorByKey('transitionTarget');
      expect(target.length > 0).assertTrue();
      done();
    });
  });
}
