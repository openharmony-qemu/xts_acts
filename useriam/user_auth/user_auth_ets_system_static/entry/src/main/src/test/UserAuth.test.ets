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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { userAuth } from '@kit.UserAuthenticationKit';
import type common from '@ohos.app.ability.common';
import { GlobalContext } from '../testrunner/OpenHarmonyTestRunner';

let domain: int = 0x0000;
let tag: string = 'testTag';
let format: string = '%{public}s';

export default function UserAuthTest() {
  describe('UserAuthTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
    })

    /**
     * @tc.name   Security_IAM_Companion_Api_static_5003
     * @tc.number Security_IAM_Companion_Api_static_5003
     * @tc.desc   registerRemoteAuthCallback test with not system app
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Companion_Api_static_5003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'Security_IAM_Companion_Api_static_5003 start');
      const context: common.Context = await GlobalContext.getContext();
      let callback: userAuth.IRemoteAuthCallback = {
        onGetRemoteAuthWidgetParam: (challenge: Uint8Array): userAuth.WidgetParam => {
          return {
            title: '远程认证',
            navigationButtonText: '返回',
            windowMode: userAuth.WindowModeType.DIALOG_BOX,
            uiContext: context
          };
        },
        onRemoteAuthResult: (challenge: Uint8Array, result: userAuth.UserAuthResult): void => {
          hilog.info(domain, tag, format, "认证结果" + result.result);
        }
      }
      try {
        await userAuth.registerRemoteAuthCallback(callback);
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, "Security_IAM_Companion_Api_static_5003 failed " + err.code + " " + err.message);
        expect(err.code).assertEqual(202);
      }
      done();
    })
    /**
     * @tc.name   Security_IAM_Companion_Api_static_5006
     * @tc.number Security_IAM_Companion_Api_static_5006
     * @tc.desc   unregisterRemoteAuthCallback test with not system app
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Companion_Api_static_5006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'Security_IAM_Companion_Api_static_5006 start');
      try {
        await userAuth.unregisterRemoteAuthCallback();
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, "Security_IAM_Companion_Api_static_5006 failed " + err.code + " " + err.message);
        expect(err.code).assertEqual(202);
      }
      done();
    })
  });
};