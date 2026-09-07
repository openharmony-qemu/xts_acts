'use static';
/*
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
import { describe, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
export default function CustomSelectionPage() {
   describe('CustomSelectionPage', () => {

     beforeEach(async (): Promise<void> => {
       console.info('CustomSelectionPage beforeEach start');
       let options: router.RouterOptions = {
         url: 'MainAbility/pages/CustomSelect/CustomSelect',
       }
       try {
         const router = AppStorage.get<Router>("router") as Router
         router.clear();
         let pages = router.getState();
         console.info('get CustomSelectionPage state pages:' + JSON.stringify(pages));
         if (!('CustomSelectionPage' == pages.name)) {
           console.info('get CustomSelectionPage pages.name:' + JSON.stringify(pages.name));
           router.pushUrl(options);
           await CommonFunc.sleep(2500);
           // console.info('push CustomSelectionPage page result:' + JSON.stringify(result));
         }
       } catch (err) {
         console.error('push CustomSelectionPage page error:' + err);
       }
       console.info('CustomSelectionPage beforeEach end');
     });
 


     
    
/**
     * @tc.number   selecttest_001
     * @tc.name     selecttest_001
     * @tc.desc     selecttest_001
     * @tc.level    Level.LEVEL3
     */
it('selecttest_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      // try {
        let Key: string = 'select01'
        let strJson = inspector.getInspectorByKey(Key);
        console.log('selecttest_001')
        try {
          await CommonFunc.sleep(1000)
        } catch (err) {
          console.info('CustomSelectTest sleep err: ' + JSON.stringify(err));
        }
        let obj = JSON.parseJsonElement(strJson);
        let objString = obj.getElement('$attrs').tryGetElement('avoidance')
        if(objString) {
          console.info('selecttest_001 ' + JSON.stringifyJsonElement(objString!));
        }

      // } catch(ERROR) {
      //   expect().assertFail();
      // }
      done();
     });
 })
}