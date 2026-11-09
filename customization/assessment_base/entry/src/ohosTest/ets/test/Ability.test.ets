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
     * @tc.number SUB_Customization_Assessment_begin_Success_0001
     * @tc.name   SUB_Customization_Assessment_begin_Success_0001
     * @tc.desc   begin interface is called successfully and isActive returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_Success_0001';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
        const active: boolean = assessment.isActive();
        expect(active).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      assessment.end(context);
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_preparatory_begin_Success_0002
     * @tc.name   SUB_Customization_Assessment_preparatory_begin_Success_0002
     * @tc.desc   begin interface is called repeatedly without exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_preparatory_begin_Success_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_preparatory_begin_Success_0002';
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
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_error_0003
     * @tc.name   SUB_Customization_Assessment_begin_error_0003
     * @tc.desc   begin interface is called again during an active assessment and throws 36700002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_error_0003', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_error_0003';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
        assessment.begin(context, config, assessmentCallback);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(36700002);
          expect(err.message).assertEqual('Assessment configuration service is already active');
        }
      }
      assessment.end(context);
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_userCancel_Success_0001
     * @tc.name   SUB_Customization_Assessment_begin_userCancel_Success_0001
     * @tc.desc   begin interface with user canceling the confirm dialog, onBegin callback returns USER_CANCEL and isActive returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_userCancel_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_userCancel_Success_0001';
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

        const active: boolean = assessment.isActive();
        expect(active).assertFalse();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0001
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0001
     * @tc.desc   begin interface with allowedApps exceeding the maximum count (20) throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0001';
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
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })


    /**
     * @tc.number SUB_Customization_Assessment_onBegin_Success_0001
     * @tc.name   SUB_Customization_Assessment_onBegin_Success_0001
     * @tc.desc   onBegin callback of the IAssessmentCallback interface returns OK after begin succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_Success_0001';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      assessment.end(context);
      done();
    })


    /**
     * @tc.number SUB_Customization_Assessment_end_success_0001
     * @tc.name   SUB_Customization_Assessment_end_success_0001
     * @tc.desc   end interface is called successfully after the assessment began
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_end_success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_end_success_0001';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
        assessment.end(context);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onEnd_Success_0001
     * @tc.name   SUB_Customization_Assessment_onEnd_Success_0001
     * @tc.desc   onEnd callback of the IAssessmentCallback interface is triggered after end and isActive returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onEnd_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onEnd_Success_0001';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
        assessment.end(context);
        await driver.delayMs(1000);
        expect(endCalled).assertTrue();
        const active: boolean = assessment.isActive();
        expect(active).assertFalse();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_end_error_0002
     * @tc.name   SUB_Customization_Assessment_end_error_0002
     * @tc.desc   end interface is called when the assessment is not active and throws 36700003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_end_error_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_end_error_0002';
      try {
        // 应用上下文
        let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
        assessment.end(context);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(36700003);
          expect(err.message).assertEqual('Assessment configuration service is not active');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_isActive_Success_0001
     * @tc.name   SUB_Customization_Assessment_isActive_Success_0001
     * @tc.desc   isActive interface returns true during an active assessment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_isActive_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_isActive_Success_0001';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
        const active: boolean = assessment.isActive();
        expect(active).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      assessment.end(context);

      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_isActive_Success_0002
     * @tc.name   SUB_Customization_Assessment_isActive_Success_0002
     * @tc.desc   isActive interface returns false when not in assessment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_isActive_Success_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_isActive_Success_0002';
      try {
        const active: boolean = assessment.isActive();
        expect(active).assertFalse();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_0001
     * @tc.name   SUB_Customization_Assessment_getConfiguration_Success_0001
     * @tc.desc   getConfiguration interface returns the configured duration during an active assessment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_0001';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.duration).assertEqual(3600000);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      assessment.end(context);

      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_0002
     * @tc.name   SUB_Customization_Assessment_getConfiguration_Success_0002
     * @tc.desc   getConfiguration interface returns duration 0 when the assessment is not active
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_0002';
      try {
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.duration).assertEqual(0);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_0003
     * @tc.name   SUB_Customization_Assessment_getConfiguration_Success_0003
     * @tc.desc   getConfiguration interface returns empty allowedApps when the assessment is not active
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_0003', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_0003';
      try {
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.allowedApps.length).assertEqual(0);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_0004
     * @tc.name   SUB_Customization_Assessment_getConfiguration_Success_0004
     * @tc.desc   getConfiguration interface returns the default config after the assessment ended
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_0004', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_0004';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
        assessment.end(context);
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.duration).assertEqual(0);
        expect(getconfig.allowedApps.length).assertEqual(0);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_getConfiguration_Success_0005
     * @tc.name   SUB_Customization_Assessment_getConfiguration_Success_0005
     * @tc.desc   getConfiguration interface returns the configured allowedApps during an active assessment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_getConfiguration_Success_0005', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_getConfiguration_Success_0005';
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
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
        const getconfig: assessment.AssessmentConfig = assessment.getConfiguration();
        expect(getconfig.allowedApps[0]).assertEqual('com.samples.assessment');

      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      assessment.end(context);
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_duration_Success_0001
     * @tc.name   SUB_Customization_Assessment_duration_Success_0001
     * @tc.desc   the duration field of AssessmentConfig is set to 7200000 successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_duration_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_duration_Success_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：最大时长2小时（7200000毫秒），评估期间允许运行包名为com.samples.assessment的应用
      let config: assessment.AssessmentConfig = {
        duration: 7200000,
        allowedApps: ['com.samples.assessment']
      };
      expect(config.duration).assertEqual(7200000);
      expect(typeof config.duration).assertEqual('number');

      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_duration_Success_0002
     * @tc.name   SUB_Customization_Assessment_duration_Success_0002
     * @tc.desc   the duration field of AssessmentConfig is set to 0 which means unlimited
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_duration_Success_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_duration_Success_0002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：不限时（duration为0），评估期间允许运行包名为com.example.dictionary的应用
      let config: assessment.AssessmentConfig = {
        duration: 0,
        allowedApps: ['com.example.dictionary']
      };
      expect(config.duration).assertEqual(0);
      expect(typeof config.duration).assertEqual('number');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_duration_Success_0003
     * @tc.name   SUB_Customization_Assessment_duration_Success_0003
     * @tc.desc   the duration field of AssessmentConfig is set to 0 with allowedApps configured
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_duration_Success_0003', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_duration_Success_0003';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：不限时（duration为0），评估期间允许运行包名为com.example.dictionary的应用
      let config: assessment.AssessmentConfig = {
        duration: 0,
        allowedApps: ['com.example.dictionary']
      };
      expect(config.duration).assertEqual(0);
      expect(config.allowedApps.length).assertEqual(1);
      expect(config.allowedApps[0]).assertEqual('com.example.dictionary');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_allowedApps_Success_0001
     * @tc.name   SUB_Customization_Assessment_allowedApps_Success_0001
     * @tc.desc   the allowedApps field of AssessmentConfig supports a list of package names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_allowedApps_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_allowedApps_Success_0001';
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
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_allowedApps_Success_0002
     * @tc.name   SUB_Customization_Assessment_allowedApps_Success_0002
     * @tc.desc   the allowedApps field of AssessmentConfig can be an empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_allowedApps_Success_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_allowedApps_Success_0002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      // 评估配置：白名单为空数组
      let config: assessment.AssessmentConfig = {
        duration: 3600000,
        allowedApps: []
      };
      expect(config.allowedApps.length).assertEqual(0);
      expect(Array.isArray(config.allowedApps)).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_allowedApps_Success_0003
     * @tc.name   SUB_Customization_Assessment_allowedApps_Success_0003
     * @tc.desc   the allowedApps field of AssessmentConfig supports at most 10 package names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_allowedApps_Success_0003', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_allowedApps_Success_0003';
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
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentErrorCode_Success_0001
     * @tc.name   SUB_Customization_Assessment_assessmentErrorCode_Success_0001
     * @tc.desc   the values of the AssessmentErrorCode enum are as defined in the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentErrorCode_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentErrorCode_Success_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      expect(assessment.AssessmentErrorCode.OK).assertEqual(0);
      expect(assessment.AssessmentErrorCode.USER_CANCEL).assertEqual(1);
      expect(assessment.AssessmentErrorCode.TIMEOUT).assertEqual(2);
      expect(assessment.AssessmentErrorCode.SYSTEM_ERROR).assertEqual(3);
      expect(assessment.AssessmentErrorCode.ENV_ANOMALY).assertEqual(4);
      done();
    })


    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_0001
     * @tc.name   SUB_Customization_Assessment_assessmentError_Success_0001
     * @tc.desc   the AssessmentError interface contains code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.OK,
        message: 'Assessment begin  successfully'
      };
      expect(error.code).assertEqual(0);
      expect(error.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(typeof error.message).assertEqual('string');
      let AssessmentErrorinfo: assessment.AssessmentError = error;
      let interruptnfo: assessment.AssessmentInterruptInfo = error as ESObject;

      let captureBeginErr: assessment.AssessmentError | null = null;
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;

      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(AssessmentErrorinfo);
      assessmentCallback.onInterrupted(interruptnfo);

      expect(captureBeginErr!.code).assertEqual(0);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(captureBeginErr!.message).assertEqual('Assessment begin  successfully');

      expect(captureInterruptInfo!.code).assertEqual(0);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(captureInterruptInfo!.message).assertEqual('Assessment begin  successfully');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_0002
     * @tc.name   SUB_Customization_Assessment_assessmentError_Success_0002
     * @tc.desc   the message field of the AssessmentError interface is optional and is undefined when not provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_0002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);
      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.OK,
      };
      expect(error.code).assertEqual(0);
      expect(error.message).assertEqual(undefined);
      let AssessmentErrorinfo: assessment.AssessmentError = error;
      let interruptnfo: assessment.AssessmentInterruptInfo = error as ESObject;

      let captureBeginErr: assessment.AssessmentError | null = null;
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;

      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(AssessmentErrorinfo);
      assessmentCallback.onInterrupted(interruptnfo);

      expect(captureBeginErr!.code).assertEqual(0);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(captureBeginErr!.message).assertEqual(undefined);

      expect(captureInterruptInfo!.code).assertEqual(0);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(captureInterruptInfo!.message).assertEqual(undefined);
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_0003
     * @tc.name   SUB_Customization_Assessment_assessmentError_Success_0003
     * @tc.desc   the AssessmentError interface with USER_CANCEL code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_0003', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_0003';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.USER_CANCEL,
        message: 'User cancelled the assessment'
      };

      expect(error.code).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
      expect(typeof error.message).assertEqual('string');
      expect(error.message).assertEqual('User cancelled the assessment');
      let AssessmentErrorinfo: assessment.AssessmentError = error;
      let interruptnfo: assessment.AssessmentInterruptInfo = error as ESObject;

      let captureBeginErr: assessment.AssessmentError | null = null;
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;

      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(AssessmentErrorinfo);
      assessmentCallback.onInterrupted(interruptnfo);

      expect(captureBeginErr!.code).assertEqual(1);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
      expect(captureBeginErr!.message).assertEqual('User cancelled the assessment');

      expect(captureInterruptInfo!.code).assertEqual(1);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
      expect(captureInterruptInfo!.message).assertEqual('User cancelled the assessment');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_0004
     * @tc.name   SUB_Customization_Assessment_assessmentError_Success_0004
     * @tc.desc   the AssessmentError interface with TIMEOUT code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_0004', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_0004';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.TIMEOUT,
        message: 'User cancelled the assessment'
      };

      expect(error.code).assertEqual(assessment.AssessmentErrorCode.TIMEOUT);
      expect(typeof error.message).assertEqual('string');
      expect(error.message).assertEqual('User cancelled the assessment');
      let AssessmentErrorinfo: assessment.AssessmentError = error;
      let interruptnfo: assessment.AssessmentInterruptInfo = error as ESObject;

      let captureBeginErr: assessment.AssessmentError | null = null;
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;

      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(AssessmentErrorinfo);
      assessmentCallback.onInterrupted(interruptnfo);

      expect(captureBeginErr!.code).assertEqual(2);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.TIMEOUT);
      expect(captureBeginErr!.message).assertEqual('User cancelled the assessment');

      expect(captureInterruptInfo!.code).assertEqual(2);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.TIMEOUT);
      expect(captureInterruptInfo!.message).assertEqual('User cancelled the assessment');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_0005
     * @tc.name   SUB_Customization_Assessment_assessmentError_Success_0005
     * @tc.desc   the AssessmentError interface with SYSTEM_ERROR code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_0005', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_0005';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.SYSTEM_ERROR,
        message: 'User cancelled the assessment'
      };

      expect(error.code).assertEqual(assessment.AssessmentErrorCode.SYSTEM_ERROR);
      expect(typeof error.message).assertEqual('string');
      expect(error.message).assertEqual('User cancelled the assessment');
      let AssessmentErrorinfo: assessment.AssessmentError = error;
      let interruptnfo: assessment.AssessmentInterruptInfo = error as ESObject;

      let captureBeginErr: assessment.AssessmentError | null = null;
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;

      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(AssessmentErrorinfo);
      assessmentCallback.onInterrupted(interruptnfo);

      expect(captureBeginErr!.code).assertEqual(3);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.SYSTEM_ERROR);
      expect(captureBeginErr!.message).assertEqual('User cancelled the assessment');

      expect(captureInterruptInfo!.code).assertEqual(3);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.SYSTEM_ERROR);
      expect(captureInterruptInfo!.message).assertEqual('User cancelled the assessment');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_0006
     * @tc.name   SUB_Customization_Assessment_assessmentError_Success_0006
     * @tc.desc   the AssessmentError interface with ENV_ANOMALY code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_0006', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_0006';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.ENV_ANOMALY,
        message: 'User cancelled the assessment'
      };

      expect(error.code).assertEqual(assessment.AssessmentErrorCode.ENV_ANOMALY);
      expect(typeof error.message).assertEqual('string');
      expect(error.message).assertEqual('User cancelled the assessment');
      let AssessmentErrorinfo: assessment.AssessmentError = error;
      let interruptnfo: assessment.AssessmentInterruptInfo = error as ESObject;

      let captureBeginErr: assessment.AssessmentError | null = null;
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;

      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(AssessmentErrorinfo);
      assessmentCallback.onInterrupted(interruptnfo);

      expect(captureBeginErr!.code).assertEqual(4);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.ENV_ANOMALY);
      expect(captureBeginErr!.message).assertEqual('User cancelled the assessment');

      expect(captureInterruptInfo!.code).assertEqual(4);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.ENV_ANOMALY);
      expect(captureInterruptInfo!.message).assertEqual('User cancelled the assessment');
      done();
    })


    /**
     * @tc.number SUB_Customization_Assessment_assessmentInterruptInfo_Success_0001
     * @tc.name   SUB_Customization_Assessment_assessmentInterruptInfo_Success_0001
     * @tc.desc   the AssessmentInterruptInfo interface contains code and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentInterruptInfo_Success_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentInterruptInfo_Success_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let info: assessment.AssessmentInterruptInfo = {
        code: assessment.AssessmentErrorCode.USER_CANCEL,
        message: 'User cancelled the assessment'
      };
      expect(info.code).assertEqual(1);
      expect(info.code).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
      expect(typeof info.message).assertEqual('string');
      expect(info.message).assertEqual('User cancelled the assessment');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0002
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0002
     * @tc.desc   begin interface with an empty allowedApps array throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0002';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: []
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      assessment.end(context);
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0003
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0003
     * @tc.desc   begin interface with an empty string in allowedApps throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0003', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0003';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['']
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
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0004
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0004
     * @tc.desc   begin interface with a blank string in allowedApps throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0004', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0004';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: [' ']
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
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0005
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0005
     * @tc.desc   begin interface with a null config throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0005', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0005';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config = null;
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
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0006
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0006
     * @tc.desc   begin interface with an undefined config throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0006', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0006';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config = undefined;
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
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0016
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0016
     * @tc.desc   begin interface with an undefined config throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0016', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0016';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: ESObject = {
          duration: 3600000,
          allowedApps: ''
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
        let driver: Driver = Driver.create();
        await driver.delayMs(1000);
        let button: Component = await driver.findComponent(ON.text('开启'));
        await button.click();
        await driver.delayMs(1000);
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      }
      assessment.end(context);
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0007
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0007
     * @tc.desc   begin interface with a null onBegin callback throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0007', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0007';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        let assessmentCallback: ESObject = { onBegin: null };
        assessment.begin(context, config, assessmentCallback);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0008
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0008
     * @tc.desc   begin interface with an undefined onBegin callback throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0008', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0008';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        let assessmentCallback: ESObject = { onBegin: undefined };
        assessment.begin(context, config, assessmentCallback);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0009
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0009
     * @tc.desc   begin interface with a null onInterrupted callback throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0009', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0009';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        let assessmentCallback: ESObject = { onInterrupted: null };
        assessment.begin(context, config, assessmentCallback);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_begin_paramError_0010
     * @tc.name   SUB_Customization_Assessment_begin_paramError_0010
     * @tc.desc   begin interface with an undefined onInterrupted callback throws 401 parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_begin_paramError_0010', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_begin_paramError_0010';
      let context: common.UIAbilityContext = TestAbilityUtil.TEST_CONEXT;
      try {
        let config: assessment.AssessmentConfig = {
          duration: 3600000,
          allowedApps: ['com.samples.assessment']
        };
        let assessmentCallback: ESObject = { onInterrupted: undefined };
        assessment.begin(context, config, assessmentCallback);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('Invalid parameter');
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_callbackNull_0001
     * @tc.name   SUB_Customization_Assessment_onBegin_callbackNull_0001
     * @tc.desc   onBegin callback invoked with null and the received error parameter is null without exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_callbackNull_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_callbackNull_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

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
        let onBegin_null: ESObject = null;
        assessmentCallback.onBegin(onBegin_null);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(undefined);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_callbackUndefined_0002
     * @tc.name   SUB_Customization_Assessment_onBegin_callbackUndefined_0002
     * @tc.desc   onBegin callback invoked with undefined and the received error parameter is undefined without exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_callbackUndefined_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_callbackUndefined_0002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

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
        let onBegin_undefined: ESObject = undefined;
        assessmentCallback.onBegin(onBegin_undefined);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(undefined);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_callbackNull_0001
     * @tc.name   SUB_Customization_Assessment_onInterrupted_callbackNull_0001
     * @tc.desc   onInterrupted callback invoked with null and the received info parameter is null without exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_callbackNull_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_callbackNull_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

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
        let onInterrupted_null: ESObject = null;
        assessmentCallback.onInterrupted(onInterrupted_null);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(undefined);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_callbackUndefined_0002
     * @tc.name   SUB_Customization_Assessment_onInterrupted_callbackUndefined_0002
     * @tc.desc   onInterrupted callback invoked with undefined and the received info parameter is undefined without exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_callbackUndefined_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_callbackUndefined_0002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

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
        let onInterrupted_undefined: ESObject = undefined;
        assessmentCallback.onInterrupted(onInterrupted_undefined);
        expect(false).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(undefined);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_0008
     * @tc.name SUB_Customization_Assessment_assessmentError_Success_0008
     * @tc.desc the AssessmentError interface accepts an illegal code -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_0008', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_0008';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      try {
        let error: assessment.AssessmentError = {
          code: -1 as assessment.AssessmentErrorCode,
          message: 'Assessment begin  successfully'
        };
        expect(error.code).assertEqual(-1);
        expect(error.message).assertEqual('Assessment begin  successfully');

        let AssessmentErrorinfo: assessment.AssessmentError = error;
      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(undefined);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_assessmentError_Success_0009
     * @tc.name SUB_Customization_Assessment_assessmentError_Success_0009
     * @tc.desc the AssessmentError object with an illegal code -1 cast to AssessmentInterruptInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_Customization_Assessment_assessmentError_Success_0009', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_assessmentError_Success_0009';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      try {
        let error: assessment.AssessmentError = {
          code: -1 as assessment.AssessmentErrorCode,
          message: 'Assessment begin  successfully'
        };
        expect(error.code).assertEqual(-1);
        expect(error.message).assertEqual('Assessment begin  successfully');


        let interruptnfo: assessment.AssessmentInterruptInfo = error as ESObject;

      } catch (err) {
        if (err.code === 801) {
          expect(err.code).assertEqual(801);
          done();
          return;
        } else {
          hilog.error(DOMAIN, TAG, `${testNum} failed, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(undefined);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_errorCode_OK_0001
     * @tc.name   SUB_Customization_Assessment_onBegin_errorCode_OK_0001
     * @tc.desc   onBegin callback receives the AssessmentError with OK code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_errorCode_OK_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_errorCode_OK_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.OK,
        message: 'Assessment begin successfully'
      };
      let captureBeginErr: assessment.AssessmentError | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(error);

      expect(captureBeginErr!.code).assertEqual(0);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(captureBeginErr!.message).assertEqual('Assessment begin successfully');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_errorCode_USER_CANCEL_0002
     * @tc.name   SUB_Customization_Assessment_onBegin_errorCode_USER_CANCEL_0002
     * @tc.desc   onBegin callback receives the AssessmentError with USER_CANCEL code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_errorCode_USER_CANCEL_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_errorCode_USER_CANCEL_0002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.USER_CANCEL,
        message: 'User cancelled the assessment'
      };
      let captureBeginErr: assessment.AssessmentError | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(error);

      expect(captureBeginErr!.code).assertEqual(1);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
      expect(captureBeginErr!.message).assertEqual('User cancelled the assessment');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_errorCode_TIMEOUT_0003
     * @tc.name   SUB_Customization_Assessment_onBegin_errorCode_TIMEOUT_0003
     * @tc.desc   onBegin callback receives the AssessmentError with TIMEOUT code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_errorCode_TIMEOUT_0003', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_errorCode_TIMEOUT_0003';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.TIMEOUT,
        message: 'Assessment timed out'
      };
      let captureBeginErr: assessment.AssessmentError | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(error);

      expect(captureBeginErr!.code).assertEqual(2);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.TIMEOUT);
      expect(captureBeginErr!.message).assertEqual('Assessment timed out');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_errorCode_SYSTEM_ERROR_0004
     * @tc.name   SUB_Customization_Assessment_onBegin_errorCode_SYSTEM_ERROR_0004
     * @tc.desc   onBegin callback receives the AssessmentError with SYSTEM_ERROR code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_errorCode_SYSTEM_ERROR_0004', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_errorCode_SYSTEM_ERROR_0004';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.SYSTEM_ERROR,
        message: 'Assessment system error'
      };
      let captureBeginErr: assessment.AssessmentError | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(error);

      expect(captureBeginErr!.code).assertEqual(3);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.SYSTEM_ERROR);
      expect(captureBeginErr!.message).assertEqual('Assessment system error');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_errorCode_ENV_ANOMALY_0005
     * @tc.name   SUB_Customization_Assessment_onBegin_errorCode_ENV_ANOMALY_0005
     * @tc.desc   onBegin callback receives the AssessmentError with ENV_ANOMALY code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_errorCode_ENV_ANOMALY_0005', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_errorCode_ENV_ANOMALY_0005';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.ENV_ANOMALY,
        message: 'Assessment environment anomaly'
      };
      let captureBeginErr: assessment.AssessmentError | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(error);

      expect(captureBeginErr!.code).assertEqual(4);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.ENV_ANOMALY);
      expect(captureBeginErr!.message).assertEqual('Assessment environment anomaly');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_errorCode_illegal_0006
     * @tc.name   SUB_Customization_Assessment_onBegin_errorCode_illegal_0006
     * @tc.desc   onBegin callback receives the AssessmentError with illegal code -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_errorCode_illegal_0006', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_errorCode_illegal_0006';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: -1 as assessment.AssessmentErrorCode,
        message: 'Assessment begin successfully'
      };
      let captureBeginErr: assessment.AssessmentError | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(error);

      expect(captureBeginErr!.code).assertEqual(-1);
      expect(captureBeginErr!.message).assertEqual('Assessment begin successfully');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_errorCode_illegal_0007
     * @tc.name   SUB_Customization_Assessment_onBegin_errorCode_illegal_0007
     * @tc.desc   onBegin callback receives the AssessmentError with illegal code 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_errorCode_illegal_0007', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_errorCode_illegal_0007';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: 5 as assessment.AssessmentErrorCode,
        message: 'Assessment begin successfully'
      };
      let captureBeginErr: assessment.AssessmentError | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(error);

      expect(captureBeginErr!.code).assertEqual(5);
      expect(captureBeginErr!.message).assertEqual('Assessment begin successfully');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_errorCode_OK_0001
     * @tc.name   SUB_Customization_Assessment_onInterrupted_errorCode_OK_0001
     * @tc.desc   onInterrupted callback receives the AssessmentInterruptInfo with OK code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_errorCode_OK_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_errorCode_OK_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let interruptInfo: assessment.AssessmentInterruptInfo = {
        code: assessment.AssessmentErrorCode.OK,
        message: 'Assessment interrupted'
      };
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onInterrupted(interruptInfo);

      expect(captureInterruptInfo!.code).assertEqual(0);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(captureInterruptInfo!.message).assertEqual('Assessment interrupted');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_errorCode_USER_CANCEL_0002
     * @tc.name   SUB_Customization_Assessment_onInterrupted_errorCode_USER_CANCEL_0002
     * @tc.desc   onInterrupted callback receives the AssessmentInterruptInfo with USER_CANCEL code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_errorCode_USER_CANCEL_0002', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_errorCode_USER_CANCEL_0002';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let interruptInfo: assessment.AssessmentInterruptInfo = {
        code: assessment.AssessmentErrorCode.USER_CANCEL,
        message: 'User cancelled the assessment'
      };
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onInterrupted(interruptInfo);

      expect(captureInterruptInfo!.code).assertEqual(1);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.USER_CANCEL);
      expect(captureInterruptInfo!.message).assertEqual('User cancelled the assessment');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_errorCode_TIMEOUT_0003
     * @tc.name   SUB_Customization_Assessment_onInterrupted_errorCode_TIMEOUT_0003
     * @tc.desc   onInterrupted callback receives the AssessmentInterruptInfo with TIMEOUT code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_errorCode_TIMEOUT_0003', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_errorCode_TIMEOUT_0003';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let interruptInfo: assessment.AssessmentInterruptInfo = {
        code: assessment.AssessmentErrorCode.TIMEOUT,
        message: 'Assessment timed out'
      };
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onInterrupted(interruptInfo);

      expect(captureInterruptInfo!.code).assertEqual(2);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.TIMEOUT);
      expect(captureInterruptInfo!.message).assertEqual('Assessment timed out');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_errorCode_SYSTEM_ERROR_0004
     * @tc.name   SUB_Customization_Assessment_onInterrupted_errorCode_SYSTEM_ERROR_0004
     * @tc.desc   onInterrupted callback receives the AssessmentInterruptInfo with SYSTEM_ERROR code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_errorCode_SYSTEM_ERROR_0004', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_errorCode_SYSTEM_ERROR_0004';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let interruptInfo: assessment.AssessmentInterruptInfo = {
        code: assessment.AssessmentErrorCode.SYSTEM_ERROR,
        message: 'Assessment system error'
      };
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onInterrupted(interruptInfo);

      expect(captureInterruptInfo!.code).assertEqual(3);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.SYSTEM_ERROR);
      expect(captureInterruptInfo!.message).assertEqual('Assessment system error');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_errorCode_ENV_ANOMALY_0005
     * @tc.name   SUB_Customization_Assessment_onInterrupted_errorCode_ENV_ANOMALY_0005
     * @tc.desc   onInterrupted callback receives the AssessmentInterruptInfo with ENV_ANOMALY code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_errorCode_ENV_ANOMALY_0005', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_errorCode_ENV_ANOMALY_0005';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let interruptInfo: assessment.AssessmentInterruptInfo = {
        code: assessment.AssessmentErrorCode.ENV_ANOMALY,
        message: 'Assessment environment anomaly'
      };
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onInterrupted(interruptInfo);

      expect(captureInterruptInfo!.code).assertEqual(4);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.ENV_ANOMALY);
      expect(captureInterruptInfo!.message).assertEqual('Assessment environment anomaly');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_errorCode_illegal_0006
     * @tc.name   SUB_Customization_Assessment_onInterrupted_errorCode_illegal_0006
     * @tc.desc   onInterrupted callback receives the AssessmentInterruptInfo with illegal code -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_errorCode_illegal_0006', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_errorCode_illegal_0006';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let interruptInfo: assessment.AssessmentInterruptInfo = {
        code: -1 as assessment.AssessmentErrorCode,
        message: 'Assessment interrupted'
      };
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onInterrupted(interruptInfo);

      expect(captureInterruptInfo!.code).assertEqual(-1);
      expect(captureInterruptInfo!.message).assertEqual('Assessment interrupted');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_errorCode_illegal_0007
     * @tc.name   SUB_Customization_Assessment_onInterrupted_errorCode_illegal_0007
     * @tc.desc   onInterrupted callback receives the AssessmentInterruptInfo with illegal code 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_errorCode_illegal_0007', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_errorCode_illegal_0007';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let interruptInfo: assessment.AssessmentInterruptInfo = {
        code: 5 as assessment.AssessmentErrorCode,
        message: 'Assessment interrupted'
      };
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onInterrupted(interruptInfo);

      expect(captureInterruptInfo!.code).assertEqual(5);
      expect(captureInterruptInfo!.message).assertEqual('Assessment interrupted');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onBegin_emptyMessage_0001
     * @tc.name   SUB_Customization_Assessment_onBegin_emptyMessage_0001
     * @tc.desc   onBegin callback receives the AssessmentError with an empty message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onBegin_emptyMessage_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onBegin_emptyMessage_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let error: assessment.AssessmentError = {
        code: assessment.AssessmentErrorCode.OK,
        message: ''
      };
      let captureBeginErr: assessment.AssessmentError | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          captureBeginErr = err;
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onBegin(error);

      expect(captureBeginErr!.code).assertEqual(0);
      expect(captureBeginErr!.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(captureBeginErr!.message).assertEqual('');
      done();
    })

    /**
     * @tc.number SUB_Customization_Assessment_onInterrupted_emptyMessage_0001
     * @tc.name   SUB_Customization_Assessment_onInterrupted_emptyMessage_0001
     * @tc.desc   onInterrupted callback receives the AssessmentInterruptInfo with an empty message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Customization_Assessment_onInterrupted_emptyMessage_0001', Level.LEVEL0, async (done: () => void) => {
      const testNum = 'SUB_Customization_Assessment_onInterrupted_emptyMessage_0001';
      hilog.info(DOMAIN, TAG, '%{public}s', `test ${testNum}`);

      let interruptInfo: assessment.AssessmentInterruptInfo = {
        code: assessment.AssessmentErrorCode.OK,
        message: ''
      };
      let captureInterruptInfo: assessment.AssessmentInterruptInfo | null = null;
      let assessmentCallback: assessment.IAssessmentCallback = {
        onBegin: (err) => {
          if (err.code === assessment.AssessmentErrorCode.OK) {
            hilog.info(DOMAIN, TAG, 'Assessment began successfully.');
          } else {
            hilog.error(DOMAIN, TAG, `Assessment begin failed, code: ${err.code}, message: ${err.message}`);
          }
        },
        onInterrupted: (info: assessment.AssessmentInterruptInfo) => {
          captureInterruptInfo = info;
          hilog.warn(DOMAIN, TAG, `Assessment interrupted, code: ${info.code}, message: ${info.message}`);
        },
        onEnd: () => {
          hilog.info(DOMAIN, TAG, 'Assessment ended.');
        }
      };

      assessmentCallback.onInterrupted(interruptInfo);

      expect(captureInterruptInfo!.code).assertEqual(0);
      expect(captureInterruptInfo!.code).assertEqual(assessment.AssessmentErrorCode.OK);
      expect(captureInterruptInfo!.message).assertEqual('');
      done();
    })

  })
}
