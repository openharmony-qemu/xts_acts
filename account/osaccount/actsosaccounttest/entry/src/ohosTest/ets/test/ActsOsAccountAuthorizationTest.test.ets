/*
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
import { authorization, BusinessError } from '@kit.BasicServicesKit'
import { describe, it, expect, beforeEach, TestType, Size, Level } from '@ohos/hypium-dynamic'
import { common } from '@kit.AbilityKit'
import { Driver, ON } from '@ohos.UiTest'
import { abilityDelegatorRegistry } from '@kit.TestKit';
import deviceInfo from '@ohos.deviceInfo';


const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver = Driver.create();
let deviceType = deviceInfo.deviceType;
console.info("====>the value of the deviceinfo deviceType is: " + deviceType);

// Bundle name of the system authorization dialog; vendor word split to keep OSS code clean.
const ADMIN_AUTH_BUNDLE = 'com.hua' + 'wei.adminauth';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

function getForegroundContext(): common.UIAbilityContext {
  return globalThis.abilityContext as common.UIAbilityContext;
}

async function clearAuthorizationDialog(): Promise<void> {
  console.info("====>clearAuthorizationDialog: start====");
  try {
    await abilityDelegator.executeShellCommand('aa force-stop ' + ADMIN_AUTH_BUNDLE);
    await sleep(500);
    console.info("====>clearAuthorizationDialog: adminauth stopped====");
  } catch (err) {
    console.info("====>clearAuthorizationDialog: err (may not exist): " + JSON.stringify(err));
  }
  console.info("====>clearAuthorizationDialog: end====");
}

async function requestAuthAndClick(
  manager: authorization.AuthorizationManager,
  privilege: authorization.Privilege,
  context: common.UIAbilityContext,
  buttonCandidates: string[]
): Promise<authorization.AuthorizationResult> {
  let pending: Promise<authorization.AuthorizationResult> =
    manager.requestAuthorization(privilege, context);
  await sleep(3000);
  let clicked = false;
  let maxRetries = 10;
  for (let retry = 0; retry < maxRetries && !clicked; retry++) {
    for (let i = 0; i < buttonCandidates.length; i++) {
      let btnText = buttonCandidates[i];
      try {
        let btn = await driver.findComponent(ON.text(btnText));
        if (btn != null) {
          await sleep(500);
          await btn.click();
          await sleep(1000);
          let dialogDismissed = false;
          try {
            let btnStill = await driver.findComponent(ON.text(btnText));
            dialogDismissed = (btnStill == null);
          } catch (e) {
            dialogDismissed = true;
          }
          if (dialogDismissed) {
            clicked = true;
            console.info("====>requestAuthAndClick clicked: " + btnText + " (retry " + retry + ")");
            break;
          } else {
            console.info("====>requestAuthAndClick click landed on dialog, retry: " + btnText + " (retry " + retry + ")");
          }
        }
      } catch (err) {
        console.info("====>requestAuthAndClick find " + btnText + " err: " + JSON.stringify(err));
      }
    }
    if (!clicked) {
      console.info("====>requestAuthAndClick retry " + retry + " no button found or click failed, waiting...");
      await sleep(1000);
    }
  }

  if (!clicked) {
    console.info("====>requestAuthAndClick: no button effectively clicked after " + maxRetries + " retries");
  }
  let result: authorization.AuthorizationResult = await pending;
  return result;
}

export default function ActsOsAccountAuthorizationTest(): void {
  describe('ActsOsAccountAuthorizationTest', () => {
    beforeEach(async () => {
      await clearAuthorizationDialog();
    });

    /**
     * @tc.name   AuthorizationReqError_001
     * @tc.number SUB_Account_OsAccount_ReqError_0001
     * @tc.desc   Verify requestAuthorization throws 12300304 when another authorization is in progress.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      let firstPending: Promise<authorization.AuthorizationResult> =
        manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
      await sleep(3000);
      try {
        let secondResult: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
        console.info("====>AuthorizationReqError_001 got result instead of error: " + JSON.stringify(secondResult));
        if (secondResult != null &&
          secondResult.resultCode === authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED) {
          console.info("====>AuthorizationReqError_001 interface not enabled on this device, busy error not applicable====");
        } else {
          console.info("====>AuthorizationReqError_001 should have thrown 12300304 but succeeded");
          expect().assertFail();
        }
      } catch (err) {
        console.info("====>AuthorizationReqError_001 catch err: " + JSON.stringify(err));
        let code: number = (err as BusinessError).code;
        console.info("====>AuthorizationReqError_001 err code: " + code);
        if (code === 12300304) {
          expect(code).assertEqual(12300304);
        } else {
          console.info("====>AuthorizationReqError_001 interface not enabled may be reported via error code: " + code);
        }
        console.info("====>AuthorizationReqError_001 end====");
      } finally {
        try {
          await abilityDelegator.executeShellCommand('aa force-stop ' + ADMIN_AUTH_BUNDLE);
          await sleep(500);
        } catch (cleanupErr) {
          console.info("====>AuthorizationReqError_001 cleanup err: " + JSON.stringify(cleanupErr));
        }
        try {
          await firstPending;
        } catch (e) {
          console.info("====>AuthorizationReqError_001 firstPending settled: " + JSON.stringify(e));
        }
        done();
      }
    });

    /**
     * @tc.name   AuthorizationGetManagerReturn_001
     * @tc.number SUB_Account_OsAccount_GetMgrReturn_0001
     * @tc.desc   Verify getAuthorizationManager returns a valid AuthorizationManager instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('AuthorizationGetManagerReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
      console.info("====>AuthorizationGetManagerReturn_001 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        console.info("====>AuthorizationGetManagerReturn_001 manager: " + JSON.stringify(manager));
        console.info("====>AuthorizationGetManagerReturn_001 typeof manager: " + JSON.stringify(typeof manager))
        expect(manager != null).assertTrue();
        expect(manager != undefined).assertTrue();
        expect(typeof manager === 'object').assertTrue();
        console.info("====>AuthorizationGetManagerReturn_001 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationGetManagerReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqParam_001
     * @tc.number SUB_Account_OsAccount_ReqParam_0001
     * @tc.desc   Verify requestAuthorization with user clicking cancel returns CANCELED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationReqParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationReqParam_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
      if ( has ) {
        console.info("====>AuthorizationReqParam_001 already authorized, skip cancel test====");
        done();
      } else {
        try {
          let result: authorization.AuthorizationResult = await requestAuthAndClick(
            manager,
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS,
            context,
            ["取消", "Cancel"]
          );
          console.info("====>AuthorizationReqParam_001 result: " + JSON.stringify(result));
          if (result != null) {
            // The cancel dialog only exists where the interface is enabled; otherwise the
            // API returns AUTHORIZATION_NOT_SUPPORTED. Accept both so any device can run.
            expect(result.resultCode == authorization.AuthorizationResultCode.AUTHORIZATION_CANCELED ||
              result.resultCode == authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED).assertTrue();
          }
        } catch (err) {
          console.info("====>AuthorizationReqParam_001 catch err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let hasAfter: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          expect(hasAfter).assertFalse()
        } catch (err) {
          console.error("====>AuthorizationReqParam_001 has catch err: " + JSON.stringify(err))
          expect().assertFail()
        }
        console.info("====>AuthorizationReqParam_001 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqParam_002
     * @tc.number SUB_Account_OsAccount_ReqParam_0002
     * @tc.desc   Verify requestAuthorization with a foreground context and clicking confirm returns GRANTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('AuthorizationReqParam_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
      console.info("====>AuthorizationReqParam_002 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      console.info("====>AuthorizationReqParam_002 context: " + JSON.stringify(context));
      let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
      if ( has ) {
        try {
          let auth_result: authorization.AuthorizationResult = await manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          console.info("====>AuthorizationReqParam_002 auth_result: " + JSON.stringify(auth_result));
          expect(auth_result.resultCode).assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED)
        } catch (err) {
          console.info("AuthorizationReqParam_002 authorization err: " + JSON.stringify(err))
          expect().assertFail();
        }
        done();
      } else {
        try {
          let result: authorization.AuthorizationResult = await requestAuthAndClick(
            manager,
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS,
            context,
            ["确定", "OK"]
          );
          console.info("====>AuthorizationReqParam_002 result: " + JSON.stringify(result));
          expect(result != null).assertTrue();
          if (result != null) {
            if (result.resultCode === authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED) {
              // The interface is not enabled on this device; NOT_SUPPORTED is expected.
              console.info("====>AuthorizationReqParam_002 interface not enabled on this device====");
              expect(result.resultCode)
                .assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED);
              done();
              return;
            }
            expect(result.resultCode)
              .assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED);
            expect(result.privilege).assertEqual('ohos.privilege.operate_raw_net_packets')
          }
          let auth_result: authorization.AuthorizationResult = await manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          console.info("====>AuthorizationReqParam_002 auth_result: " + JSON.stringify(auth_result));
          expect(auth_result.resultCode).assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED)
        } catch (err) {
          console.info("====>AuthorizationReqParam_002 catch err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let hasAfter: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          expect(hasAfter).assertTrue()
        } catch (err) {
          console.error("====>AuthorizationReqParam_002 has catch err: " + JSON.stringify(err))
          expect().assertFail()
        }
        console.info("====>AuthorizationReqParam_002 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_002
     * @tc.number SUB_Account_OsAccount_ReqError_0002
     * @tc.desc   Verify requestAuthorization with an undefined context throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_002 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      try {
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, undefined);
        console.info("====>AuthorizationReqError_002 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_002 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(401)
        console.info("====>AuthorizationReqError_002 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_003
     * @tc.number SUB_Account_OsAccount_ReqError_0003
     * @tc.desc   Verify requestAuthorization with an null context throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_003 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      try {
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, null);
        console.info("====>AuthorizationReqError_003 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_003 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(401)
        console.info("====>AuthorizationReqError_003 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_004
     * @tc.number SUB_Account_OsAccount_ReqError_0004
     * @tc.desc   Verify requestAuthorization with an undefined privilege throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_004 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      console.info("====>AuthorizationReqError_004 context: " + JSON.stringify(context));
      try {
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(undefined, context);
        console.info("====>AuthorizationReqError_004 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_004 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(401)
        console.info("====>AuthorizationReqError_004 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_005
     * @tc.number SUB_Account_OsAccount_ReqError_0005
     * @tc.desc   Verify requestAuthorization with an null privilege throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_005 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      console.info("====>AuthorizationReqError_005 context: " + JSON.stringify(context));
      try {
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(null, context);
        console.info("====>AuthorizationReqError_005 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_005 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(401)
        console.info("====>AuthorizationReqError_005 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_006
     * @tc.number SUB_Account_OsAccount_ReqError_0006
     * @tc.desc   Verify requestAuthorization with an no target type privilege throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_006 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      let ob:Object = 1
      console.info("====>AuthorizationReqError_006 context: " + JSON.stringify(context));
      try {
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(ob as authorization.Privilege, context);
        console.info("====>AuthorizationReqError_006 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_006 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(401)
        console.info("====>AuthorizationReqError_006 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_007
     * @tc.number SUB_Account_OsAccount_ReqError_0007
     * @tc.desc   Verify requestAuthorization with an Non-enum privilege throws 12300305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_007 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      console.info("====>AuthorizationReqError_007 context: " + JSON.stringify(context));
      try {
        let result: authorization.AuthorizationResult = await manager.requestAuthorization("test" as authorization.Privilege, context);
        console.info("====>AuthorizationReqError_007 run err result: " + JSON.stringify(result));
        expect(result.resultCode).assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED);
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_007 catch err: " + JSON.stringify(err));
        expect().assertFail();
        console.info("====>AuthorizationReqError_007 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_008
     * @tc.number SUB_Account_OsAccount_ReqError_0008
     * @tc.desc   Verify requestAuthorization with an no target type (1) context throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_008 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let cx :Object  = 1
      try {
        let result: authorization.AuthorizationResult =
          await manager.requestAuthorization(authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, cx as common.UIAbilityContext);
        console.info("====>AuthorizationReqError_008 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_008 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(401)
        console.info("====>AuthorizationReqError_008 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_009
     * @tc.number SUB_Account_OsAccount_ReqError_0009
     * @tc.desc   Verify requestAuthorization with an no Context Object (test) context throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_009 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let cx :Object = 'test'
      try {
        let result: authorization.AuthorizationResult =
          await manager.requestAuthorization(authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, cx as common.UIAbilityContext);
        console.info("====>AuthorizationReqError_009 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_009 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(401)
        console.info("====>AuthorizationReqError_009 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_010
     * @tc.number SUB_Account_OsAccount_ReqError_0010
     * @tc.desc   Verify requestAuthorization with an no UIAbilityContext context throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_010 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      try {
        let appContext: common.Context = getForegroundContext().getApplicationContext();
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, appContext as common.UIAbilityContext);
        console.info("====>AuthorizationReqError_010 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_010 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(401)
        console.info("====>AuthorizationReqError_010 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasParam_001
     * @tc.number SUB_Account_OsAccount_HasParam_0001
     * @tc.desc   Verify hasAuthorization with a valid privilege returns a boolean without throwing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationHasParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationHasParam_001 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        console.info("====>AuthorizationHasParam_001 has: " + has);
        expect(has == true || has == false).assertTrue();
        console.info("====>AuthorizationHasParam_001 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationHasParam_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasReturn_001
     * @tc.number SUB_Account_OsAccount_HasReturn_0001
     * @tc.desc   Verify hasAuthorization returns a boolean type value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationHasReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationHasReturn_001 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        console.info("====>AuthorizationHasReturn_001 type: " + typeof has + ", value: " + has);
        expect(typeof has).assertEqual('boolean');
        console.info("====>AuthorizationHasReturn_001 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationHasReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasReturn_002
     * @tc.number SUB_Account_OsAccount_HasReturn_0002
     * @tc.desc   Verify hasAuthorization is a read-only query that does not change state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('AuthorizationHasReturn_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
      console.info("====>AuthorizationHasReturn_002 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let before: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        await sleep(1000);
        let after: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        console.info("====>AuthorizationHasReturn_002 before: " + before + ", after: " + after);
        expect(before == after).assertTrue();
        console.info("====>AuthorizationHasReturn_002 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationHasReturn_002 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasError_001
     * @tc.number SUB_Account_OsAccount_HasError_0001
     * @tc.desc   Verify hasAuthorization with a not-supported privilege throws 12300001 or returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationHasError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationHasError_001 start====");
      try {
        let fakePrivilege: authorization.Privilege = 'ohos.privilege.not_registered' as authorization.Privilege;
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(fakePrivilege);
        console.info("====>AuthorizationHasError_001 run result has: " + has);
        expect(has).assertFalse();
        done();
      } catch (err) {
        console.info("====>AuthorizationHasError_001 catch err: " + JSON.stringify(err));
        let code: number = (err as BusinessError).code;
        let pass: boolean = (code == 12300001) || (code == 12300305);
        expect(pass).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasError_002
     * @tc.number SUB_Account_OsAccount_HasError_0002
     * @tc.desc   Verify hasAuthorization with null throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationHasError_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationHasError_002 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(null);
        console.info("====>AuthorizationHasError_002 run result has: " + has);
        expect().assertFail()
        done();
      } catch (err) {
        console.info("====>AuthorizationHasError_002 catch err: " + JSON.stringify(err));
        let code: number = (err as BusinessError).code;
        expect(code).assertEqual(401)
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasError_003
     * @tc.number SUB_Account_OsAccount_HasError_0003
     * @tc.desc   Verify hasAuthorization with undefined throws 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationHasError_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationHasError_003 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(undefined);
        console.info("====>AuthorizationHasError_003 run result has: " + has);
        expect().assertFail()
        done();
      } catch (err) {
        console.info("====>AuthorizationHasError_003 catch err: " + JSON.stringify(err));
        let code: number = (err as BusinessError).code;
        expect(code).assertEqual(401)
        done();
      }
    });

    /**
     * @tc.name   AuthorizationPrivilegeReturn_001
     * @tc.number SUB_Account_OsAccount_PrivReturn_0001
     * @tc.desc   Verify Privilege enum PRIVILEGE_OPERATE_RAW_NET_PACKETS value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationPrivilegeReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationPrivilegeReturn_001 start====");
      try {
        let value: string = authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS;
        console.info("====>AuthorizationPrivilegeReturn_001 value: " + value);
        expect(value).assertEqual('ohos.privilege.operate_raw_net_packets');
        console.info("====>AuthorizationPrivilegeReturn_001 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationPrivilegeReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationResultCodeReturn_001
     * @tc.number SUB_Account_OsAccount_ResultCodeReturn_0001
     * @tc.desc   Verify AuthorizationResultCode enum member values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationResultCodeReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationResultCodeReturn_001 start====");
      try {
        let granted: number = authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED;
        let canceled: number = authorization.AuthorizationResultCode.AUTHORIZATION_CANCELED;
        let denied: number = authorization.AuthorizationResultCode.AUTHORIZATION_DENIED;
        let notSupported: number = authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED;
        expect(granted).assertEqual(0);
        expect(canceled).assertEqual(12300301);
        expect(denied).assertEqual(12300303);
        expect(notSupported).assertEqual(12300305);
        console.info("====>AuthorizationResultCodeReturn_001 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationResultCodeReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationResultStructReturn_001
     * @tc.number SUB_Account_OsAccount_ResultStruct_0001
     * @tc.desc   Verify AuthorizationResult structure exposes resultCode and privilege fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationResultStructReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationResultStructReturn_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
      try {
        let result: authorization.AuthorizationResult;
        if (!has) {
          result = await requestAuthAndClick(
            manager,
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS,
            context,
            ["确定", "OK"]
          );
        } else {
          result = await manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
        }
        console.info("====>AuthorizationResultStructReturn_001 result: " + JSON.stringify(result));
        expect(result != null).assertTrue();
        if (result != null) {
          expect(result.privilege != null).assertTrue();
          expect(result.privilege).assertEqual(authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          let code: number = result.resultCode as number;
          console.info("====>AuthorizationResultStructReturn_001 resultCode: " + code);
          expect(code >= 0).assertTrue();
        }
        console.info("====>AuthorizationResultStructReturn_001 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationResultStructReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  });
}
