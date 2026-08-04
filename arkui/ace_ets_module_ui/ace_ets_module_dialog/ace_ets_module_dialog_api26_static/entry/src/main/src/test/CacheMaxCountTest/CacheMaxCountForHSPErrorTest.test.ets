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

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

const PAGE_URL = 'MainAbility/pages/CacheMaxCount/CacheMaxCountForHSPErrorTest';
const PAGE_NAME = 'CacheMaxCountForHSPErrorTest';

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

export default function CacheMaxCountForHSPErrorTest(): void {
  describe('CacheMaxCountForHSPErrorTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.api26.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => { await navigatePage(); });
    afterEach(async (): Promise<void> => { await Utils.sleep(1000); });

    /**
     * @tc.name   SUB_ACE_API26_CacheMaxCountForHSPError_0100
     * @tc.number SUB_ACE_API26_CacheMaxCountForHSPError_0100
     * @tc.desc   setResourceManagerCacheMaxCountForHSP error 100101 and 100102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CacheMaxCountForHSPError_0100', Level.LEVEL0, async (): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('btn_error_lt_0'));
      expect(!!btn1).assertEqual(true);
      await (btn1!.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await waitForTextContent('txt_error_lt_0', '100101')).assertEqual('100101');
      let btn2 = await driver.findComponent(ON.id('btn_error_float'));
      expect(!!btn2).assertEqual(true);
      await (btn2!.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(await waitForTextContent('txt_error_float', '100102')).assertEqual('100102');
    });
  });
}
