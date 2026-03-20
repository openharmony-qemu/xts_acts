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

import { describe, expect, beforeAll, afterAll, it, TestType, Size, Level } from '@ohos/hypium'
import rpc from './@ohos.rpc';
import Want from './@ohos.app.ability.Want';
import { Callback } from './@ohos.base';
import Context from './application/Context';
import { PanelInfo } from './@ohos.selectionInput.SelectionPanel';
import ExtensionContext from './application/ExtensionContext';
import { selectionManager, SelectionExtensionContext } from '@kit.BasicServicesKit';

const TAG = '[SelectionManagerTest]';
export default function SelectionManagerTest() {
  describe('SelectionManagerTest', () => {

    beforeAll(async () => {
      console.log(TAG, '************* Unit SelectionManagerTest start*************');
    })

    afterAll(async () => {
      console.log(TAG, '************* Unit SelectionManagerTest end*************');
    })

    /**
     * @tc.name   testSelectionManagerTest0100
     * @tc.number SUB_Selection_EXT_0100
     * @tc.desc   OH_Selection testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '*************testSelectionManagerTest0100 start*************');
      try{
        selectionManager.on('selectionCompleted',(info) => {
          expect(info != null).assertTrue();
        });
      } catch(error) {
        console.error('Code is ${error.code}, message is ${error.message}')
      }
      console.info(TAG, '*************testSelectionManagerTest0100 end*************');
    });
  })
}
