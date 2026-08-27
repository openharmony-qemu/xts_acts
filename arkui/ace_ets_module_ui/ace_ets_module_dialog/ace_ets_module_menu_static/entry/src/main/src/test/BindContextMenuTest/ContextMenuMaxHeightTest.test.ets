'use static';

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { describe, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../../hypium/index";
import router from '@ohos.router';
import drawing from '@ohos.graphics.drawing';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils';
import { BarState } from '@ohos.arkui.component';

export default function ContextMenuMaxHeightTest(): void {
  describe('ContextMenuMaxHeightTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ContextMenuMaxHeight beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ContextMenuMaxHeight state pages:" + JSON.stringify(pages));
        if (!("bindContextMenu" == pages.name)) {
          console.info("get  ContextMenuMaxHeight pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/bindContextMenu/ContextMenuMaxHeight',
          })
        }
      } catch (err) {
        console.error("push ContextMenuMaxHeight page error:" + err);
      }
      console.info("ContextMenuMaxHeight foreEach end");
    });

    /**
     * @tc.name   ContextMenuMaxHeightTest_0100
     * @tc.number SUB_ARKUI_API_ContextMenuMaxHeightTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContextMenuMaxHeightTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[ContextMenuMaxHeightTest_0100] START');
        let driver = Driver.create();
        await Utils.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('SetMaxHeightPercent');
        let strJson2 = inspector.getInspectorByKey('SetMaxHeightVp');
        let strJson3 = inspector.getInspectorByKey('SetMaxHeightPx');
        let strJson4 = inspector.getInspectorByKey('SetMaxHeightFp');
        let strJson5 = inspector.getInspectorByKey('SetMaxHeightLpx');
        let strJson6 = inspector.getInspectorByKey('SetMaxHeight_0');
        let strJson7 = inspector.getInspectorByKey('SetMaxHeight_-1');
        let strJson8 = inspector.getInspectorByKey('SetMaxHeightUndefined');
        console.info('hello: ' + Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('height').split('.')[0]));
        console.info('hello: ' + Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('height').split('.')[0]));
        console.info('hello: ' + Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('height').split('.')[0]));
        console.info('hello: ' + Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('height').split('.')[0]));
        console.info('hello: ' + Number(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('height').split('.')[0]));
        console.info('hello: ' + Number(JSON.parseJsonElement(strJson6).getElement('$attrs').getString('height').split('.')[0]));
        console.info('hello: ' + Number(JSON.parseJsonElement(strJson7).getElement('$attrs').getString('height').split('.')[0]));
        console.info('hello: ' + Number(JSON.parseJsonElement(strJson8).getElement('$attrs').getString('height').split('.')[0]));

        expect(BarState.Off).assertEqual(0);
        expect(BarState.Auto).assertEqual(1);
        expect(BarState.On).assertEqual(2);

        expect(Math.floor(Math.abs(Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('height').split('.')[0]) -16)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('height').split('.')[0]) -16)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('height').split('.')[0]) -16)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('height').split('.')[0]) -16)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Number(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('height').split('.')[0]) -16)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Number(JSON.parseJsonElement(strJson6).getElement('$attrs').getString('height').split('.')[0]) -16)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Number(JSON.parseJsonElement(strJson7).getElement('$attrs').getString('height').split('.')[0]) -16)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Number(JSON.parseJsonElement(strJson8).getElement('$attrs').getString('height').split('.')[0]) -16)) <= 1).assertTrue();

        console.info('[ContextMenuMaxHeightTest_0100] END');
        done();
      } catch (err) {
        console.info('ContextMenuMaxHeightTest err: ' + JSON.stringify(err));
        done();
      }
    });
    
  })
}