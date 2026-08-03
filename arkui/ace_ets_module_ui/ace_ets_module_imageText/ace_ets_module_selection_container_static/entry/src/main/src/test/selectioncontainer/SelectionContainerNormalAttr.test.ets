'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

export default function SelectionContainerNormalAttrTest(): void {
  describe('SelectionContainerNormalAttrTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] SelectionContainerNormalAttrTest beforeAll');
      await UtilsTest.startAbility('com.arkui.ace.selectionContainer.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectioncontainer/SelectionContainerNormalAttr'
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages.name !== 'SelectionContainerNormalAttr') {
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_NEW] SelectionContainerNormalAttrTest route error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500);
    });

    afterAll(async (): Promise<void> => {
      const routerInstance: Router = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_CTOR_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_CTOR_0100
     * @tc.desc   SelectionContainer constructor without options exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_CTOR_0100', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_ctor');
      expect(strJson).not().assertUndefined();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs')).not().assertUndefined();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_OPTIONS_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_OPTIONS_0200
     * @tc.desc   SelectionContainer setSelectionContainerOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_OPTIONS_0200', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_options');
      expect(strJson).not().assertUndefined();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption')).assertEqual('InApp');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_JOIN_NEWLINE_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_JOIN_NEWLINE_0300
     * @tc.desc   textJoinStyle NEWLINE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_JOIN_NEWLINE_0300', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_join_newline');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textJoinStyle')).assertEqual('NEWLINE');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_JOIN_DIRECT_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_JOIN_DIRECT_0400
     * @tc.desc   textJoinStyle DIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_JOIN_DIRECT_0400', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_join_direct');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textJoinStyle')).assertEqual('DIRECT');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_COPY_INAPP_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_COPY_INAPP_0500
     * @tc.desc   copyOption InApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_COPY_INAPP_0500', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_copy_inapp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption')).assertEqual('InApp');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_COPY_LOCAL_0600
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_COPY_LOCAL_0600
     * @tc.desc   copyOption LocalDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_COPY_LOCAL_0600', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_copy_local');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('copyOption')).assertEqual('Local');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_CARET_0700
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_CARET_0700
     * @tc.desc   caretColor Color.Red
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_CARET_0700', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_caret_red');
      let caretColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretColor');
      let isRed: boolean = caretColor === '#FFFF0000' || caretColor.toLowerCase() === '#ffff0000';
      expect(isRed).assertTrue();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_SELECTED_BG_0800
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_SELECTED_BG_0800
     * @tc.desc   selectedBackgroundColor normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_SELECTED_BG_0800', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_selected_bg');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedBackgroundColor'))
        .not().assertUndefined();
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_HAPTIC_TRUE_0900
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_HAPTIC_TRUE_0900
     * @tc.desc   enableHapticFeedback true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_HAPTIC_TRUE_0900', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_haptic_true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableHapticFeedback')).assertEqual('true');
    });

    /**
     * @tc.name   SUB_ARKUI_SELECTIONCONTAINER_STATIC_HAPTIC_FALSE_1000
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_STATIC_HAPTIC_FALSE_1000
     * @tc.desc   enableHapticFeedback false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_SELECTIONCONTAINER_STATIC_HAPTIC_FALSE_1000', Level.LEVEL1, async () => {
      let strJson: string = inspector.getInspectorByKey('sc_static_attr_haptic_false');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableHapticFeedback'))
        .assertEqual('false');
    });

  });
}
