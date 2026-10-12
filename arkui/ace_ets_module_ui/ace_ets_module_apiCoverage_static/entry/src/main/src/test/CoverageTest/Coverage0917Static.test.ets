'use static'
/*
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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[coverage0917StaticTest]';
const PAGE_URL = 'MainAbility/pages/coverage/Coverage0917Static';

export default function coverage0917StaticTest(): void {
  describe('coverage0917StaticTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeEach start`);
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        const pages = routerInstance.getState();
        if (pages.name !== 'Coverage0917Static') {
          routerInstance.clear();
          await Utils.sleep(500);
          const options: router.RouterOptions = { url: PAGE_URL };
          await routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error(`${LOG_TAG} beforeEach navigate soft-fail: ${err}`);
      }
    });

    afterEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} afterEach`);
      await Utils.sleep(200);
    });

    /**
     * @tc.number SUB_ARKUI_APICOVERAGE0917_STATIC_FSLAUNCH_0100
     * @tc.name SUB_ARKUI_APICOVERAGE0917_STATIC_FSLAUNCH_0100
     * @tc.desc Cover FullScreenLaunch appId alias smoke on static page
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_APICOVERAGE0917_STATIC_FSLAUNCH_0100', Level.LEVEL1, async () => {
      await Utils.sleep(1200);
      const strJson: string = inspector.getInspectorByKey('fsLaunchFlag');
      expect(strJson.length > 2).assertTrue();
      expect(strJson.indexOf('ok') >= 0).assertTrue();
    });
  });
}
