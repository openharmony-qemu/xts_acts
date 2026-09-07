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

import { beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import testNapi from 'libnapiCovAsync.so';

export default function napiCovAsyncTest() {
  describe('ActsNapiCovAsyncTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateAsyncWorkNormal0001
     * @tc.number SUB_NAPI_ASYNC_NOCOV_0100
     * @tc.desc   Verify napi_create_async_work with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkNormal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkNormal0001';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkAbnormal0002
     * @tc.number SUB_NAPI_ASYNC_NOCOV_0200
     * @tc.desc   Verify napi_create_async_work with null parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkAbnormal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkAbnormal0002';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkReturnVal0003
     * @tc.number SUB_NAPI_ASYNC_NOCOV_0300
     * @tc.desc   Verify napi_create_async_work return value and queue/cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkReturnVal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkReturnVal0003';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkReturnVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}
