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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, TestType, Size, Level, it } from "@ohos/hypium"
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
     * @tc.number SUB_Customization_Assessment_begin_Success_001
     * @tc.name   begin interface normal test
     * @tc.desc   begin interface is called successfully and isActive returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_begin_Success_001';
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

        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
        const active: boolean = assessment.isActive();
        expect(active).assertTrue()
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      assessment.end(context);
    })

    /**
     * @tc.number SUB_Customization_Assessment_preparatory_begin_Success_002
     * @tc.name   begin interface repeated call test
     * @tc.desc   begin interface is called repeatedly without exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_preparatory_begin_Success_002', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_preparatory_begin_Success_002';
      try {
        // 应用上下文
        let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
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
        assessment.begin(context, config, assessmentCallback);
        assessment.begin(context, config, assessmentCallback);
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('取消'));
        await button.click();
        await driver.delayMs(1000);
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_error_003
     * @tc.name   begin interface repeated error test
     * @tc.desc   begin interface is called again during an active assessment and throws 36700002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_error_003', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_begin_error_003';
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
        assessment.begin(context, config, assessmentCallback);
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(36700002)
      }
      assessment.end(context);
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_userCancel_Success_001
     * @tc.name   begin interface user cancel test
     * @tc.desc   begin interface with user canceling the confirm dialog, onBegin callback returns USER_CANCEL and isActive returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_userCancel_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_begin_userCancel_Success_001';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        let beginCode: number = -1;
        let assessmentCallback: assessment.IAssessmentCallback = {
          onBegin: (error: assessment.AssessmentError) => {
            beginCode = error.code;
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('取消'));
        await button.click();
        await driver.delayMs(1000);
        // expect(beginCode).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
        const active: boolean = assessment.isActive();
        expect(active).assertFalse();
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} 111111111failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_001
     * @tc.name   begin interface allowedApps exceed limit test
     * @tc.desc   begin interface with 11 allowedApps (max is 10) throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_001';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let allowedApps: string[] = [];
        for (let i = 0; i < 20; i++) {
          allowedApps.push(`com.samples.app${i}`);
        }
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: allowedApps
        };
        let assessmentCallback: assessment.IAssessmentCallback = {
          onBegin: (error: assessment.AssessmentError) => {
            hilog.info(DOMAIN, TAG, `onBegin, code: ${error.code}, message: ${error.message}`);
          },
          onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
            hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
          },
          onEnd: () => {
            hilog.info(DOMAIN, TAG, 'Assessment ended.');
          }
        };
        assessment.begin(context, config, assessmentCallback);
        expect(false).assertTrue()
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401)
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_002
     * @tc.name   begin interface invalid duration test
     * @tc.desc   begin interface with a negative duration throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_002', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_002';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: -1,
          allowedApps: ['com.samples.assessment']
        };
        let assessmentCallback: assessment.IAssessmentCallback = {
          onBegin: (error: assessment.AssessmentError) => {
            hilog.info(DOMAIN, TAG, `onBegin, code: ${error.code}, message: ${error.message}`);
          },
          onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
            hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
          },
          onEnd: () => {
            hilog.info(DOMAIN, TAG, 'Assessment ended.');
          }
        };
        assessment.begin(context, config, assessmentCallback);
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401)
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_Success_001
     * @tc.name   onBegin callback test
     * @tc.desc   onBegin callback of the IAssessmentCallback interface returns OK after begin succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_onBegin_Success_001';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        let beginCode: number = -1;
        let assessmentCallback: assessment.IAssessmentCallback = {
          onBegin: (error: assessment.AssessmentError) => {
            beginCode = error.code;
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      assessment.end(context);
    })


    /**
     * @tc.number SUB_Customization_Assessment_end_success_001
     * @tc.name   end interface normal test
     * @tc.desc   end interface is called successfully after the assessment began
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_end_success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_end_success_001';
      try {
        // 应用上下文
        let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
        assessment.end(context);
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_onEnd_Success_001
     * @tc.name   onEnd callback test
     * @tc.desc   onEnd callback of the IAssessmentCallback interface is triggered after end and isActive returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onEnd_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_onEnd_Success_001';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        let endCalled: boolean = false;
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
            endCalled = true;
            hilog.info(DOMAIN, TAG, 'Assessment ended.');
          }
        };
        assessment.begin(context, config, assessmentCallback);
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
        assessment.end(context);
        await driver.delayMs(1000);
        expect(endCalled).assertTrue();
        const active: boolean = assessment.isActive();
        expect(active).assertFalse();
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_end_error_002
     * @tc.name   end interface not active error test
     * @tc.desc   end interface is called when the assessment is not active and throws 36700003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_end_error_002', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_end_error_002';
      try {
        // 应用上下文
        let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
        assessment.end(context);
        expect(false).assertTrue()
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(36700003)
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_isActive_Success_001
     * @tc.name   isActive interface true test
     * @tc.desc   isActive interface returns true during an active assessment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_isActive_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_isActive_Success_001';
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
        const active: boolean = assessment.isActive();
        expect(active).assertTrue()
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      assessment.end(context);

    })

    /**
     * @tc.number SUB_Customization_Assessment_isActive_Success_002
     * @tc.name   isActive interface false test
     * @tc.desc   isActive interface returns false when not in assessment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_isActive_Success_002', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_isActive_Success_002';
      try {
        const active: boolean = assessment.isActive();
        expect(active).assertFalse()
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_001
     * @tc.name   getConfiguration interface duration test
     * @tc.desc   getConfiguration interface returns the configured duration during an active assessment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_001';
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.duration).assertEqual(3600000)
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      assessment.end(context);

    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_002
     * @tc.name   getConfiguration interface default duration test
     * @tc.desc   getConfiguration interface returns duration 0 when the assessment is not active
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_002', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_002';
      try {
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.duration).assertEqual(0)
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_003
     * @tc.name   getConfiguration interface default allowedApps test
     * @tc.desc   getConfiguration interface returns empty allowedApps when the assessment is not active
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_003', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_003';
      try {
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.allowedApps.length).assertEqual(0)
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_004
     * @tc.name   getConfiguration interface after end test
     * @tc.desc   getConfiguration interface returns the default config after the assessment ended
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_004', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_004';
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
        assessment.end(context);
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.duration).assertEqual(0)
        expect(getconfig.allowedApps.length).assertEqual(0)
      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_005
     * @tc.name   getConfiguration interface allowedApps test
     * @tc.desc   getConfiguration interface returns the configured allowedApps during an active assessment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_005', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_005';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await driver.delayMs(1000);
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.allowedApps[0]).assertEqual('com.samples.assessment');

      } catch (err) {
        hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      assessment.end(context);
    })

    /**
     * @tc.number SUB_Customization_Assessment_duration_Success_001
     * @tc.name   AssessmentConfig duration normal test
     * @tc.desc   the duration field of AssessmentConfig is set to 7200000 successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_duration_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_duration_Success_001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：最大时长2小时（7200000毫秒），评估期间允许运行包名为com.samples.assessment的应用
      let config: assessment.AssessmentConfig = {
        duration: 7200000,
        allowedApps: ['com.samples.assessment']
      };
      expect(config.duration).assertEqual(7200000);
      expect(typeof config.duration).assertEqual('number');

    })

    /**
     * @tc.number SUB_Customization_Assessment_duration_Success_002
     * @tc.name   AssessmentConfig duration zero test
     * @tc.desc   the duration field of AssessmentConfig is set to 0 which means unlimited
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_duration_Success_002', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_duration_Success_002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：不限时（duration为0），评估期间允许运行包名为com.example.dictionary的应用
      let config: assessment.AssessmentConfig = {
        duration: 0,
        allowedApps: ['com.example.dictionary']
      };
      expect(config.duration).assertEqual(0);
      expect(typeof config.duration).assertEqual('number');
    })

    /**
     * @tc.number SUB_Customization_Assessment_duration_Success_003
     * @tc.name   AssessmentConfig duration zero with whitelist test
     * @tc.desc   the duration field of AssessmentConfig is set to 0 with allowedApps configured
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_duration_Success_003', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_duration_Success_003';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：不限时（duration为0），评估期间允许运行包名为com.example.dictionary的应用
      let config: assessment.AssessmentConfig = {
        duration: 0,
        allowedApps: ['com.example.dictionary']
      };
      expect(config.duration).assertEqual(0);
      expect(config.allowedApps.length).assertEqual(1);
      expect(config.allowedApps[0]).assertEqual('com.example.dictionary');
    })

    /**
     * @tc.number SUB_Customization_Assessment_allowedApps_Success_001
     * @tc.name   AssessmentConfig allowedApps normal test
     * @tc.desc   the allowedApps field of AssessmentConfig supports a list of package names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_allowedApps_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_allowedApps_Success_001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：最大时长1小时（3600000毫秒），评估期间允许运行包名为com.example.dictionary等三个应用
      let config: assessment.AssessmentConfig = {
        duration: 3600000,
        allowedApps: ['com.example.dictionary', 'com.example.app2', 'com.example.app3']
      };
      expect(config.allowedApps.length).assertEqual(3);
      expect(config.allowedApps[0]).assertEqual('com.example.dictionary');
      expect(config.allowedApps[1]).assertEqual('com.example.app2');
      expect(config.allowedApps[2]).assertEqual('com.example.app3');
    })

    /**
     * @tc.number SUB_Customization_Assessment_allowedApps_Success_002
     * @tc.name   AssessmentConfig allowedApps empty test
     * @tc.desc   the allowedApps field of AssessmentConfig can be an empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_allowedApps_Success_002', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_allowedApps_Success_002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：白名单为空数组
      let config: assessment.AssessmentConfig = {
        duration: 3600000,
        allowedApps: []
      };
      expect(config.allowedApps.length).assertEqual(0);
      expect(Array.isArray(config.allowedApps)).assertTrue();
    })

    /**
     * @tc.number SUB_Customization_Assessment_allowedApps_Success_003
     * @tc.name   AssessmentConfig allowedApps max boundary test
     * @tc.desc   the allowedApps field of AssessmentConfig supports at most 10 package names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_allowedApps_Success_003', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_allowedApps_Success_003';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：白名单配置10个包名（接口规定最多支持10个）
      let allowedApps: string[] = [];
      for (let i = 0; i < 10; i++) {
        allowedApps.push(`com.samples.app${i}`);
      }
      let config: assessment.AssessmentConfig = {
        duration: 3600000,
        allowedApps: allowedApps
      };
      expect(config.allowedApps.length).assertEqual(10);
      expect(config.allowedApps[0]).assertEqual('com.samples.app0');
      expect(config.allowedApps[9]).assertEqual('com.samples.app9');
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentErrorCode_Success_001
     * @tc.name   AssessmentErrorCode enum test
     * @tc.desc   the values of the AssessmentErrorCode enum are as defined in the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentErrorCode_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_assessmentErrorCode_Success_001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      expect(assessment.AssessmentErrorCode.OK).assertEqual(0);
      expect(assessment.AssessmentErrorCode.USER_CANCEL).assertEqual(1);
      expect(assessment.AssessmentErrorCode.TIMEOUT).assertEqual(2);
      expect(assessment.AssessmentErrorCode.SYSTEM_ERROR).assertEqual(3);
      // expect(assessment.AssessmentErrorCode.SECURITY_BREACH).assertEqual(4);
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_001
     * @tc.name   AssessmentError interface normal test
     * @tc.desc   the AssessmentError interface contains code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.OK,
        message: 'Assessment begin  successfully'
      }
      expect(error.code).assertEqual(0);
      expect(error.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(typeof error.message).assertEqual('string');
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_002
     * @tc.name   AssessmentError interface message optional test
     * @tc.desc   the message field of the AssessmentError interface is optional and defaults to an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_002', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);
      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.OK,
      }
      expect(error.code).assertEqual(0);
      expect(error.message).assertEqual(undefined);
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_003
     * @tc.name   AssessmentError interface USER_CANCEL test
     * @tc.desc   the AssessmentError interface with USER_CANCEL code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_003', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_003';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.USER_CANCEL,
        message: 'User cancelled the assessment'
      }

      expect(error.code).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
      expect(typeof error.message).assertEqual('string');
      expect(error.message).assertEqual('User cancelled the assessment');
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentInterruptInfo_Success_001
     * @tc.name   AssessmentInterruptInfo interface normal test
     * @tc.desc   the AssessmentInterruptInfo interface contains code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentInterruptInfo_Success_001', Level.LEVEL0, async () => {
      const testNum = 'SUB_Customization_Assessment_assessmentInterruptInfo_Success_001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let info: assessment.AssessmentInterruptInfo = {
        code: assessment.AssessmentErrorCode.USER_CANCEL,
        message: 'User cancelled the assessment'
      };
      expect(info.code).assertEqual(1);
      expect(info.code).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
      expect(typeof info.message).assertEqual('string');
      expect(info.message).assertEqual('User cancelled the assessment');
    })

  })
}