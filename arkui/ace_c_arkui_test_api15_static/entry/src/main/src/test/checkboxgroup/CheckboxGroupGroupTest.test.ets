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

import { expect, beforeEach, describe, it, Level} from '../../../../hypium/index';
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';

export default function checkboxGroupGroupTest() {

  describe('CheckboxGroupGroupTest', () => {

    beforeEach(async () => {
      console.info("CheckboxGroupGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/checkboxgroup/CheckboxGroupGroupTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CheckboxGroupGroupTest state pages: " + JSON.stringify(pages));
        if (!("CheckboxGroupGroupTest" == pages.name)) {
          console.info("get CheckboxGroupGroupTest  state pages.name: " + JSON.stringify(pages.name));
          await Utils.sleep(3000)
        }
      } catch (err) {
        console.error("push CheckboxGroupGroupTest page error:" + err);
      }
      console.info("CheckboxGroupGroupTest beforeEach end");
    })

    
    /**
     * @tc.number   checkboxGroupGroupTest001
     * @tc.name     checkboxGroupGroupTest001
     * @tc.desc     checkboxGroupGroupTest001
     * @tc.level    Level.LEVEL1
     */
    it('checkboxGroupGroupTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let  strJson = inspector.getInspectorByKey('checkboxgroup') //可能是inspector.getInspectorByKey返回值有问题 strJson无法打印 导致crash
        await Utils.sleep(1000)
        // console.info('checkboxGroupGroupTest001 strJson ' + strJson)
        let obj = JSON.parseJsonElement(strJson)
        await Utils.sleep(3000)
        console.info('checkboxGroupGroupTest001 group ' + JSON.stringify(obj.getElement('$attrs').getString('group')))
        expect(obj.getElement('$attrs').getString('group')).assertEqual("checkboxgroup")
        console.info('checkboxGroupGroupTest001 end')
        done();
      } catch (err) {
        console.info('checkboxGroupGroupTest001 err: ' + JSON.stringify(err));
        done();
      }
    })

  })
}
