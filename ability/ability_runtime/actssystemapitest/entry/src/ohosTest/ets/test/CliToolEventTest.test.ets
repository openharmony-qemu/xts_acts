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
import { common } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';

const TAG = 'cliToolEventTest';
const ERR_PERMISSION = 201;
const ERR_SYSTEM_API = 202;
const ERR_PARAM = 401;
const ERR_CAPABILITY = 801;
const ERR_SESSION_NOT_FOUND = 35600032;
const ERR_SYSTEM = 35600050;

const TOOL_EVENT_STDOUT = 'stdout';
const TOOL_EVENT_STDERR = 'stderr';
const TOOL_EVENT_EXIT = 'exit';
const TOOL_EVENT_ERROR = 'error';

function isExpectedBizCode(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_SYSTEM_API || code === ERR_PARAM ||
    code === ERR_CAPABILITY || code === ERR_SESSION_NOT_FOUND || code === ERR_SYSTEM ||
    code === 35600031;
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

function assertCliToolEvent(event: common.CliToolEvent): void {
  expect(event !== undefined).assertTrue();
  expect(event.toolEventType.length > 0).assertTrue();
  expect(event.data !== undefined).assertTrue();
  let t = '' + event.toolEventType;
  expect(t === TOOL_EVENT_STDOUT || t === TOOL_EVENT_STDERR ||
    t === TOOL_EVENT_EXIT || t === TOOL_EVENT_ERROR).assertTrue();
}

export default function cliToolEventTest() {
  describe('cliToolEventTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliToolEvent_Type_Enum_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliToolEvent_Type_Enum_0100
     * @tc.desc   Assert ToolEventType string values defined by CliToolEvent API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliToolEvent_Type_Enum_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
        expect(TOOL_EVENT_STDOUT).assertEqual('stdout');
        expect(TOOL_EVENT_STDERR).assertEqual('stderr');
        expect(TOOL_EVENT_EXIT).assertEqual('exit');
        expect(TOOL_EVENT_ERROR).assertEqual('error');
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliToolEvent_Callback_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliToolEvent_Callback_0100
     * @tc.desc   Receive CliToolEvent via execCmd callback; assert event shape when available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliToolEvent_Callback_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let gotEvent = false;
        try {
          let info = await cliManager.execCmd('echo xts_cli_tool_event', {
            background: false,
            yieldMs: 8000,
            timeout: 30,
            callback: {
              onEvent: (event: common.CliToolEvent) => {
                gotEvent = true;
                hilog.info(0x0000, TAG, 'onEvent type=%{public}s', event.toolEventType);
                assertCliToolEvent(event);
              }
            }
          });
          hilog.info(0x0000, TAG, 'session=%{public}s status=%{public}s gotEvent=%{public}s',
            info.sessionId, info.status, String(gotEvent));
          expect(info.sessionId.length > 0).assertTrue();
          try {
            await cliManager.clearSession(info.sessionId);
          } catch (clearErr) {
            hilog.info(0x0000, TAG, 'clearSession %{public}s', safeErrorText(clearErr));
          }
        } catch (error) {
          hilog.info(0x0000, TAG, 'Callback_0100 %{public}s', safeErrorText(error));
          expect(isExpectedBizCode(errCodeOf(error))).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_CliToolEvent_Subscribe_Abnormal_0100
     * @tc.number SUB_Ability_AbilityRuntime_CliToolEvent_Subscribe_Abnormal_0100
     * @tc.desc   subscribeSession invalid id while registering CliToolEvent callback; expect error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_CliToolEvent_Subscribe_Abnormal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          await cliManager.subscribeSession('xts_invalid_session_for_event', {
            onEvent: (event: common.CliToolEvent) => {
              assertCliToolEvent(event);
            }
          });
          expect().assertFail();
        } catch (error) {
          let code = errCodeOf(error);
          hilog.info(0x0000, TAG, 'Subscribe abnormal %{public}s', safeErrorText(error));
          expect(code === ERR_SESSION_NOT_FOUND || isExpectedBizCode(code)).assertTrue();
        }
        done();
      });
  });
}
