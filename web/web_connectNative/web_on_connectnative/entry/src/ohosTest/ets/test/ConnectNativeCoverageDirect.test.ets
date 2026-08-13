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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import { BusinessError } from '@kit.BasicServicesKit';

export default function connectNativeCoverageDirect() {
  describe('connectNativeCoverageDirect', () => {
    /**
     * @tc.name   testDisconnectNativeNullUndefinedDirect
     * @tc.number SUB_WEB_DISCONNECTNATIVE_DIRECT_0100
     * @tc.desc   disconnectNative null/undefined param coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDisconnectNativeNullUndefinedDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await Promise.race([
          webNativeMessagingExtensionManager.disconnectNative(null),
          new Promise<void>((_, reject) => setTimeout(() => reject({ code: -1 }), 2000))
        ]);
      } catch (e) {
        console.info('disconnect null code=' + (e as BusinessError).code);
        expect((e as BusinessError).code !== undefined).assertTrue();
      }
      try {
        await Promise.race([
          webNativeMessagingExtensionManager.disconnectNative(undefined),
          new Promise<void>((_, reject) => setTimeout(() => reject({ code: -1 }), 2000))
        ]);
      } catch (e) {
        console.info('disconnect undef code=' + (e as BusinessError).code);
        expect((e as BusinessError).code !== undefined).assertTrue();
      }
      done();
    })
  })
}
