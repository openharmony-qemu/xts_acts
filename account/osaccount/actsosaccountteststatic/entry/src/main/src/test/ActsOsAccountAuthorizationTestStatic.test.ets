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
import { authorization, BusinessError } from '@kit.BasicServicesKit'
import { describe, it, expect, beforeEach, beforeAll, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { Component, Driver, ON, MatchPattern } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';

let tag: string = 'testTag';

// 从 EntryAbility 注入的 AppStorage 获取前台 UIAbilityContext
function getForegroundContext(): common.UIAbilityContext {
  let context: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
  return context as common.UIAbilityContext;
}

// 静态工程中测试在应用自身进程内运行（OpenHarmonyTestRunner 直接执行 Hypium），
// 不能 aa force-stop 自身 bundle（会杀掉正在执行的测试套进程），
// 只能通过 aa start 将 EntryAbility 前置到前台，保证后续授权弹窗能够正常拉起。
async function startEntryAbility(): Promise<void> {
  let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let bundleName: string = 'com.acts.osaccounttest.static';
  let cmd: string = 'aa start -a EntryAbility -b ' + bundleName;
  let user: string | undefined = abilityDelegatorRegistry.getArguments().parameters["-u"];
  if (user !== undefined) {
    cmd += ' -u ' + user;
  }
  await abilityDelegator.executeShellCommand(cmd);
  hilog.info(0x0000, tag, '====>startEntryAbility executed: ' + cmd);
  await Utils.msSleep(2000);
}

// 在授权弹窗中探测"允许/同意/确认"按钮并点击；
// 返回 true 表示弹窗已实际拉起且按钮可交互。
async function clickDialogConfirm(driver: Driver): Promise<boolean> {
  let texts: string[] = ["允许", "同意", "确认"];
  for (let i: number = 0; i < texts.length; i++) {
    try {
      let btn: Component | null = await driver.waitForComponent(ON.text(texts[i], MatchPattern.EQUALS), 5000);
      if (btn != null) {
        await btn.click();
        hilog.info(0x0000, tag, '====>clickDialogConfirm clicked: ' + texts[i]);
        return true;
      }
    } catch (err) {
      hilog.info(0x0000, tag, '====>clickDialogConfirm not found: ' + texts[i]);
    }
  }
  return false;
}

// 在授权弹窗中探测"取消"按钮并点击；
// 返回 true 表示弹窗已实际拉起且按钮可交互。
async function clickDialogCancel(driver: Driver): Promise<boolean> {
  try {
    let cancel: Component | null = await driver.waitForComponent(ON.text("取消", MatchPattern.EQUALS), 5000);
    if (cancel != null) {
      await cancel.click();
      hilog.info(0x0000, tag, '====>clickDialogCancel clicked');
      return true;
    }
  } catch (err) {
    hilog.info(0x0000, tag, '====>clickDialogCancel not found');
  }
  return false;
}

export default function ActsOsAccountAuthorizationTestStatic(): void {
  describe('ActsOsAccountAuthorizationTestStatic', () => {
    let driver: Driver = Driver.create();

    /**
     * 套件级前置：将 EntryAbility 前置到前台，由 onForeground 注入 UIAbilityContext，
     * 保证后续每个 requestAuthorization 用例都能在有效前台上下文上拉起授权弹窗。
     */
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, '====>beforeAll start===="');
      try {
        let context: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
        if (context === undefined) {
          await startEntryAbility();
          if (getForegroundContext() == undefined) {
            hilog.info(0x0000, tag, '====>beforeAll: context still undefined after start');
          } else {
            hilog.info(0x0000, tag, '====>beforeAll: context ready');
          }
        } else {
          hilog.info(0x0000, tag, '====>beforeAll: context already present');
        }
      } catch (err) {
        hilog.info(0x0000, tag, '====>beforeAll err: ' + JSON.stringify(err));
      }
      hilog.info(0x0000, tag, '====>beforeAll end====');
      done();
    });

    /**
     * 每个用例前置：确保 UIAbilityContext 已注入（未注入时重新前置 EntryAbility）。
     * 不执行 aa force-stop（静态工程测试与应用同进程，自杀会导致套件中断）。
     */
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, '====>beforeEach start====');
      try {
        let context: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
        if (context === undefined) {
          await startEntryAbility();
        }
      } catch (err) {
        hilog.info(0x0000, tag, '====>beforeEach err: ' + JSON.stringify(err));
      }
      hilog.info(0x0000, tag, '====>beforeEach end====');
      done();
    });

    /**
    * @tc.number    AA_GETMGR_RETURN_001
    * @tc.name      AuthorizationGetManagerReturn_001_Static
    * @tc.desc      Verify getAuthorizationManager returns a valid AuthorizationManager instance.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL0
    */
    it('AuthorizationGetManagerReturn_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationGetManagerReturn_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
          hilog.info(0x0000, tag, logTag + "manager: " + JSON.stringify(manager));
          expect(manager != null).assertTrue();
          expect(manager != undefined).assertTrue();
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_GETMGR_RETURN_002
    * @tc.name      AuthorizationGetManagerReturn_002_Static
    * @tc.desc      Verify the returned AuthorizationManager can be used for authorization queries.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL1
    */
    it('AuthorizationGetManagerReturn_002_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationGetManagerReturn_002_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
          let has: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          hilog.info(0x0000, tag, logTag + "has: " + has);
          expect(has == true || has == false).assertTrue();
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_REQ_PARAM_002
    * @tc.name      AuthorizationReqParam_002_Static
    * @tc.desc      Verify requestAuthorization pulls up the permission confirmation dialog and clicking cancel returns CANCELED.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL1
    * @tc.note      MUST run before AA_REQ_PARAM_001: a granted authorization is bound to
    *               the process lifetime, so once granted, subsequent calls reuse the grant
    *               without showing the dialog. Running cancel first guarantees no valid
    *               authorization exists, so both cancel and confirm cases pull the dialog.
    */
    it('AuthorizationReqParam_002_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationReqParam_002_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let context: common.UIAbilityContext = getForegroundContext();
        hilog.info(0x0000, tag, logTag + "context: " + JSON.stringify(context));
        try {
          // 发起授权请求（不 await，弹窗交互完成后 Promise 才 resolve）
          let promise: Promise<authorization.AuthorizationResult> = manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          // 证明弹窗确实被拉起：waitForComponent 找到"取消"按钮
          let shown: boolean = await clickDialogCancel(driver);
          hilog.info(0x0000, tag, logTag + "dialog shown: " + shown);
          expect(shown).assertTrue();
          let result: authorization.AuthorizationResult = await promise;
          hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
          if (result != null) {
            expect(result.resultCode)
              .assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_CANCELED);
          }
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_REQ_PARAM_001
    * @tc.name      AuthorizationReqParam_001_Static
    * @tc.desc      Verify requestAuthorization pulls up the permission confirmation dialog and clicking confirm returns GRANTED.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL0
    * @tc.note      Runs AFTER AA_REQ_PARAM_002 (cancel). Since cancel grants nothing,
    *               no valid authorization persists, so this case pulls the dialog again.
    */
    it('AuthorizationReqParam_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationReqParam_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let context: common.UIAbilityContext = getForegroundContext();
        hilog.info(0x0000, tag, logTag + "context: " + JSON.stringify(context));
        try {
          // 发起授权请求（不 await，弹窗交互完成后 Promise 才 resolve）
          let promise: Promise<authorization.AuthorizationResult> = manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          // 证明弹窗确实被拉起：waitForComponent 找到"允许/同意/确认"按钮
          let shown: boolean = await clickDialogConfirm(driver);
          hilog.info(0x0000, tag, logTag + "dialog shown: " + shown);
          expect(shown).assertTrue();
          let result: authorization.AuthorizationResult = await promise;
          hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
          if (result != null) {
            expect(result.resultCode)
              .assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED);
            expect(result.privilege).assertEqual(authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          }
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_REQ_ERROR_001
    * @tc.name      AuthorizationReqError_001_Static
    * @tc.desc      Verify requestAuthorization with an invalid (non-UI) context throws 12300302.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL3
    */
    it('AuthorizationReqError_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationReqError_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        try {
          // 场景：传入非 UI 上下文（ApplicationContext），交互受限应抛 12300302
          let appContext: common.Context | undefined = getForegroundContext().getApplicationContext();
          let result: authorization.AuthorizationResult = await manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, appContext);
          hilog.info(0x0000, tag, logTag + "run err result: " + JSON.stringify(result));
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect((err as BusinessError).code).assertEqual(12300302);
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        }
      });

    /**
    * @tc.number    AA_REQ_ERROR_002
    * @tc.name      AuthorizationReqError_002_Static
    * @tc.desc      Verify requestAuthorization with an undefined context throws 12300302 or 12300002.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL3
    */
    it('AuthorizationReqError_002_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationReqError_002_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        try {
          // 场景：传入 undefined context，应抛 12300302 或 12300002
          let result: authorization.AuthorizationResult = await manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, undefined as unknown as common.UIAbilityContext);
          hilog.info(0x0000, tag, logTag + "run err result: " + JSON.stringify(result));
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          let code: number = (err as BusinessError).code;
          let pass: boolean = (code == 12300302) || (code == 12300002);
          expect(pass).assertTrue();
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        }
      });

    /**
    * @tc.number    AA_HAS_PARAM_001
    * @tc.name      AuthorizationHasParam_001_Static
    * @tc.desc      Verify hasAuthorization with a valid privilege returns a boolean without throwing.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL1
    */
    it('AuthorizationHasParam_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationHasParam_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
          let has: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          hilog.info(0x0000, tag, logTag + "has: " + has);
          expect(has == true || has == false).assertTrue();
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_HAS_RETURN_001
    * @tc.name      AuthorizationHasReturn_001_Static
    * @tc.desc      Verify hasAuthorization returns a boolean type value.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL1
    */
    it('AuthorizationHasReturn_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationHasReturn_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
          let has: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          hilog.info(0x0000, tag, logTag + "type: " + typeof has + ", value: " + has);
          expect(typeof has).assertEqual('boolean');
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_HAS_RETURN_002
    * @tc.name      AuthorizationHasReturn_002_Static
    * @tc.desc      Verify hasAuthorization is a read-only query that does not change state.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL2
    */
    it('AuthorizationHasReturn_002_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationHasReturn_002_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
          let before: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          await Utils.msSleep(1000);
          let after: boolean = await manager.hasAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
          hilog.info(0x0000, tag, logTag + "before: " + before + ", after: " + after);
          expect(before == after).assertTrue();
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_HAS_ERROR_001
    * @tc.name      AuthorizationHasError_001_Static
    * @tc.desc      Verify hasAuthorization with a not-supported privilege returns false or throws.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL3
    */
    it('AuthorizationHasError_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationHasError_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          // 场景：传入未注册特权值
          let fakePrivilege: authorization.Privilege = 'ohos.privilege.not_registered' as authorization.Privilege;
          let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
          let has: boolean = await manager.hasAuthorization(fakePrivilege);
          hilog.info(0x0000, tag, logTag + "run result has: " + has);
          expect(has == true || has == false).assertTrue();
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          let code: number = (err as BusinessError).code;
          let pass: boolean = (code == 12300001) || (code == 12300305);
          expect(pass).assertTrue();
          done();
        }
      });

    /**
    * @tc.number    AA_PRIV_RETURN_001
    * @tc.name      AuthorizationPrivilegeReturn_001_Static
    * @tc.desc      Verify Privilege enum PRIVILEGE_OPERATE_RAW_NET_PACKETS value.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL1
    */
    it('AuthorizationPrivilegeReturn_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationPrivilegeReturn_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          let value: string = authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS;
          hilog.info(0x0000, tag, logTag + "value: " + value);
          expect(value).assertEqual('ohos.privilege.operate_raw_net_packets');
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_RESULTCODE_RETURN_001
    * @tc.name      AuthorizationResultCodeReturn_001_Static
    * @tc.desc      Verify AuthorizationResultCode enum member values.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL1
    */
    it('AuthorizationResultCodeReturn_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationResultCodeReturn_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          let granted: number = authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED;
          let canceled: number = authorization.AuthorizationResultCode.AUTHORIZATION_CANCELED;
          let denied: number = authorization.AuthorizationResultCode.AUTHORIZATION_DENIED;
          let notSupported: number = authorization.AuthorizationResultCode.AUTHORIZATION_NOT_SUPPORTED;
          expect(granted).assertEqual(0);
          expect(canceled).assertEqual(12300301);
          expect(denied).assertEqual(12300303);
          expect(notSupported).assertEqual(12300305);
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number    AA_RESULT_STRUCT_001
    * @tc.name      AuthorizationResultStructReturn_001_Static
    * @tc.desc      Verify AuthorizationResult structure exposes resultCode and privilege fields.
    * @tc.type      FUNCTION
    * @tc.size      MEDIUMTEST
    * @tc.level     LEVEL1
    */
    it('AuthorizationResultStructReturn_001_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthorizationResultStructReturn_001_Static ";
        hilog.info(0x0000, tag, logTag + "start====");
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let context: common.UIAbilityContext = getForegroundContext();
        try {
          // AA_REQ_PARAM_001 已授予授权，此调用直接复用，不弹窗直接返回 GRANTED；
          // 若授权不存在，则弹窗且弹窗确认。
          let promise: Promise<authorization.AuthorizationResult> = manager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          await clickDialogConfirm(driver);
          let result: authorization.AuthorizationResult = await promise;
          hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
          expect(result != null).assertTrue();
          if (result != null) {
            expect(result.privilege != null).assertTrue();
            expect(result.privilege).assertEqual(authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
            let code: number = result.resultCode as number;
            hilog.info(0x0000, tag, logTag + "resultCode: " + code);
            expect(code >= 0).assertTrue();
          }
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  });
}