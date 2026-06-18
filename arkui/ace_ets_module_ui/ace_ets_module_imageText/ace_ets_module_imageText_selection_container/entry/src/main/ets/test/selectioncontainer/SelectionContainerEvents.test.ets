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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@system.router';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';

interface OptionsObj {
  uri: string
}

let driver: Driver;

export default function SelectionContainerEventsTest() {
  describe('SelectionContainerEventsTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerEventsTest] beforeAll called');
      driver = Driver.create();
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerEventsTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerEvents'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerEvents" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerEventsTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerEventsTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerEventsTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerOnTextSelectionChange_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ONTEXTSELECTIONCHANGE_EVENT_0100
     * @tc.desc   Test SelectionContainer onTextSelectionChange event initial state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerOnTextSelectionChange_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerOnTextSelectionChange_0100] START');
      let resultText = await driver.findComponent(ON.id('text_onselectionchange_result'));
      expect(resultText).not().assertUndefined();
      let text: string = await resultText.getText();
      expect(text).assertEqual('onTextSelectionChange: false');
      console.info('[selectionContainerOnTextSelectionChange_0100] END');
    });

    /**
     * @tc.name   selectionContainerOnTextSelectionChangeTrigger_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ONTEXTSELECTIONCHANGE_EVENT_0200
     * @tc.desc   Test SelectionContainer onTextSelectionChange event triggered by long click
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('selectionContainerOnTextSelectionChangeTrigger_0200', Level.LEVEL1, async () => {
      console.info('[selectionContainerOnTextSelectionChangeTrigger_0200] START');
      let component = await driver.findComponent(ON.id('selectioncontainer_events'));
      expect(component).not().assertUndefined();
      await component.longClick();
      await Utils.sleep(600);
      let resultText = await driver.findComponent(ON.id('text_onselectionchange_result'));
      let text: string = await resultText.getText();
      expect(text).assertContain('onTextSelectionChange:');
      console.info('[selectionContainerOnTextSelectionChangeTrigger_0200] result text: ' + text);
      console.info('[selectionContainerOnTextSelectionChangeTrigger_0200] END');
    });

    /**
     * @tc.name   selectionContainerOnWillCopy_0300
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ONWILLCOPY_EVENT_0300
     * @tc.desc   Test SelectionContainer onWillCopy event initial state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerOnWillCopy_0300', Level.LEVEL0, async () => {
      console.info('[selectionContainerOnWillCopy_0300] START');
      let resultText = await driver.findComponent(ON.id('text_onwillcopy_result'));
      expect(resultText).not().assertUndefined();
      let text: string = await resultText.getText();
      expect(text).assertEqual('onWillCopy: false');
      console.info('[selectionContainerOnWillCopy_0300] END');
    });

    /**
     * @tc.name   selectionContainerOnCopy_0400
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_ONCOPY_EVENT_0400
     * @tc.desc   Test SelectionContainer onCopy event initial state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerOnCopy_0400', Level.LEVEL0, async () => {
      console.info('[selectionContainerOnCopy_0400] START');
      let resultText = await driver.findComponent(ON.id('text_oncopy_result'));
      expect(resultText).not().assertUndefined();
      let text: string = await resultText.getText();
      expect(text).assertEqual('onCopy: false');
      console.info('[selectionContainerOnCopy_0400] END');
    });

    /**
     * @tc.name   selectionContainerEventsNull_0500
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_EVENTS_PARAM_0500
     * @tc.desc   Test SelectionContainer events with null callbacks, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEventsNull_0500', Level.LEVEL0, async () => {
      console.info('[selectionContainerEventsNull_0500] START');
      let strJson: string = getInspectorByKey('selectioncontainer_events_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEventsNull_0500] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerEventsNull_0500] END');
    });

    /**
     * @tc.name   selectionContainerEventsUndefined_0600
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_EVENTS_PARAM_0600
     * @tc.desc   Test SelectionContainer events with undefined callbacks, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerEventsUndefined_0600', Level.LEVEL0, async () => {
      console.info('[selectionContainerEventsUndefined_0600] START');
      let strJson: string = getInspectorByKey('selectioncontainer_events_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerEventsUndefined_0600] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SelectionContainer');
      console.info('[selectionContainerEventsUndefined_0600] END');
    });
  });
}
