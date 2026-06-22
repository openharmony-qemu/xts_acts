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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ArcListChildrenMainSizeTest() {

  describe('ArcListChildrenMainSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    it('testArcListChildrenMainSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize001()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize002', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize002()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize003()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize004()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize005()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize006()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize007()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize008()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize009', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize009()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize010', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize010()).assertEqual(0)
      done()
    })

    it('testArcListChildrenMainSize011', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize011()).assertEqual(0)
      done()
    })
  })
}