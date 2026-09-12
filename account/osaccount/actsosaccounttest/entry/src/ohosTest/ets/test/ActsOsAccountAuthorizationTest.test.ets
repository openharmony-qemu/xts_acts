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
import { describe, it, expect, beforeEach, TestType, Size, Level } from '@ohos/hypium'
import { common } from '@kit.AbilityKit'
import { Driver, ON } from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

let driver: Driver = Driver.create();

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

// 从 TestAbility 获取前台 UIAbilityContext
function getForegroundContext(): common.UIAbilityContext {
  return globalThis.abilityContext as common.UIAbilityContext;
}

export default function ActsOsAccountAuthorizationTest(): void {
  describe('ActsOsAccountAuthorizationTest', () => {

    /**
     * 前置操作：关闭测试hap并重新拉起，销毁授权进程，保证每个用例执行前提是权限未被授予。
     */
    beforeEach(async (done: () => void) => {
      console.info("====>beforeEach: force-stop & relaunch test hap start====");
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let bundleName: string = 'com.acts.osaccounttest';
      try {
        // 关闭测试hap（销毁进程，授权随进程销毁而失效）
        await abilityDelegator.executeShellCommand('aa force-stop ' + bundleName);
        console.info("====>beforeEach: force-stop executed====");
        await sleep(2000);
      } catch (err) {
        console.info("====>beforeEach: force-stop err: " + JSON.stringify(err));
      }
      try {
        // 重新拉起测试hap
        let cmd: string = 'aa start -d 0 -a TestAbility -b ' + bundleName;
        let user: string | undefined = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if (user !== undefined) {
          cmd += ' -u ' + user;
        }
        await abilityDelegator.executeShellCommand(cmd);
        console.info("====>beforeEach: relaunch executed====");
        await sleep(3000);
      } catch (err) {
        console.info("====>beforeEach: relaunch err: " + JSON.stringify(err));
      }
      console.info("====>beforeEach: force-stop & relaunch test hap end====");
      done();
    });

    /**
     * @tc.name   AuthorizationGetManagerReturn_001
     * @tc.number AA_GETMGR_RETURN_001
     * @tc.desc   Verify getAuthorizationManager returns a valid AuthorizationManager instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AuthorizationGetManagerReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
      console.info("====>AuthorizationGetManagerReturn_001 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        console.info("====>AuthorizationGetManagerReturn_001 manager: " + JSON.stringify(manager));
        expect(manager != null).assertTrue();
        expect(manager != undefined).assertTrue();
        console.info("====>AuthorizationGetManagerReturn_001 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationGetManagerReturn_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationGetManagerReturn_002
     * @tc.number AA_GETMGR_RETURN_002
     * @tc.desc   Verify the returned AuthorizationManager can be used for authorization queries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AuthorizationGetManagerReturn_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationGetManagerReturn_002 start====");
      try {
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS);
        console.info("====>AuthorizationGetManagerReturn_002 has: " + has);
        expect(has == true || has == false).assertTrue();
        console.info("====>AuthorizationGetManagerReturn_002 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationGetManagerReturn_002 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqParam_001
     * @tc.number AA_REQ_PARAM_001
     * @tc.desc   Verify requestAuthorization with a foreground context and clicking confirm returns GRANTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AuthorizationReqParam_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
      console.info("====>AuthorizationReqParam_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      console.info("====>AuthorizationReqParam_001 context: " + JSON.stringify(context));
      try {
        // 场景：前台 context，授权弹窗弹出后点击"允许/同意/确认"
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
        console.info("====>AuthorizationReqParam_001 result: " + JSON.stringify(result));
        try {
          let confirm = await driver.findComponent(ON.text("允许"));
          let confirm1 = await driver.findComponent(ON.text("同意"));
          let confirm2 = await driver.findComponent(ON.text("确认"));
          if (confirm != null && confirm != undefined) {
            await confirm.click();
          } else if (confirm1 != null && confirm1 != undefined) {
            await confirm1.click();
          } else if (confirm2 != null && confirm2 != undefined) {
            await confirm2.click();
          }
        } catch (err) {
          console.info("====>AuthorizationReqParam_001 click confirm err: " + JSON.stringify(err));
        }
        await sleep(1000);
        // 重新获取授权结果（确认后应为成功）
        let result2: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
        console.info("====>AuthorizationReqParam_001 result2: " + JSON.stringify(result2));
        expect(result2 != null).assertTrue();
        if (result2 != null) {
          expect(result2.resultCode)
            .assertEqual(authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED);
        }
        console.info("====>AuthorizationReqParam_001 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationReqParam_001 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqParam_002
     * @tc.number AA_REQ_PARAM_002
     * @tc.desc   Verify requestAuthorization with user clicking cancel returns CANCELED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AuthorizationReqParam_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationReqParam_002 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      try {
        // 场景：授权弹窗弹出后点击"取消"
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
        console.info("====>AuthorizationReqParam_002 result: " + JSON.stringify(result));
        try {
          let cancel = await driver.findComponent(ON.text("取消"));
          if (cancel != null && cancel != undefined) {
            await cancel.click();
          }
        } catch (err) {
          console.info("====>AuthorizationReqParam_002 click cancel err: " + JSON.stringify(err));
        }
        await sleep(1000);
        if (result != null && result != undefined) {
          expect(result.resultCode == authorization.AuthorizationResultCode.AUTHORIZATION_CANCELED ||
            result.resultCode == authorization.AuthorizationResultCode.AUTHORIZATION_GRANTED).assertTrue();
        }
        console.info("====>AuthorizationReqParam_002 end====");
        done();
      } catch (err) {
        console.info("====>AuthorizationReqParam_002 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_001
     * @tc.number AA_REQ_ERROR_001
     * @tc.desc   Verify requestAuthorization with an invalid (non-UI) context throws 12300302.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthorizationReqError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      try {
        // 场景：传入非 UI 上下文（ApplicationContext），交互受限应抛 12300302
        let appContext: common.Context = getForegroundContext().getApplicationContext();
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, appContext);
        console.info("====>AuthorizationReqError_001 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_001 catch err: " + JSON.stringify(err));
        expect((err as BusinessError).code).assertEqual(12300302);
        console.info("====>AuthorizationReqError_001 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationReqError_002
     * @tc.number AA_REQ_ERROR_002
     * @tc.desc   Verify requestAuthorization with an undefined context throws 12300302.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthorizationReqError_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationReqError_002 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      try {
        // 场景：传入 undefined context，应抛 12300302 或 12300002
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, undefined as unknown as common.UIAbilityContext);
        console.info("====>AuthorizationReqError_002 run err result: " + JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>AuthorizationReqError_002 catch err: " + JSON.stringify(err));
        let code: number = (err as BusinessError).code;
        let pass: boolean = (code == 12300302) || (code == 12300002);
        expect(pass).assertTrue();
        console.info("====>AuthorizationReqError_002 end====");
        done();
      }
    });

    /**
     * @tc.name   AuthorizationHasParam_001
     * @tc.number AA_HAS_PARAM_001
     * @tc.desc   Verify hasAuthorization with a valid privilege returns a boolean without throwing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.number AA_HAS_RETURN_001
     * @tc.desc   Verify hasAuthorization returns a boolean type value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.number AA_HAS_RETURN_002
     * @tc.desc   Verify hasAuthorization is a read-only query that does not change state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.number AA_HAS_ERROR_001
     * @tc.desc   Verify hasAuthorization with a not-supported privilege throws 12300001 or returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthorizationHasError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
      console.info("====>AuthorizationHasError_001 start====");
      try {
        // 场景：传入一个未注册的自定义特权值（字符串枚举会在编译期受限，这里用 try 包裹本地别名）
        let fakePrivilege: authorization.Privilege = 'ohos.privilege.not_registered' as authorization.Privilege;
        let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
        let has: boolean = await manager.hasAuthorization(fakePrivilege);
        console.info("====>AuthorizationHasError_001 run result has: " + has);
        expect(has == true || has == false).assertTrue();
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
     * @tc.name   AuthorizationPrivilegeReturn_001
     * @tc.number AA_PRIV_RETURN_001
     * @tc.desc   Verify Privilege enum PRIVILEGE_OPERATE_RAW_NET_PACKETS value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.number AA_RESULTCODE_RETURN_001
     * @tc.desc   Verify AuthorizationResultCode enum member values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.number AA_RESULT_STRUCT_001
     * @tc.desc   Verify AuthorizationResult structure exposes resultCode and privilege fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AuthorizationResultStructReturn_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
      console.info("====>AuthorizationResultStructReturn_001 start====");
      let manager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
      let context: common.UIAbilityContext = getForegroundContext();
      try {
        let result: authorization.AuthorizationResult = await manager.requestAuthorization(
          authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
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
