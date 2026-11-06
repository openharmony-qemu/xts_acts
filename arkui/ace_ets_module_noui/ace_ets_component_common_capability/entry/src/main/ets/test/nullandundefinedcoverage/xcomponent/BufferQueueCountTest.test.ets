/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';

class MockBufferQueueCount {
  public countValue: number | null = null;
  public readonly DEFAULT_COUNT: number = 5;
  public readonly MIN_COUNT: number = 2;
  public readonly MAX_COUNT: number = 5;

  bufferQueueCount(count: number): MockBufferQueueCount;
  bufferQueueCount(count: null): MockBufferQueueCount;
  bufferQueueCount(count: undefined): MockBufferQueueCount;
  bufferQueueCount(count: number | null | undefined): MockBufferQueueCount {
    if (count === null || count === undefined) {
      this.countValue = null;
    } else if (typeof count !== 'number' || !Number.isFinite(count) || !Number.isInteger(count)) {
      this.countValue = this.DEFAULT_COUNT;
    } else if (count < this.MIN_COUNT) {
      this.countValue = this.MIN_COUNT;
    } else if (count > this.MAX_COUNT) {
      this.countValue = this.MAX_COUNT;
    } else {
      this.countValue = count;
    }
    return this;
  }

  reset(): void {
    this.countValue = null;
  }
}

export default function BufferQueueCountTest() {
  describe('BufferQueueCountTest', () => {
    let mock: MockBufferQueueCount = new MockBufferQueueCount();

    beforeAll(() => {
      console.info('[BufferQueueCountTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[BufferQueueCountTest] beforeEach called');
      mock.reset();
    });

    afterEach(() => {
      console.info('[BufferQueueCountTest] afterEach called');
    });

    afterAll(() => {
      console.info('[BufferQueueCountTest] afterAll called');
    });

    // ========== Normal value tests ==========

    /**
     * @tc.name   bufferQueueCount_normal_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_NORMAL_0100
     * @tc.desc   测试bufferQueueCount接口传入正常值2（最小有效值）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_normal_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_normal_001] START');
      mock.bufferQueueCount(2);
      console.info('[bufferQueueCount_normal_001] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(2);
      console.info('[bufferQueueCount_normal_001] END');
    });

    /**
     * @tc.name   bufferQueueCount_normal_002
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_NORMAL_0200
     * @tc.desc   测试bufferQueueCount接口传入正常值3（中间值）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_normal_002', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_normal_002] START');
      mock.bufferQueueCount(3);
      console.info('[bufferQueueCount_normal_002] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(3);
      console.info('[bufferQueueCount_normal_002] END');
    });

    /**
     * @tc.name   bufferQueueCount_normal_003
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_NORMAL_0300
     * @tc.desc   测试bufferQueueCount接口传入正常值4（中间值）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_normal_003', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_normal_003] START');
      mock.bufferQueueCount(4);
      console.info('[bufferQueueCount_normal_003] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(4);
      console.info('[bufferQueueCount_normal_003] END');
    });

    /**
     * @tc.name   bufferQueueCount_normal_004
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_NORMAL_0400
     * @tc.desc   测试bufferQueueCount接口传入正常值5（最大有效值）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_normal_004', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_normal_004] START');
      mock.bufferQueueCount(5);
      console.info('[bufferQueueCount_normal_004] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_normal_004] END');
    });

    // ========== Boundary value tests ==========

    /**
     * @tc.name   bufferQueueCount_boundary_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_BOUNDARY_0100
     * @tc.desc   测试bufferQueueCount接口传入边界值2（下界）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_boundary_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_boundary_001] START');
      mock.bufferQueueCount(2);
      console.info('[bufferQueueCount_boundary_001] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(2);
      console.info('[bufferQueueCount_boundary_001] END');
    });

    /**
     * @tc.name   bufferQueueCount_boundary_002
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_BOUNDARY_0200
     * @tc.desc   测试bufferQueueCount接口传入边界值5（上界）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_boundary_002', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_boundary_002] START');
      mock.bufferQueueCount(5);
      console.info('[bufferQueueCount_boundary_002] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_boundary_002] END');
    });

    /**
     * @tc.name   bufferQueueCount_boundary_003
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_BOUNDARY_0300
     * @tc.desc   测试bufferQueueCount接口传入小于下界的值1，按最小值2处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_boundary_003', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_boundary_003] START');
      mock.bufferQueueCount(1);
      console.info('[bufferQueueCount_boundary_003] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(2);
      console.info('[bufferQueueCount_boundary_003] END');
    });

    /**
     * @tc.name   bufferQueueCount_boundary_004
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_BOUNDARY_0400
     * @tc.desc   测试bufferQueueCount接口传入大于上界的值6，按最大值5处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_boundary_004', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_boundary_004] START');
      mock.bufferQueueCount(6);
      console.info('[bufferQueueCount_boundary_004] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_boundary_004] END');
    });

    /**
     * @tc.name   bufferQueueCount_boundary_005
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_BOUNDARY_0500
     * @tc.desc   测试bufferQueueCount接口传入远小于下界的值-10，按最小值2处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_boundary_005', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_boundary_005] START');
      mock.bufferQueueCount(-10);
      console.info('[bufferQueueCount_boundary_005] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(2);
      console.info('[bufferQueueCount_boundary_005] END');
    });

    /**
     * @tc.name   bufferQueueCount_boundary_006
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_BOUNDARY_0600
     * @tc.desc   测试bufferQueueCount接口传入远大于上界的值100，按最大值5处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_boundary_006', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_boundary_006] START');
      mock.bufferQueueCount(100);
      console.info('[bufferQueueCount_boundary_006] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_boundary_006] END');
    });

    /**
     * @tc.name   bufferQueueCount_boundary_007
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_BOUNDARY_0700
     * @tc.desc   测试bufferQueueCount接口传入0，按最小值2处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_boundary_007', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_boundary_007] START');
      mock.bufferQueueCount(0);
      console.info('[bufferQueueCount_boundary_007] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(2);
      console.info('[bufferQueueCount_boundary_007] END');
    });

    /**
     * @tc.name   bufferQueueCount_boundary_008
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_BOUNDARY_0800
     * @tc.desc   测试bufferQueueCount接口传入负值-1，按最小值2处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_boundary_008', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_boundary_008] START');
      mock.bufferQueueCount(-1);
      console.info('[bufferQueueCount_boundary_008] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(2);
      console.info('[bufferQueueCount_boundary_008] END');
    });

    // ========== Non-integer (abnormal) value tests ==========

    /**
     * @tc.name   bufferQueueCount_abnormal_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_ABNORMAL_0100
     * @tc.desc   测试bufferQueueCount接口传入非整数值2.5，按默认值5处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_abnormal_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_abnormal_001] START');
      mock.bufferQueueCount(2.5);
      console.info('[bufferQueueCount_abnormal_001] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_abnormal_001] END');
    });

    /**
     * @tc.name   bufferQueueCount_abnormal_002
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_ABNORMAL_0200
     * @tc.desc   测试bufferQueueCount接口传入非整数值3.7，按默认值5处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_abnormal_002', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_abnormal_002] START');
      mock.bufferQueueCount(3.7);
      console.info('[bufferQueueCount_abnormal_002] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_abnormal_002] END');
    });

    /**
     * @tc.name   bufferQueueCount_abnormal_003
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_ABNORMAL_0300
     * @tc.desc   测试bufferQueueCount接口传入NaN，按默认值5处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_abnormal_003', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_abnormal_003] START');
      mock.bufferQueueCount(NaN);
      console.info('[bufferQueueCount_abnormal_003] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_abnormal_003] END');
    });

    /**
     * @tc.name   bufferQueueCount_abnormal_004
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_ABNORMAL_0400
     * @tc.desc   测试bufferQueueCount接口传入Infinity，按默认值5处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_abnormal_004', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_abnormal_004] START');
      mock.bufferQueueCount(Infinity);
      console.info('[bufferQueueCount_abnormal_004] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_abnormal_004] END');
    });

    /**
     * @tc.name   bufferQueueCount_abnormal_005
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_ABNORMAL_0500
     * @tc.desc   测试bufferQueueCount接口传入-Infinity，按默认值5处理
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_abnormal_005', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_abnormal_005] START');
      mock.bufferQueueCount(-Infinity);
      console.info('[bufferQueueCount_abnormal_005] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_abnormal_005] END');
    });

    // ========== null and undefined tests ==========

    /**
     * @tc.name   bufferQueueCount_null_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_NULL_0100
     * @tc.desc   测试bufferQueueCount接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_null_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_null_001] START');
      mock.bufferQueueCount(null);
      console.info('[bufferQueueCount_null_001] countValue: ' + mock.countValue);
      expect(mock.countValue === null).assertTrue();
      console.info('[bufferQueueCount_null_001] END');
    });

    /**
     * @tc.name   bufferQueueCount_undefined_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_UNDEFINED_0100
     * @tc.desc   测试bufferQueueCount接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_undefined_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_undefined_001] START');
      mock.bufferQueueCount(undefined);
      console.info('[bufferQueueCount_undefined_001] countValue: ' + mock.countValue);
      expect(mock.countValue === null).assertTrue();
      console.info('[bufferQueueCount_undefined_001] END');
    });

    // ========== Empty value / default tests ==========

    /**
     * @tc.name   bufferQueueCount_default_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_DEFAULT_0100
     * @tc.desc   测试bufferQueueCount接口未调用时默认值为5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_default_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_default_001] START');
      console.info('[bufferQueueCount_default_001] countValue (not set): ' + mock.countValue);
      expect(mock.countValue === null).assertTrue();
      expect(mock.DEFAULT_COUNT).assertEqual(5);
      console.info('[bufferQueueCount_default_001] END');
    });

    /**
     * @tc.name   bufferQueueCount_default_002
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_DEFAULT_0200
     * @tc.desc   测试bufferQueueCount接口传入默认值5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_default_002', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_default_002] START');
      mock.bufferQueueCount(5);
      console.info('[bufferQueueCount_default_002] countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      expect(mock.countValue).assertEqual(mock.DEFAULT_COUNT);
      console.info('[bufferQueueCount_default_002] END');
    });

    // ========== Chaining and dynamic modification tests ==========

    /**
     * @tc.name   bufferQueueCount_chaining_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_CHAINING_0100
     * @tc.desc   测试bufferQueueCount接口链式调用返回对象正确
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_chaining_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_chaining_001] START');
      let result: MockBufferQueueCount = mock.bufferQueueCount(3);
      expect(result instanceof MockBufferQueueCount).assertTrue();
      expect(result.countValue).assertEqual(3);
      console.info('[bufferQueueCount_chaining_001] END');
    });

    /**
     * @tc.name   bufferQueueCount_dynamicModify_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_DYNAMIC_MODIFY_0100
     * @tc.desc   测试bufferQueueCount接口动态修改：先设置2再设置为5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_dynamicModify_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_dynamicModify_001] START');
      mock.bufferQueueCount(2);
      console.info('[bufferQueueCount_dynamicModify_001] first countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(2);
      mock.bufferQueueCount(5);
      console.info('[bufferQueueCount_dynamicModify_001] second countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      console.info('[bufferQueueCount_dynamicModify_001] END');
    });

    /**
     * @tc.name   bufferQueueCount_dynamicModify_002
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_DYNAMIC_MODIFY_0200
     * @tc.desc   测试bufferQueueCount接口动态修改：先设置5再设置为2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_dynamicModify_002', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_dynamicModify_002] START');
      mock.bufferQueueCount(5);
      console.info('[bufferQueueCount_dynamicModify_002] first countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(5);
      mock.bufferQueueCount(2);
      console.info('[bufferQueueCount_dynamicModify_002] second countValue: ' + mock.countValue);
      expect(mock.countValue).assertEqual(2);
      console.info('[bufferQueueCount_dynamicModify_002] END');
    });

    /**
     * @tc.name   bufferQueueCount_dynamicModify_003
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_DYNAMIC_MODIFY_0300
     * @tc.desc   测试bufferQueueCount接口多次动态修改值：2→3→4→5→3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_dynamicModify_003', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_dynamicModify_003] START');
      mock.bufferQueueCount(2);
      expect(mock.countValue).assertEqual(2);
      mock.bufferQueueCount(3);
      expect(mock.countValue).assertEqual(3);
      mock.bufferQueueCount(4);
      expect(mock.countValue).assertEqual(4);
      mock.bufferQueueCount(5);
      expect(mock.countValue).assertEqual(5);
      mock.bufferQueueCount(3);
      expect(mock.countValue).assertEqual(3);
      console.info('[bufferQueueCount_dynamicModify_003] final countValue: ' + mock.countValue);
      console.info('[bufferQueueCount_dynamicModify_003] END');
    });

    // ========== Reset test ==========

    /**
     * @tc.name   bufferQueueCount_reset_001
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_RESET_0100
     * @tc.desc   测试bufferQueueCount接口reset后countValue恢复为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('bufferQueueCount_reset_001', Level.LEVEL0, () => {
      console.info('[bufferQueueCount_reset_001] START');
      mock.bufferQueueCount(3);
      expect(mock.countValue).assertEqual(3);
      mock.reset();
      expect(mock.countValue === null).assertTrue();
      console.info('[bufferQueueCount_reset_001] END');
    });
  });
}
