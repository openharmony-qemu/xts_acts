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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@system.router';
import Utils from '../../MainAbility/common/Utils';

interface OptionsObj {
  uri: string
}

export default function SelectionContainerNormalAttrTest() {
  describe('SelectionContainerNormalAttrTest', () => {
    beforeAll(async () => {
      console.info('[ARKUI_DYN] SelectionContainerNormalAttrTest beforeAll');
    });

    beforeEach(async (done: Function) => {
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerNormalAttr'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('SelectionContainerNormalAttr' == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] SelectionContainerNormalAttrTest push error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await Utils.sleep(500);
    });

    afterAll(async () => {
      router.clear();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_CTOR_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_CTOR_0100
     * @tc.desc   SelectionContainer constructor without options exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_CTOR_0100', Level.LEVEL1, async () => {
      let strJson: string = getInspectorByKey('sc_dyn_attr_ctor');
      expect(strJson).not().assertUndefined();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs).not().assertUndefined();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_OPTIONS_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_OPTIONS_0200
     * @tc.desc   SelectionContainer with SelectionContainerOptions.controller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_OPTIONS_0200', Level.LEVEL1, async () => {
      let strJson: string = getInspectorByKey('sc_dyn_attr_options');
      expect(strJson).not().assertUndefined();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.copyOption).assertEqual('InApp');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_JOIN_NEWLINE_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_JOIN_NEWLINE_0300
     * @tc.desc   textJoinStyle NEWLINE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_JOIN_NEWLINE_0300', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_attr_join_newline'));
      expect(obj.$attrs.textJoinStyle).assertEqual('NEWLINE');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_JOIN_DIRECT_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_JOIN_DIRECT_0400
     * @tc.desc   textJoinStyle DIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_JOIN_DIRECT_0400', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_attr_join_direct'));
      expect(obj.$attrs.textJoinStyle).assertEqual('DIRECT');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_COPY_INAPP_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_COPY_INAPP_0500
     * @tc.desc   copyOption InApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_COPY_INAPP_0500', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_attr_copy_inapp'));
      expect(obj.$attrs.copyOption).assertEqual('InApp');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_COPY_LOCAL_0600
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_COPY_LOCAL_0600
     * @tc.desc   copyOption LocalDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_COPY_LOCAL_0600', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_attr_copy_local'));
      expect(obj.$attrs.copyOption).assertEqual('Local');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_CARET_0700
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_CARET_0700
     * @tc.desc   caretColor Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_CARET_0700', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_attr_caret_red'));
      expect(obj.$attrs.caretColor).not().assertUndefined();
      let caretColor: string = obj.$attrs.caretColor as string;
      let isRed: boolean = caretColor === '#FFFF0000' || caretColor.toLowerCase() === '#ffff0000';
      expect(isRed).assertTrue();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_SELECTED_BG_0800
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_SELECTED_BG_0800
     * @tc.desc   selectedBackgroundColor normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_SELECTED_BG_0800', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_attr_selected_bg'));
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_HAPTIC_TRUE_0900
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_HAPTIC_TRUE_0900
     * @tc.desc   enableHapticFeedback true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_HAPTIC_TRUE_0900', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_attr_haptic_true'));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_DYN_HAPTIC_FALSE_1000
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_DYN_HAPTIC_FALSE_1000
     * @tc.desc   enableHapticFeedback false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_DYN_HAPTIC_FALSE_1000', Level.LEVEL1, async () => {
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('sc_dyn_attr_haptic_false'));
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
    });

  });
}
