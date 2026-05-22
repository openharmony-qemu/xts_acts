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
import { Want, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';
import { commonEventManager } from '@kit.BasicServicesKit';
import testNapi from 'libentry.so';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import fs from '@ohos.file.fs';

let context: common.UIAbilityContext;

let sub: commonEventManager.CommonEventSubscriber;

let pipeRead: testNapi.PipeResult = { readFd: -1, writeFd: -1 };
let pipeWrite: testNapi.PipeResult = { readFd: -1, writeFd: -1 };

let connId: number = 0;

const CAPABILITY_NOT_SUPPORTED_ERROR = 801;

function isCapabilityNotSupportedCode(code: number): boolean {
  return String(code) === '801';
}

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time);
  });
}

async function SendCommand(command: string, fd: number) {
  try {
    let writeLen = await fs.write(fd, command);
    if (writeLen <= 0) {
      hilog.error(0x0000, 'testTag', `SendCommand writeLen <= 0`);
      return;
    }
    hilog.info(0x0000, 'testTag', `SendCommand command ${command} ok`);
  } catch (error) {
    hilog.error(0x0000, 'testTag', `SendCommand failed, errorCode: ${error.code}, message: ${error.message}`);
  }
}

function closePipe(pipe: testNapi.PipeResult) {
  if (pipe.readFd != -1) {
    fs.close(pipe.readFd);
    pipe.readFd = -1;
  }
  if (pipe.writeFd != -1) {
    fs.close(pipe.writeFd);
    pipe.writeFd = -1;
  }
}

function buildConnectWant(pipeReadFd: number, pipeWriteFd: number): Want {
  return {
    bundleName: 'com.acts.context.webonconnectnativerely',
    abilityName: 'WebNativeExtensionExtAbility1',
    parameters: {
      'ohos.arkweb.extensionOrigin': 'testOrigin',
      'ohos.arkweb.messageReadPipe': { 'type': 'FD', 'value': pipeReadFd },
      'ohos.arkweb.messageWritePipe': { 'type': 'FD', 'value': pipeWriteFd }
    }
  };
}

function handleCapabilityNotSupported(tcNumber: string, done: Function): boolean {
  let flag = true;
  hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
  expect(flag).assertEqual(true);
  flag = false;
  done();
  return true;
}

export default function startAbilityForResultTest() {
  describe('ActsStartAbilityForResultTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'ActsStartAbilityForResultTest beforeAll start');
    });

    afterEach(async () => {
      closePipe(pipeRead);
      closePipe(pipeWrite);
      try {
        commonEventManager.unsubscribe(sub);
      } catch (e) {
      }
      if (connId != 0) {
        webNativeMessagingExtensionManager.disconnectNative(connId).then(() => {
          hilog.info(0x0000, 'testTag', `afterEach disconnectNative id : ${connId} succeed`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `afterEach disconnectNative id : ${connId} error: ${JSON.stringify(err)}`);
        });
        connId = 0;
      }
    });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100
     * @tc.desc   Test startAbilityForResult(want) without options: verify Promise<AbilityResult> returns
     *            resultCode=0 and want field is present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100', Level.LEVEL0,
      async (done: Function) => {
        await sleep(3000);
        const tcNumber = `SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0100`;
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        try {
          pipeRead = testNapi.createPipe();
          pipeWrite = testNapi.createPipe();
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          return;
        }

        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['webNativeMessaging1_startAbilityForResult_success']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
            // 验证调用成功（result=200）
            expect(commonEventData.parameters?.result).assertEqual(200);
            // 验证 AbilityResult.resultCode = 0（由 EntryAbility.terminateSelfWithResult({resultCode:0}) 设置）
            expect(commonEventData.parameters?.resultCode).assertEqual(0);
            // 验证 AbilityResult.want 字段存在
            expect(commonEventData.parameters?.hasWant).assertEqual(1);
            done();
          });
        });

        let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
          onConnect(connection) {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
            SendCommand('startAbilityForResult', pipeWrite.writeFd);
          },
          onDisconnect(connection) {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          },
          onFailed(code, errMsg) {
            hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
            if (isCapabilityNotSupportedCode(code)) {
              handleCapabilityNotSupported(tcNumber, done);
              return;
            }
            expect(code).assertEqual(801);
            done();
          }
        };

        try {
          connId = webNativeMessagingExtensionManager.connectNative(
            context, buildConnectWant(pipeWrite.readFd, pipeRead.writeFd), callback);
          hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} connect failed: ${JSON.stringify(err)}`);
          connId = 0;
          if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
            handleCapabilityNotSupported(tcNumber, done);
            return;
          }
          expect(err.code).assertEqual('801');
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200
     * @tc.desc   Test startAbilityForResult(want, options) with StartOptions parameter: verify Promise<AbilityResult>
     *            returns resultCode=0 and want field is present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200', Level.LEVEL0,
      async (done: Function) => {
        await sleep(3000);
        const tcNumber = `SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0200`;
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        try {
          pipeRead = testNapi.createPipe();
          pipeWrite = testNapi.createPipe();
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          return;
        }

        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['webNativeMessaging1_startAbilityForResult_withOptions']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
            // 验证调用成功（result=200）
            expect(commonEventData.parameters?.result).assertEqual(200);
            // 验证 AbilityResult.resultCode = 0
            expect(commonEventData.parameters?.resultCode).assertEqual(0);
            // 验证 AbilityResult.want 字段存在
            expect(commonEventData.parameters?.hasWant).assertEqual(1);
            done();
          });
        });

        let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
          onConnect(connection) {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
            // 发送命令触发 startAbilityForResult(want, options) 带 StartOptions 的调用路径
            SendCommand('startAbilityForResultWithOptions', pipeWrite.writeFd);
          },
          onDisconnect(connection) {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          },
          onFailed(code, errMsg) {
            hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
            if (isCapabilityNotSupportedCode(code)) {
              handleCapabilityNotSupported(tcNumber, done);
              return;
            }
            expect(code).assertEqual(801);
            done();
          }
        };

        try {
          connId = webNativeMessagingExtensionManager.connectNative(
            context, buildConnectWant(pipeWrite.readFd, pipeRead.writeFd), callback);
          hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} connect failed: ${JSON.stringify(err)}`);
          connId = 0;
          if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
            handleCapabilityNotSupported(tcNumber, done);
            return;
          }
          expect(err.code).assertEqual('801');
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300
     * @tc.desc   Test startAbilityForResult with a non-existent ability: verify Promise rejects with
     *            BusinessError code 16000001 (The specified ability does not exist)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300', Level.LEVEL0,
      async (done: Function) => {
        await sleep(3000);
        const tcNumber = `SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300`;
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        try {
          pipeRead = testNapi.createPipe();
          pipeWrite = testNapi.createPipe();
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          return;
        }

        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['webNativeMessaging1_startAbilityForResult_error']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
            // 验证进入了 catch 分支（result=200 代表 catch 捕获到了错误）
            expect(commonEventData.parameters?.result).assertEqual(200);
            // 验证错误码为 16000001（指定 ability 不存在）
            expect(commonEventData.parameters?.errorCode).assertEqual(16000001);
            done();
          });
        });

        let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
          onConnect(connection) {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
            // 发送命令触发以无效 want 调用 startAbilityForResult，预期抛出 16000001
            SendCommand('startAbilityForResultError', pipeWrite.writeFd);
          },
          onDisconnect(connection) {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          },
          onFailed(code, errMsg) {
            hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
            if (isCapabilityNotSupportedCode(code)) {
              handleCapabilityNotSupported(tcNumber, done);
              return;
            }
            expect(code).assertEqual(801);
            done();
          }
        };

        try {
          connId = webNativeMessagingExtensionManager.connectNative(
            context, buildConnectWant(pipeWrite.readFd, pipeRead.writeFd), callback);
          hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} connect failed: ${JSON.stringify(err)}`);
          connId = 0;
          if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
            handleCapabilityNotSupported(tcNumber, done);
            return;
          }
          expect(err.code).assertEqual('801');
          done();
        }
      });
  });
}
