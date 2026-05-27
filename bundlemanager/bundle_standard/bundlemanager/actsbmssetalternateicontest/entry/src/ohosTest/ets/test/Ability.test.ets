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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import bundleManager from '@ohos.bundle.bundleManager';

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';
const ERROR_CODE_17700308: number = 17700308;
const ERROR_CODE_17700309: number = 17700309;
const ERROR_CODE_401: number = 401;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.name   SUB_BMS_FRAMEWORK_SETALTERNATEICON_0100
     * @tc.number SUB_BMS_FRAMEWORK_SETALTERNATEICON_0100
     * @tc.desc   Test setAlternateIcon with empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_BMS_FRAMEWORK_SETALTERNATEICON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_SETALTERNATEICON_0100';
        hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} begin`);
        let alternateName: string = '';
        try {
          bundleManager.setAlternateIcon(alternateName).then(() => {
            hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon success`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon failed: ${err.code}`);
            expect(err.code).assertEqual(ERROR_CODE_17700309);
            done();
          });
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon error: ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} end`);
      })

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_SETALTERNATEICON_0200
     * @tc.number SUB_BMS_FRAMEWORK_SETALTERNATEICON_0200
     * @tc.desc   Test setAlternateIcon with a invalid name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_SETALTERNATEICON_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_SETALTERNATEICON_0200';
        hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} begin`);
        let alternateName: string = 'NOT_EXIST';
        try {
          bundleManager.setAlternateIcon(alternateName).then(() => {
            hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon success`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon failed: ${err.code}`);
            expect(err.code).assertEqual(ERROR_CODE_17700308);
            done();
          });
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon error: ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} end`);
    })

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_SETALTERNATEICON_0300
     * @tc.number SUB_BMS_FRAMEWORK_SETALTERNATEICON_0300
     * @tc.desc   Test setAlternateIcon and getAlternateIcons with a valid name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_BMS_FRAMEWORK_SETALTERNATEICON_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_SETALTERNATEICON_0300';
        hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} begin`);
        let alternateName: string = 'testIcon';
        try {
          bundleManager.setAlternateIcon(alternateName).then(() => {
            hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon success`);
            bundleManager.getAlternateIcons().then((data) => {
              hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} getAlternateIcons success`,`data: ${JSON.stringify(data)}`);
              expect(data.length).assertEqual(1);
              expect(data[0].iconName).assertEqual('testIcon');
              expect(data[0].iconId).assertLarger(0);
              expect(data[0].enabled).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} getAlternateIcons failed: ${err.code}`);
              expect().assertFail();
              done();
            });
          }).catch((err: BusinessError) => {
            hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon failed: ${err.code}`);
            expect().assertFail();
            done();
          });
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon error: ${err.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} end`);
     })

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_SETALTERNATEICON_0400
     * @tc.number SUB_BMS_FRAMEWORK_SETALTERNATEICON_0400
     * @tc.desc   Test setAlternateIcon  with nulll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_SETALTERNATEICON_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_SETALTERNATEICON_0400';
        hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} begin`);
        let alternateName: string | null = null;
        try {
          bundleManager.setAlternateIcon(alternateName).then(() => {
            hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon success`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon failed: ${err.code}`);
            expect().assertFail();
            done();
          });
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon error: ${err.code}`);
          expect(err.code).assertEqual(ERROR_CODE_401);
          done();
        }
        hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} end`);
     })

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_SETALTERNATEICON_0500
     * @tc.number SUB_BMS_FRAMEWORK_SETALTERNATEICON_0500
     * @tc.desc   Test setAlternateIcon  with undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
      it('SUB_BMS_FRAMEWORK_SETALTERNATEICON_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: Function) => {
          const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_SETALTERNATEICON_0500';
          hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} begin`);
          let alternateName: string | undefined = undefined;
          try {
            bundleManager.setAlternateIcon(alternateName).then(() => {
              hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon success`);
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon failed: ${err.code}`);
              expect().assertFail();
              done();
            });
          } catch (e) {
            let err: BusinessError = e as BusinessError;
            hilog.error(DOMAIN, TAG, `${TEST_CASE_NAME} setAlternateIcon error: ${err.code}`);
            expect(err.code).assertEqual(ERROR_CODE_401);
            done();
          }
          hilog.info(DOMAIN, TAG, `${TEST_CASE_NAME} end`);
       })
  })
}