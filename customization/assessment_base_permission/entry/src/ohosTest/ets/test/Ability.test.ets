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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, TestType, Size, Level, it } from '@ohos/hypium'
import { assessment } from '@kit.AutomaticSceneConfigurationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base'
import { common } from '@kit.AbilityKit';
import { TestAbilityUtil } from "./util/TestAbilityUtil";
import { Component, Driver, ON, On } from '@kit.TestKit';

export const DOMAIN: number = 0xFF00

const TAG: string = 'Assessment'

export default function AutomaticSceneConTest() {
  describe('AutomaticSceneConTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_noPermission_0001
     * @tc.name   SUB_Customization_Assessment_begin_noPermission_0001
     * @tc.desc   begin interface throws 201 permission denied when the app does not request ohos.permission.ASSESSMENT_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_noPermission_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_noPermission_0001';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
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
     * @tc.number SUB_Customization_Assessment_end_noPermission_0001
     * @tc.name   SUB_Customization_Assessment_end_noPermission_0001
     * @tc.desc   end interface throws 201 permission denied when the app does not request ohos.permission.ASSESSMENT_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_end_noPermission_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_end_noPermission_0001';
      try {
        // 应用上下文
        let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
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
     * @tc.number SUB_Customization_Assessment_isActive_noPermission_0001
     * @tc.name   SUB_Customization_Assessment_isActive_noPermission_0001
     * @tc.desc   isActive interface throws 201 permission denied when the app does not request ohos.permission.ASSESSMENT_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_isActive_noPermission_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_isActive_noPermission_0001';
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
     * @tc.number SUB_Customization_Assessment_getConfiguration_noPermission_0001
     * @tc.name   SUB_Customization_Assessment_getConfiguration_noPermission_0001
     * @tc.desc   getConfiguration interface throws 201 permission denied when the app does not request ohos.permission.ASSESSMENT_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_noPermission_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_noPermission_0001';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
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
