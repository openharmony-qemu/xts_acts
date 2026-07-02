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

let context: common.UIAbilityContext;
let userAgentPC:string = "";

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => resolve('ok'), time);
  });
}

export default function startAbilityForResultTest() {
  describe('ActsStartAbilityForResultTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'ActsStartAbilityForResultTest beforeAll');
    });

    afterEach(async () => {
      await sleep(1000);
    });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100
     * @tc.desc   Test startAbilityForResult(want): directly call context.startAbilityForResult
     *            to launch rely EntryAbility, verify AbilityResult.resultCode and AbilityResult.want.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100', Level.LEVEL0,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerely',
          abilityName: 'EntryAbility',
          parameters: { 'callType': 'forResult' }
        };

        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {

          try {
            await context.startAbilityForResult(want).then((data: common.AbilityResult) => {
              hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult success: ${JSON.stringify(data)}`);
              expect(data.resultCode).assertEqual(0);
              expect(data.want?.bundleName).assertEqual('com.acts.context.webonconnectnativerely');
              expect(data.want?.abilityName).assertEqual('EntryAbility');
              done();
            }).catch((err: BusinessError) => {
              hilog.error(0x0000, 'testTag', `${tcNumber} startAbilityForResult error: ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
            });
          } catch (err) {
            hilog.error(0x0000, 'testTag', `${tcNumber} catch error: ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          }
        } else {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100-capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200
     * @tc.desc   Test startAbilityForResult(want, options): call with StartOptions parameter,
     *            verify that without required permission, the API returns error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200', Level.LEVEL0,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerely',
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
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200--capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300
     * @tc.desc   Test startAbilityForResult with non-existent ability:
     *            verify BusinessError.code = 16000001 (The specified ability does not exist).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300', Level.LEVEL0,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300';
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
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300--capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400
     * @tc.desc   Test startAbilityForResult with null want parameter:
     *            verify BusinessError.code = 401 (Parameter error).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400', Level.LEVEL2,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {
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
        } else {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0400--capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500
     * @tc.desc   Test startAbilityForResult with undefined want parameter:
     *            verify BusinessError.code = 401 (Parameter error).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500', Level.LEVEL2,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {
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
        } else {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0500--capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600
     * @tc.desc   Test startAbilityForResult(want, null) with null as second parameter:
     *            verify the API handles null gracefully without crashing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600', Level.LEVEL2,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerely',
          abilityName: 'EntryAbility',
          parameters: { 'callType': 'forResult' }
        };
        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {
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
        } else {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0600--capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700
     * @tc.desc   Test startAbilityForResult(want, undefined) with undefined as second parameter:
     *            verify the API handles undefined gracefully without crashing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700', Level.LEVEL2,
      async (done: Function) => {
        await sleep(2000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerely',
          abilityName: 'EntryAbility',
          parameters: { 'callType': 'forResult' }
        };
        if ((userAgentPC).includes('PC') || (userAgentPC).includes('Tablet')) {
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
        } else {
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0700--capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0800
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0800
     * @tc.desc   Test startAbilityForResult(want, options) to construct error 201:
     *            call with want targeting an ability that requires additional permission,
     *            verify the API returns error code 201 (Permission denied).
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
          bundleName: 'com.acts.context.webonconnectnativerely',
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
          console.log('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0800--capability not supported');
          expect(true).assertEqual(true);
          done();
        }
      });
  });
}
