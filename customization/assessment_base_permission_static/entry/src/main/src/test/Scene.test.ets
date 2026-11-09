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
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
//import emitter from '@ohos.events.emitter'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, Callback } from '@ohos.base'
import assessment from '@ohos.customization.assessment'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "@ohos/hypium-static/src/main/indexStatic";
import { Driver, ON, Component } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';
import notificationManager from '@ohos.notificationManager'


const TAG = 'ASCKit'
const DOMAIN: int = 0x0000;

let context: common.UIAbilityContext
let bundle: string = 'com.example.assessment.nopermission.static'

export default function AutomaticSceneConStaticTest(): void {
  let TEST_SUITE_NAME: string = 'AutomaticSceneConStaticTest ===>'
  describe('AutomaticSceneConStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        await abilityDelegator.startAbility({
          abilityName: 'EntryAbility',
          bundleName: bundle
        });
        hilog.info(DOMAIN, TAG, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll end');
      } catch (err) {
        hilog.info(DOMAIN, TAG, 'startAbility fail');
      }
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(2000);
    })

   
   /**
     * @tc.number SUB_Customization_Assessment_begin_noPermission_0100
     * @tc.name   SUB_Customization_Assessment_begin_noPermission_0100
     * @tc.desc   begin interface throws 201 permission denied when the app does not request ohos.permission.ASSESSMENT_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_noPermission_0100', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_noPermission_0100';
      let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      try {
        // 应用上下文
        // 评估配置：最大时长1小时（3600000毫秒），评估期间允许运行包名为com.samples.assessment的应用
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        // 评估过程回调
        let assessmentCallback: assessment.IAssessmentCallback = {
          onBegin: (error: assessment.AssessmentError) => {
            if (error.code === assessment.AssessmentErrorCode.OK) {
              hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
            } else {
              hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${error.code}, message: ${error.message}`);
            }
          },
          onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
            hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
          },
          onEnd: () => {
            hilog.info(DOMAIN, TAG, 'Assessment ended.');
          }
        };
        assessment.begin(context, config, assessmentCallback);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          expect(err.message).assertEqual('Capability not supported');
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          expect(err.message).assertEqual('Permission denied');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_end_noPermission_0200
     * @tc.name   SUB_Customization_Assessment_end_noPermission_0200
     * @tc.desc   end interface throws 201 permission denied when the app does not request ohos.permission.ASSESSMENT_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_end_noPermission_0200', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_end_noPermission_0200';
      try {
        // 应用上下文
        let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        assessment.end(context);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          expect(err.message).assertEqual('Capability not supported');
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          expect(err.message).assertEqual('Permission denied');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_isActive_noPermission_0300
     * @tc.name   SUB_Customization_Assessment_isActive_noPermission_0300
     * @tc.desc   isActive interface throws 201 permission denied when the app does not request ohos.permission.ASSESSMENT_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_isActive_noPermission_0300', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_isActive_noPermission_0300';
      try {
        const active: boolean = assessment.isActive();
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          expect(err.message).assertEqual('Capability not supported');
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          expect(err.message).assertEqual('Permission denied');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_noPermission_0400
     * @tc.name   SUB_Customization_Assessment_getConfiguration_noPermission_0400
     * @tc.desc   getConfiguration interface throws 201 permission denied when the app does not request ohos.permission.ASSESSMENT_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_noPermission_0400', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_noPermission_0400';
      let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          expect(err.message).assertEqual('Capability not supported');
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          expect(err.message).assertEqual('Permission denied');
        }
      }
      done();
    })
  })
}
