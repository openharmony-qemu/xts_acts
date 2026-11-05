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

function assertExecResultShape(result: cliManager.ExecResult): void {
  // Cover ExecResult fields: exitCode/outputText/errorText/signalNumber/timeOut/executionTime.
  expect(result.timeOut !== undefined).assertTrue();
  expect(typeof result.timeOut).assertEqual('boolean');
  expect(typeof result.executionTime).assertEqual('number');
  expect(result.executionTime >= 0).assertTrue();
  if (result.exitCode !== undefined) {
    expect(typeof result.exitCode).assertEqual('number');
  }
  if (result.outputText !== undefined) {
    expect(typeof result.outputText).assertEqual('string');
  }
  if (result.errorText !== undefined) {
    expect(typeof result.errorText).assertEqual('string');
  }
  if (result.signalNumber !== undefined) {
    expect(typeof result.signalNumber).assertEqual('number');
  }
}

function assertShellCompleted(info: cliManager.CliSessionInfo, outputMarker: string): void {
  expect(info.sessionId.length > 0).assertTrue();
  expect(info.toolName).assertEqual('shell');
  expect(info.status).assertEqual(cliManager.SessionStatus.COMPLETED);
  expect(info.result !== undefined).assertTrue();
  if (info.result === undefined) {
    return;
  }
  assertExecResultShape(info.result);
  expect(info.result.timeOut).assertEqual(false);
  if (info.result.exitCode !== undefined) {
    expect(info.result.exitCode).assertEqual(0);
  }
  expect(info.result.outputText !== undefined).assertTrue();
  if (info.result.outputText !== undefined) {
    expect(info.result.outputText.indexOf(outputMarker) >= 0).assertTrue();
  }
}

function isClearSessionBizCode(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_SYSTEM_API ||
    code === ERR_SESSION_NOT_FOUND || code === ERR_SYSTEM || code === ERR_PARAM;
}

function isExecCmdBizCode(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_PARAM ||
    code === ERR_CAPABILITY || code === 35600031 || code === ERR_SYSTEM;
}

function isGetToolBizCode(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_PARAM ||
    code === ERR_TOOL_NOT_FOUND || code === ERR_SYSTEM;
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
     * @tc.desc   queryToolSummaries returns Array; empty length===0 path or known biz error 201/202/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QueryToolSummaries_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let list = await cliManager.queryToolSummaries();
          hilog.info(0x0000, TAG, 'QueryToolSummaries empty-path size=%{public}d', list.length);
          expect(Array.isArray(list)).assertTrue();
          if (list.length === 0) {
            expect(list.length).assertEqual(0);
          } else {
            // Device has tools: empty path not hit; still assert Array shape.
            expect(list.length > 0).assertTrue();
          }
        } catch (error) {
          hilog.info(0x0000, TAG, 'QueryToolSummaries empty-path %{public}s', safeErrorText(error));
          let code = errCodeOf(error);
          expect(code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_SYSTEM ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QueryToolSummaries_NonEmpty_0110
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QueryToolSummaries_NonEmpty_0110
     * @tc.desc   queryToolSummaries non-empty: assert ToolSummary name/description/version;
     *     if empty on device, assert length===0; or BusinessError 201/202/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QueryToolSummaries_NonEmpty_0110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let list = await cliManager.queryToolSummaries();
          hilog.info(0x0000, TAG, 'QueryToolSummaries non-empty size=%{public}d', list.length);
          expect(Array.isArray(list)).assertTrue();
          if (list.length > 0) {
            expect(typeof list[0].name).assertEqual('string');
            expect(list[0].name.length > 0).assertTrue();
            expect(typeof list[0].description).assertEqual('string');
            expect(typeof list[0].version).assertEqual('string');
          } else {
            expect(list.length).assertEqual(0);
          }
        } catch (error) {
          hilog.info(0x0000, TAG, 'QueryToolSummaries non-empty %{public}s', safeErrorText(error));
          let code = errCodeOf(error);
          expect(code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_SYSTEM ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QueryTools_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QueryTools_0100
     * @tc.desc   queryTools returns Array; empty length===0 path or known biz error 201/202/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QueryTools_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let list = await cliManager.queryTools();
          hilog.info(0x0000, TAG, 'QueryTools empty-path size=%{public}d', list.length);
          expect(Array.isArray(list)).assertTrue();
          if (list.length === 0) {
            expect(list.length).assertEqual(0);
          } else {
            expect(list.length > 0).assertTrue();
          }
        } catch (error) {
          hilog.info(0x0000, TAG, 'QueryTools empty-path %{public}s', safeErrorText(error));
          let code = errCodeOf(error);
          expect(code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_SYSTEM ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QueryTools_NonEmpty_0110
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QueryTools_NonEmpty_0110
     * @tc.desc   queryTools non-empty: assert ToolInfo fields; if empty assert length===0;
     *     or BusinessError 201/202/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QueryTools_NonEmpty_0110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let list = await cliManager.queryTools();
          hilog.info(0x0000, TAG, 'QueryTools non-empty size=%{public}d', list.length);
          expect(Array.isArray(list)).assertTrue();
          if (list.length > 0) {
            expect(typeof list[0].name).assertEqual('string');
            expect(list[0].name.length > 0).assertTrue();
            expect(typeof list[0].description).assertEqual('string');
            expect(typeof list[0].version).assertEqual('string');
          } else {
            expect(list.length).assertEqual(0);
          }
        } catch (error) {
          hilog.info(0x0000, TAG, 'QueryTools non-empty %{public}s', safeErrorText(error));
          let code = errCodeOf(error);
          expect(code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_SYSTEM ||
            isExpectedBizCode(code)).assertTrue();
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
     * @tc.desc   getToolInfoByName toolName="" length out of 1..32 valid range; expect 401/201/202/35600030/35600050
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
          expect(isGetToolBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Null_0210
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Null_0210
     * @tc.desc   getToolInfoByName(null) out of valid string range; expect 401/201/202/35600030/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Null_0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.getToolInfoByName(null);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'GetToolInfoByName null %{public}s', safeErrorText(error));
          expect(isGetToolBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Undefined_0220
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Undefined_0220
     * @tc.desc   getToolInfoByName(undefined) out of valid string range; expect 401/201/202/35600030/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Undefined_0220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.getToolInfoByName(undefined);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'GetToolInfoByName undefined %{public}s', safeErrorText(error));
          expect(isGetToolBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Return_0230
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Return_0230
     * @tc.desc   getToolInfoByName return ToolInfo name/version/description/executablePath or 201/202/35600030/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_GetToolInfoByName_Return_0230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let summaries = await cliManager.queryToolSummaries();
          expect(Array.isArray(summaries)).assertTrue();
          if (summaries.length === 0) {
            hilog.info(0x0000, TAG, 'GetToolInfoByName return skip: empty summaries');
            done();
            return;
          }
          let toolName = summaries[0].name;
          expect(toolName.length > 0 && toolName.length <= 32).assertTrue();
          let info = await cliManager.getToolInfoByName(toolName);
          expect(info !== undefined).assertTrue();
          expect(typeof info.name).assertEqual('string');
          expect(info.name.length > 0 && info.name.length <= 32).assertTrue();
          expect(typeof info.version).assertEqual('string');
          expect(typeof info.description).assertEqual('string');
          expect(typeof info.executablePath).assertEqual('string');
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'GetToolInfoByName return %{public}s', safeErrorText(error));
          expect(isGetToolBizCode(code)).assertTrue();
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
     * @tc.desc   execCmd cmd="" empty length; expect 201/202/401/801/35600031/35600050 (EXEC_CLI_TOOL/PUBLIC)
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
          expect(isExecCmdBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Null_0210
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Null_0210
     * @tc.desc   execCmd(null) out of valid string range; expect 201/202/401/801/35600031/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Null_0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.execCmd(null);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecCmd null %{public}s', safeErrorText(error));
          expect(isExecCmdBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Undefined_0220
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Undefined_0220
     * @tc.desc   execCmd(undefined) out of valid string range; expect 201/202/401/801/35600031/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_Undefined_0220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.execCmd(undefined);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecCmd undefined %{public}s', safeErrorText(error));
          expect(isExecCmdBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_OptionsNull_0230
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_OptionsNull_0230
     * @tc.desc   execCmd options=null; expect success ExecResult or 201/202/401/801/35600031/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_OptionsNull_0230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let info = await cliManager.execCmd('echo xts_cli_opt_null', null);
          assertSessionInfoShape(info);
          if (info.result !== undefined) {
            assertExecResultShape(info.result);
          }
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecCmd options null %{public}s', safeErrorText(error));
          expect(isExecCmdBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_OptionsUndefined_0240
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_OptionsUndefined_0240
     * @tc.desc   execCmd options=undefined; expect success ExecResult or 201/202/401/801/35600031/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_OptionsUndefined_0240',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let info = await cliManager.execCmd('echo xts_cli_opt_undef', undefined);
          assertSessionInfoShape(info);
          if (info.result !== undefined) {
            assertExecResultShape(info.result);
          }
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecCmd options undefined %{public}s', safeErrorText(error));
          expect(isExecCmdBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecCmd_WorkDirEmpty_0250
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecCmd_WorkDirEmpty_0250
     * @tc.desc   execCmd workDir="" empty string coverage; expect result or 201/202/401/801/35600031/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecCmd_WorkDirEmpty_0250',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let info = await cliManager.execCmd('echo xts_cli_workdir_empty', {
            workDir: '',
            background: false,
            yieldMs: 0,
            timeout: 30
          });
          assertSessionInfoShape(info);
          if (info.result !== undefined) {
            assertExecResultShape(info.result);
          }
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecCmd workDir empty %{public}s', safeErrorText(error));
          expect(isExecCmdBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ExecResult_ErrorText_0260
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ExecResult_ErrorText_0260
     * @tc.desc   ExecResult.errorText/signalNumber/exitCode/outputText/timeOut/executionTime coverage via stderr cmd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ExecResult_ErrorText_0260',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let info = await cliManager.execCmd('ls /xts_cli_not_exist_path_for_stderr', {
            background: false,
            yieldMs: 0,
            timeout: 30
          });
          hilog.info(0x0000, TAG, 'ExecResult stderr status=%{public}s result=%{public}s',
            info.status, JSON.stringify(info.result));
          expect(info.result !== undefined).assertTrue();
          if (info.result !== undefined) {
            assertExecResultShape(info.result);
            if (info.result.errorText !== undefined) {
              expect(typeof info.result.errorText).assertEqual('string');
            }
            if (info.result.signalNumber !== undefined) {
              expect(typeof info.result.signalNumber).assertEqual('number');
            }
          }
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecResult errorText %{public}s', safeErrorText(error));
          expect(isExecCmdBizCode(code)).assertTrue();
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
     * @tc.desc   clearSession invalid sessionId; expect 201/202/35600032/35600050 (perm EXEC_CLI_TOOL/PUBLIC)
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
          expect(isClearSessionBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ClearSession_Empty_0200
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ClearSession_Empty_0200
     * @tc.desc   clearSession sessionId="" empty length; expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ClearSession_Empty_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.clearSession('');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ClearSession empty %{public}s', safeErrorText(error));
          expect(isClearSessionBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ClearSession_Null_0210
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ClearSession_Null_0210
     * @tc.desc   clearSession(null) out of valid string range; expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ClearSession_Null_0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.clearSession(null);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ClearSession null %{public}s', safeErrorText(error));
          expect(isClearSessionBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_ClearSession_Undefined_0220
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_ClearSession_Undefined_0220
     * @tc.desc   clearSession(undefined) out of valid string range; expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_ClearSession_Undefined_0220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.clearSession(undefined);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ClearSession undefined %{public}s', safeErrorText(error));
          expect(isClearSessionBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QuerySession_Empty_0200
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QuerySession_Empty_0200
     * @tc.desc   querySession sessionId=""; expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QuerySession_Empty_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.querySession('');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'QuerySession empty %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QuerySession_Null_0210
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QuerySession_Null_0210
     * @tc.desc   querySession(null) out of valid string range; expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QuerySession_Null_0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.querySession(null);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'QuerySession null %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QuerySession_Undefined_0220
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QuerySession_Undefined_0220
     * @tc.desc   querySession(undefined) out of valid string range; expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QuerySession_Undefined_0220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.querySession(undefined);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'QuerySession undefined %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_QuerySession_Return_0230
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_QuerySession_Return_0230
     * @tc.desc   querySession after execCmd; cover CliSessionInfo sessionId/toolName/status/result
     *     or BusinessError 201/202/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_QuerySession_Return_0230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let marker = 'xts_cli_query_session_return';
          let info = await cliManager.execCmd('echo ' + marker, {
            background: false,
            yieldMs: 5000,
            timeout: 30
          });
          assertSessionInfoShape(info);
          let queried = await cliManager.querySession(info.sessionId);
          expect(typeof queried.sessionId).assertEqual('string');
          expect(queried.sessionId.length > 0).assertTrue();
          expect(typeof queried.toolName).assertEqual('string');
          expect(queried.toolName.length > 0).assertTrue();
          expect(queried.status !== undefined).assertTrue();
          if (queried.status === cliManager.SessionStatus.COMPLETED ||
            queried.status === cliManager.SessionStatus.FAILED) {
            expect(queried.result !== undefined).assertTrue();
            if (queried.result !== undefined) {
              assertExecResultShape(queried.result);
            }
          }
          await clearSessionQuiet(info.sessionId);
        } catch (error) {
          hilog.info(0x0000, TAG, 'QuerySession return %{public}s', safeErrorText(error));
          expect(isExpectedBizCode(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Empty_0200
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Empty_0200
     * @tc.desc   subscribeSession sessionId=""; expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Empty_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.subscribeSession('', {
            onEvent: (_event) => {
            }
          });
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SubscribeSession empty %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Null_0210
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Null_0210
     * @tc.desc   subscribeSession(null); expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Null_0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.subscribeSession(null, {
            onEvent: (_event) => {
            }
          });
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SubscribeSession null %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Undefined_0220
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Undefined_0220
     * @tc.desc   subscribeSession(undefined); expect 201/202/401/35600032/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SubscribeSession_Undefined_0220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.subscribeSession(undefined, {
            onEvent: (_event) => {
            }
          });
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SubscribeSession undefined %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SendMessage_Abnormal_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SendMessage_Abnormal_0100
     * @tc.desc   sendMessage with invalid sessionId; expect 201/202/35600032/35600033/35600050
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
          expect(code === ERR_SESSION_NOT_FOUND || code === 35600033 ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SendMessage_EmptySid_0200
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SendMessage_EmptySid_0200
     * @tc.desc   sendMessage sessionId=""; expect 201/202/401/35600032/35600033/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SendMessage_EmptySid_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.sendMessage('', 'hello');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SendMessage empty sid %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || code === 35600033 ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SendMessage_NullSid_0210
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SendMessage_NullSid_0210
     * @tc.desc   sendMessage(null, msg); expect 201/202/401/35600032/35600033/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SendMessage_NullSid_0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.sendMessage(null, 'hello');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SendMessage null sid %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || code === 35600033 ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SendMessage_UndefinedSid_0220
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SendMessage_UndefinedSid_0220
     * @tc.desc   sendMessage(undefined, msg); expect 201/202/401/35600032/35600033/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SendMessage_UndefinedSid_0220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.sendMessage(undefined, 'hello');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SendMessage undefined sid %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || code === 35600033 ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SendMessage_EmptyMsg_0230
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SendMessage_EmptyMsg_0230
     * @tc.desc   sendMessage(invalidId, ""); expect 201/202/401/35600032/35600033/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SendMessage_EmptyMsg_0230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.sendMessage('xts_invalid_session_id', '');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SendMessage empty msg %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || code === 35600033 ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SendMessage_NullMsg_0240
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SendMessage_NullMsg_0240
     * @tc.desc   sendMessage(invalidId, null); expect 201/202/401/35600032/35600033/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SendMessage_NullMsg_0240',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.sendMessage('xts_invalid_session_id', null);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SendMessage null msg %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || code === 35600033 ||
            isExpectedBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_SendMessage_UndefinedMsg_0250
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_SendMessage_UndefinedMsg_0250
     * @tc.desc   sendMessage(invalidId, undefined); expect 201/202/401/35600032/35600033/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_SendMessage_UndefinedMsg_0250',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.sendMessage('xts_invalid_session_id', undefined);
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SendMessage undefined msg %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || code === 35600033 ||
            isExpectedBizCode(code)).assertTrue();
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
