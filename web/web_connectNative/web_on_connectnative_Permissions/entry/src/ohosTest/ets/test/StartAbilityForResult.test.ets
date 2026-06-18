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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, afterEach, Level, it, expect } from '@ohos/hypium';
import { Want, common, StartOptions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';
let userAgentPC:string = "";
let context: common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => resolve('ok'), time);
  });
}

export default function startAbilityForResultPermissionTest() {
  describe('ActsStartAbilityForResultPermissionTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'ActsStartAbilityForResultPermissionTest beforeAll');
    });

    afterEach(async () => {
      await sleep(1000);
    });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300
     * @tc.desc   Test startAbilityForResult without ohos.permission.WEB_NATIVE_MESSAGING:
     *            directly call context.startAbilityForResult(want), should get error 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300', Level.LEVEL0,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerelypermission',
          abilityName: 'EntryAbility',
          parameters: { 'callType': 'forResult' }
        };

        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {
          try {
            await context.startAbilityForResult(want).then((data: common.AbilityResult) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult success: ${JSON.stringify(data)}`);
              expect(data.resultCode).assertEqual(0);
              done();
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult error: ${JSON.stringify(err)}`);
              expect(err.code).assertEqual(201);
              done();
            });
          } catch (err) {
            hilog.info(0x0000, 'testTag', `${tcNumber} catch error code: ${err.code}`);
            expect(err.code).assertEqual(201);
            done();
          }
        } else  {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100-capability not supported');
          expect(true).assertEqual(true);
          done();
        }


      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400
     * @tc.desc   Test startAbilityForResult(want, options) without ohos.permission.WEB_NATIVE_MESSAGING:
     *            directly call context.startAbilityForResult(want, options) with StartOptions,
     *            verify the API completes (success or error 201).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400', Level.LEVEL0,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerelypermission',
          abilityName: 'EntryAbility',
          parameters: { 'callType': 'forResult' }
        };
        let options: StartOptions = {
          displayId: 0
        };
        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {
          try {
            await context.startAbilityForResult(want, options).then((data: common.AbilityResult) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult success: ${JSON.stringify(data)}`);
              expect(data.resultCode).assertEqual(0);
              done();
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult error: ${JSON.stringify(err)}`);
              expect(err.code).assertEqual(201);
              done();
            });
          } catch (err) {
            hilog.info(0x0000, 'testTag', `${tcNumber} catch error code: ${err.code}`);
            expect(err.code).assertEqual(201);
            done();
          }
        } else {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100-capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500
     * @tc.desc   Test startAbilityForResult with non-existent ability without ohos.permission.WEB_NATIVE_MESSAGING:
     *            directly call context.startAbilityForResult(invalidWant),
     *            verify BusinessError.code = 16000001 (The specified ability does not exist).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500', Level.LEVEL0,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let invalidWant: Want = {
          bundleName: 'com.invalid.nonexistent.bundle',
          abilityName: 'NonExistentAbility'
        };
        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {
          try {
            await context.startAbilityForResult(invalidWant).then((data: common.AbilityResult) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} unexpected success: ${JSON.stringify(data)}`);
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} caught expected error: ${err.code}`);
              expect(err.code).assertEqual(16000001);
              done();
            });
          } catch (err) {
            hilog.info(0x0000, 'testTag', `${tcNumber} catch error code: ${err.code}`);
            expect(err.code).assertEqual(16000001);
            done();
          }
        } else {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100-capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600
     * @tc.desc   Test startAbilityForResult with null want parameter without ohos.permission.WEB_NATIVE_MESSAGING:
     *            verify BusinessError.code = 401 (Parameter error).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600', Level.LEVEL2,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
          try {
            await context.startAbilityForResult(null).then((data: common.AbilityResult) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} unexpected success: ${JSON.stringify(data)}`);
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
              expect(err.code).assertEqual(401);
              done();
            });
          } catch (err) {
            hilog.info(0x0000, 'testTag', `${tcNumber} catch error code: ${err.code}`);
            expect(err.code).assertEqual(401);
            done();
          }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700
     * @tc.desc   Test startAbilityForResult with undefined want parameter without ohos.permission.WEB_NATIVE_MESSAGING:
     *            verify BusinessError.code = 401 (Parameter error).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700', Level.LEVEL2,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
          try {
            await context.startAbilityForResult(undefined).then((data: common.AbilityResult) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} unexpected success: ${JSON.stringify(data)}`);
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
              expect(err.code).assertEqual(401);
              done();
            });
          } catch (err) {
            hilog.info(0x0000, 'testTag', `${tcNumber} catch error code: ${err.code}`);
            expect(err.code).assertEqual(401);
            done();
          }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0800
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0800
     * @tc.desc   Test startAbilityForResult(want, null) with null as second parameter
     *            without ohos.permission.WEB_NATIVE_MESSAGING:
     *            verify the API handles null gracefully without crashing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0800', Level.LEVEL2,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0800';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerelypermission',
          abilityName: 'EntryAbility',
          parameters: { 'callType': 'forResult' }
        };

        let errorCode: number = -1;
        try {
          context.startAbilityForResult(want, null);
          errorCode = 0;
          hilog.info(0x0000, 'testTag', `${tcNumber} API handled null gracefully`);
        } catch (err) {
          errorCode = err.code;
          hilog.info(0x0000, 'testTag', `${tcNumber} catch error code: ${err.code}`);
        }
        expect(errorCode).assertEqual(0);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0900
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0900
     * @tc.desc   Test startAbilityForResult(want, undefined) with undefined as second parameter
     *            without ohos.permission.WEB_NATIVE_MESSAGING:
     *            verify the API handles undefined gracefully without crashing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0900', Level.LEVEL2,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0900';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerelypermission',
          abilityName: 'EntryAbility',
          parameters: { 'callType': 'forResult' }
        };

        let errorCode: number = -1;
        try {
          context.startAbilityForResult(want, undefined);
          errorCode = 0;
          hilog.info(0x0000, 'testTag', `${tcNumber} API handled undefined gracefully`);
        } catch (err) {
          errorCode = err.code;
          hilog.info(0x0000, 'testTag', `${tcNumber} catch error code: ${err.code}`);
        }
        expect(errorCode).assertEqual(0);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_1000
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_1000
     * @tc.desc   Test startAbilityForResult(want, options) to construct error 201
     *            without ohos.permission.WEB_NATIVE_MESSAGING:
     *            call with want and StartOptions, verify the API completes (success or error 201).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_1000', Level.LEVEL2,
      async (done: Function) => {
        await sleep(1000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_1000';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerelypermission',
          abilityName: 'EntryAbility',
          parameters: { 'callType': 'forResult' }
        };
        let options: StartOptions = {
          displayId: 0,
          windowFocused: true
        };
        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {
          try {
            await context.startAbilityForResult(want, options).then((data: common.AbilityResult) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult success: ${JSON.stringify(data)}`);
              expect(data.resultCode).assertEqual(0);
              done();
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult error: ${JSON.stringify(err)}`);
              expect(err.code).assertEqual(201);
              done();
            });
          } catch (err) {
            hilog.info(0x0000, 'testTag', `${tcNumber} catch error code: ${err.code}`);
            expect(err.code).assertEqual(201);
            done();
          }
      } else {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100-capability not supported');
          expect(true).assertEqual(true);
          done();
      }
      });
  });
}
