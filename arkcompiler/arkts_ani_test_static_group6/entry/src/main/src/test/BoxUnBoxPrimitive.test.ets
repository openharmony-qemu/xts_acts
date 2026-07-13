'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function boxUnBoxPrimitiveTest(): void {
  describe("boxUnBoxPrimitiveTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0100
      * @tc.name      testBoxBooleanNative
      * @tc.desc      basic box Boolean test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxBooleanNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxBooleanNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0200
      * @tc.name      testUnboxBooleanNative
      * @tc.desc      basic unbox Boolean test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxBooleanNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxBooleanNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0210
      * @tc.name      testUnboxBooleanExceptionNative
      * @tc.desc      unbox Boolean exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxBooleanExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxBooleanExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0300
      * @tc.name      testBoxByteNative
      * @tc.desc      basic box Byte test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxByteNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxByteNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0310
      * @tc.name      testBoxByteExceptionNative
      * @tc.desc      box Byte exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxByteExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxByteExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0400
      * @tc.name      testUnboxByteNative
      * @tc.desc      basic unbox Byte test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxByteNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxByteNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0500
      * @tc.name      testBoxCharNative
      * @tc.desc      basic box Char test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxCharNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxCharNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0510
      * @tc.name      testBoxCharExceptionNative
      * @tc.desc      box Char exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxCharExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxCharExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0600
      * @tc.name      testUnboxCharNative
      * @tc.desc      basic unbox Char test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxCharNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxCharNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0610
      * @tc.name      testUnboxCharExceptionNative
      * @tc.desc      unbox Char exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxCharExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxCharExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0700
      * @tc.name      testBoxDoubleNative
      * @tc.desc      basic box Double test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxDoubleNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxDoubleNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0710
      * @tc.name      testBoxDoubleExceptionNative
      * @tc.desc      box Double exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxDoubleExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxDoubleExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0800
      * @tc.name      testUnboxDoubleNative
      * @tc.desc      basic unbox Double test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxDoubleNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxDoubleNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0810
      * @tc.name      testUnboxDoubleExceptionNative
      * @tc.desc      unbox Double exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxDoubleExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxDoubleExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0900
      * @tc.name      testBoxFloatNative
      * @tc.desc      basic box Float test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxFloatNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxFloatNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_0910
      * @tc.name      testBoxFloatExceptionNative
      * @tc.desc      box Float exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxFloatExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxFloatExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1000
      * @tc.name      testUnboxFloatNative
      * @tc.desc      basic unbox Float test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxFloatNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxFloatNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1010
      * @tc.name      testUnboxFloatExceptionNative
      * @tc.desc      unbox Float exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxFloatExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxFloatExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1100
      * @tc.name      testBoxIntNative
      * @tc.desc      basic box Int test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxIntNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxIntNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1110
      * @tc.name      testBoxIntExceptionNative
      * @tc.desc      box Int exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxIntExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxIntExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1200
      * @tc.name      testUnboxIntNative
      * @tc.desc      basic unbox Int test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxIntNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxIntNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1210
      * @tc.name      testUnboxIntExceptionNative
      * @tc.desc      unbox Int exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxIntExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxIntExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1300
      * @tc.name      testBoxLongNative
      * @tc.desc      basic box Long test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxLongNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxLongNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1310
      * @tc.name      testBoxLongExceptionNative
      * @tc.desc      box Long exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxLongExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxLongExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1400
      * @tc.name      testUnboxLongNative
      * @tc.desc      basic unbox Long test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxLongNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxLongNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1410
      * @tc.name      testUnboxLongExceptionNative
      * @tc.desc      unbox Long exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxLongExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxLongExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1500
      * @tc.name      testBoxShortNative
      * @tc.desc      basic box Short test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxShortNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxShortNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1510
      * @tc.name      testBoxShortExceptionNative
      * @tc.desc      box Short exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testBoxShortExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testBoxShortExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1600
      * @tc.name      testUnboxShortNative
      * @tc.desc      basic unbox Short test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxShortNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxShortNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1610
      * @tc.name      testUnboxShortExceptionNative
      * @tc.desc      unbox Short exception parameter test
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testUnboxShortExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testUnboxShortExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1700
      * @tc.name      testStabilityLoop1000NormalNative
      * @tc.desc      stability test: 1000 times loop normal box/unbox
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testStabilityLoop1000NormalNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testStabilityLoop1000NormalNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1710
      * @tc.name      testStabilityLoop1000ExceptionNative
      * @tc.desc      stability test: 1000 times loop exception box/unbox
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testStabilityLoop1000ExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testStabilityLoop1000ExceptionNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1800
      * @tc.name      testStability10ThreadsNormalNative
      * @tc.desc      stability test: 10 threads normal box/unbox
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testStability10ThreadsNormalNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testStability10ThreadsNormalNative();
      expect(result).assertTrue();
    });

    /**
      * @tc.number    SUB_ANI_BOX_UNBOX_STATIC_1810
      * @tc.name      testStability10ThreadsExceptionNative
      * @tc.desc      stability test: 10 threads exception box/unbox
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 0
      */
    it("testStability10ThreadsExceptionNative", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.testStability10ThreadsExceptionNative();
      expect(result).assertTrue();
    });
  })
}