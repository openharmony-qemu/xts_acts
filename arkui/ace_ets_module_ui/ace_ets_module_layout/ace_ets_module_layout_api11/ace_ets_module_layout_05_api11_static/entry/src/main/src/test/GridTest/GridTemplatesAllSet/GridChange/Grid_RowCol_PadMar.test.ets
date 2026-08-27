'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function Grid_RowCol_PadMar() {

  describe('Grid_RowCol_PadMarTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("Grid_RowCol_PadMar beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_PadMar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_RowCol_PadMar state pages: " + JSON.stringify(pages));
        if (!("Grid_RowCol_PadMar" == pages.name)) {
          console.info("get Grid_RowCol_PadMar state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_RowCol_PadMar page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_RowCol_PadMarTestTest await err: ' + JSON.stringify(err));
      }
      console.info("Grid_RowCol_PadMar after each called")
    });
    
    
    

/**
     * @tc.number   testGridRowColGridPad_static_01
     * @tc.name     testGridRowColGridPad_static_01
     * @tc.desc     testGridRowColGridPad_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColGridPad_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColGridPad_static_01] START');
            try {
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.info('Grid_RowCol_PadMarTestTest await err: ' + JSON.stringify(err));
      }
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_PadMar' + '_01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let Grid_RowCol_PadMar_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_011');
      let Grid_RowCol_PadMar_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_012');
      let Grid_RowCol_PadMar_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_013');
      let Grid_RowCol_PadMar_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_014');
      let Grid_RowCol_PadMar_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_01');

      expect(Math.abs(Math.round(Grid_RowCol_PadMar_011.left - Grid_RowCol_PadMar_01.left) -
      Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.left - Grid_RowCol_PadMar_011.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_012.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_014.left) <= 1).assertTrue();

      expect(Math.abs(Math.floor(Grid_RowCol_PadMar_01.right - Grid_RowCol_PadMar_012.right) -
      Math.floor(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_012.right) <= 1).assertTrue();

      expect(Math.abs(Math.round(Grid_RowCol_PadMar_011.top - Grid_RowCol_PadMar_01.top) -
      Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_012.top - Grid_RowCol_PadMar_011.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_013.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_014.top) <= 1).assertTrue();

      expect(Math.abs(Math.floor(Grid_RowCol_PadMar_01.bottom - Grid_RowCol_PadMar_013.bottom) -
      Math.floor(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_014.bottom) <= 1).assertTrue();

      console.info(`[testGridRowColGridPad_static_01] Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left=
        ${(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left)}`);
      console.info(`[testGridRowColGridPad_static_01] Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left=
        ${(Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left)}`);
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_013.left) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_014.left) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();

      console.info(`[testGridRowColGridPad_static_01] Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top=
        ${(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top)}`);
      console.info(`[testGridRowColGridPad_static_01] Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top=
        ${(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top)}`);
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_013.top) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_014.bottom - Grid_RowCol_PadMar_014.top) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      console.info('[testGridRowColGridPad_static_01] END');
      done();
    });
    
    
    

/**
     * @tc.number   testGridRowColGridMargin_static_02
     * @tc.name     testGridRowColGridMargin_static_02
     * @tc.desc     testGridRowColGridMargin_static_02
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColGridMargin_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColGridMargin_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addPadding', value: 0
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addMargin', value: 10
      });
            try {
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.info('Grid_RowCol_PadMarTestTest await err: ' + JSON.stringify(err));
      }
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_PadMar' + '_01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let Grid_RowCol_PadMar_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_011');
      let Grid_RowCol_PadMar_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_012');
      let Grid_RowCol_PadMar_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_013');
      let Grid_RowCol_PadMar_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_014');
      let Grid_RowCol_PadMar_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_01');
      let Grid_RowCol_PadMar_Box_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_Box_01');
      expect(Math.abs(Grid_RowCol_PadMar_011.left - Grid_RowCol_PadMar_01.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.left - Grid_RowCol_PadMar_01.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_012.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_014.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_01.right - Grid_RowCol_PadMar_012.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_012.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.top - Grid_RowCol_PadMar_01.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_012.top - Grid_RowCol_PadMar_011.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_013.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_014.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_01.bottom - Grid_RowCol_PadMar_013.bottom) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_014.bottom) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_01.left - Grid_RowCol_PadMar_Box_01.left -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_01.top - Grid_RowCol_PadMar_Box_01.top -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_Box_01.right - Grid_RowCol_PadMar_01.right -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_Box_01.bottom - Grid_RowCol_PadMar_01.bottom -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_013.left -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_014.left -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_013.top -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_014.bottom - Grid_RowCol_PadMar_014.top -
      UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      console.info('[testGridRowColGridMargin_static_02] END');
      done();
    });
    
    
    

/**
     * @tc.number   testGridRowColGridPadMar_static_03
     * @tc.name     testGridRowColGridPadMar_static_03
     * @tc.desc     testGridRowColGridPadMar_static_03
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColGridPadMar_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColGridPadMar_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addPadding', value: 10
      });
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'addMargin', value: 10
      });
            try {
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.info('Grid_RowCol_PadMarTestTest await err: ' + JSON.stringify(err));
      }
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_PadMar' + '_01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let Grid_RowCol_PadMar_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_011');
      let Grid_RowCol_PadMar_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_012');
      let Grid_RowCol_PadMar_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_013');
      let Grid_RowCol_PadMar_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_014');
      let Grid_RowCol_PadMar_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_01');
      let Grid_RowCol_PadMar_Box_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_PadMar' + '_Box_01');

      expect(Math.abs(Grid_RowCol_PadMar_011.left - Grid_RowCol_PadMar_01.left -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_013.left - Grid_RowCol_PadMar_011.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_012.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_014.left) <= 1).assertTrue();

      expect(Math.abs(Math.floor(Grid_RowCol_PadMar_01.right - Grid_RowCol_PadMar_012.right) -
      Math.floor(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_012.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.top - Grid_RowCol_PadMar_01.top -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_012.top - Grid_RowCol_PadMar_011.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_013.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_014.top) <= 1).assertTrue();

      expect(Math.abs(Math.floor(Grid_RowCol_PadMar_01.bottom - Grid_RowCol_PadMar_013.bottom) -
      Math.floor(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_014.bottom) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_PadMar_01.left - Grid_RowCol_PadMar_Box_01.left -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_01.top - Grid_RowCol_PadMar_Box_01.top -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_Box_01.right - Grid_RowCol_PadMar_01.right -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_PadMar_Box_01.bottom - Grid_RowCol_PadMar_01.bottom -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();

      console.info(`[testGridRowColGridPadMar_static_03] Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left=
        ${(Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left)}`);
      console.info(`[testGridRowColGridPadMar_static_03] Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left=
        ${(Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left)}`);
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_011.right - Grid_RowCol_PadMar_011.left) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_012.right - Grid_RowCol_PadMar_012.left) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_013.right - Grid_RowCol_PadMar_013.left) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_014.right - Grid_RowCol_PadMar_014.left) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();

      console.info(`[testGridRowColGridPadMar_static_03] Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top=
        ${(Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top)}`);
      console.info(`[testGridRowColGridPadMar_static_03] Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top=
        ${(Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top)}`);
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_011.bottom - Grid_RowCol_PadMar_011.top) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_012.bottom - Grid_RowCol_PadMar_012.top) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_013.bottom - Grid_RowCol_PadMar_013.top) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((Grid_RowCol_PadMar_014.bottom - Grid_RowCol_PadMar_014.top) -
      UIContext.resolveUIContext()!.vp2px(140))) <= 1).assertTrue();

      console.info('[testGridRowColGridPadMar_static_03] END');
      done();
    });

  })
}
