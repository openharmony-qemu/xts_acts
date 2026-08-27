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
import inspector from '@ohos.arkui.inspector'
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager';
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function Grid_Row_GutterOption_Default() {
  describe('Grid_Row_GutterOption_Default', () => {

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_GutterOption_Default beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_Default',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_GutterOption_Default state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_GutterOption_Default" == pages.name)) {
          console.info("get Grid_Row_GutterOption_Default state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_GutterOption_Default page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_GutterOption_DefaultTest await err: ' + JSON.stringify(err));
      }
      console.info("Grid_Row_GutterOption_Default after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterOption_Default_static_0100
     * @tc.name     SUB_ACE_GridRowGutterOption_Default_static_0100
     * @tc.desc     SUB_ACE_GridRowGutterOption_Default_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterOption_Default_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterOption_Default_static_0100 START');
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_GutterOption_DefaultTest await err: ' + JSON.stringify(err));
      }

      let GutterOption_1: RectValue = CommonFunc.getComponentRect('GutterOptionChange_001');
      let firstGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_0');
      let secondGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_1');
      let thirdGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_2');
      let gridRowGutterOptionJson = inspector.getInspectorByKey('GutterOptionChange_001');
     expect(JSON.parseJsonElement(gridRowGutterOptionJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(firstGutterOption.top - GutterOption_1.top) <= 1).assertTrue();
      expect(Math.abs(firstGutterOption.left - GutterOption_1.left) <= 1).assertTrue();

      expect(Math.abs(secondGutterOption.left - firstGutterOption.right - UIContext.resolveUIContext()!.vp2px(0)) <=
        1).assertTrue();
      expect(Math.abs(thirdGutterOption.top - firstGutterOption.bottom - UIContext.resolveUIContext()!.vp2px(0)) <=
        1).assertTrue();


      console.info('SUB_ACE_GridRowGutterOption_Default_static_0100 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterOption_Default_static_0200
     * @tc.name     SUB_ACE_GridRowGutterOption_Default_static_0200
     * @tc.desc     SUB_ACE_GridRowGutterOption_Default_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterOption_Default_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterOption_Default_static_0200 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'optionX', value: 10.0
      })
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_GutterOption_DefaultTest await err: ' + JSON.stringify(err));
      }

      let GutterOption_1: RectValue = CommonFunc.getComponentRect('GutterOptionChange_001');
      let firstGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_0');
      let secondGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_1');
      let thirdGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_2');
      let gridRowGutterOptionJson = inspector.getInspectorByKey('GutterOptionChange_001');
     expect(JSON.parseJsonElement(gridRowGutterOptionJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(firstGutterOption.top - GutterOption_1.top) <= 1).assertTrue();
      expect(Math.abs(firstGutterOption.left - GutterOption_1.left) <= 1).assertTrue();

      expect(Math.abs(secondGutterOption.left - firstGutterOption.right - UIContext.resolveUIContext()!.vp2px(10)) <=
        1).assertTrue();
      expect(Math.abs(thirdGutterOption.top - firstGutterOption.bottom - UIContext.resolveUIContext()!.vp2px(0)) <=
        1).assertTrue();


      console.info('SUB_ACE_GridRowGutterOption_Default_static_0200 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterOption_Default_static_0300
     * @tc.name     SUB_ACE_GridRowGutterOption_Default_static_0300
     * @tc.desc     SUB_ACE_GridRowGutterOption_Default_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterOption_Default_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterOption_Default_static_0300 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'optionX', value: 0.0
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'optionY', value: 10.0
      })
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_GutterOption_DefaultTest await err: ' + JSON.stringify(err));
      }

      let GutterOption_1: RectValue = CommonFunc.getComponentRect('GutterOptionChange_001');
      let firstGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_0');
      let secondGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_1');
      let thirdGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_2');
      let gridRowGutterOptionJson = inspector.getInspectorByKey('GutterOptionChange_001');
     expect(JSON.parseJsonElement(gridRowGutterOptionJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(firstGutterOption.top - GutterOption_1.top) <= 1).assertTrue();
      expect(Math.abs(firstGutterOption.left - GutterOption_1.left) <= 1).assertTrue();

      expect(Math.abs(Math.abs(secondGutterOption.left - firstGutterOption.right) -
      Math.abs(UIContext.resolveUIContext()!.vp2px(0))) <= 1).assertTrue();
      expect(Math.abs(Math.abs(thirdGutterOption.top - firstGutterOption.bottom) -
      Math.abs(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();


      console.info('SUB_ACE_GridRowGutterOption_Default_static_0300 END');
      done();
    });


  })
}
