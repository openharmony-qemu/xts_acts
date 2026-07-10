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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import hilog from '@ohos.hilog';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { ButtonType, ControlSize } from '@kit.ArkUI';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';

export default function ExtendableGridBuiltInTest() {
  describe('ExtendableGridBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableGridBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableGridBuiltIn",
      }
      try {
        const ExtendableGridBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableGridBuiltInTest.clear();
        let pages: router.RouterState = ExtendableGridBuiltInTest.getState();
        console.info("get ExtendableGridBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableGridBuiltIn" == pages.name)) {
          console.info("get ExtendableGridBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableGridBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableGridBuiltInTest page error:" + err);
      }
      console.info("ExtendableGridBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableGridBuiltInTest after each called");
    });

    afterAll(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExtendableGridBuiltInTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableGridBuiltIn_ColumnsTemplate_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_GRID_COLUMNS_TEMPLATE_0100
     * @tc.desc: Test ExtendableGrid columnsTemplate property
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableGridBuiltIn_ColumnsTemplate_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableGridBuiltIn_ColumnsTemplate_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableGrid_001');
      await CommonFunc.sleep(1000);
      let columnsTemplate=JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')
      console.info("[ExtendableGridBuiltIn_ColumnsTemplate_0100] columnsTemplate is: " + columnsTemplate);
      expect(columnsTemplate).assertEqual('repeat(auto-fit, 70)');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableGridBuiltIn_ColumnsTemplate_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableGridBuiltIn_CustomAttribute_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_GRID_CUSTOM_ATTRIBUTE_0200
     * @tc.desc: Test ExtendableGrid with custom newAttribute method (columnsGap, rowsGap, height)
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableGridBuiltIn_CustomAttribute_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableGridBuiltIn_CustomAttribute_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableGrid_001');
      await CommonFunc.sleep(1000);
      let columnsGap=JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsGap')
      let rowsGap=JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap')
      let height=JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')
      console.info("[ExtendableGridBuiltIn_CustomAttribute_0200] columnsGap is: " + columnsGap + ", rowsGap is: " + rowsGap + ", height is: " + height);
      expect(columnsGap).assertEqual('10.00vp');
      expect(rowsGap).assertEqual('10.00vp');
      expect(height).assertEqual('100.00vp');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableGridBuiltIn_CustomAttribute_0200] END');
      done();
    });

    /**
     * @tc.name: ExtendableGridBuiltIn_Border_0300
     * @tc.number: SUB_ARKUI_EXTENDABLE_GRID_BORDER_0300
     * @tc.desc: Test ExtendableGrid border property
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableGridBuiltIn_Border_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableGridBuiltIn_Border_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableGrid_001');
      await CommonFunc.sleep(1000);
      let borderWidth=JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth')
      let borderColor=JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderColor')
      console.info("[ExtendableGridBuiltIn_Border_0300] borderWidth is: " + borderWidth + ", borderColor is: " + borderColor);
      expect(borderWidth).assertEqual('1.00vp');
      expect(borderColor).assertEqual('#FF000000');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableGridBuiltIn_Border_0300] END');
      done();
    });
  });
}