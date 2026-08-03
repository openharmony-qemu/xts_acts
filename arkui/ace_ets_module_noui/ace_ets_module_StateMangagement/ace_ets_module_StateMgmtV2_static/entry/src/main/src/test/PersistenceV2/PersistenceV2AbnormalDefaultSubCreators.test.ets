'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

function readContent(key: string): string {
  let strJson = inspector.getInspectorByKey(key);
  let obj = JSON.parseJsonElement(strJson);
  return obj.getElement('$attrs').getString('content');
}

export default function PersistenceV2AbnormalDefaultSubCreatorsTest(): void {
  describe('PersistenceV2AbnormalDefaultSubCreatorsTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.StateMgmtV2.static', 'EntryAbility');
      await UtilsTest.msSleep(1000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PersistenceV2/PersistenceV2AbnormalDefaultSubCreators',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        if (!('PersistenceV2AbnormalDefaultSubCreators' == routerInstance.getState().name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push PersistenceV2AbnormalDefaultSubCreators error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
    });

    it('SUB_ARKUI_PersistenceV2_defaultSubCreators_undefined_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let dVal = readContent('text_abn_sub_d');
        let uVal = readContent('text_abn_sub_u');
        expect(uVal).assertEqual(dVal);
        done();
      });
  });
}
