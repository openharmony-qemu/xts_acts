/*
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

import router from '@ohos.router';
import { describe, beforeAll, afterEach, it, expect, Level } from "@ohos/hypium";
import { Driver, ON, Point } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';

export default function HoveredAttributeTest() {
  describe('HoveredAttributeTest', () => {
    beforeAll(async (done: Function) => {
      console.info("[HoveredAttributeTest] beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/hoveredAttribute/HoveredAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("[HoveredAttributeTest] get state success " + JSON.stringify(pages));
        if (!("HoveredAttributeTest" == pages.name)) {
          console.info("[HoveredAttributeTest] page name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("[HoveredAttributeTest] push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("[HoveredAttributeTest] push page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
    });

    // ========== Area1: applyHoveredAttribute ==========

    /**
     * @tc.number    SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100
     * @tc.name      applyHoveredAttributeHoverTest
     * @tc.desc      Test applyHoveredAttribute hover effect on Button.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('applyHoveredAttributeHoverTest', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] START');
      let driver: Driver = Driver.create();

      let component = await driver.findComponent(ON.id('modifierHoverBtn'));
      let bounds = await component.getBounds();
      let centerX: number = Math.floor((bounds.left + bounds.right) / 2);
      let centerY: number = Math.floor((bounds.top + bounds.bottom) / 2);
      let hoverPoint: Point = { x: centerX, y: centerY };
      await driver.mouseMoveTo(hoverPoint);
      await Utils.sleep(500);

      let strJson = getInspectorByKey('modifierHoverBtn');
      let obj: ESObject = JSON.parse(strJson);
      let hoverColor: string = obj.$attrs.backgroundColor;
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] hoverColor: ' + hoverColor);
      expect(hoverColor).assertContain('#FFFF0000');

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutBounds = await moveOutComponent.getBounds();
      let moveOutX: number = Math.floor((moveOutBounds.left + moveOutBounds.right) / 2);
      let moveOutY: number = Math.floor((moveOutBounds.top + moveOutBounds.bottom) / 2);
      let moveOutPoint: Point = { x: moveOutX, y: moveOutY };
      await driver.mouseMoveTo(moveOutPoint);
      await Utils.sleep(500);

      strJson = getInspectorByKey('modifierHoverBtn');
      obj = JSON.parse(strJson);
      let normalColor: string = obj.$attrs.backgroundColor;
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] normalColor: ' + normalColor);
      expect(normalColor).assertContain('#FF000000');

      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0200
     * @tc.name      applyHoveredAttributeStateSwitch
     * @tc.desc      Test applyHoveredAttribute state switch multiple times.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('applyHoveredAttributeStateSwitch', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0200] START');
      let driver: Driver = Driver.create();

      let component = await driver.findComponent(ON.id('modifierHoverBtn'));
      let bounds = await component.getBounds();
      let centerX: number = Math.floor((bounds.left + bounds.right) / 2);
      let centerY: number = Math.floor((bounds.top + bounds.bottom) / 2);
      let hoverPoint: Point = { x: centerX, y: centerY };

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutBounds = await moveOutComponent.getBounds();
      let moveOutX: number = Math.floor((moveOutBounds.left + moveOutBounds.right) / 2);
      let moveOutY: number = Math.floor((moveOutBounds.top + moveOutBounds.bottom) / 2);
      let moveOutPoint: Point = { x: moveOutX, y: moveOutY };

      for (let i: number = 0; i < 3; i++) {
        await driver.mouseMoveTo(hoverPoint);
        await Utils.sleep(500);
        let strJson = getInspectorByKey('modifierHoverBtn');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.backgroundColor).assertContain('#FFFF0000');

        await driver.mouseMoveTo(moveOutPoint);
        await Utils.sleep(500);
        strJson = getInspectorByKey('modifierHoverBtn');
        obj = JSON.parse(strJson);
        expect(obj.$attrs.backgroundColor).assertContain('#FF000000');
      }

      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0300
     * @tc.name      applyHoveredAttributeInitialColor
     * @tc.desc      Test applyHoveredAttribute initial background color.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('applyHoveredAttributeInitialColor', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0300] START');
      let driver: Driver = Driver.create();

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutBounds = await moveOutComponent.getBounds();
      let moveOutX: number = Math.floor((moveOutBounds.left + moveOutBounds.right) / 2);
      let moveOutY: number = Math.floor((moveOutBounds.top + moveOutBounds.bottom) / 2);
      let moveOutPoint: Point = { x: moveOutX, y: moveOutY };
      await driver.mouseMoveTo(moveOutPoint);
      await Utils.sleep(500);

      let strJson = getInspectorByKey('modifierHoverBtn');
      let obj: ESObject = JSON.parse(strJson);
      let initialColor: string = obj.$attrs.backgroundColor;
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0300] initialColor: ' + initialColor);
      expect(initialColor).assertContain('#FF000000');

      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0400
     * @tc.name      applyHoveredAttributeMoveOut
     * @tc.desc      Test applyHoveredAttribute move out after hover.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('applyHoveredAttributeMoveOut', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0400] START');
      let driver: Driver = Driver.create();

      let component = await driver.findComponent(ON.id('modifierHoverBtn'));
      let bounds = await component.getBounds();
      let centerX: number = Math.floor((bounds.left + bounds.right) / 2);
      let centerY: number = Math.floor((bounds.top + bounds.bottom) / 2);
      let hoverPoint: Point = { x: centerX, y: centerY };
      await driver.mouseMoveTo(hoverPoint);
      await Utils.sleep(300);

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutBounds = await moveOutComponent.getBounds();
      let moveOutX: number = Math.floor((moveOutBounds.left + moveOutBounds.right) / 2);
      let moveOutY: number = Math.floor((moveOutBounds.top + moveOutBounds.bottom) / 2);
      let moveOutPoint: Point = { x: moveOutX, y: moveOutY };
      await driver.mouseMoveTo(moveOutPoint);
      await Utils.sleep(500);

      let strJson = getInspectorByKey('modifierHoverBtn');
      let obj: ESObject = JSON.parse(strJson);
      let normalColor: string = obj.$attrs.backgroundColor;
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0400] normalColor: ' + normalColor);
      expect(normalColor).assertContain('#FF000000');

      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0400] END');
      done();
    });

    // ========== Area3: addSupportedUIStates HOVERED ==========

    /**
     * @tc.number    SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0100
     * @tc.name      addSupportedUIStatesHoveredHoverTest
     * @tc.desc      Test addSupportedUIStates HOVERED effect on FrameNode Text.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('addSupportedUIStatesHoveredHoverTest', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0100] START');
      let driver: Driver = Driver.create();

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutBounds = await moveOutComponent.getBounds();
      let moveOutX: number = Math.floor((moveOutBounds.left + moveOutBounds.right) / 2);
      let moveOutY: number = Math.floor((moveOutBounds.top + moveOutBounds.bottom) / 2);
      let moveOutPoint: Point = { x: moveOutX, y: moveOutY };
      await driver.mouseMoveTo(moveOutPoint);
      await Utils.sleep(500);

      let component = await driver.findComponent(ON.id('frameNodeHoverText'));
      let bounds = await component.getBounds();
      let centerX: number = Math.floor((bounds.left + bounds.right) / 2);
      let centerY: number = Math.floor((bounds.top + bounds.bottom) / 2);
      let hoverPoint: Point = { x: centerX, y: centerY };
      await driver.mouseMoveTo(hoverPoint);
      await Utils.sleep(500);

      let strJson = getInspectorByKey('frameNodeHoverText');
      let obj: ESObject = JSON.parse(strJson);
      let hoverColor: string = obj.$attrs.backgroundColor;
      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0100] hoverColor: ' + hoverColor);
      expect(hoverColor).assertContain('#FF0000FF');

      await driver.mouseMoveTo(moveOutPoint);
      await Utils.sleep(500);

      strJson = getInspectorByKey('frameNodeHoverText');
      obj = JSON.parse(strJson);
      let normalColor: string = obj.$attrs.backgroundColor;
      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0100] normalColor: ' + normalColor);
      expect(normalColor).assertContain('#FF008000');

      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0200
     * @tc.name      addSupportedUIStatesHoveredStateSwitch
     * @tc.desc      Test addSupportedUIStates HOVERED state switch multiple times.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('addSupportedUIStatesHoveredStateSwitch', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0200] START');
      let driver: Driver = Driver.create();

      let component = await driver.findComponent(ON.id('frameNodeHoverText'));
      let bounds = await component.getBounds();
      let centerX: number = Math.floor((bounds.left + bounds.right) / 2);
      let centerY: number = Math.floor((bounds.top + bounds.bottom) / 2);
      let hoverPoint: Point = { x: centerX, y: centerY };

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutBounds = await moveOutComponent.getBounds();
      let moveOutX: number = Math.floor((moveOutBounds.left + moveOutBounds.right) / 2);
      let moveOutY: number = Math.floor((moveOutBounds.top + moveOutBounds.bottom) / 2);
      let moveOutPoint: Point = { x: moveOutX, y: moveOutY };

      for (let i: number = 0; i < 3; i++) {
        await driver.mouseMoveTo(hoverPoint);
        await Utils.sleep(500);
        let strJson = getInspectorByKey('frameNodeHoverText');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.backgroundColor).assertContain('#FF0000FF');

        await driver.mouseMoveTo(moveOutPoint);
        await Utils.sleep(500);
        strJson = getInspectorByKey('frameNodeHoverText');
        obj = JSON.parse(strJson);
        expect(obj.$attrs.backgroundColor).assertContain('#FF008000');
      }

      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0300
     * @tc.name      addSupportedUIStatesHoveredRemove
     * @tc.desc      Test removeSupportedUIStates then hover should not change color.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('addSupportedUIStatesHoveredRemove', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0300] START');
      let driver: Driver = Driver.create();

      let removeBtn = await driver.findComponent(ON.id('frameNodeRemoveBtn'));
      await removeBtn.click();
      await Utils.sleep(500);

      let component = await driver.findComponent(ON.id('frameNodeHoverText'));
      let bounds = await component.getBounds();
      let centerX: number = Math.floor((bounds.left + bounds.right) / 2);
      let centerY: number = Math.floor((bounds.top + bounds.bottom) / 2);
      let hoverPoint: Point = { x: centerX, y: centerY };
      await driver.mouseMoveTo(hoverPoint);
      await Utils.sleep(500);

      let strJson = getInspectorByKey('frameNodeHoverText');
      let obj: ESObject = JSON.parse(strJson);
      let hoverColor: string = obj.$attrs.backgroundColor;
      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0300] hoverColor: ' + hoverColor);
      expect(hoverColor).assertContain('#FF008000');

      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0400
     * @tc.name      addSupportedUIStatesHoveredNormalState
     * @tc.desc      Test NORMAL state judgment logic with == operator.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('addSupportedUIStatesHoveredNormalState', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0400] START');
      let driver: Driver = Driver.create();

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutBounds = await moveOutComponent.getBounds();
      let moveOutX: number = Math.floor((moveOutBounds.left + moveOutBounds.right) / 2);
      let moveOutY: number = Math.floor((moveOutBounds.top + moveOutBounds.bottom) / 2);
      let moveOutPoint: Point = { x: moveOutX, y: moveOutY };
      await driver.mouseMoveTo(moveOutPoint);
      await Utils.sleep(500);

      let strJson = getInspectorByKey('frameNodeHoverText');
      let obj: ESObject = JSON.parse(strJson);
      let normalColor: string = obj.$attrs.backgroundColor;
      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0400] normalColor: ' + normalColor);
      expect(normalColor).assertContain('#FF008000');

      console.info('[SUB_ACE_ARKUI_ADDSUPPORTEDUISTATES_HOVERED_0400] END');
      done();
    });
  });
}