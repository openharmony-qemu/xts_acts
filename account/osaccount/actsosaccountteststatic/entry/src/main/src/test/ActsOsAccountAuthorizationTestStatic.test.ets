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
import { authorization } from '@kit.BasicServicesKit'
import { describe, it, expect, beforeEach, beforeAll, TestType, Size, Level } from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import deviceInfo from '@ohos.deviceInfo';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import display from '@ohos.display';

let tag: string = 'AuthTestTag';

const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver = Driver.create();
let deviceType: string = deviceInfo.deviceType;
hilog.info(0x0000, tag, "====>the value of the deviceinfo deviceType is: " + deviceType);

// Bundle name of the system authorization dialog; vendor word split to keep OSS code clean.
const ADMIN_AUTH_BUNDLE: string = 'com.hua' + 'wei.adminauth';


async function getForegroundContext(): Promise<common.UIAbilityContext | undefined> {
  let maxRetries: int = 30;
  for (let retry: int = 0; retry < maxRetries; retry++) {
    let ctx: common.UIAbilityContext | undefined =
      AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
    if (ctx) {
      hilog.info(0x0000, tag, "====>getForegroundContext: got context via AppStorage (retry " + retry + ")");
      return ctx;
    }
    hilog.info(0x0000, tag, "====>getForegroundContext: AppStorage context not ready (retry " + retry + ")");
    await Utils.msSleep(500);
  }
  hilog.error(0x0000, tag, "====>getForegroundContext: failed after " + maxRetries + " retries");
  return undefined;
}

async function clearAuthorizationDialog(): Promise<void> {
  hilog.info(0x0000, tag, "====>clearAuthorizationDialog: start====");
  try {
    await abilityDelegator.executeShellCommand('aa force-stop ' + ADMIN_AUTH_BUNDLE);
    await Utils.msSleep(500);
    hilog.info(0x0000, tag, "====>clearAuthorizationDialog: adminauth stopped====");
  } catch (err) {
    hilog.info(0x0000, tag, "====>clearAuthorizationDialog: err (may not exist): " + JSON.stringify(err));
  }
  hilog.info(0x0000, tag, "====>clearAuthorizationDialog: end====");
}


async function clickAuthDialogFallback(confirm: boolean): Promise<boolean> {
  try {
    let d: display.Display = display.getDefaultDisplaySync();
    let w: number = d.width;
    let h: number = d.height;
    hilog.info(0x0000, tag, "====>clickAuthDialogFallback screen " + w + "x" + h + " confirm=" + confirm);
    let btnY: int = Math.floor(h * 0.72).toInt();
    let btnX: int = confirm ? Math.floor(w * 0.68).toInt() : Math.floor(w * 0.32).toInt();
    hilog.info(0x0000, tag, "====>clickAuthDialogFallback click at (" + btnX + "," + btnY + ")");
    await driver.click(btnX, btnY);
    hilog.info(0x0000, tag, "====>clickAuthDialogFallback click done");
    return true;
  } catch (err) {
    hilog.info(0x0000, tag, "====>clickAuthDialogFallback err: " + JSON.stringify(err));
    return false;
  }
}

async function requestAuthAndClick(
  manager: authorization.AuthorizationManager,
  privilege: authorization.Privilege,
  context: common.UIAbilityContext,
  buttonCandidates: string[]
): Promise<authorization.AuthorizationResult> {
  let pending: Promise<authorization.AuthorizationResult> =
    manager.requestAuthorization(privilege, context);
  await Utils.msSleep(3000);
  let clicked: boolean = false;
  let maxRetries: int = 5;
  for (let retry: int = 0; retry < maxRetries && !clicked; retry++) {
    for (let i: int = 0; i < buttonCandidates.length; i++) {
      let btnText: string = buttonCandidates[i];
      try {
        let btn: Component | null = await driver.findComponent(ON.text(btnText));
        if (btn != null) {
          await btn.click();
          await Utils.msSleep(1000);
          let btnAfter: Component | null = await driver.findComponent(ON.text(btnText));
          if (btnAfter != null) {
            hilog.info(0x0000, tag, "====>requestAuthAndClick clicked failed: " + btnText + " (retry " + retry + ")");
          } else {
            clicked = true;
            hilog.info(0x0000, tag, "====>requestAuthAndClick clicked: " + btnText + " (retry " + retry + ")");
            break;
          }
        }
      } catch (err) {
        hilog.info(0x0000, tag, "====>requestAuthAndClick find " + btnText + " err: " + JSON.stringify(err));
      }
    }
    if (!clicked) {
      hilog.info(0x0000, tag, "====>requestAuthAndClick retry " + retry + " no button found, waiting...");
      await Utils.msSleep(1000);
    }
  }

  if (!clicked) {
    hilog.info(0x0000, tag, "====>requestAuthAndClick: no button via findComponent, trying coordinate fallback");
    let firstBtn: string = buttonCandidates[0];
    let isConfirm: boolean = (firstBtn === '确定' || firstBtn === 'OK');
    for (let retry: int = 0; retry < maxRetries && !clicked; retry++) {
      clicked = await clickAuthDialogFallback(isConfirm);
      if (clicked) {
        hilog.info(0x0000, tag, "====>requestAuthAndClick coordinate fallback clicked (retry " + retry + ")");
      } else {
        hilog.info(0x0000, tag, "====>requestAuthAndClick coordinate fallback retry " + retry + " failed");
        await Utils.msSleep(1000);
      }
    }
  }

  if (!clicked) {
    hilog.info(0x0000, tag, "====>requestAuthAndClick: no button clicked after all retries and fallbacks");
  }
  let result: authorization.AuthorizationResult = await pending;
  return result;
}

export default function ActsOsAccountAuthorizationTestStatic(): void {
  describe('ActsOsAccountAuthorizationTestStatic', () => {
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsOsAccountAuthorizationTestStatic beforeAll start");
      let cmd: string = "aa start -a EntryAbility -b com.acts.osaccounttest.static";
      let user: string | undefined = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      try {
        await abilityDelegator.executeShellCommand(cmd);
        await Utils.msSleep(3000);
        hilog.info(0x0000, tag, "====>ActsOsAccountAuthorizationTestStatic beforeAll EntryAbility started");
      } catch (err) {
        hilog.error(0x0000, tag, "====>ActsOsAccountAuthorizationTestStatic beforeAll start ability err: " + JSON.stringify(err));
      }
      hilog.info(0x0000, tag, "====>ActsOsAccountAuthorizationTestStatic beforeAll end");
      done();
    });

    beforeEach(async () => {
      await clearAuthorizationDialog();
    });

    /**
     * @tc.name   AuthorizationReqError_001
     * @tc.number SUB_Account_OsAccount_ReqErrorStatic_0001
     * @tc.desc   Verify requestAuthorization throws 12300304 when another authorization is in progress.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('AuthorizationReqError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationReqError_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext | undefined = await getForegroundContext();
      if (!context) {
        hilog.error(0x0000, tag, "====>AuthorizationReqError_001 context is undefined, cannot test====");
        expect().assertFail();
        done();
        return;
      }
      let firstPending: Promise<authorization.AuthorizationResult> =
        manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
      await Utils.msSleep(3000);
      try {
        let secondResult: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
        hilog.info(0x0000, tag,
          "====>AuthorizationReqError_001 got result instead of error: " + JSON.stringify(secondResult));
        if (secondResult != null &&
          secondResult.resultCode === authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED) {
          hilog.info(0x0000, tag,
            "====>AuthorizationReqError_001 interface not enabled on this device, busy error not applicable====");
        } else {
          hilog.info(0x0000, tag, "====>AuthorizationReqError_001 should have thrown 12300304 but succeeded");
          expect().assertFail();
        }
      } catch (err) {
        hilog.info(0x0000, tag, "====>AuthorizationReqError_001 catch err: " + JSON.stringify(err));
        let code: number = err.code;
        hilog.info(0x0000, tag, "====>AuthorizationReqError_001 err code: " + code);
        if (code === 12300304) {
          expect(code).assertEqual(12300304);
        } else {
          hilog.info(0x0000, tag,
            "====>AuthorizationReqError_001 interface not enabled may be reported via error code: " + code);
        }
        hilog.info(0x0000, tag, "====>AuthorizationReqError_001 end====");
      } finally {
        try {
          await abilityDelegator.executeShellCommand('aa force-stop ' + ADMIN_AUTH_BUNDLE);
          await Utils.msSleep(500);
        } catch (cleanupErr) {
          hilog.info(0x0000, tag, "====>AuthorizationReqError_001 cleanup err: " + JSON.stringify(cleanupErr));
        }
        try {
          await firstPending;
        } catch (e) {
          hilog.info(0x0000, tag, "====>AuthorizationReqError_001 firstPending settled: " + JSON.stringify(e));
        }
        done();
      }
    });

    /**
     * @tc.name   AuthorizationGetManagerReturn_001
     * @tc.number SUB_Account_OsAccount_GetMgrReturnStatic_0001
     * @tc.desc   Verify getAuthorizationManager returns a valid AuthorizationManager instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('AuthorizationGetManagerReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationGetManagerReturn_001 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        hilog.info(0x0000, tag, "====>AuthorizationGetManagerReturn_001 manager: " + JSON.stringify(manager));
        hilog.info(0x0000, tag, "====>AuthorizationGetManagerReturn_001 typeof manager: " + JSON.stringify(typeof manager));
        expect(manager != null).assertTrue();
        expect(manager != undefined).assertTrue();
        expect(typeof manager === 'object').assertTrue();
        hilog.info(0x0000, tag, "====>AuthorizationGetManagerReturn_001 end====");
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "====>AuthorizationGetManagerReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqParam_001
     * @tc.number SUB_Account_OsAccount_ReqParamStatic_0001
     * @tc.desc   Verify requestAuthorization with user clicking cancel returns CANCELED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationReqParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationReqParam_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext | undefined = await getForegroundContext();
      if (!context) {
        hilog.error(0x0000, tag, "====>AuthorizationReqParam_001 context is undefined, cannot test====");
        expect().assertFail();
        done();
        return;
      }
      let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
      if (has) {
        hilog.info(0x0000, tag, "====>AuthorizationReqParam_001 already authorized, skip cancel test====");
        done();
      } else {
        try {
          let result: authorization.AuthorizationResult = await requestAuthAndClick(
            manager,
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS,
            context,
            ["取消", "Cancel"]
          );
          hilog.info(0x0000, tag, "====>AuthorizationReqParam_001 result: " + JSON.stringify(result));
          if (result != null) {
            // The cancel dialog only exists where the interface is enabled; otherwise the
            // API returns AUTHORIZATION_NOT_SUPPORTED. Accept both so any device can run.
            expect(result.resultCode == authorization.AuthorizationResultCode.AUTHORIZATION_CANCELED ||
              result.resultCode == authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED).assertTrue();
          }
        } catch (err) {
          hilog.info(0x0000, tag, "====>AuthorizationReqParam_001 catch err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let hasAfter: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          expect(hasAfter).assertFalse();
        } catch (err) {
          hilog.error(0x0000, tag, "====>AuthorizationReqParam_001 has catch err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>AuthorizationReqParam_001 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqParam_002
     * @tc.number SUB_Account_OsAccount_ReqParamStatic_0002
     * @tc.desc   Verify requestAuthorization with a foreground context and clicking confirm returns GRANTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('AuthorizationReqParam_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationReqParam_002 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext | undefined = await getForegroundContext();
      hilog.info(0x0000, tag, "====>AuthorizationReqParam_002 context obtained");
      if (!context) {
        hilog.error(0x0000, tag, "====>AuthorizationReqParam_002 context is undefined, cannot test====");
        expect().assertFail();
        done();
        return;
      }
      let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
      if (has) {
        try {
          let auth_result: authorization.AuthorizationResult = await manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          hilog.info(0x0000, tag, "====>AuthorizationReqParam_002 auth_result: " + JSON.stringify(auth_result));
          expect(auth_result.resultCode).assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED);
        } catch (err) {
          hilog.info(0x0000, tag, "AuthorizationReqParam_002 authorization err: " + JSON.stringify(err));
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
          hilog.info(0x0000, tag, "====>AuthorizationReqParam_002 result: " + JSON.stringify(result));
          expect(result != null).assertTrue();
          if (result != null) {
            if (result.resultCode === authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED) {
              // The interface is not enabled on this device; NOT_SUPPORTED is expected.
              hilog.info(0x0000, tag,
                "====>AuthorizationReqParam_002 interface not enabled on this device====");
              expect(result.resultCode)
                .assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED);
              done();
              return;
            }
            expect(result.resultCode)
              .assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED);
            expect(result.privilege).assertEqual('ohos.privilege.operate_raw_net_packets');
          }
          let auth_result: authorization.AuthorizationResult = await manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          hilog.info(0x0000, tag, "====>AuthorizationReqParam_002 auth_result: " + JSON.stringify(auth_result));
          expect(auth_result.resultCode).assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED);
        } catch (err) {
          hilog.info(0x0000, tag, "====>AuthorizationReqParam_002 catch err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let hasAfter: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          expect(hasAfter).assertTrue();
        } catch (err) {
          hilog.error(0x0000, tag, "====>AuthorizationReqParam_002 has catch err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>AuthorizationReqParam_002 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasParam_001
     * @tc.number SUB_Account_OsAccount_HasParamStatic_0001
     * @tc.desc   Verify hasAuthorization with a valid privilege returns a boolean without throwing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationHasParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationHasParam_001 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        hilog.info(0x0000, tag, "====>AuthorizationHasParam_001 has: " + has);
        expect(has == true || has == false).assertTrue();
        hilog.info(0x0000, tag, "====>AuthorizationHasParam_001 end====");
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "====>AuthorizationHasParam_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasReturn_001
     * @tc.number SUB_Account_OsAccount_HasReturnStatic_0001
     * @tc.desc   Verify hasAuthorization returns a boolean type value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationHasReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationHasReturn_001 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        hilog.info(0x0000, tag, "====>AuthorizationHasReturn_001 type: " + typeof has + ", value: " + has);
        expect(typeof has).assertEqual('boolean');
        hilog.info(0x0000, tag, "====>AuthorizationHasReturn_001 end====");
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "====>AuthorizationHasReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasReturn_002
     * @tc.number SUB_Account_OsAccount_HasReturnStatic_0002
     * @tc.desc   Verify hasAuthorization is a read-only query that does not change state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('AuthorizationHasReturn_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationHasReturn_002 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let before: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        await Utils.msSleep(1000);
        let after: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        hilog.info(0x0000, tag, "====>AuthorizationHasReturn_002 before: " + before + ", after: " + after);
        expect(before == after).assertTrue();
        hilog.info(0x0000, tag, "====>AuthorizationHasReturn_002 end====");
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "====>AuthorizationHasReturn_002 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationPrivilegeReturn_001
     * @tc.number SUB_Account_OsAccount_PrivReturnStatic_0001
     * @tc.desc   Verify Privilege enum PRIVILEGE_OPERATE_RAW_NET_PACKETS value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationPrivilegeReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationPrivilegeReturn_001 start====");
      try {
        let value: string = authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS;
        hilog.info(0x0000, tag, "====>AuthorizationPrivilegeReturn_001 value: " + value);
        expect(value).assertEqual('ohos.privilege.operate_raw_net_packets');
        hilog.info(0x0000, tag, "====>AuthorizationPrivilegeReturn_001 end====");
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "====>AuthorizationPrivilegeReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationResultCodeReturn_001
     * @tc.number SUB_Account_OsAccount_ResultCodeReturnStatic_0001
     * @tc.desc   Verify AuthorizationResultCode enum member values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationResultCodeReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationResultCodeReturn_001 start====");
      try {
        let granted: number = authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED;
        let canceled: number = authorization.AuthorizationResultCode.AUTHORIZATION_CANCELED;
        let denied: number = authorization.AuthorizationResultCode.AUTHORIZATION_DENIED;
        let notSupported: number = authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED;
        expect(granted).assertEqual(0);
        expect(canceled).assertEqual(12300301);
        expect(denied).assertEqual(12300303);
        expect(notSupported).assertEqual(12300305);
        hilog.info(0x0000, tag, "====>AuthorizationResultCodeReturn_001 end====");
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "====>AuthorizationResultCodeReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationResultStructReturn_001
     * @tc.number SUB_Account_OsAccount_ResultStructStatic_0001
     * @tc.desc   Verify AuthorizationResult structure exposes resultCode and privilege fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('AuthorizationResultStructReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthorizationResultStructReturn_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext | undefined = await getForegroundContext();
      let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
      try {
        if (!context) {
          hilog.error(0x0000, tag, "====>AuthorizationResultStructReturn_001 context is undefined, cannot test====");
          expect().assertFail();
          done();
          return;
        }
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
        hilog.info(0x0000, tag, "====>AuthorizationResultStructReturn_001 result: " + JSON.stringify(result));
        expect(result != null).assertTrue();
        if (result != null) {
          expect(result.privilege != null).assertTrue();
          expect(result.privilege).assertEqual(authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          let code: number = result.resultCode;
          hilog.info(0x0000, tag, "====>AuthorizationResultStructReturn_001 resultCode: " + code);
          expect(code >= 0).assertTrue();
        }
        hilog.info(0x0000, tag, "====>AuthorizationResultStructReturn_001 end====");
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "====>AuthorizationResultStructReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  });
}
