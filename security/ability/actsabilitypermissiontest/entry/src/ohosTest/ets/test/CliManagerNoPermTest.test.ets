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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import cliManager from '@ohos.app.cli.cliManager';
import hilog from '@ohos.hilog';

const TAG = 'CliManagerNoPerm';
const ERR_PERMISSION = 201;
const ERR_SYSTEM_API = 202;
const ERR_CAPABILITY = 801;
const ERR_SYSTEM = 35600050;

function safeErrorText(error: Object): string {
  try {
    return JSON.stringify(error);
  } catch (stringifyErr) {
    return 'stringify_failed';
  }
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

function isNoPermBizCode(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_SYSTEM_API ||
    code === ERR_CAPABILITY || code === ERR_SYSTEM;
}

export default function cliManagerNoPermTest() {
  describe('cliManagerNoPermTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_NoPerm_QueryToolSummaries_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_NoPerm_QueryToolSummaries_0100
     * @tc.desc   queryToolSummaries without QUERY_CLI_TOOL/QUERY_PUBLIC_CLI_TOOL; expect 201
     *     (or 202/35600050 on limited devices)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_NoPerm_QueryToolSummaries_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.queryToolSummaries();
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'QueryToolSummaries noPerm %{public}s', safeErrorText(error));
          expect(isNoPermBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_NoPerm_GetToolInfoByName_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_NoPerm_GetToolInfoByName_0100
     * @tc.desc   getToolInfoByName without QUERY_CLI_TOOL/QUERY_PUBLIC_CLI_TOOL; expect 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_NoPerm_GetToolInfoByName_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.getToolInfoByName('ohos-aa');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'GetToolInfoByName noPerm %{public}s', safeErrorText(error));
          expect(isNoPermBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_NoPerm_ExecCmd_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_NoPerm_ExecCmd_0100
     * @tc.desc   execCmd without EXEC_CLI_TOOL/EXEC_PUBLIC_CLI_TOOL; expect 201/202/801/35600050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_NoPerm_ExecCmd_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.execCmd('echo xts_cli_noperm');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ExecCmd noPerm %{public}s', safeErrorText(error));
          expect(isNoPermBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_NoPerm_ClearSession_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_NoPerm_ClearSession_0100
     * @tc.desc   clearSession without EXEC_CLI_TOOL/EXEC_PUBLIC_CLI_TOOL; expect 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_NoPerm_ClearSession_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.clearSession('xts_noperm_session');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'ClearSession noPerm %{public}s', safeErrorText(error));
          expect(isNoPermBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_NoPerm_QuerySession_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_NoPerm_QuerySession_0100
     * @tc.desc   querySession without EXEC_CLI_TOOL/EXEC_PUBLIC_CLI_TOOL; expect 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_NoPerm_QuerySession_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.querySession('xts_noperm_session');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'QuerySession noPerm %{public}s', safeErrorText(error));
          expect(isNoPermBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_NoPerm_SendMessage_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_NoPerm_SendMessage_0100
     * @tc.desc   sendMessage without EXEC_CLI_TOOL/EXEC_PUBLIC_CLI_TOOL; expect 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_NoPerm_SendMessage_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.sendMessage('xts_noperm_session', 'hello');
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SendMessage noPerm %{public}s', safeErrorText(error));
          expect(isNoPermBizCode(code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliManager_NoPerm_SubscribeSession_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliManager_NoPerm_SubscribeSession_0100
     * @tc.desc   subscribeSession without EXEC_CLI_TOOL/EXEC_PUBLIC_CLI_TOOL; expect 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliManager_NoPerm_SubscribeSession_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.subscribeSession('xts_noperm_session', {
            onEvent: (_event) => {
            }
          });
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'SubscribeSession noPerm %{public}s', safeErrorText(error));
          expect(isNoPermBizCode(code)).assertTrue();
        }
        done();
      });
  });
}
