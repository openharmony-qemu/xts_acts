/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';

const BUNDLE_NAME = 'ohos.acts.bundlemanager.test.getBundleInstallStatus.enterprise';
const BUNDLE_NAME_NOT_EXIST = 'ohos.acts.bundle.not.exist.dummy';
const ERROR_MESSAGE_PARAM_CHECK_ERROR = 'BusinessError 401: Parameter error. The type of bundleName must be string.';
const TAG = 'BundleMgrHits';
const TEST_SUITE_NAME = 'GetBundleInstallStatusTest';

export default function getBundleInstallStatusTest() {
  describe('GetBundleInstallStatusTest', () => {
    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0100
     * @tc.number SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0100
     * @tc.desc Verify an empty bundle name returns BUNDLE_NOT_EXIST.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0100';
        try {
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          const status = bundleManager.getBundleInstallStatus('');
          expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_NOT_EXIST);
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        } catch (err) {
          hilog.error(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0200
     * @tc.number SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0200
     * @tc.desc Verify a non-empty missing bundle name returns BUNDLE_NOT_EXIST.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0200';
        try {
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          const status = bundleManager.getBundleInstallStatus(BUNDLE_NAME_NOT_EXIST);
          expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_NOT_EXIST);
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        } catch (err) {
          hilog.error(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0300
     * @tc.number SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0300
     * @tc.desc Verify null is rejected with parameter error 401.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0300';
        try {
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          bundleManager.getBundleInstallStatus(null);
          expect().assertFail();
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch: code=${error.code}, message=${error.message}`);
          expect(error.code).assertEqual(401);
          expect(error.message).assertEqual(ERROR_MESSAGE_PARAM_CHECK_ERROR);
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0400
     * @tc.number SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0400
     * @tc.desc Verify undefined is rejected with parameter error 401.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0400';
        try {
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          bundleManager.getBundleInstallStatus(undefined);
          expect().assertFail();
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch: code=${error.code}, message=${error.message}`);
          expect(error.code).assertEqual(401);
          expect(error.message).assertEqual(ERROR_MESSAGE_PARAM_CHECK_ERROR);
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0500
     * @tc.number SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0500
     * @tc.desc Verify the test bundle is reported as BUNDLE_INSTALLED.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0500';
        try {
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          const status = bundleManager.getBundleInstallStatus(BUNDLE_NAME);
          expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_INSTALLED);
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        } catch (err) {
          hilog.error(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0600
     * @tc.number SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0600
     * @tc.desc Verify BUNDLE_INSTALLING enum value is 2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETBUNDLEINSTALLSTATUS_0600';
        try {
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          expect(bundleManager.BundleInstallStatus.BUNDLE_INSTALLING).assertEqual(2);
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        } catch (err) {
          hilog.error(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      });
  });
}
