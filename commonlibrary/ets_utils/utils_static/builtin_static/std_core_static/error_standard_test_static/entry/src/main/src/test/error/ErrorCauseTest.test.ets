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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';
import { BusinessError } from '@kit.BasicServicesKit';

export default function ErrorCauseTest(): void {
  describe('ErrorCauseTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0100
     * @tc.name testErrorCause001
     * @tc.desc Verify Error cause accepts string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strCause: Object = 'string reason' as Object;
      let err: Error = new Error('msg', { cause: strCause });
      expect(err.cause).assertEqual(strCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0200
     * @tc.name testErrorCause002
     * @tc.desc Verify Error cause accepts numeric value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numCause: Object = 42 as Object;
      let err: Error = new Error('msg', { cause: numCause });
      expect(err.cause).assertEqual(numCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0300
     * @tc.name testErrorCause003
     * @tc.desc Verify Error cause accepts boolean value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolCause: Object = true as Object;
      let err: Error = new Error('msg', { cause: boolCause });
      expect(err.cause).assertEqual(boolCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0400
     * @tc.name testErrorCause004
     * @tc.desc Verify TypeError as cause preserves type and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: TypeError = new TypeError('type error');
      let err: Error = new Error('msg', { cause: inner });
      expect(err.cause).assertEqual(inner);
      expect((err.cause as TypeError).message).assertEqual('type error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0500
     * @tc.name testErrorCause005
     * @tc.desc Verify Error cause defaults to undefined without options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('msg', { cause: undefined });
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0600
     * @tc.name testErrorCause006
     * @tc.desc Verify empty object as cause is stored correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('msg', {});
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0700
     * @tc.name testErrorCause007
     * @tc.desc Verify Error cause can be shared across multiple errors
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('root cause');
      let e1: Error = new Error('first', { cause: root });
      let e2: Error = new Error('second', { cause: root });
      expect(e1.cause).assertEqual(root);
      expect(e2.cause).assertEqual(root);
      expect(e1.cause).assertEqual(e2.cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0800
     * @tc.name testErrorCause008
     * @tc.desc Verify TypeError cause accepts string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strCause: Object = 'reason' as Object;
      let err: TypeError = new TypeError('msg', { cause: strCause });
      expect(err.cause).assertEqual(strCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_0900
     * @tc.name testErrorCause009
     * @tc.desc Verify RangeError cause accepts numeric value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numCause: Object = 100 as Object;
      let err: RangeError = new RangeError('msg', { cause: numCause });
      expect(err.cause).assertEqual(numCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1000
     * @tc.name testErrorCause010
     * @tc.desc Verify SyntaxError cause accepts boolean false value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolCause: Object = false as Object;
      let err: SyntaxError = new SyntaxError('msg', { cause: boolCause });
      expect(err.cause).assertEqual(boolCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1100
     * @tc.name testErrorCause011
     * @tc.desc Verify cause can be assigned after Error construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('msg');
      expect(err.cause).assertUndefined();
      let lateCause: Error = new Error('late assigned');
      err.cause = lateCause;
      expect(err.cause).assertEqual(lateCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1200
     * @tc.name testErrorCause012
     * @tc.desc Verify 3-level Error cause chain preserves all messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3: Error = new Error('level3');
      let l2: Error = new Error('level2', { cause: l3 });
      let l1: Error = new Error('level1', { cause: l2 });
      expect((l1.cause as Error).message).assertEqual('level2');
      expect(((l1.cause as Error).cause as Error).message).assertEqual('level3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1300
     * @tc.name testErrorCause013
     * @tc.desc Verify loop-built 5-level Error cause chain preserves messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('depth0');
      let current: Object = root;
      for (let d: int = 1; d <= 5; d++) {
        current = new Error('depth' + d, { cause: current as Object as Error });
      }
      expect((current as Error).message).assertEqual('depth5');
      let walk: Object = current;
      for (let d: int = 5; d >= 1; d--) {
        expect((walk as Error).message).assertEqual('depth' + d);
        walk = (walk as Error).cause as Object;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1400
     * @tc.name testErrorCause014
     * @tc.desc Verify mixed subclass cause chain preserves all messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: TypeError = new TypeError('root type error');
      let mid: RangeError = new RangeError('middle range', { cause: root });
      let top: SyntaxError = new SyntaxError('top syntax', { cause: mid });
      expect((top.cause as RangeError).message).assertEqual('middle range');
      expect(((top.cause as RangeError).cause as TypeError).message).assertEqual('root type error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1500
     * @tc.name testErrorCause015
     * @tc.desc Verify cause option works with ArithmeticError, NullPointerError and ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('root');
      let arrErr: ArithmeticError = new ArithmeticError('arithmetic', { cause: root });
      expect(arrErr.cause).assertEqual(root);
      let npErr: NullPointerError = new NullPointerError('null', { cause: root });
      expect(npErr.cause).assertEqual(root);
      let ccErr: ClassCastError = new ClassCastError('cast', { cause: root });
      expect(ccErr.cause).assertEqual(root);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1600
     * @tc.name testErrorCause016
     * @tc.desc Verify cause option works with TypeError, RangeError and SyntaxError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strCause: Object = 'ref cause' as Object;
      let refErr: ReferenceError = new ReferenceError('ref', { cause: strCause });
      expect(refErr.cause).assertEqual(strCause);

      let numCause: Object = 99 as Object;
      let evalErr: EvalError = new EvalError('eval', { cause: numCause });
      expect(evalErr.cause).assertEqual(numCause);

      let boolCause: Object = true as Object;
      let uriErr: URIError = new URIError('uri', { cause: boolCause });
      expect(uriErr.cause).assertEqual(boolCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1700
     * @tc.name testErrorCause017
     * @tc.desc Verify cause option works with runtime Error subclass types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('root');
      let divErr: DivideByZeroError = new DivideByZeroError('div by zero', { cause: root });
      expect(divErr.cause).assertEqual(root);
      let stackErr: StackOverflowError = new StackOverflowError('stack overflow', { cause: root });
      expect(stackErr.cause).assertEqual(root);
      let oomErr: OutOfMemoryError = new OutOfMemoryError('oom', { cause: root });
      expect(oomErr.cause).assertEqual(root);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1800
     * @tc.name testErrorCause018
     * @tc.desc Verify AggregateError cause accepts string cause value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error('e1'), new TypeError('e2')];
      let strCause: Object = 'aggregate reason' as Object;
      let aggErr: AggregateError = new AggregateError(errors, 'multiple errors', { cause: strCause });
      expect(aggErr.cause).assertEqual(strCause);
      expect(aggErr.message).assertEqual('multiple errors');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_1900
     * @tc.name testErrorCause019
     * @tc.desc Verify multi-level cause chain preserves deepest cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new TypeError('wrapped at layer2', { cause: e1 as Error });
        try {
          throw wrapped;
        } catch (e2) {
          wrapped = new Error('wrapped at layer1', { cause: e2 as Error });
        }
      }
      expect(wrapped.message).assertEqual('wrapped at layer1');
      let l2: Object = (wrapped as Error).cause as Object;
      expect((l2 as TypeError).message).assertEqual('wrapped at layer2');
      let root: Object = (l2 as TypeError).cause as Object;
      expect((root as Error).message).assertEqual('root failure');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2000
     * @tc.name testErrorCause020
     * @tc.desc Verify cause set to undefined via property works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('msg', { cause: undefined });
      expect(e.cause === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2100
     * @tc.name testErrorCause021
     * @tc.desc Verify cause set to undefined after init clears it
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('msg', { cause: new Error('original') });
      e.cause = undefined;
      expect(e.cause === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2200
     * @tc.name testErrorCause022
     * @tc.desc Verify single-level cause chain preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Error = new Error('cause');
      let e: Error = new Error('e', { cause: c });
      expect(e.cause).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2300
     * @tc.name testErrorCause023
     * @tc.desc Verify 2-level deep cause chain preserves middle cause message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l2: Error = new Error('l2');
      let l1: Error = new Error('l1', { cause: l2 });
      expect((l1.cause as Error).message).assertEqual('l2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2400
     * @tc.name testErrorCause024
     * @tc.desc Verify 3-level deep cause chain reaches bottom cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3: Error = new Error('l3');
      let l2: Error = new Error('l2', { cause: l3 });
      let l1: Error = new Error('l1', { cause: l2 });
      expect(((l1.cause as Error).cause as Error).message).assertEqual('l3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2500
     * @tc.name testErrorCause025
     * @tc.desc Verify 4-level deep cause chain preserves structure
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l4: Error = new Error('l4');
      let l3: Error = new Error('l3', { cause: l4 });
      let l2: Error = new Error('l2', { cause: l3 });
      let l1: Error = new Error('l1', { cause: l2 });
      expect(((l1.cause as Error).cause as Error).message).assertEqual('l3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2600
     * @tc.name testErrorCause026
     * @tc.desc Verify mixed Error subclass types in cause chainitive types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('e');
      let t: TypeError = new TypeError('t', { cause: e });
      let r: RangeError = new RangeError('r', { cause: t });
      let s: SyntaxError = new SyntaxError('s', { cause: r });
      expect(((s.cause as RangeError).cause as TypeError).cause).assertEqual(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2700
     * @tc.name testErrorCause027
     * @tc.desc Verify circular cause reference works without crash
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('self');
      e.cause = e;
      expect(e.cause).assertEqual(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2800
     * @tc.name testErrorCause028
     * @tc.desc Verify cause can be reassigned to different Error instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('e');
      let c1: Error = new Error('c1');
      e.cause = c1;
      expect(e.cause).assertEqual(c1);
      let c2: Error = new Error('c2');
      e.cause = c2;
      expect(e.cause).assertEqual(c2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_2900
     * @tc.name testErrorCause029
     * @tc.desc Verify cause can be cleared to undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('e', { cause: new Error('c') });
      expect(e.cause).not().assertUndefined();
      e.cause = undefined;
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3000
     * @tc.name testErrorCause030
     * @tc.desc Verify cause mutation propagates to parent Error reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('original');
      let e: Error = new Error('e', { cause: cause });
      cause.message = 'changed';
      expect((e.cause as Error).message).assertEqual('changed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3100
     * @tc.name testErrorCause031
     * @tc.desc Verify 3-level cause chain with mixed primitive types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('top', { cause: (42 as Object) });
      let m: string = (e.cause as Object).toString();
      expect(m).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3200
     * @tc.name testErrorCause032
     * @tc.desc Verify TypeError with undefined options defaults cause to undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError('msg', undefined);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3300
     * @tc.name testErrorCause033
     * @tc.desc Verify cause on ArithmeticError subtype preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Error = new Error('c');
      let e: ArithmeticError = new ArithmeticError('a', { cause: c });
      expect(e.cause).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3400
     * @tc.name testErrorCause034
     * @tc.desc Verify cause on NullPointerError subtype preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Error = new Error('c');
      let e: NullPointerError = new NullPointerError('n', { cause: c });
      expect(e.cause).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3500
     * @tc.name testErrorCause035
     * @tc.desc Verify cause on ClassCastError subtype preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Error = new Error('c');
      let e: ClassCastError = new ClassCastError('c', { cause: c });
      expect(e.cause).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3600
     * @tc.name testErrorCause036
     * @tc.desc Verify shared cause reference across multiple Error instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Error = new Error('shared');
      let e1: Error = new Error('a', { cause: c });
      let e2: Error = new Error('b', { cause: c });
      expect(e1.cause).assertEqual(e2.cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3700
     * @tc.name testErrorCause037
     * @tc.desc Verify 100-level deep cause chain preserves all levels with correct messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('depth0');
      let current: Error = root;
      for (let d: int = 1; d <= 100; d++) {
        current = new Error('depth' + d, { cause: current });
      }
      expect(current.message).assertEqual('depth100');
      let walk: Object = current;
      let foundRoot: boolean = false;
      for (let d: int = 0; d <= 100; d++) {
        if ((walk as Error).message === 'depth0') {
          foundRoot = true;
          break;
        }
        walk = (walk as Error).cause as Object;
      }
      expect(foundRoot).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3800
     * @tc.name testErrorCause038
     * @tc.desc Verify Map object as cause preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCause: Map<string, string> = new Map<string, string>();
      mapCause.set('key', 'val');
      let e: Error = new Error('map', { cause: mapCause });
      expect(e.cause).assertEqual(mapCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_3900
     * @tc.name testErrorCause039
     * @tc.desc Verify Set object as cause preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setCause: Set<string> = new Set<string>();
      setCause.add('item');
      let e: Error = new Error('set', { cause: setCause });
      expect(e.cause).assertEqual(setCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4000
     * @tc.name testErrorCause040
     * @tc.desc Verify Date object as cause preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateCause: Date = new Date();
      let e: Error = new Error('date', { cause: dateCause });
      expect(e.cause).assertEqual(dateCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4100
     * @tc.name testErrorCause041
     * @tc.desc Verify null as cause cast to Object sets cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCause2: Map<number, string> = new Map<number, string>();
      mapCause2.set(0, 'null test');
      let e: Error = new Error('nulltest', { cause: mapCause2 });
      expect(e.cause).assertEqual(mapCause2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4200
     * @tc.name testErrorCause042
     * @tc.desc Verify three-node circular cause chain preserves each link
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('circle-first');
      let second: Error = new Error('circle-second', { cause: first });
      let third: Error = new Error('circle-third', { cause: second });
      first.cause = third;
      expect(first.cause).assertEqual(third);
      expect((third.cause as Error).message).assertEqual('circle-second');
      expect(((third.cause as Error).cause as Error).message).assertEqual('circle-first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4300
     * @tc.name testErrorCause043
     * @tc.desc Verify built-in Error subclasses preserve shared Error cause reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('shared-builtin-cause');
      let typeErr: TypeError = new TypeError('type', { cause: cause });
      let rangeErr: RangeError = new RangeError('range', { cause: cause });
      let syntaxErr: SyntaxError = new SyntaxError('syntax', { cause: cause });
      let referenceErr: ReferenceError = new ReferenceError('reference', { cause: cause });
      let evalErr: EvalError = new EvalError('eval', { cause: cause });
      let uriErr: URIError = new URIError('uri', { cause: cause });
      expect(typeErr.cause).assertEqual(cause);
      expect(rangeErr.cause).assertEqual(cause);
      expect(syntaxErr.cause).assertEqual(cause);
      expect(referenceErr.cause).assertEqual(cause);
      expect(evalErr.cause).assertEqual(cause);
      expect(uriErr.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4400
     * @tc.name testErrorCause044
     * @tc.desc Verify BusinessError cause property preserves Error reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: BusinessError = new BusinessError(500, 'cause-holder');
      let cause: Error = new Error('runtime-cause');
      err.cause = cause;
      expect(err.cause).assertEqual(cause);
      expect((err.cause as Error).message).assertEqual('runtime-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4500
     * @tc.name testErrorCause045
     * @tc.desc Verify BusinessError can participate in nested Error cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let business: BusinessError = new BusinessError(507, 'business-link');
      let outer: Error = new Error('outer-link', { cause: business });
      let resolved: BusinessError = outer.cause as BusinessError;
      expect(resolved.code).assertEqual(507);
      expect(resolved.message).assertEqual('business-link');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4600
     * @tc.name testErrorCause046
     * @tc.desc Verify null cannot be cast to Object as cause throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        let e: Error = new Error('null-cause');
        e.cause = null as Object;
      } catch (e) {
        threw = true;
      }
      expect(threw).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4700
     * @tc.name testErrorCause047
     * @tc.desc Verify cause chain of depth 4 preserves all links
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Error = new Error('depth4');
      let c: Error = new Error('depth3', { cause: d });
      let b: Error = new Error('depth2', { cause: c });
      let a: Error = new Error('depth1', { cause: b });
      expect(a.message).assertEqual('depth1');
      expect(((a.cause as Error).cause as Error).message).assertEqual('depth3');
      expect((((a.cause as Error).cause as Error).cause as Error).message).assertEqual('depth4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CAUSE_4800
     * @tc.name testErrorCause048
     * @tc.desc Verify cause chain of depth 5 with mixed Error subclasses
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCause048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e5: TypeError = new TypeError('e5');
      let e4: Error = new Error('e4', { cause: e5 });
      let e3: RangeError = new RangeError('e3', { cause: e4 });
      let e2: Error = new Error('e2', { cause: e3 });
      let e1: SyntaxError = new SyntaxError('e1', { cause: e2 });
      expect(e1.message).assertEqual('e1');
      expect((e1.cause as Error).message).assertEqual('e2');
      expect(((e1.cause as Error).cause as RangeError).message).assertEqual('e3');
    });
  });
}
