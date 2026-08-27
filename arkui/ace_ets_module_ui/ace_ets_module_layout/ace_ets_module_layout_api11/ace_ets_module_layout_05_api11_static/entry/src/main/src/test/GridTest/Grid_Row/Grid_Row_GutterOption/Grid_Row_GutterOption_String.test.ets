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
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function Grid_Row_GutterOption_String() {
  describe('Grid_Row_GutterOption_String', () => {

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_GutterOption_String beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_String',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_GutterOption_String state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_GutterOption_String" == pages.name)) {
          console.info("get Grid_Row_GutterOption_String state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_GutterOption_String page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_GutterOption_StringTest await err: ' + JSON.stringify(err));
      }
      console.info("Grid_Row_GutterOption_String after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterOption_STRING_static_0100
     * @tc.name     SUB_ACE_GridRowGutterOption_STRING_static_0100
     * @tc.desc     SUB_ACE_GridRowGutterOption_STRING_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterOption_STRING_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterOption_STRING_static_0100 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'length', value: '80px' as String
      })
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_GutterOption_StringTest await err: ' + JSON.stringify(err));
      }

      let firstGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String0');
      let secondGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String1');
      let thirdGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String2');

      expect(Math.round(secondGutterOptionStr.left - firstGutterOptionStr.right)).assertEqual(Math.round(80));
      expect(Math.round(thirdGutterOptionStr.top - firstGutterOptionStr.bottom)).assertEqual(Math.round(80));

      console.info('SUB_ACE_GridRowGutterOption_STRING_static_0100 END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterOption_STRING_static_0200
     * @tc.name     SUB_ACE_GridRowGutterOption_STRING_static_0200
     * @tc.desc     SUB_ACE_GridRowGutterOption_STRING_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterOption_STRING_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterOption_STRING_static_0200 START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'length', value: '30%' as String
      })
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_GutterOption_StringTest await err: ' + JSON.stringify(err));
      }

      let firstGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String0');
      let secondGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String1');
      let thirdGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String2');

      expect(Math.abs(Math.round(secondGutterOptionStr.left - firstGutterOptionStr.right) - Math.round(0)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdGutterOptionStr.top - firstGutterOptionStr.bottom) - Math.round(0)) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_STRING_static_0200 END');
      done();
    });
  })
}
