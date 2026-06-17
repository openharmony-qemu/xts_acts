/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ArcListFlingSpeedLimitTest() {

  describe('ArcListFlingSpeedLimitTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    it('testArcListFlingSpeedLimit001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimit001()).assertEqual(0)
      done()
    })

    it('testArcListFlingSpeedLimit002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimit002()).assertEqual(0)
      done()
    })

    it('testArcListFlingSpeedLimit003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimit003()).assertEqual(0)
      done()
    })

    it('testArcListFlingSpeedLimit004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListFlingSpeedLimit004()).assertEqual(0)
      done()
    })
  })
}