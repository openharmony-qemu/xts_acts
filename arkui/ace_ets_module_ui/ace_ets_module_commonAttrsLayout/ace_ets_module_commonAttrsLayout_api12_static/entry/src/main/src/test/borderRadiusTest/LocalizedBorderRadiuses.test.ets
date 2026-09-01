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

import { beforeEach, afterEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function LocalizedBorderRadiuses() {
  describe('LocalizedBorderRadiuses', () => {
    beforeEach(() => {
      console.info("LocalizedBorderRadiuses beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/borderRadius/LocalizedBorderRadiuses',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LocalizedBorderRadiuses state pages:" + JSON.stringify(pages));
        if (!("LocalizedBorderRadiuses" == pages.name)) {
          console.info("get LocalizedBorderRadiuses pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push LocalizedBorderRadiuses page error:" + err);
      }
      console.info("LocalizedBorderRadiuses beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('LocalizedBorderRadiuses afterEach err: ' + JSON.stringify(err));
      }
      console.info("LocalizedBorderRadiuses after each called");
    });


    
    
/**
     * @tc.number   LocalizedBorderRadiuses_static_0100
     * @tc.name     LocalizedBorderRadiuses_static_0100
     * @tc.desc     LocalizedBorderRadiuses_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LocalizedBorderRadiuses_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LocalizedBorderRadiuses_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('LocalizedBorderRadiuses_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('LocalizedBorderRadiuses_col');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('LocalizedBorderRadiuses_static_0100 err: ' + JSON.stringify(err));
      }
      console.info("[ObserverNavDestinationId_0100] obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getString('topLeft'))
        .assertEqual('20.00vp')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getString('topRight'))
        .assertEqual('10.00vp')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getString('bottomLeft'))
        .assertEqual('15.00vp')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('borderRadius').getString('bottomRight'))
        .assertEqual('25.00vp')
      console.info('LocalizedBorderRadiuses_static_0100 END');
      done();
    });


  })
}
