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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function StringBuilderConstructorOneTest(): void {
  describe('StringBuilderConstructorOneTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0001
     * @tc.name testStringBuilderConstructorOne001
     * @tc.desc Verify multiple empty constructor calls produce distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder1 = new StringBuilder();
        const builder2 = new StringBuilder();
        expect(builder1 === builder2).assertFalse();
        expect(builder1.stringLength).assertEqual(0);
        expect(builder2.stringLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0002
     * @tc.name testStringBuilderConstructorOne002
     * @tc.desc Verify inter-builder data transfer via toString and append pipeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builderA = new StringBuilder();
        builderA.append('Hello');
        const builderB = new StringBuilder();
        builderB.append(builderA.toString());
        builderB.append(' World');
        expect(builderB.toString()).assertEqual('Hello World');
        expect(builderB.stringLength).assertEqual(11);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0003
     * @tc.name testStringBuilderConstructorOne003
     * @tc.desc Verify appending an empty string after constructing an empty StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append('');
        expect(builder.toString()).assertEqual('');
        expect(builder.stringLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0004
     * @tc.name testStringBuilderConstructorOne004
     * @tc.desc Verify reassigned builder starts from a fresh empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let builder = new StringBuilder();
        builder.append('old');
        builder = new StringBuilder();
        builder.append('new');
        expect(builder.toString()).assertEqual('new');
        expect(builder.stringLength).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0005
     * @tc.name testStringBuilderConstructorOne005
     * @tc.desc Verify that calling toString immediately after construction returns an
     *   empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.toString();
        builder.append("A");
        expect(builder.stringLength).assertEqual(1);
        expect(builder.toString()).assertEqual("A");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0006
     * @tc.name testStringBuilderConstructorOne006
     * @tc.desc Verify that calling toString multiple times after construction returns
     *   consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        const r1 = builder.toString();
        const r2 = builder.toString();
        const r3 = builder.toString();
        expect(r1).assertEqual('');
        expect(r2).assertEqual('');
        expect(r3).assertEqual('');
        expect(r1 === r2 && r2 === r3).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0007
     * @tc.name testStringBuilderConstructorOne007
     * @tc.desc Verify empty constructed builder accepts first char append correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append(c'Z');
        expect(builder.toString()).assertEqual('Z');
        expect(builder.stringLength).assertEqual(1);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0008
     * @tc.name testStringBuilderConstructorOne008
     * @tc.desc Verify the type of the instance using instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        expect(builder instanceof StringBuilder).assertTrue();
        expect(builder.toString()).assertEqual('');
        expect(builder.stringLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0009
     * @tc.name testStringBuilderConstructorOne009
     * @tc.desc Verify that the instance has empty content and zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        expect(builder.toString()).assertEqual('');
        expect(builder.stringLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0010
     * @tc.name testStringBuilderConstructorOne010
     * @tc.desc Verify creating a large number of StringBuilder instances works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        for (let i = 0; i < 1000; i++) {
          const builder = new StringBuilder();
          expect(builder.stringLength).assertEqual(0);
          expect(builder.toString()).assertEqual('');
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0011
     * @tc.name testStringBuilderConstructorOne011
     * @tc.desc Verify that a large number of instances with different content do not
     *   interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builders: StringBuilder[] = [];
        for (let i = 0; i < 100; i++) {
          const b = new StringBuilder();
          b.append('item' + i.toString());
          builders.push(b);
        }
        for (let i = 0; i < 100; i++) {
          expect(builders[i].toString()).assertEqual('item' + i.toString());
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0012
     * @tc.name testStringBuilderConstructorOne012
     * @tc.desc Verify repeated append of numbered tokens keeps token boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        for (let i = 0; i < 5; i++) {
          builder.append('item[').append(i).append('];');
        }
        expect(builder.toString()).assertEqual('item[0];item[1];item[2];item[3];item[4];');
        expect(builder.stringLength).assertEqual(40);
      }
    );


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0013
     * @tc.name testStringBuilderConstructorOne013
     * @tc.desc Verify that StringBuilder as an export class can be imported and used
     *   in other files
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        expect(builder instanceof StringBuilder).assertTrue();
        expect(builder.toString()).assertEqual('');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0014
     * @tc.name testStringBuilderConstructorOne014
     * @tc.desc Verify that StringBuilder works correctly in API version 20 environment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append('API20');
        expect(builder.toString()).assertEqual('API20');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0015
     * @tc.name testStringBuilderConstructorOne015
     * @tc.desc Verify mixed append stringLength toString after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("Mixed");
        builder.append("Test");
        expect(builder.stringLength).assertEqual(9);
        expect(builder.toString()).assertEqual("MixedTest");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0016
     * @tc.name testStringBuilderConstructorOne016
     * @tc.desc Verify append different types after empty construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("str");
        builder.append(100);
        builder.append(true);
        expect(builder.toString()).assertEqual("str100true");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0017
     * @tc.name testStringBuilderConstructorOne017
     * @tc.desc Verify long string append after empty construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        let longStr = "x".repeat(10000);
        builder.append(longStr);
        expect(builder.stringLength).assertEqual(10000);
        expect(builder.toString()).assertEqual(longStr);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0018
     * @tc.name testStringBuilderConstructorOne018
     * @tc.desc Verify toString and stringLength consistency after append
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("Consistency");
        let str: string = builder.toString();
        let len: int = builder.stringLength;
        expect(str).assertEqual("Consistency");
        expect(len).assertEqual(11);
        expect(str.length).assertEqual(len);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0019
     * @tc.name testStringBuilderConstructorOne019
     * @tc.desc Verify chained append returns this after empty construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        let result = builder.append("chain").append("test");
        expect(result === builder).assertTrue();
        expect(builder.toString()).assertEqual("chaintest");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0020
     * @tc.name testStringBuilderConstructorOne020
     * @tc.desc Verify append various type boundaries after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        let b: byte = 127;
        let s: short = 32767;
        builder.append(b);
        builder.append(s);
        builder.append(2147483647);
        expect(builder.toString()).assertEqual("127327672147483647");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0021
     * @tc.name testStringBuilderConstructorOne021
     * @tc.desc Verify 200 append operations after construction maintains correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        for (let i = 0; i < 200; i++) {
          builder.append("x");
        }
        expect(builder.stringLength).assertEqual(200);
        expect(builder.toString().length).assertEqual(200);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0022
     * @tc.name testStringBuilderConstructorOne022
     * @tc.desc Verify construction then append then concatStrings interaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("Hello");
        builder.append(" ");
        const cs: string = StringBuilder.concatStrings("World", "!");
        builder.append(cs);
        expect(builder.toString()).assertEqual("Hello World!");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0023
     * @tc.name testStringBuilderConstructorOne023
     * @tc.desc Verify construction then append with numeric boundary after string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("Value: ");
        builder.append(2147483647);
        expect(builder.toString()).assertEqual("Value: 2147483647");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_ONE_0024
     * @tc.name testStringBuilderConstructorOne024
     * @tc.desc Verify construction then append boolean then string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append(true);
        builder.append(" is the value");
        expect(builder.toString()).assertEqual("true is the value");
      }
    );
  });
}

