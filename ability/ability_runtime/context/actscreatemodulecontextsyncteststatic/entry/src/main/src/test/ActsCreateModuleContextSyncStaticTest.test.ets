'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import application from '@ohos.app.ability.application';
import { Driver, ON } from '@ohos.UiTest';

const DOMAIN: int = 0x0000;
const TAG = 'testTag';
const SUITE_NAME = 'ActsCreateModuleContextSyncStaticTest';
const BUNDLE_NAME = 'com.example.createmodulecontextsync.static';
const MODULE_ENTRY = 'entry';
const ERR_CONTEXT_NOT_EXIST = 16000011;
const ERR_MODULE_NOT_EXIST = 16000021;

let context: common.UIAbilityContext | undefined;

export default function actsCreateModuleContextSyncStaticTest() {
  describe('ActsCreateModuleContextSyncStaticTest', () => {
    beforeAll(async () => {
      let driver = Driver.create();
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(DOMAIN, TAG, `${SUITE_NAME} beforeAll start`);
      let delegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      let cmd = `aa start -a EntryAbility -b ${BUNDLE_NAME}`;
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if (user !== undefined) {
        cmd += ` -u ${user}`;
      }
      delegator.executeShellCommand(cmd).then(
        (result: abilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(DOMAIN, TAG, `ShellCmdResult: ${result.stdResult}`);
        });
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext')
        as common.UIAbilityContext;
      hilog.info(DOMAIN, TAG, `context: ${!!context}`);
      hilog.info(DOMAIN, TAG, `${SUITE_NAME} beforeAll end`);
    })

    /**
     * @tc.name   ACTS_CreateModuleContextSync_Static_0100
     * @tc.number ACTS_CreateModuleContextSync_Static_0100
     * @tc.desc   Verify createModuleContextSync returns context with correct properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CreateModuleContextSync_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const CASE_NAME = 'ACTS_CreateModuleContextSync_Static_0100';
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} start`);
        try {
          let ctx = application.createModuleContextSync(context!, MODULE_ENTRY);
          hilog.info(DOMAIN, TAG, `${CASE_NAME} create success`);
          expect(`${ctx.area}`).assertEqual('1');
          expect(ctx.applicationInfo.name).assertEqual(BUNDLE_NAME);
          expect(ctx.cacheDir).assertEqual('/data/storage/el2/base/cache');
          expect(ctx.tempDir).assertEqual('/data/storage/el2/base/temp');
          expect(ctx.filesDir).assertEqual('/data/storage/el2/base/files');
          expect(ctx.databaseDir).assertEqual('/data/storage/el2/database');
          expect(`${ctx.stageMode}`).assertEqual('true');
          hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} end`);
        } catch (error) {
          hilog.error(DOMAIN, TAG, `${CASE_NAME} failed: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   ACTS_CreateModuleContextSync_Static_0200
     * @tc.number ACTS_CreateModuleContextSync_Static_0200
     * @tc.desc   Verify createModuleContextSync returns context with correct applicationInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CreateModuleContextSync_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const CASE_NAME = 'ACTS_CreateModuleContextSync_Static_0200';
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} start`);
        try {
          let ctx = application.createModuleContextSync(context!, MODULE_ENTRY);
          hilog.info(DOMAIN, TAG, `${CASE_NAME} create success`);
          expect(ctx.applicationInfo.name).assertEqual(BUNDLE_NAME);
          hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} end`);
        } catch (error) {
          hilog.error(DOMAIN, TAG, `${CASE_NAME} failed: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   ACTS_CreateModuleContextSync_Static_0300
     * @tc.number ACTS_CreateModuleContextSync_Static_0300
     * @tc.desc   Verify createModuleContextSync throws 16000021 when module name is wrong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CreateModuleContextSync_Static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const CASE_NAME = 'ACTS_CreateModuleContextSync_Static_0300';
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} start`);
        try {
          application.createModuleContextSync(context!, 'entrytest');
          hilog.error(DOMAIN, TAG, `${CASE_NAME} should throw but did not`);
          expect().assertFail();
        } catch (error) {
          let e = error as BusinessError;
          hilog.info(DOMAIN, TAG, `${CASE_NAME} err code: ${e.code}`);
          expect(e.code).assertEqual(ERR_MODULE_NOT_EXIST);
        }
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} end`);
        done();
      });

    /**
     * @tc.name   ACTS_CreateModuleContextSync_Static_0400
     * @tc.number ACTS_CreateModuleContextSync_Static_0400
     * @tc.desc   Verify createModuleContextSync throws 16000021 when module name is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CreateModuleContextSync_Static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const CASE_NAME = 'ACTS_CreateModuleContextSync_Static_0400';
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} start`);
        try {
          application.createModuleContextSync(context!, '');
          hilog.error(DOMAIN, TAG, `${CASE_NAME} should throw but did not`);
          expect().assertFail();
        } catch (error) {
          let e = error as BusinessError;
          hilog.info(DOMAIN, TAG, `${CASE_NAME} err code: ${e.code}`);
          expect(e.code).assertEqual(ERR_MODULE_NOT_EXIST);
        }
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} end`);
        done();
      });

    /**
     * @tc.name   ACTS_CreateModuleContextSync_Static_0500
     * @tc.number ACTS_CreateModuleContextSync_Static_0500
     * @tc.desc   Verify createModuleContextSync throws 16000011 when context is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CreateModuleContextSync_Static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const CASE_NAME = 'ACTS_CreateModuleContextSync_Static_0500';
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} start`);
        let fakeContext = { stageMode: true } as common.Context;
        try {
          application.createModuleContextSync(fakeContext, MODULE_ENTRY);
          hilog.error(DOMAIN, TAG, `${CASE_NAME} should throw but did not`);
          expect().assertFail();
        } catch (error) {
          let e = error as BusinessError;
          hilog.info(DOMAIN, TAG, `${CASE_NAME} err code: ${e.code}`);
          expect(e.code).assertEqual(ERR_CONTEXT_NOT_EXIST);
        }
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} end`);
        done();
      });

    /**
     * @tc.name   ACTS_CreateModuleContextSync_Static_0600
     * @tc.number ACTS_CreateModuleContextSync_Static_0600
     * @tc.desc   Verify createModuleContextSync throws 16000021 when module does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_CreateModuleContextSync_Static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const CASE_NAME = 'ACTS_CreateModuleContextSync_Static_0600';
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} start`);
        try {
          application.createModuleContextSync(context!, 'nonexistent');
          hilog.error(DOMAIN, TAG, `${CASE_NAME} should throw but did not`);
          expect().assertFail();
        } catch (error) {
          let e = error as BusinessError;
          hilog.info(DOMAIN, TAG, `${CASE_NAME} err code: ${e.code}`);
          expect(e.code).assertEqual(ERR_MODULE_NOT_EXIST);
        }
        hilog.info(DOMAIN, TAG, `${SUITE_NAME}#${CASE_NAME} end`);
        done();
      });
  })
}
