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



export default function builtinsLinkerTypeCircularityErrorTest() {
  describe('builtinsLinkerTypeCircularityErrorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0100
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0100
     * @tc.desc: Test constructor with no arguments
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerTypeCircularityError();
      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual('');
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0200
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0200
     * @tc.desc: Test constructor with simple circular dependency message
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerTypeCircularityError('Circular type dependency detected');
      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual('Circular type dependency detected');
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0300
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0300
     * @tc.desc: Test constructor with empty message string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerTypeCircularityError('');
      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual('');
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0400
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0400
     * @tc.desc: Test constructor with message containing special characters and type names
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialMsg = 'Type "Node<T>" circularly references itself through "Edge<Node<T>>"';
      const error = new LinkerTypeCircularityError(specialMsg);
      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual(specialMsg);
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0500
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0500
     * @tc.desc: Test constructor with options (cause) parameter
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cause = new Error('Previous type resolution failed');
      const error = new LinkerTypeCircularityError('Circular dependency error', { cause });
      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual('Circular dependency error');
      expect(error.cause).assertEqual(cause);
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0600
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0600
     * @tc.desc: Test constructor with both message and empty options
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerTypeCircularityError('Type circular reference detected', {});
      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual('Type circular reference detected');
      expect(error.cause).assertUndefined();
    });
    
    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0700
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0700
     * @tc.desc: Test constructor with long circular dependency chain description
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longMsg = 'Circular dependency chain detected: TypeA depends on TypeB, ' +
        'TypeB depends on TypeC, TypeC depends on TypeD, ' +
        'and TypeD depends back on TypeA creating an unresolvable cycle';
      const error = new LinkerTypeCircularityError(longMsg);
      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual(longMsg);
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0800
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0800
     * @tc.desc: Test that error instance is throwable and catchable
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        throw new LinkerTypeCircularityError('Circular type dependency test error');
        expect(true).assertFalse();
      } catch (error) {
        expect(error instanceof LinkerTypeCircularityError).assertTrue();
        expect(error.name).assertEqual('LinkerTypeCircularityError');
        expect(error.message).assertEqual('Circular type dependency test error');
      }
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest0900
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST0900
     * @tc.desc: Test error stack trace property
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerTypeCircularityError('Circular type reference in linking phase');
      expect(typeof error.stack).assertEqual('string');
      expect(error.stack?.includes('LinkerTypeCircularityError')).assertTrue();
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest1000
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST1000
     * @tc.desc: Test error with nested cause chain for circular dependencies
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const rootCause = new Error('Initial type resolution failure');
      const middleError = new LinkerTypeCircularityError('Intermediate circular dependency', { cause: rootCause });
      const topError = new LinkerTypeCircularityError('Final circular dependency resolution failed', { cause: middleError });

      expect(topError.cause).assertEqual(middleError);
      expect(middleError.cause).assertEqual(rootCause);
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest1100
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST1100
     * @tc.desc: Test error with specific type names in circular dependency message
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const typeName1 = 'LinkedListNode';
      const typeName2 = 'LinkedList';
      const error = new LinkerTypeCircularityError(
        `Type ${typeName1} circularly references ${typeName2} which references back to ${typeName1}`
      );

      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertContain(typeName1);
      expect(error.message).assertContain(typeName2);
      expect(error.message).assertContain('circularly references');
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest1200
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST1200
     * @tc.desc: Test error toString() method for circular dependencies
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const error = new LinkerTypeCircularityError('Circular reference: A -> B -> A');
      const errorString = error.toString();

      expect(errorString).assertContain('LinkerTypeCircularityError');
      expect(errorString).assertContain('Circular reference: A -> B -> A');
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest1300
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST1300
     * @tc.desc: Test error with generic type circularity
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const genericMsg = 'Generic type circularity: Container<T> where T = Container<T>';
      const error = new LinkerTypeCircularityError(genericMsg);

      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual(genericMsg);
      expect(error.message).assertContain('Generic type circularity');
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest1400
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST1400
     * @tc.desc: Test error with interface implementation circularity
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const interfaceMsg = 'Interface circularity: InterfaceA extends InterfaceB, InterfaceB extends InterfaceA';
      const error = new LinkerTypeCircularityError(interfaceMsg);

      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertContain('InterfaceA');
      expect(error.message).assertContain('InterfaceB');
      expect(error.message).assertContain('circularity');
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest1500
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST1500
     * @tc.desc: Test error with complex multi-type circular dependency
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const complexMsg = 'Multi-type circular dependency: Graph -> Node -> Edge -> Graph';
      const error = new LinkerTypeCircularityError(complexMsg);

      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertContain('Graph');
      expect(error.message).assertContain('Node');
      expect(error.message).assertContain('Edge');
      expect(error.message).assertContain('->');
    });

    /**
     * @tc.name: builtinsLinkerTypeCircularityErrorTest1600
     * @tc.number: BUILTINS_LINKER_TYPE_CIRCULARITY_ERROR_TEST1600
     * @tc.desc: Test error with template/metaprogramming circularity
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsLinkerTypeCircularityErrorTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const templateMsg = 'Template circularity: TypeList<Head, Tail> where Tail = TypeList<Head, Tail>';
      const error = new LinkerTypeCircularityError(templateMsg);

      expect(error.name).assertEqual('LinkerTypeCircularityError');
      expect(error.message).assertEqual(templateMsg);
      expect(error.message).assertContain('TypeList');
      expect(error.message).assertContain('where');
    });

  })
}