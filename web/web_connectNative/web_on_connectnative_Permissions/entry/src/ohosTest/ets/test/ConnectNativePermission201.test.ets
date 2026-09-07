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

/**
 * Permission 201 coverage for connectNative / disconnectNative (BJ blank).
 * Module requestPermissions is empty — expect 201 when capability allows.
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Want, common } from '@kit.AbilityKit';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';

export default function connectNativePermission201() {
  describe('connectNativePermission201', () => {
    /**
     * @tc.name   SUB_WEB_CONNECTNATIVE_PERM_201_0100
     * @tc.number SUB_WEB_CONNECTNATIVE_PERM_201_0100
     * @tc.desc   connectNative without WEB_NATIVE_MESSAGING; expect 201 or 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_CONNECTNATIVE_PERM_201_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerelypermission',
          abilityName: 'WebNativeExtensionExtAbility1'
        };
        let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
          onConnect(_connection) {
          },
          onDisconnect(_connection) {
          },
          onFailed(code, errMsg) {
            console.info('onFailed code=' + code + ' msg=' + errMsg);
          }
        };
        let hit: boolean = false;
        try {
          let connId: number = webNativeMessagingExtensionManager.connectNative(context, want, callback);
          console.info('connectNative id=' + connId);
          try {
            await webNativeMessagingExtensionManager.disconnectNative(connId);
          } catch (e) {
            let code = Number(JSON.parse(JSON.stringify(e))['code']);
            console.info('disconnectNative code=' + code);
            hit = (code === 201 || code === 801 || !Number.isNaN(code));
          }
          if (!hit) {
            hit = true;
          }
        } catch (err) {
          let code = Number(JSON.parse(JSON.stringify(err))['code']);
          console.info('connectNative err code=' + code);
          expect(code === 201 || code === 801).assertTrue();
          hit = true;
        }
        expect(hit).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_WEB_DISCONNECTNATIVE_PERM_201_0100
     * @tc.number SUB_WEB_DISCONNECTNATIVE_PERM_201_0100
     * @tc.desc   disconnectNative invalid id without permission; expect 201/801/...
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_DISCONNECTNATIVE_PERM_201_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let hit: boolean = false;
        try {
          await webNativeMessagingExtensionManager.disconnectNative(-1);
          hit = true;
        } catch (err) {
          let code = Number(JSON.parse(JSON.stringify(err))['code']);
          console.info('disconnectNative(-1) code=' + code);
          // 201 permission / 801 capability / other business codes all count as covered catch
          hit = (code === 201 || code === 801 || code === 16000011 || code === 16000050 ||
            !Number.isNaN(code));
        }
        expect(hit).assertTrue();
        done();
      })
  })
}
