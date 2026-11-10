'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it,Level } from "@ohos/hypium-static/src/main/indexStatic";import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
let libUtil:LibUtil = new LibUtil();


export default function customDialogTest1() {


  describe('customDialogTest1', () => {
    let PAGE_TAG = 'customDialogTest1';
    beforeEach(async (): Promise<void> => {
      try {
        await Utils.pushPage(`customdialog/${PAGE_TAG}`, false);
        await Utils.sleep(1000);
      } catch (err) {
        console.info('customDialogTest1 beforeEach err: ' + JSON.stringify(err));
      }
    });


    
    /**
     * @tc.number   customDialogTest1_0010
     * @tc.name     customDialogTest1_0010
     * @tc.desc     customDialogTest1_0010
     * @tc.level    Level.LEVEL1
     */
    it('customDialogTest1_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('customDialogTest1_0010  START');
      try {
        await Utils.sleep(100);
        let strJson = inspector.getInspectorByKey('buttonId');
        let obj = JSON.parseJsonElement(strJson);
        let id = obj.getElement('$attrs').getString('id');
        expect(id).assertEqual('buttonId');
        console.info('customDialogTest1_0010  END');
      } catch (err) {
        console.info('customDialogTest1_0010 err: ' + JSON.stringify(err));
      }
      done()
    })


  })
}
