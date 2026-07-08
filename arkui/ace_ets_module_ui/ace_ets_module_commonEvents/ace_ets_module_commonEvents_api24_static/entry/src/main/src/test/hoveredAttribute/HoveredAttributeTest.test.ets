'use static';
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Point } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function HoveredAttributeTest(): void {
  describe('HoveredAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api24.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/hoveredAttribute/HoveredAttributeTestPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[HoveredAttributeTest] get state pages: " + JSON.stringify(pages));
        if (!("HoveredAttributeTestPage" == pages.name)) {
          console.info("[HoveredAttributeTest] page name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("[HoveredAttributeTest] push page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("[HoveredAttributeTest] afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100
     * @tc.name      applyHoveredAttributeHoverTest
     * @tc.desc      Test applyHoveredAttribute hover effect on Button.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('applyHoveredAttributeHoverTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('modifierHoverBtn'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] modifierHoverBtn center: ' + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('modifierHoverBtn');
      let obj = JSON.parseJsonElement(strJson);
      let hoverColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] hoverColor: ' + hoverColor);
      expect(hoverColor).assertEqual('#FFFF0000');

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] moveOutBtn center: ' + JSON.stringify(moveOutCenter));
      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('modifierHoverBtn');
      obj = JSON.parseJsonElement(strJson);
      let normalColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0100] normalColor: ' + normalColor);
      expect(normalColor).assertEqual('#FF000000');

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
    it('applyHoveredAttributeStateSwitch', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('modifierHoverBtn'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);

      for (let i: number = 0; i < 3; i++) {
        await driver.mouseMoveTo(center);
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('modifierHoverBtn');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');

        await driver.mouseMoveTo(moveOutCenter);
        await CommonFunc.sleep(1000);
        strJson = inspector.getInspectorByKey('modifierHoverBtn');
        obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF000000');
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
    it('applyHoveredAttributeInitialColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('modifierHoverBtn');
      let obj = JSON.parseJsonElement(strJson);
      let initialColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0300] initialColor: ' + initialColor);
      expect(initialColor).assertEqual('#FF000000');

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
    it('applyHoveredAttributeMoveOut', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('modifierHoverBtn'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(1000);

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('modifierHoverBtn');
      let obj = JSON.parseJsonElement(strJson);
      let normalColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0400] normalColor: ' + normalColor);
      expect(normalColor).assertEqual('#FF000000');

      console.info('[SUB_ACE_ARKUI_APPLYHOVEREDATTRIBUTE_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_STATESTYLES_HOVERED_0100
     * @tc.name      stateStylesHoveredHoverTest
     * @tc.desc      Test stateStyles hovered effect on Text.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('stateStylesHoveredHoverTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('stateHoverText'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0100] stateHoverText center: ' + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('stateHoverText');
      let obj = JSON.parseJsonElement(strJson);
      let hoverColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0100] hoverColor: ' + hoverColor);
      expect(hoverColor).assertEqual('#FFFF0000');

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('stateHoverText');
      obj = JSON.parseJsonElement(strJson);
      let normalColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0100] normalColor: ' + normalColor);
      expect(normalColor).assertEqual('#FF0000FF');

      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_STATESTYLES_HOVERED_0200
     * @tc.name      stateStylesHoveredStateSwitch
     * @tc.desc      Test stateStyles hovered state switch multiple times.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('stateStylesHoveredStateSwitch', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('stateHoverText'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);

      for (let i: number = 0; i < 3; i++) {
        await driver.mouseMoveTo(center);
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('stateHoverText');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');

        await driver.mouseMoveTo(moveOutCenter);
        await CommonFunc.sleep(1000);
        strJson = inspector.getInspectorByKey('stateHoverText');
        obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF');
      }

      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_STATESTYLES_HOVERED_0300
     * @tc.name      stateStylesHoveredInitialColor
     * @tc.desc      Test stateStyles hovered initial background color.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('stateStylesHoveredInitialColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('stateHoverText');
      let obj = JSON.parseJsonElement(strJson);
      let initialColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0300] initialColor: ' + initialColor);
      expect(initialColor).assertEqual('#FF0000FF');

      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_STATESTYLES_HOVERED_0400
     * @tc.name      stateStylesHoveredMoveOut
     * @tc.desc      Test stateStyles hovered move out after hover.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('stateStylesHoveredMoveOut', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('stateHoverText'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(1000);

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('stateHoverText');
      let obj = JSON.parseJsonElement(strJson);
      let normalColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0400] normalColor: ' + normalColor);
      expect(normalColor).assertEqual('#FF0000FF');

      console.info('[SUB_ACE_ARKUI_STATESTYLES_HOVERED_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ONHOVER_HOVERED_0100
     * @tc.name      onHoverHoveredHoverTest
     * @tc.desc      Test onHover effect on Text.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('onHoverHoveredHoverTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('frameNodeHoverText'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0100] frameNodeHoverText center: ' + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('frameNodeHoverText');
      let obj = JSON.parseJsonElement(strJson);
      let hoverColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0100] hoverColor: ' + hoverColor);
      expect(hoverColor).assertEqual('#FF0000FF');

      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('frameNodeHoverText');
      obj = JSON.parseJsonElement(strJson);
      let normalColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0100] normalColor: ' + normalColor);
      expect(normalColor).assertEqual('#FF008000');

      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ONHOVER_HOVERED_0200
     * @tc.name      onHoverHoveredStateSwitch
     * @tc.desc      Test onHover state switch multiple times.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('onHoverHoveredStateSwitch', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('frameNodeHoverText'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);

      for (let i: number = 0; i < 3; i++) {
        await driver.mouseMoveTo(center);
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('frameNodeHoverText');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF');

        await driver.mouseMoveTo(moveOutCenter);
        await CommonFunc.sleep(1000);
        strJson = inspector.getInspectorByKey('frameNodeHoverText');
        obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF008000');
      }

      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ONHOVER_HOVERED_0300
     * @tc.name      onHoverHoveredRemove
     * @tc.desc      Test onHover after remove button clicked.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('onHoverHoveredRemove', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let removeBtn = await driver.findComponent(ON.id('frameNodeRemoveBtn'));
      await removeBtn?.click();
      await CommonFunc.sleep(1000);

      let component = await driver.findComponent(ON.id('frameNodeHoverText'));
      let center: Point = await (component?.getBoundsCenter() as Promise<Point>);
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0300] frameNodeHoverText center: ' + JSON.stringify(center));
      await driver.mouseMoveTo(center);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('frameNodeHoverText');
      let obj = JSON.parseJsonElement(strJson);
      let hoverColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0300] hoverColor: ' + hoverColor);
      expect(hoverColor).assertEqual('#FF008000');

      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_ONHOVER_HOVERED_0400
     * @tc.name      onHoverHoveredNormalState
     * @tc.desc      Test onHover normal state.
     * @tc.level     LEVEL1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('onHoverHoveredNormalState', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let moveOutComponent = await driver.findComponent(ON.id('moveOutBtn'));
      let moveOutCenter: Point = await (moveOutComponent?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo(moveOutCenter);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('frameNodeHoverText');
      let obj = JSON.parseJsonElement(strJson);
      let normalColor: string = obj.getElement('$attrs').getString('backgroundColor');
      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0400] normalColor: ' + normalColor);
      expect(normalColor).assertEqual('#FF008000');

      console.info('[SUB_ACE_ARKUI_ONHOVER_HOVERED_0400] END');
      done();
    });
  });
}