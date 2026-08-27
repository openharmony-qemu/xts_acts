'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function selectOnSelectJsunit() {
  describe('selectOnSelectTest', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/select",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectMenu state success " + JSON.stringify(pages));
        if (!("select" == pages.name)) {
          console.info("get SelectMenu state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push SelectMenu page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('selectTest sleep err: ' + JSON.stringify(err));
      }
      console.info("selectOnSelect after each called");
    });

    
    
    
    
    /**
     * @tc.number   testselectOnSelect0001
     * @tc.name     testselectOnSelect0001
     * @tc.desc     testselectOnSelect0001
     * @tc.level    Level.LEVEL0
     */
it('testselectOnSelect0001', Level.LEVEL0, async () => {
      console.info('selectOnSelect testselectOnSelect0001 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('selectTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('Select');
      console.info("[testselectOnSelect0001] component width strJson:" + strJson);
      let obj= JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Select');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected')).assertEqual("2");
      console.info("[testselectOnSelect0001] selected value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected'));

    });

    
    
    
    
    /**
     * @tc.number   testselectOnSelect0002
     * @tc.name     testselectOnSelect0002
     * @tc.desc     testselectOnSelect0002
     * @tc.level    Level.LEVEL0
     */
it('testselectOnSelect0002', Level.LEVEL0, async () => {
      console.info('selectOnSelect testselectOnSelect0002 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('selectTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('Select');
      console.info("[testselectOnSelect0002] component height strJson:" + strJson);
      let obj= JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Select');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('value')).assertEqual("TTT");
      console.info("[testselectOnSelect0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('value'));

    });
  })
}
