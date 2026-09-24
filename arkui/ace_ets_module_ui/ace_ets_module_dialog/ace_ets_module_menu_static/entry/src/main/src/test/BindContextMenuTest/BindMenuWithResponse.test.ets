'use static';
/**
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

import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function BindMenuWithResponseTest(): void {
  describe('BindMenuWithResponseTest', () => {
    beforeEach(async (): Promise<void> => {
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        const pages = routerInstance.getState();
        if (pages.name !== 'BindMenuWithResponseIndex') {
          routerInstance.replaceUrl({ url: 'MainAbility/pages/bindContextMenu/BindMenuWithResponse' });
        }
        await Utils.sleep(500);
      } catch (err) {
        console.info('BindMenuWithResponse beforeEach err: ' + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('BindMenuWithResponse afterEach err: ' + JSON.stringify(err));
      }
    });

    it('BindMenuWithResponse_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(1000);
        const button = await driver.findComponent(ON.id('bindClickId'));
        expect(!!button).assertEqual(true);
        if (button) {
          await button.longClick();
        }
        await CommonFunc.sleep(1000);
        const menu = await driver.findComponent(ON.type('Menu'));
        expect(menu !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('BindMenuWithResponse err: ' + JSON.stringify(err));
        done();
      }
    });
  });
}
