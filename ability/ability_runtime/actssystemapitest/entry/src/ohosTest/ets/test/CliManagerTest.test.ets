/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic';
import cliManager from '@ohos.app.cli.cliManager';
import hilog from '@ohos.hilog';

const TAG = 'cliManagerTest';
const ERR_PERMISSION = 201;
const ERR_SYSTEM_API = 202;
const ERR_PARAM = 401;
const ERR_CAPABILITY = 801;
const ERR_TOOL_NOT_FOUND = 35600030;
const ERR_SESSION_NOT_FOUND = 35600032;
const ERR_SYSTEM = 35600050;

function isExpectedBizCode(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_PARAM ||
    code === ERR_CAPABILITY || code === ERR_TOOL_NOT_FOUND || code === ERR_SESSION_NOT_FOUND ||
    code === ERR_SYSTEM || code === 35600031 || code === 35600033 || code === 35600034 ||
    code === 35600035 || code === 35600036;
}

/**
 * Environment-only skips for positive execCmd option cases across devices:
 * 201 permission / 202 non-system / 801 capability. Not a soft-pass for all codes.
 */
function isExecCmdEnvSkip(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_CAPABILITY;
}

function safeErrorText(error: Object): string {
  let text = '';
  try {
    text = JSON.stringify(error);
  } catch (stringifyErr) {
    text = 'stringify_failed';
  }
  return text;
}

function errCodeOf(error: Object): number {
  let text = safeErrorText(error);
  let marker = '"code":';
  let idx = text.indexOf(marker);
  if (idx < 0) {
    return -1;
  }
  let start = idx + marker.length;
  while (start < text.length && text.charAt(start) === ' ') {
    start++;
  }
  let end = start;
  while (end < text.length) {
    let ch = text.charAt(end);
    if (ch >= '0' && ch <= '9') {
      end++;
    } else {
      break;
    }
  }
  if (end <= start) {
    return -1;
  }
  return Number(text.substring(start, end));
}

function assertSessionInfoShape(info: cliManager.CliSessionInfo): void {
  expect(info !== undefined).assertTrue();
  expect(info.sessionId.length > 0).assertTrue();
  expect(info.toolName.length > 0).assertTrue();
  expect(info.status !== undefined).assertTrue();
}

function assertShellCompleted(info: cliManager.CliSessionInfo, outputMarker: string): void {
  expect(info.sessionId.length > 0).assertTrue();
  expect(info.toolName).assertEqual('shell');
  expect(info.status).assertEqual(cliManager.SessionStatus.COMPLETED);
  expect(info.result !== undefined).assertTrue();
  if (info.result === undefined) {
    return;
  }
  expect(info.result.timeOut).assertEqual(false);
  expect(info.result.executionTime >= 0).assertTrue();
  if (info.result.exitCode !== undefined) {
    expect(info.result.exitCode).assertEqual(0);
  }
  expect(info.result.outputText !== undefined).assertTrue();
  if (info.result.outputText !== undefined) {
    expect(info.result.outputText.indexOf(outputMarker) >= 0).assertTrue();
  }
}

async function clearSessionQuiet(sessionId: string): Promise<void> {
  try {
    await cliManager.clearSession(sessionId);
  } catch (clearErr) {
    hilog.info(0x0000, TAG, 'clearSession %{public}s', safeErrorText(clearErr));
  }
}

async function waitSessionComplete(sessionId: string, rounds: number): Promise<cliManager.CliSessionInfo> {
  let last = await cliManager.querySession(sessionId);
  let i = 0;
  while (i < rounds && last.status === cliManager.SessionStatus.RUNNING) {
    await new Promise<void>((resolve) => setTimeout(resolve, 200));
    last = await cliManager.querySession(sessionId);
    i++;
  }
  return last;
}

export default function cliManagerTest() {
  describe('cliManagerTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SessionStatus_Enum_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SessionStatus_Enum_0100
     * @tc.desc   Assert SessionStatus enum String values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SessionStatus_Enum_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
        expect(cliManager.SessionStatus.RUNNING).assertEqual('running');
        expect(cliManager.SessionStatus.COMPLETED).assertEqual('completed');
        expect(cliManager.SessionStatus.FAILED).assertEqual('failed');
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QueryToolSummaries_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QueryToolSummaries_0100
     * @tc.desc   Normal queryToolSummaries; expect list or known biz error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QueryToolSummaries_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let list = await cliManager.queryToolSummaries();
          hilog.info(0x0000, TAG, 'QueryToolSummaries size=%{public}d', list.length);
          expect(Array.isArray(list)).assertTrue();
          if (list.length > 0) {
            expect(list[0].name.length > 0).assertTrue();
          }
        } catch (error) {
          hilog.info(0x0000, TAG, 'QueryToolSummaries %{public}s', safeErrorText(error));
          expect(isExpectedBizCode(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QueryTools_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QueryTools_0100
     * @tc.desc   Normal queryTools; expect list or known biz error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QueryTools_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let list = await cliManager.queryTools();
          hilog.info(0x0000, TAG, 'QueryTools size=%{public}d', list.length);
          expect(Array.isArray(list)).assertTrue();
        } catch (error) {
          hilog.info(0x0000, TAG, 'QueryTools %{public}s', safeErrorText(error));
          expect(isExpectedBizCode(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Abnormal_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Abnormal_0100
     * @tc.desc   getToolInfoByName with nonexistent name; expect 35600030 or known error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Abnormal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.getToolInfoByName('xts_nonexistent_cli_tool_name');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'GetToolInfoByName abnormal %{public}s', safeErrorText(error));
          expect(code === ERR_TOOL_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Empty_0200
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Empty_0200
     * @tc.desc   getToolInfoByName with empty String; expect biz error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Empty_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.getToolInfoByName('');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'GetToolInfoByName empty %{public}s', safeErrorText(error));
          expect(code === ERR_PARAM || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_0100
     * @tc.desc   Normal execCmd echo; expect CliSessionInfo or known biz error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let info = await cliManager.execCmd('echo xts_cli_manager', {
            background: false,
            yieldMs: 5000,
            timeout: 30,
            callback: {
              onEvent: (event) => {
                hilog.info(0x0000, TAG, 'ExecCmd event type=%{public}s dataLen=%{public}d',
                  event.toolEventType, event.data.length);
                expect(event.toolEventType.length > 0).assertTrue();
                expect(event.data !== undefined).assertTrue();
              }
            }
          });
          hilog.info(0x0000, TAG, 'ExecCmd session=%{public}s status=%{public}s',
            info.sessionId, info.status);
          assertSessionInfoShape(info);
          try {
            await cliManager.clearSession(info.sessionId);
          } catch (clearErr) {
            hilog.info(0x0000, TAG, 'ExecCmd clearSession %{public}s', safeErrorText(clearErr));
          }
        } catch (error) {
          hilog.info(0x0000, TAG, 'ExecCmd %{public}s', safeErrorText(error));
          expect(isExpectedBizCode(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Empty_0200
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Empty_0200
     * @tc.desc   execCmd with empty command; expect biz error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Empty_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.execCmd('');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecCmd empty %{public}s', safeErrorText(error));
          expect(code === ERR_PARAM || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_WorkDir_0300
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_WorkDir_0300
     * @tc.desc   Compatible: capable device asserts pwd output contains workDir; else 201/202/801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_WorkDir_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const workDir = '/data/local/tmp';
        try {
          let info = await cliManager.execCmd('pwd', {
            workDir: workDir,
            background: false,
            yieldMs: 0,
            timeout: 30
          });
          hilog.info(0x0000, TAG, 'ExecCmd workDir session=%{public}s status=%{public}s result=%{public}s',
            info.sessionId, info.status, JSON.stringify(info.result));
          assertShellCompleted(info, workDir);
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          hilog.info(0x0000, TAG, 'ExecCmd workDir %{public}s', safeErrorText(error));
          expect(isExecCmdEnvSkip(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Env_0310
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Env_0310
     * @tc.desc   Compatible: capable device asserts printenv shows env value; else 201/202/801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Env_0310',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const envKey = 'XTS_CLI_ENV';
        const envValue = 'xts_cli_env_value';
        let envMap: Record<string, string> = {};
        envMap[envKey] = envValue;
        try {
          let info = await cliManager.execCmd('printenv ' + envKey, {
            env: envMap,
            background: false,
            yieldMs: 0,
            timeout: 30
          });
          hilog.info(0x0000, TAG, 'ExecCmd env session=%{public}s status=%{public}s result=%{public}s',
            info.sessionId, info.status, JSON.stringify(info.result));
          assertShellCompleted(info, envValue);
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          hilog.info(0x0000, TAG, 'ExecCmd env %{public}s', safeErrorText(error));
          expect(isExecCmdEnvSkip(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Policy_0320
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Policy_0320
     * @tc.desc   Compatible: capable device accepts empty policy + echo marker; else 201/202/801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Policy_0320',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const marker = 'xts_cli_policy_ok';
        try {
          let info = await cliManager.execCmd('echo ' + marker, {
            policy: '',
            background: false,
            yieldMs: 0,
            timeout: 30
          });
          hilog.info(0x0000, TAG, 'ExecCmd policy session=%{public}s status=%{public}s result=%{public}s',
            info.sessionId, info.status, JSON.stringify(info.result));
          assertShellCompleted(info, marker);
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          hilog.info(0x0000, TAG, 'ExecCmd policy %{public}s', safeErrorText(error));
          expect(isExecCmdEnvSkip(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Background_0400
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Background_0400
     * @tc.desc   Compatible: capable device bg+query COMPLETED with marker; else 201/202/801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Background_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const marker = 'xts_cli_bg_ok';
        try {
          let info = await cliManager.execCmd('echo ' + marker, {
            background: true,
            timeout: 30
          });
          hilog.info(0x0000, TAG, 'ExecCmd bg session=%{public}s status=%{public}s',
            info.sessionId, info.status);
          expect(info.sessionId.length > 0).assertTrue();
          expect(info.toolName).assertEqual('shell');
          expect(info.status === cliManager.SessionStatus.RUNNING ||
            info.status === cliManager.SessionStatus.COMPLETED).assertTrue();
          let queried = await waitSessionComplete(info.sessionId, 50);
          hilog.info(0x0000, TAG, 'ExecCmd bg queried status=%{public}s result=%{public}s',
            queried.status, JSON.stringify(queried.result));
          assertShellCompleted(queried, marker);
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          hilog.info(0x0000, TAG, 'ExecCmd bg %{public}s', safeErrorText(error));
          expect(isExecCmdEnvSkip(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_YieldMs0_0500
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_YieldMs0_0500
     * @tc.desc   Compatible: capable device yieldMs0 COMPLETED+marker; else 201/202/801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_YieldMs0_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const marker = 'xts_cli_yield0_ok';
        try {
          let info = await cliManager.execCmd('echo ' + marker, {
            background: false,
            yieldMs: 0,
            timeout: 30
          });
          hilog.info(0x0000, TAG, 'ExecCmd yield0 session=%{public}s status=%{public}s result=%{public}s',
            info.sessionId, info.status, JSON.stringify(info.result));
          assertShellCompleted(info, marker);
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          hilog.info(0x0000, TAG, 'ExecCmd yield0 %{public}s', safeErrorText(error));
          expect(isExecCmdEnvSkip(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QuerySession_Abnormal_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QuerySession_Abnormal_0100
     * @tc.desc   querySession with invalid sessionId; expect 35600032 or known error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QuerySession_Abnormal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.querySession('xts_invalid_session_id');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'QuerySession abnormal %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Abnormal_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Abnormal_0100
     * @tc.desc   subscribeSession with invalid sessionId; expect 35600032 or known error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Abnormal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.subscribeSession('xts_invalid_session_id', {
            onEvent: (_event) => {
            }
          });
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SubscribeSession abnormal %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ClearSession_Abnormal_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ClearSession_Abnormal_0100
     * @tc.desc   clearSession with invalid sessionId; expect 35600032 or known error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ClearSession_Abnormal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.clearSession('xts_invalid_session_id');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ClearSession abnormal %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SendMessage_Abnormal_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SendMessage_Abnormal_0100
     * @tc.desc   sendMessage with invalid sessionId; expect 35600032 or known error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SendMessage_Abnormal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.sendMessage('xts_invalid_session_id', 'hello');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SendMessage abnormal %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecTool_Abnormal_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecTool_Abnormal_0100
     * @tc.desc   execTool with nonexistent tool; expect 401/201/202/35600030 or known error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecTool_Abnormal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.execTool('xts_nonexistent_tool', 'run', {}, '');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecTool abnormal %{public}s', safeErrorText(error));
          expect(code === ERR_TOOL_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });
  });
}
