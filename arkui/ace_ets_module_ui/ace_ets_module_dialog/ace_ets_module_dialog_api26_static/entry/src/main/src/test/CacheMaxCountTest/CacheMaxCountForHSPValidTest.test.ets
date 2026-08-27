'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';

const PAGE_URL = 'MainAbility/pages/CacheMaxCount/CacheMaxCountForHSPValidTest';
const PAGE_NAME = 'CacheMaxCountForHSPValidTest';

function readTextContent(key: string): string {
  let strJson = inspector.getInspectorByKey(key);
  if (strJson.length === 0) {
    return '';
  }
  return JSON.parseJsonElement(strJson).getElement('$attrs').getString('content');
}

async function waitForTextContent(key: string, expected: string): Promise<string> {
  for (let i = 0; i < 10; i++) {
    let content = readTextContent(key);
    if (content === expected) {
      return content;
    }
    await CommonFunc.sleep(500);
  }
  return readTextContent(key);
}

async function navigatePage(): Promise<void> {
  await CommonFunc.sleep(500);
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== PAGE_NAME) {
    routerInstance.replaceUrl({ url: PAGE_URL });
    await CommonFunc.sleep(3000);
  }
}

export default function CacheMaxCountForHSPValidTest(): void {
  describe('CacheMaxCountForHSPValidTest', (): void => {
    beforeEach(async (): Promise<void> => {
      try {
        await navigatePage();
      } catch (err) {
        console.info('CacheMaxCountForHSPValidTest beforeEach err: ' + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('CacheMaxCountForHSPValidTest afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   SUB_ACE_API26_CacheMaxCountForHSPValid_0100
     * @tc.number SUB_ACE_API26_CacheMaxCountForHSPValid_0100
     * @tc.desc   setResourceManagerCacheMaxCountForHSP with valid counts 0,1,10,100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CacheMaxCountForHSPValid_0100', Level.LEVEL0, async (): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      const btnIds: string[] = ['btn_param_0', 'btn_param_1', 'btn_param_10', 'btn_param_100'];
      const txtIds: string[] = ['txt_cache_hsp_0', 'txt_cache_hsp_1', 'txt_cache_hsp_10', 'txt_cache_hsp_100'];
      for (let i = 0; i < btnIds.length; i++) {
        let btn = await driver.findComponent(ON.id(btnIds[i]));
        expect(!!btn).assertEqual(true);
        await (btn!.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let content = await waitForTextContent(txtIds[i], 'success');
        expect(content).assertEqual('success');
      }
    });
  });
}
