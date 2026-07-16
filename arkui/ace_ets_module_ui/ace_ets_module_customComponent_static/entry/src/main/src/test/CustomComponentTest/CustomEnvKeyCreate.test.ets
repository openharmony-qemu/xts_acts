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
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

function readContent(key: string): string {
  let strJson = inspector.getInspectorByKey(key);
  let obj = JSON.parseJsonElement(strJson);
  return obj.getElement('$attrs').getString('content');
}

export default function CustomEnvKeyCreateTest(): void {
  describe('CustomEnvKeyCreateTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.customComponent.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvKeyCreatePage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        if (!('CustomEnvKeyCreatePage' == routerInstance.getState().name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvKeyCreatePage error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
    });

    it('SUB_ARKUI_CustomEnvKey_create_string_0100', Level.LEVEL0, async (done: () => void) => {
      expect(readContent('key_create_str')).assertEqual('str:str-default');
      done();
    });

    it('SUB_ARKUI_CustomEnvKey_create_number_0100', Level.LEVEL0, async (done: () => void) => {
      expect(readContent('key_create_num')).assertEqual('num:-1');
      done();
    });

    it('SUB_ARKUI_CustomEnvKey_create_boolean_0100', Level.LEVEL0, async (done: () => void) => {
      expect(readContent('key_create_bool')).assertEqual('bool:false');
      done();
    });
  });
}
