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

export default function ArcScrollBarDisplayModeTest() {

  describe('ArcScrollBarDisplayModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    it('testArcScrollBarDisplayMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayMode001()).assertEqual(0)
      done()
    })

    it('testArcScrollBarDisplayMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayMode002()).assertEqual(0)
      done()
    })

    it('testArcScrollBarDisplayMode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayMode003()).assertEqual(0)
      done()
    })

    it('testArcScrollBarDisplayMode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcScrollBarDisplayMode004()).assertEqual(0)
      done()
    })
  })
}