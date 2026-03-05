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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsFloatBoxSetText() {
  describe("builtinsFloatBoxSetText", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.name    builtinsFloatBoxSetText0001
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0001
     * @tc.desc    Test FloatBox.set method basic functionality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = FloatBox.box(10.5 as float);
      const ret = box.set(20.7 as float);
      expect(ret).assertEqual(20.7 as float);
      expect(box.get()).assertEqual(20.7 as float);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0002
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0002
     * @tc.desc    Test FloatBox precision with addition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new FloatBox();
      const value1 = 1.0 as float;
      const value2 = 1e-8 as float;
      box.set(value1);
      const sum = box.get() + value2;
      box.set(sum);
      expect(box.get()).assertEqual(1.0 as float);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0003
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0003
     * @tc.desc    Test FloatBox.set method with minimum positive float value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const v = 1.40129846432481707e-45 as float;
      const box = new FloatBox();
      expect(box.set(v)).assertEqual(v);
      expect(box.get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0004
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0004
     * @tc.desc    Test FloatBox.set method with maximum positive float value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const v = 3.40282346638528860e+38 as float;
      const box = new FloatBox();
      expect(box.set(v)).assertEqual(v);
      expect(box.get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0005
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0005
     * @tc.desc    Test FloatBox.set method multiple consecutive calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new FloatBox();
      expect(box.set(1.1 as float)).assertEqual(1.1 as float);
      expect(box.set(2.2 as float)).assertEqual(2.2 as float);
      expect(box.set(3.3 as float)).assertEqual(3.3 as float);
      expect(box.get()).assertEqual(3.3 as float);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0006
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0006
     * @tc.desc    Test FloatBox.set method with underflow positive value 1.0e-46
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const box = new FloatBox();
      expect(box.set(1.0e-46 as float)).assertEqual(0.0 as float); // flush to zero
      expect(box.get()).assertEqual(0.0 as float);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0007
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0007
     * @tc.desc    Test FloatBox.set method with hex literal 0xcafebabe
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const v = 0xcafebabe as float;
      const box = new FloatBox();
      expect(box.set(v)).assertEqual(v);
      expect(box.get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0008
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0008
     * @tc.desc    Test FloatBox.set method with minimum negative float value -1.40129846432481707e-45
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const v = -1.40129846432481707e-45 as float;
      const box = new FloatBox();
      expect(box.set(v)).assertEqual(v);
      expect(box.get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0009
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0009
     * @tc.desc    Test FloatBox.set method with maximum negative float value -3.40282346638528860e+38
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const v = -3.40282346638528860e+38 as float;
      const box = new FloatBox();
      expect(box.set(v)).assertEqual(v);
      expect(box.get()).assertEqual(v);
    });

    /**
     * @tc.name    builtinsFloatBoxSetText0010
     * @tc.number  BUILTINS_FLOAT_BOX_SET_TEXT_0010
     * @tc.desc    Test FloatBox.set method with underflow negative value -1.0e-46
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsFloatBoxSetText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const box = new FloatBox();
      expect(box.set(-1.0e-46 as float)).assertEqual(-0.0 as float);
      expect(box.get()).assertEqual(-0.0 as float);
    });
  })
}