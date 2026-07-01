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

export default function SelectionContainerModifierTest() {
  describe('SelectionContainerModifierTest', () => {
    beforeAll(async () => {
      console.info('[SelectionContainerModifierTest] beforeAll called');
      driver = Driver.create();
    });

    beforeEach(async (done: Function) => {
      console.info('[SelectionContainerModifierTest] beforeEach called');
      let options: OptionsObj = {
        uri: 'MainAbility/pages/selectioncontainer/SelectionContainerModifier'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!("SelectionContainerModifier" == pages.name)) {
          await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('[SelectionContainerModifierTest] push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info('[SelectionContainerModifierTest] afterEach called');
      await Utils.sleep(1000);
    });

    afterAll(async () => {
      console.info('[SelectionContainerModifierTest] afterAll called');
      router.clear();
    });

    /**
     * @tc.name   selectionContainerModifierInitial_0100
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_MODIFIER_0100
     * @tc.desc   Test SelectionContainer modifier initial state with applyNormalAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerModifierInitial_0100', Level.LEVEL0, async () => {
      console.info('[selectionContainerModifierInitial_0100] START');
      let strJson: string = getInspectorByKey('selectioncontainer_modifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerModifierInitial_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).assertEqual('InApp');
      let caretColor: string = obj.$attrs.caretColor as string;
      let isRedColor: boolean = caretColor === '#FFFF0000' || caretColor.toLowerCase() === '#ffff0000';
      expect(isRedColor).assertTrue();
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      expect(obj.$attrs.textJoinStyle).assertEqual('NEWLINE');
      console.info('[selectionContainerModifierInitial_0100] END');
    });

    /**
     * @tc.name   selectionContainerModifierDynamic_0200
     * @tc.number SUB_ARKUI_SELECTIONCONTAINER_MODIFIER_0200
     * @tc.desc   Test SelectionContainer modifier dynamic state change via button click
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('selectionContainerModifierDynamic_0200', Level.LEVEL0, async () => {
      console.info('[selectionContainerModifierDynamic_0200] START');
      let btn = await driver.findComponent(ON.id('btn_change_modifier'));
      expect(btn).not().assertUndefined();
      await btn.click();
      await Utils.sleep(500);
      let strJson: string = getInspectorByKey('selectioncontainer_modifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionContainerModifierDynamic_0200] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.copyOption).assertEqual('Local');
      let caretColor: string = obj.$attrs.caretColor as string;
      let isBlueColor: boolean = caretColor === '#FF0000FF' || caretColor.toLowerCase() === '#ff0000ff';
      expect(isBlueColor).assertTrue();
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      expect(obj.$attrs.textJoinStyle).assertEqual('DIRECT');
      console.info('[selectionContainerModifierDynamic_0200] END');
    });
  });
}
