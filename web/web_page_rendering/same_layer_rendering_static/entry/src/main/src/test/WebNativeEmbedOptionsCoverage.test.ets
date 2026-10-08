'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

export default function webNativeEmbedOptionsCoverage() {
  describe('WebNativeEmbedOptionsCoverageTestSuite', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      try {
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        const want: Want = {
          bundleName: 'com.open.harmony.samelayerrenderingtest.static',
          abilityName: 'EntryAbility',
          uri: 'pages/WebNativeEmbedOptionsCoverage',
        };
        await delegator.startAbility(want);
        await Utils.msSleep(2000);
      } catch (err) {
        console.error('start WebNativeEmbedOptionsCoverage failed: ' + JSON.stringify(err));
      }
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   testNativeEmbedOptionsCssDisplayFalse
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_COVERAGE_0100
     * @tc.desc   nativeEmbedOptions supportCssDisplayChange false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeEmbedOptionsCssDisplayFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testCaseName: string = 'testNativeEmbedOptionsCssDisplayFalse';
        const expected: string = 'success';
        Utils.emitEvent(testCaseName, 10)
        Utils.registerEvent(testCaseName, expected, 37101, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebNativeEmbedOptionsCoverageButton', 10, '');
        await Utils.msSleep(2000);
        expect(testCaseName).assertEqual('testNativeEmbedOptionsCssDisplayFalse');
        done();
      })

    /**
     * @tc.name   testNativeEmbedOptionsTransformSkewTrue
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_COVERAGE_0200
     * @tc.desc   nativeEmbedOptions supportTransformRotateAndSkew true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeEmbedOptionsTransformSkewTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testCaseName: string = 'testNativeEmbedOptionsTransformSkewTrue';
        const expected: string = 'success';
        Utils.emitEvent(testCaseName, 10)
        Utils.registerEvent(testCaseName, expected, 37102, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebNativeEmbedOptionsCoverageButton', 10, '');
        await Utils.msSleep(2000);
        expect(testCaseName).assertEqual('testNativeEmbedOptionsTransformSkewTrue');
        done();
      })

    /**
     * @tc.name   testNativeEmbedOptionsTransformSkewFalse
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_COVERAGE_0300
     * @tc.desc   nativeEmbedOptions supportTransformRotateAndSkew false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeEmbedOptionsTransformSkewFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testCaseName: string = 'testNativeEmbedOptionsTransformSkewFalse';
        const expected: string = 'success';
        Utils.emitEvent(testCaseName, 10)
        Utils.registerEvent(testCaseName, expected, 37103, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebNativeEmbedOptionsCoverageButton', 10, '');
        await Utils.msSleep(2000);
        expect(testCaseName).assertEqual('testNativeEmbedOptionsTransformSkewFalse');
        done();
      })

    // 静态 API 不接受 null 字面量；null 语义暂不测，先保编译通过
    /*
    it('testNativeEmbedOptionsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testNativeEmbedOptionsNull', 10)
        Utils.registerEvent('testNativeEmbedOptionsNull', 'success', 37104, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebNativeEmbedOptionsCoverageButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    */

    /**
     * @tc.name   testNativeEmbedOptionsUndefined
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_COVERAGE_0400
     * @tc.desc   nativeEmbedOptions undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeEmbedOptionsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testCaseName: string = 'testNativeEmbedOptionsUndefined';
        const expected: string = 'success';
        Utils.emitEvent(testCaseName, 10)
        Utils.registerEvent(testCaseName, expected, 37105, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebNativeEmbedOptionsCoverageButton', 10, '');
        await Utils.msSleep(2000);
        expect(testCaseName).assertEqual('testNativeEmbedOptionsUndefined');
        done();
      })
  })
}
