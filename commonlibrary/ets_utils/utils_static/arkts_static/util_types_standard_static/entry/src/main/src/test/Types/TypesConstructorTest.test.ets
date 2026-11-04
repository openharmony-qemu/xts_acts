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
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '@ohos/hypium-static/src/main/indexStatic';
import util from '@ohos.util';
import Utils from './../Util.test';

class WeakKeyBox {
  tag: string = 'key';
}

class CheckerHolder {
  checker: util.types = new util.types();
}

function buildTypeChecker(): util.types {
  let instance: util.types = new util.types();
  return instance;
}

function probeRegExp(checker: util.types): boolean {
  return checker.isRegExp(new RegExp('probe'));
}

function classifyValue<T>(value: T): string {
  return typeof value;
}

class CheckerPair {
  left: util.types = new util.types();
  right: util.types = new util.types();
}

class CheckerRunner {
  runs: int = 0;

  run(instance: util.types): boolean {
    this.runs = this.runs + 1;
    return instance.isSet(new Set<int>());
  }
}

class CheckerFrame {
  holder: CheckerHolder = new CheckerHolder();
}

class DerivedChecker extends util.types {
  label: string = 'derived';

  constructor() {
    super();
  }
}

interface CheckerField {
  checker: util.types;
  label: string;
}

interface CheckerEnvelope {
  inner: CheckerField;
  tag: string;
}

interface CheckerApi {
  classify: (probe: Object) => boolean;
}

function echoChecker(instance: util.types): util.types {
  return instance;
}

function makeMapClosure(instance: util.types): () => boolean {
  return (): boolean => instance.isMap(new Map<string, int>());
}

function agreeOnMap(first: util.types, second: util.types, probe: Object): boolean {
  return first.isMap(probe) === second.isMap(probe);
}

function countMapChecks(instance: util.types, probes: Array<Object>): int {
  let hits: int = 0;
  for (const probe of probes) {
    if (instance.isMap(probe)) {
      hits = hits + 1;
    }
  }
  return hits;
}

function storeChecker(pool: Set<object>, instance: util.types): int {
  pool.add(instance);
  return pool.size;
}

function buildCheckerList(): Array<util.types> {
  let list: Array<util.types> = [];
  list.push(new util.types());
  list.push(buildTypeChecker());
  return list;
}

function labelBufferPair(instance: util.types, buffer: ArrayBuffer, view: DataView): string {
  if (instance.isArrayBuffer(buffer) && instance.isDataView(view)) {
    return 'pair';
  }
  return 'other';
}

export default function typesConstructorTest(): void {
  describe('TypesConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0100
     * @tc.name testTypesConstructor001
     * @tc.desc Merged batch (2 tests): Checker self-classification: verifies checker self-classification across its own probe, sibling instances and foreign kinds.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one checker treats a second checker instance as neither a Map nor a Set, with the Map check repeated in the reverse direction ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let verdicts: Array<boolean> = [first.isMap(second), first.isSet(second), second.isMap(first)];
        expect(verdicts[0]).assertFalse();
        expect(verdicts[1]).assertFalse();
        expect(verdicts[2]).assertFalse();
      }

      // --- [2] Verify twelve predicates, including the buffer, view, typed array, Date, Promise, WeakMap and iterator checks, report false for a checker instance ---
      {
        let checker: util.types = new util.types();
        expect(checker.isSet(checker)).assertFalse();
        expect(checker.isRegExp(checker)).assertFalse();
        expect(checker.isAnyArrayBuffer(checker)).assertFalse();
        expect(checker.isArrayBufferView(checker)).assertFalse();
        expect(checker.isTypedArray(checker)).assertFalse();
        expect(checker.isDate(checker)).assertFalse();
        expect(checker.isPromise(checker)).assertFalse();
        expect(checker.isWeakMap(checker)).assertFalse();
        expect(checker.isWeakSet(checker)).assertFalse();
        expect(checker.isMapIterator(checker)).assertFalse();
        expect(checker.isSetIterator(checker)).assertFalse();
        expect(checker.isAsyncFunction(checker)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0200
     * @tc.name testTypesConstructor002
     * @tc.desc Merged batch (5 tests): Reference identity and aliasing: a checker keeps its reference identity after being pushed into and read out of an array; widening a checker to Object and casting it back preserves the original reference; a checker moved from a Map value into a WeakMap value and one migrated from a Set into an array keep their reference and classify; substituting a new checker for an array slot keeps the substitute instance fully usable; checkers from pairs, direct calls, helpers, fields, branches and arrays are pairwise distinct.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker keeps its reference identity after being pushed into and read out of an array ---
      {
        let checker: util.types = new util.types();
        let store: util.types[] = [];
        store.push(checker);
        expect(store[0]).assertEqual(checker);
      }

      // --- [2] Verify widening a checker to Object and casting it back preserves the original reference ---
      {
        let checker: util.types = new util.types();
        let widened: Object = checker;
        let narrowed: util.types = widened as util.types;
        expect(narrowed).assertEqual(checker);
        expect(narrowed.isRegExp(new RegExp('r'))).assertTrue();
      }

      // --- [3] Verify a checker moved from a Map value into a WeakMap value and one migrated from a Set into an array keep their reference and classify ---
      {
        let key: WeakKeyBox = new WeakKeyBox();
        let origin: util.types = new util.types();
        let source: Map<string, util.types> = new Map<string, util.types>();
        source.set('a', origin);
        let handoff: util.types = source.get('a') as util.types;
        let sink: WeakMap<WeakKeyBox, util.types> = new WeakMap<WeakKeyBox, util.types>();
        sink.set(key, handoff);
        let held: util.types = sink.get(key) as util.types;
        expect(held).assertEqual(origin);
        expect(held.isDate(new Date(0))).assertTrue();
        let checker: util.types = new util.types();
        let pool: Set<object> = new Set<object>();
        pool.add(checker);
        let moved: Array<util.types> = [];
        for (const member of pool) {
          moved.push(member as util.types);
        }
        expect(moved.length).assertEqual(1);
        expect(moved[0]).assertEqual(checker);
        expect(moved[0].isSet(new Set<int>())).assertTrue();
      }

      // --- [4] Verify substituting a new checker for an array slot keeps the substitute instance fully usable ---
      {
        let original: util.types = new util.types();
        let successor: util.types = new util.types();
        let slots: Array<util.types> = [original];
        slots[0] = successor;
        expect(slots[0]).assertEqual(successor);
        expect(original === successor).assertFalse();
        expect(original.isDate(new Date(0))).assertTrue();
      }

      // --- [5] Verify checkers from pairs, direct calls, helpers, fields, branches and arrays are pairwise distinct while classifying correctly ---
      {
        let pair: CheckerPair = new CheckerPair();
        expect(pair.left === pair.right).assertFalse();
        expect(agreeOnMap(pair.left, pair.right, new Map<string, int>())).assertTrue();
        let direct: util.types = new util.types();
        let fromHelper: util.types = buildTypeChecker();
        let fromField: util.types = new CheckerHolder().checker;
        let probes: Array<Object> = [new Map<string, int>()];
        expect(direct === fromHelper).assertFalse();
        expect(fromHelper === fromField).assertFalse();
        expect(fromField === direct).assertFalse();
        expect(countMapChecks(direct, probes) + countMapChecks(fromHelper, probes)).assertEqual(2);
        let escaped: util.types | null = null;
        let takeBranch: boolean = true;
        if (takeBranch) {
          escaped = new util.types();
        }
        expect(escaped !== null).assertTrue();
        let escapedChecker: util.types = escaped as util.types;
        expect(escapedChecker.isDate(new Date(0))).assertTrue();
        let base: util.types = new util.types();
        let derived: util.types = new DerivedChecker();
        expect(base === derived).assertFalse();
        expect(base.isDate(new Date(0))).assertTrue();
        expect(derived.isSet(new Set<int>())).assertTrue();
        let pairs: Array<CheckerPair> = [new CheckerPair(), new CheckerPair()];
        expect(pairs[0].left === pairs[1].left).assertFalse();
        expect(pairs[0].right === pairs[1].right).assertFalse();
        expect(pairs[1].left.isMap(new Map<string, int>())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0300
     * @tc.name testTypesConstructor003
     * @tc.desc Merged batch (5 tests): Reference identity and aliasing: a subclass instance stored as a Map value is read back as the same reference and classifies; a typed Set keeps a plain checker and a subclass instance distinct, and two variables bound to one checker classify through either name; rebinding an alias to a fresh checker leaves the first variable on the original instance; one checker used as both Map key and value is returned as the identical reference; verdicts produced by one checker are stored as Map values under two distinct keys.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a subclass instance stored as a Map value is read back as the same reference and classifies ---
      {
        let derived: util.types = new DerivedChecker();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('slot', derived);
        let held: util.types = store.get('slot') as util.types;
        expect(held).assertEqual(derived);
        expect(held.isPromise(Promise.resolve<int>(0))).assertTrue();
      }

      // --- [2] Verify a typed Set keeps a plain checker and a subclass instance distinct, and two variables bound to one checker classify through either name ---
      {
        let base: util.types = new util.types();
        let derived: util.types = new DerivedChecker();
        let pool: Set<util.types> = new Set<util.types>();
        pool.add(base);
        pool.add(derived);
        expect(pool.size).assertEqual(2);
        let accepted: int = 0;
        for (const item of pool) {
          if (item.isMap(new Map<string, int>())) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(2);
        let checker: util.types = new util.types();
        let alias: util.types = checker;
        expect(alias).assertEqual(checker);
        expect(alias.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [3] Verify rebinding an alias to a fresh checker leaves the first variable on the original instance ---
      {
        let checker: util.types = new util.types();
        let alias: util.types = checker;
        alias = new util.types();
        expect(alias === checker).assertFalse();
        expect(checker.isDate(new Date(0))).assertTrue();
      }

      // --- [4] Verify one checker used as both Map key and value is returned as the identical reference while two distinct checkers form two entries ---
      {
        let checker: util.types = new util.types();
        let store: Map<util.types, util.types> = new Map<util.types, util.types>();
        store.set(checker, checker);
        let held: util.types = store.get(checker) as util.types;
        expect(held).assertEqual(checker);
        expect(held.isPromise(Promise.resolve<int>(0))).assertTrue();
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let store_2: Map<util.types, string> = new Map<util.types, string>();
        store_2.set(first, 'first');
        store_2.set(second, 'second');
        expect(store_2.size).assertEqual(2);
        expect(store_2.get(second)).assertEqual('second');
      }

      // --- [5] Verify verdicts produced by one checker are stored as Map values under two distinct keys ---
      {
        let checker: util.types = new util.types();
        let report: Map<string, boolean> = new Map<string, boolean>();
        report.set('mapProbe', checker.isMap(new Map<string, int>()));
        report.set('setProbe', checker.isSet(new Set<int>()));
        expect(report.size).assertEqual(2);
        expect(report.get('mapProbe') as boolean).assertTrue();
        expect(report.get('setProbe') as boolean).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0400
     * @tc.name testTypesConstructor004
     * @tc.desc Merged batch (5 tests): Reference identity and aliasing: overwriting a Map entry that holds a checker substitutes the stored instance and keeps one entry; a checker held as the WeakMap value of a class key is returned as the same reference; checkers taken from two separate holder instances are distinct and both classify a RegExp; two identical verdicts from one checker collapse into a single Set entry; verdicts of one checker for a Map probe and a Set probe form two distinct boolean Map keys.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting a Map entry that holds a checker substitutes the stored instance and keeps one entry ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('slot', first);
        store.set('slot', second);
        let held: util.types = store.get('slot') as util.types;
        expect(held).assertEqual(second);
        expect(store.size).assertEqual(1);
      }

      // --- [2] Verify a checker held as the WeakMap value of a class key is returned as the same reference ---
      {
        let checker: util.types = new util.types();
        let key: WeakKeyBox = new WeakKeyBox();
        let store: WeakMap<WeakKeyBox, util.types> = new WeakMap<WeakKeyBox, util.types>();
        store.set(key, checker);
        let held: util.types = store.get(key) as util.types;
        expect(held).assertEqual(checker);
        expect(held.isWeakMap(new WeakMap<WeakKeyBox, int>())).assertTrue();
      }

      // --- [3] Verify checkers taken from two separate holder instances are distinct and both classify a RegExp ---
      {
        let firstHolder: CheckerHolder = new CheckerHolder();
        let secondHolder: CheckerHolder = new CheckerHolder();
        expect(firstHolder.checker === secondHolder.checker).assertFalse();
        expect(firstHolder.checker.isRegExp(new RegExp('a'))).assertTrue();
        expect(secondHolder.checker.isRegExp(new RegExp('b'))).assertTrue();
      }

      // --- [4] Verify two identical verdicts from one checker collapse into a single Set entry ---
      {
        let checker: util.types = new util.types();
        let probe: Map<string, int> = new Map<string, int>();
        let outcomes: Set<boolean> = new Set<boolean>();
        outcomes.add(checker.isMap(probe));
        outcomes.add(checker.isMap(probe));
        expect(outcomes.size).assertEqual(1);
        expect(outcomes.has(true)).assertTrue();
      }

      // --- [5] Verify verdicts of one checker for a Map probe and a Set probe form two distinct boolean Map keys ---
      {
        let checker: util.types = new util.types();
        let tally: Map<boolean, string> = new Map<boolean, string>();
        tally.set(checker.isMap(new Map<string, int>()), 'hit');
        tally.set(checker.isMap(new Set<int>()), 'miss');
        expect(tally.size).assertEqual(2);
        expect(tally.get(false)).assertEqual('miss');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0500
     * @tc.name testTypesConstructor005
     * @tc.desc Merged batch (5 tests): Reference identity and aliasing: one checker hosted by a holder field and an interface field is the same reference in both; two checkers routed through one Map are recovered as their own references, not a shared one; the same checker stored at two array indexes is the identical reference at both positions; assigning a new checker to a holder field exposes the substitute while the old one stays usable; a checker stored under an int Map key is read back as the same reference and classifies.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one checker hosted by a holder field and an interface field is the same reference in both ---
      {
        let checker: util.types = new util.types();
        let holder: CheckerHolder = new CheckerHolder();
        let field: CheckerField = { checker: checker, label: 'shared' };
        holder.checker = checker;
        expect(field.checker).assertEqual(holder.checker);
        expect(holder.checker.isSet(new Set<int>())).assertTrue();
      }

      // --- [2] Verify two checkers routed through one Map are recovered as their own references, not a shared one ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('a', first);
        store.set('b', second);
        let heldFirst: util.types = store.get('a') as util.types;
        let heldSecond: util.types = store.get('b') as util.types;
        expect(heldFirst).assertEqual(first);
        expect(heldSecond).assertEqual(second);
        expect(heldFirst === heldSecond).assertFalse();
      }

      // --- [3] Verify the same checker stored at two array indexes is the identical reference at both positions ---
      {
        let checker: util.types = new util.types();
        let slots: Array<util.types> = [checker, checker];
        expect(slots[0]).assertEqual(slots[1]);
        expect(slots[1]).assertEqual(checker);
        expect(slots[0].isMap(new Map<string, int>())).assertTrue();
      }

      // --- [4] Verify assigning a new checker to a holder field exposes the substitute while the old one stays usable ---
      {
        let holder: CheckerHolder = new CheckerHolder();
        let original: util.types = holder.checker;
        holder.checker = new util.types();
        expect(holder.checker === original).assertFalse();
        expect(holder.checker.isMap(new Map<string, int>())).assertTrue();
        expect(original.isDate(new Date(0))).assertTrue();
      }

      // --- [5] Verify a checker stored under an int Map key is read back as the same reference and classifies ---
      {
        let checker: util.types = new util.types();
        let store: Map<int, util.types> = new Map<int, util.types>();
        store.set(7, checker);
        let held: util.types = store.get(7) as util.types;
        expect(held).assertEqual(checker);
        expect(held.isRegExp(new RegExp('q'))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0600
     * @tc.name testTypesConstructor006
     * @tc.desc Merged batch (4 tests): Reference identity and aliasing: checks that aliases, copies and re-bound references agree, covering repeated calls.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two interface literals that host the same checker expose one identical reference ---
      {
        let checker: util.types = new util.types();
        let first: CheckerField = { checker: checker, label: 'left' };
        let second: CheckerField = { checker: checker, label: 'right' };
        expect(first.checker).assertEqual(second.checker);
        expect(first.checker.isSet(new Set<int>())).assertTrue();
        expect(second.checker.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [2] Verify a checker registered as a WeakSet member is found by reference and still classifies a Set ---
      {
        let checker: util.types = new util.types();
        let pool: WeakSet<util.types> = new WeakSet<util.types>();
        pool.add(checker);
        expect(pool.has(checker)).assertTrue();
        expect(checker.isSet(new Set<int>())).assertTrue();
      }

      // --- [3] Verify adding one checker twice to a Set leaves a single member found by reference ---
      {
        let checker: util.types = new util.types();
        let pool: Set<object> = new Set<object>();
        pool.add(checker);
        pool.add(checker);
        expect(pool.size).assertEqual(1);
        expect(pool.has(checker)).assertTrue();
      }

      // --- [4] Verify a checker keyed by another checker in a WeakMap returns the stored payload reference ---
      {
        let keyHolder: util.types = new util.types();
        let payload: util.types = new util.types();
        let store: WeakMap<util.types, util.types> = new WeakMap<util.types, util.types>();
        store.set(keyHolder, payload);
        let held: util.types = store.get(keyHolder) as util.types;
        expect(held).assertEqual(payload);
        expect(held.isMap(new Map<string, int>())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0700
     * @tc.name testTypesConstructor007
     * @tc.desc Merged batch (4 tests): Reference identity and aliasing: checks that aliases, copies and re-bound references agree, covering loop and iterator traversal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify the helper built list holds two distinct checkers that both classify a Map ---
      {
        let list: Array<util.types> = buildCheckerList();
        expect(list.length).assertEqual(2);
        expect(list[0] === list[1]).assertFalse();
        expect(list[0].isMap(new Map<string, int>())).assertTrue();
        expect(list[1].isMap(new Map<string, int>())).assertTrue();
      }

      // --- [2] Verify separately constructed, helper built and loop built checkers are distinct independent instances that classify alike ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        expect(first === second).assertFalse();
        expect(first.isMap(new Map<int, string>())).assertTrue();
        expect(second.isMap(new Map<int, string>())).assertTrue();
        let fromHelper: util.types = buildTypeChecker();
        let local: util.types = new util.types();
        expect(fromHelper === local).assertFalse();
        expect(fromHelper.isDate(new Date(0))).assertTrue();
        let allClassified: boolean = true;
        for (let index: int = 0; index < 5; index++) {
          let loopChecker: util.types = new util.types();
          if (!loopChecker.isTypedArray(new Int16Array(2)) || !loopChecker.isArrayBuffer(new ArrayBuffer(2))) {
            allClassified = false;
          }
        }
        expect(allClassified).assertTrue();
      }

      // --- [3] Verify a checker taken out of a Map keeps its reference across the awaited Promise boundary ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('slot', checker);
        let held: util.types = await Promise.resolve<util.types>(store.get('slot') as util.types);
        expect(held).assertEqual(checker);
        expect(held.isDate(new Date(0))).assertTrue();
      }

      // --- [4] Verify a checker keeps its reference and classifies after a helper round trip and resolves to the same reference as a Promise value ---
      {
        let checker: util.types = new util.types();
        let returned: util.types = echoChecker(checker);
        expect(returned).assertEqual(checker);
        expect(returned.isSet(new Set<int>())).assertTrue();
        let holder: Promise<util.types> = Promise.resolve<util.types>(checker);
        let resolved: util.types = await holder;
        expect(resolved).assertEqual(checker);
        expect(resolved.isMap(new Map<string, int>())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0800
     * @tc.name testTypesConstructor008
     * @tc.desc Merged batch (5 tests): Probe state preservation: a Set stays a Set after the checker classified it before and after its only member was deleted; a WeakMap stays a WeakMap after the checker classified it before and after its entry was removed; a Map stays a Map after the checker classified it while empty and after one entry was added; a Uint8Array stays a typed array after the checker classified it while empty and after two writes; classifying a Set does not change its size of three members.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Set stays a Set after the checker classified it before and after its only member was deleted ---
      {
        let checker: util.types = new util.types();
        let probe: Set<int> = new Set<int>();
        probe.add(3);
        expect(checker.isSet(probe)).assertTrue();
        probe.delete(3);
        expect(checker.isSet(probe)).assertTrue();
        expect(probe.size).assertEqual(0);
      }

      // --- [2] Verify a WeakMap stays a WeakMap after the checker classified it before and after its entry was removed ---
      {
        let checker: util.types = new util.types();
        let key: WeakKeyBox = new WeakKeyBox();
        let probe: WeakMap<WeakKeyBox, int> = new WeakMap<WeakKeyBox, int>();
        probe.set(key, 1);
        expect(checker.isWeakMap(probe)).assertTrue();
        probe.delete(key);
        expect(checker.isWeakMap(probe)).assertTrue();
      }

      // --- [3] Verify a Map stays a Map after the checker classified it while empty and after one entry was added ---
      {
        let checker: util.types = new util.types();
        let probe: Map<string, int> = new Map<string, int>();
        expect(checker.isMap(probe)).assertTrue();
        probe.set('a', 1);
        expect(checker.isMap(probe)).assertTrue();
        expect(probe.size).assertEqual(1);
      }

      // --- [4] Verify a Uint8Array stays a typed array after the checker classified it while empty and after two writes ---
      {
        let checker: util.types = new util.types();
        let probe: Uint8Array = new Uint8Array(2);
        expect(checker.isTypedArray(probe)).assertTrue();
        probe.$_set(0, 7);
        probe.$_set(1, 8);
        expect(checker.isTypedArray(probe)).assertTrue();
        expect(probe.$_get(1)).assertEqual(8);
      }

      // --- [5] Verify classifying a Set does not change its size of three members ---
      {
        let checker: util.types = new util.types();
        let probe: Set<int> = new Set<int>();
        probe.add(1);
        probe.add(2);
        probe.add(3);
        let result: boolean = checker.isSet(probe);
        expect(result).assertTrue();
        expect(probe.size).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_0900
     * @tc.name testTypesConstructor009
     * @tc.desc Merged batch (5 tests): Probe state preservation: classifying an ArrayBuffer does not change its byte length of eight; classifying a Uint8Array keeps its length and the element at index one, and classifying a Date keeps the timestamp 86400000; classifying a RegExp keeps its anchored match behaviour on the probe string; an Int32Array view with the byte offset eight keeps that offset after being classified; writing through a view keeps the underlying ArrayBuffer reported as an ArrayBuffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify classifying an ArrayBuffer does not change its byte length of eight ---
      {
        let checker: util.types = new util.types();
        let probe: ArrayBuffer = new ArrayBuffer(8);
        let result: boolean = checker.isArrayBuffer(probe);
        expect(result).assertTrue();
        expect(probe.byteLength).assertEqual(8);
      }

      // --- [2] Verify classifying a Uint8Array keeps its length and the element at index one, and classifying a Date keeps the timestamp 86400000 ---
      {
        let checker: util.types = new util.types();
        let probe: Uint8Array = new Uint8Array([3, 4, 5]);
        let result: boolean = checker.isTypedArray(probe);

        expect(result).assertTrue();
        expect(probe.length).assertEqual(3);
        expect(probe.$_get(1)).assertEqual(4);
        let probe_2: Date = new Date(86400000);
        let result_2: boolean = checker.isDate(probe_2);
        expect(result_2).assertTrue();
        expect(probe_2.getTime()).assertEqual(86400000);
      }

      // --- [3] Verify classifying a RegExp keeps its anchored match behaviour on the probe string ---
      {
        let checker: util.types = new util.types();
        let probe: RegExp = new RegExp('^ab', 'g');
        let result: boolean = checker.isRegExp(probe);
        expect(result).assertTrue();
        expect(probe.test('abc')).assertTrue();
      }

      // --- [4] Verify an Int32Array view with the byte offset eight keeps that offset after being classified ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let probe: Int32Array = new Int32Array(buffer, 8, 2);
        checker.isTypedArray(probe);
        expect(probe.byteOffset).assertEqual(8);
      }

      // --- [5] Verify writing through a view keeps the underlying ArrayBuffer reported as an ArrayBuffer ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        view.$_set(0, 1);
        view.$_set(7, 1);
        expect(checker.isArrayBuffer(buffer)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1000
     * @tc.name testTypesConstructor010
     * @tc.desc Merged batch (5 tests): Probe state preservation: a checker stored in an interface typed object literal survives the round trip unchanged; instanceof and the matching predicate agree for Uint8Array, Map and Date widened to Object; a checker found by an int Map position keeps its index after the list grows by one; deleting one checker key from a Map removes only that entry and keeps the other readable; a plain class instance is rejected as a Map while its own field stays intact.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker stored in an interface typed object literal survives the round trip unchanged ---
      {
        let checker: util.types = new util.types();
        let field: CheckerField = { checker: checker, label: 'probe' };
        expect(field.checker).assertEqual(checker);
        expect(field.checker.isNativeError(new Error('e'))).assertTrue();
      }

      // --- [2] Verify instanceof and the matching predicate agree for Uint8Array, Map and Date widened to Object while an Int32Array stays a non Uint8 typed array ---
      {
        let checker: util.types = new util.types();
        let typedArray: Uint8Array = new Uint8Array(2);
        let typed: Object = typedArray;
        expect(typed instanceof Uint8Array).assertTrue();
        expect(checker.isUint8Array(typed)).assertEqual(typed instanceof Uint8Array);
        let sourceMap: Map<string, int> = new Map<string, int>();
        let mapProbe: Object = sourceMap;
        expect(mapProbe instanceof Map).assertTrue();
        expect(checker.isMap(mapProbe)).assertEqual(mapProbe instanceof Map);
        expect(checker.isMap(mapProbe)).assertTrue();
        let sourceDate: Date = new Date(0);
        let dateProbe: Object = sourceDate;
        expect(dateProbe instanceof Date).assertTrue();
        expect(checker.isDate(dateProbe)).assertEqual(dateProbe instanceof Date);
        let sourceInt32: Int32Array = new Int32Array(2);
        let int32: Object = sourceInt32;
        expect(int32 instanceof Uint8Array).assertFalse();
        expect(checker.isTypedArray(int32)).assertTrue();
      }

      // --- [3] Verify a checker found by an int Map position keeps its index after the list grows by one ---
      {
        let checker: util.types = new util.types();
        let list: Array<util.types> = [checker];
        let positions: Map<string, int> = new Map<string, int>();
        positions.set('slot', 0);
        let position: int = positions.get('slot') as int;
        expect(list[position]).assertEqual(checker);
        list.push(new util.types());
        expect(list.length).assertEqual(2);
        expect(list[0].isDate(new Date(0))).assertTrue();
      }

      // --- [4] Verify deleting one checker key from a Map removes only that entry and keeps the other readable ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let store: Map<util.types, string> = new Map<util.types, string>();
        store.set(first, 'first');
        store.set(second, 'second');
        expect(store.delete(first)).assertTrue();
        expect(store.size).assertEqual(1);
        let value: string = store.get(second) as string;
        expect(value).assertEqual('second');
        expect(second.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [5] Verify a plain class instance is rejected as a Map while its own field stays intact ---
      {
        let checker: util.types = new util.types();
        let mimic: WeakKeyBox = new WeakKeyBox();
        expect(checker.isMap(mimic)).assertFalse();
        expect(mimic.tag).assertEqual('key');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1100
     * @tc.name testTypesConstructor011
     * @tc.desc Merged batch (5 tests): Probe state preservation: mutating one subclass instance field leaves a second subclass instance untouched; a freshly constructed checker stays correct after another checker performed many checks; a subclass instance kept in a holder field keeps its own field value and classifies a buffer; interleaving Map and Promise checks twice keeps both answers stable; deleting a checker from a Set reports true and leaves the removed instance still able to classify.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify mutating one subclass instance field leaves a second subclass instance untouched ---
      {
        let first: DerivedChecker = new DerivedChecker();
        let second: DerivedChecker = new DerivedChecker();
        let base: util.types = first;
        first.label = 'changed';
        expect(base.isMap(new Map<string, int>())).assertTrue();
        expect(first.label).assertEqual('changed');
        expect(second.label).assertEqual('derived');
      }

      // --- [2] Verify a freshly constructed checker stays correct after another checker performed many checks ---
      {
        let older: util.types = new util.types();
        let mapVerdict: boolean = older.isMap(new Map<string, int>());
        expect(mapVerdict).assertTrue();
        expect(older.isSet(new Set<int>())).assertTrue();
        expect(older.isDate(new Date(0))).assertTrue();
        let fresh: util.types = new util.types();
        expect(fresh.isDate(new Date())).assertTrue();
      }

      // --- [3] Verify a subclass instance kept in a holder field keeps its own field value and classifies a buffer ---
      {
        let holder: CheckerHolder = new CheckerHolder();
        holder.checker = new DerivedChecker();
        expect(holder.checker instanceof DerivedChecker).assertTrue();
        let typed: DerivedChecker = holder.checker as DerivedChecker;
        expect(typed.label).assertEqual('derived');
        expect(typed.isArrayBuffer(new ArrayBuffer(2))).assertTrue();
      }

      // --- [4] Verify interleaving Map and Promise checks twice keeps both answers stable ---
      {
        let checker: util.types = new util.types();
        let mapProbe: Map<string, int> = new Map<string, int>();
        let promiseProbe: Promise<int> = Promise.resolve<int>(2);
        checker.isMap(mapProbe);
        checker.isPromise(promiseProbe);
        checker.isMap(mapProbe);
        expect(checker.isMap(mapProbe)).assertTrue();
        expect(checker.isPromise(promiseProbe)).assertTrue();
      }

      // --- [5] Verify deleting a checker from a Set reports true and leaves the removed instance still able to classify ---
      {
        let checker: util.types = new util.types();
        let pool: Set<object> = new Set<object>();
        pool.add(checker);
        expect(pool.delete(checker)).assertTrue();
        expect(pool.size).assertEqual(0);
        expect(checker.isSet(new Set<int>())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1200
     * @tc.name testTypesConstructor012
     * @tc.desc Merged batch (3 tests): Probe state preservation: one checker shared by two Maps survives a deletion performed on the first Map only; a Map entry whose key and value are two different checkers keeps one entry and both classify; deleting the only entry that held a checker empties the Map while the instance keeps working.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one checker shared by two Maps survives a deletion performed on the first Map only ---
      {
        let checker: util.types = new util.types();
        let first: Map<string, util.types> = new Map<string, util.types>();
        let second: Map<string, util.types> = new Map<string, util.types>();
        first.set('slot', checker);
        second.set('slot', checker);
        first.delete('slot');
        expect(first.size).assertEqual(0);
        expect(second.size).assertEqual(1);
        let held: util.types = second.get('slot') as util.types;
        expect(held).assertEqual(checker);
      }

      // --- [2] Verify a Map entry whose key and value are two different checkers keeps one entry and both classify ---
      {
        let keyHolder: util.types = new util.types();
        let payload: util.types = new util.types();
        let store: Map<util.types, util.types> = new Map<util.types, util.types>();
        store.set(keyHolder, payload);
        let held: util.types = store.get(keyHolder) as util.types;
        expect(held).assertEqual(payload);
        expect(store.size).assertEqual(1);
        expect(keyHolder.isMap(new Map<int, string>())).assertTrue();
        expect(payload.isSet(new Set<int>())).assertTrue();
      }

      // --- [3] Verify deleting the only entry that held a checker empties the Map while the instance keeps working ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('slot', checker);
        expect(store.delete('slot')).assertTrue();
        expect(store.size).assertEqual(0);
        expect(checker.isSet(new Set<int>())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1300
     * @tc.name testTypesConstructor013
     * @tc.desc Merged batch (5 tests): Cross-kind separation: a DataView and two Uint8Array views over one buffer classify correctly and a Uint8Array reports itself but not Int8Array; isMapIterator does not report the values iterator of a Set as a map iterator; plain arrow functions with void and int results are reported neither as a Promise nor as an async function; Uint8ClampedArray and Uint8Array reject each other; a Uint8Array is a typed array but not an ArrayBuffer, and a Date and a RegExp report only their own predicate.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a DataView and two Uint8Array views over one buffer classify correctly and a Uint8Array reports itself but not Int8Array ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: DataView = new DataView(buffer);
        let typed: Uint8Array = new Uint8Array(buffer);
        let sibling: Uint8Array = new Uint8Array(buffer);
        expect(checker.isDataView(view)).assertTrue();
        expect(checker.isUint8Array(typed)).assertTrue();
        expect(checker.isUint8Array(sibling)).assertTrue();
        let probe: Uint8Array = new Uint8Array(2);
        expect(checker.isUint8Array(probe)).assertTrue();
        expect(checker.isInt8Array(probe)).assertFalse();
      }

      // --- [2] Verify isMapIterator does not report the values iterator of a Set as a map iterator ---
      {
        let checker: util.types = new util.types();
        let source: Set<int> = new Set<int>();
        source.add(1);
        let probe: IterableIterator<int> = source.values();
        expect(checker.isMapIterator(probe)).assertFalse();
      }

      // --- [3] Verify plain arrow functions with void and int results are reported neither as a Promise nor as an async function ---
      {
        let checker: util.types = new util.types();
        let voidArrow: Function = (): void => {
        };
        let valueArrow: Function = (): int => 1;
        let verdicts: boolean[] = [
          checker.isPromise(voidArrow),
          checker.isAsyncFunction(voidArrow),
          checker.isPromise(valueArrow),
          checker.isAsyncFunction(valueArrow)
        ];
        let allRejected: boolean = true;
        for (const verdict of verdicts) {
          allRejected = allRejected && !verdict;
        }
        expect(allRejected).assertTrue();
      }

      // --- [4] Verify Uint8ClampedArray and Uint8Array reject each other while isUint8Array rejects Float32Array and isFloat64Array rejects Int32Array ---
      {
        let checker: util.types = new util.types();
        let clamped: Uint8ClampedArray = new Uint8ClampedArray([255]);
        let eight: Uint8Array = new Uint8Array(2);
        expect(clamped.$_get(0)).assertEqual(255);
        expect(checker.isUint8Array(clamped)).assertFalse();
        expect(checker.isUint8ClampedArray(eight)).assertFalse();
        let floatProbe: Float32Array = new Float32Array(2);
        let intProbe: Int32Array = new Int32Array(2);
        let wrongUint8: boolean = checker.isUint8Array(floatProbe);
        let wrongFloat64: boolean = checker.isFloat64Array(intProbe);
        expect(wrongUint8).assertFalse();
        expect(wrongFloat64).assertFalse();
      }

      // --- [5] Verify a Uint8Array is a typed array but not an ArrayBuffer, and a Date and a RegExp report only their own predicate ---
      {
        let checker: util.types = new util.types();
        let probe: Uint8Array = new Uint8Array(2);
        expect(checker.isTypedArray(probe)).assertTrue();
        expect(checker.isArrayBuffer(probe)).assertFalse();
        let dateProbe: Date = new Date(1);
        expect(checker.isDate(dateProbe)).assertTrue();
        expect(checker.isRegExp(dateProbe)).assertFalse();
        let pattern: RegExp = new RegExp('x');
        expect(checker.isRegExp(pattern)).assertTrue();
        expect(checker.isDate(pattern)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1400
     * @tc.name testTypesConstructor014
     * @tc.desc Merged batch (5 tests): Cross-kind separation: the keys iterator of a Set is a set iterator but not a map iterator; a DataView over an offset window is reported as a DataView; the values iterator of a Map is not reported as a set iterator; two checkers handling a Map and a RegExp respectively do not interfere; a plain checker and a subclass instance act as two separate Map keys.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the keys iterator of a Set is a set iterator but not a map iterator ---
      {
        let checker: util.types = new util.types();
        let source: Set<int> = new Set<int>();
        source.add(1);
        let probe: IterableIterator<int> = source.keys();
        expect(checker.isSetIterator(probe)).assertTrue();
        expect(checker.isMapIterator(probe)).assertFalse();
      }

      // --- [2] Verify a DataView over an offset window is reported as a DataView but not as a typed array, keeping byteOffset 2 ---
      {
        let checker: util.types = new util.types();
        let probe: DataView = new DataView(new ArrayBuffer(8), 2, 4);
        expect(checker.isDataView(probe)).assertTrue();
        expect(checker.isTypedArray(probe)).assertFalse();
        expect(probe.byteOffset).assertEqual(2);
      }

      // --- [3] Verify the values iterator of a Map is not reported as a set iterator ---
      {
        let checker: util.types = new util.types();
        let source: Map<string, int> = new Map<string, int>();
        source.set('a', 1);
        let probe: IterableIterator<int> = source.values();
        expect(checker.isMapIterator(probe)).assertTrue();
        expect(checker.isSetIterator(probe)).assertFalse();
      }

      // --- [4] Verify two checkers handling a Map and a RegExp respectively do not interfere ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let mapResult: boolean = first.isMap(new Map<string, int>());
        let regexpResult: boolean = second.isRegExp(new RegExp('a'));
        expect(mapResult).assertTrue();
        expect(regexpResult).assertTrue();
      }

      // --- [5] Verify a plain checker and a subclass instance act as two separate Map keys ---
      {
        let base: util.types = new util.types();
        let derived: util.types = new DerivedChecker();
        let store: Map<util.types, string> = new Map<util.types, string>();
        store.set(base, 'base');
        store.set(derived, 'derived');
        expect(store.size).assertEqual(2);
        expect(store.get(base)).assertEqual('base');
        expect(store.get(derived)).assertEqual('derived');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1500
     * @tc.name testTypesConstructor015
     * @tc.desc Merged batch (1 test): Cross-kind separation: one checker separates a Promise from a Date while scanning a two entry probe list.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one checker separates a Promise from a Date while scanning a two entry probe list ---
      {
        let checker: util.types = new util.types();
        let probes: Array<Object> = [Promise.resolve<int>(1), new Date(0)];
        let promiseHits: int = 0;
        let dateHits: int = 0;
        let cursor: int = 0;
        while (cursor < probes.length) {
          if (checker.isPromise(probes[cursor])) {
            promiseHits = promiseHits + 1;
          }
          if (checker.isDate(probes[cursor])) {
            dateHits = dateHits + 1;
          }
          cursor = cursor + 1;
        }
        expect(promiseHits).assertEqual(1);
        expect(dateHits).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1600
     * @tc.name testTypesConstructor016
     * @tc.desc Merged batch (5 tests): Function and closure transport: a checker passed as a function argument produces a RegExp classification; a class method handed a checker uses it to classify and counts the invocation; one checker labels a buffer and the DataView over it as a recognised pair through a helper; a generic helper reports a checker passed through it as of type object; an arrow closed over a checker classifies a Map after the creating scope has returned.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker passed as a function argument produces a RegExp classification ---
      {
        let checker: util.types = new util.types();
        expect(probeRegExp(checker)).assertTrue();
      }

      // --- [2] Verify a class method handed a checker uses it to classify and counts the invocation ---
      {
        let runner: CheckerRunner = new CheckerRunner();
        let checker: util.types = new util.types();
        expect(runner.run(checker)).assertTrue();
        expect(runner.runs).assertEqual(1);
        expect(checker.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [3] Verify one checker labels a buffer and the DataView over it as a recognised pair through a helper ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: DataView = new DataView(buffer);
        expect(labelBufferPair(checker, buffer, view)).assertEqual('pair');
        expect(checker.isArrayBuffer(view)).assertFalse();
      }

      // --- [4] Verify a generic helper reports a checker passed through it as of type object ---
      {
        let checker: util.types = new util.types();
        expect(classifyValue<util.types>(checker)).assertEqual('object');
      }

      // --- [5] Verify an arrow closed over a checker classifies a Map after the creating scope has returned ---
      {
        let checker: util.types = new util.types();
        let closed: () => boolean = makeMapClosure(checker);
        expect(closed()).assertTrue();
        expect(closed()).assertTrue();
        expect(checker.isDate(new Date(0))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1700
     * @tc.name testTypesConstructor017
     * @tc.desc Merged batch (5 tests): Function and closure transport: an arrow function that receives a checker returns its Date verdict when called with it; a helper storing a checker into a shared Set reports size one and the pool holds the instance; two closures over two different checkers both classify and keep their captured instances apart; a checker captured by an inner closure returned through an outer closure classifies a Map; one checker reused by two helper calls reports two accepted maps and then none.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an arrow function that receives a checker returns its Date verdict when called with it ---
      {
        let checker: util.types = new util.types();
        let judge: (instance: util.types) => boolean = (instance: util.types): boolean => instance.isDate(new Date(0));
        let verdict: boolean = judge(checker);
        expect(verdict).assertTrue();
      }

      // --- [2] Verify a helper storing a checker into a shared Set reports size one and the pool holds the instance ---
      {
        let pool: Set<object> = new Set<object>();
        let checker: util.types = new util.types();
        expect(storeChecker(pool, checker)).assertEqual(1);
        expect(pool.has(checker)).assertTrue();
      }

      // --- [3] Verify two closures over two different checkers both classify and keep their captured instances apart ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let firstClosure: () => boolean = makeMapClosure(first);
        let secondClosure: () => boolean = makeMapClosure(second);
        expect(firstClosure()).assertTrue();
        expect(secondClosure()).assertTrue();
        expect(first === second).assertFalse();
      }

      // --- [4] Verify a checker captured by an inner closure returned through an outer closure classifies a Map ---
      {
        let checker: util.types = new util.types();
        let outerFn: () => () => boolean = (): (() => boolean) => {
          return (): boolean => checker.isMap(new Map<string, int>());
        };
        let inner: () => boolean = outerFn();
        expect(inner()).assertTrue();
        expect(checker.isSet(new Set<int>())).assertTrue();
      }

      // --- [5] Verify one checker reused by two helper calls reports two accepted maps and then none ---
      {
        let checker: util.types = new util.types();
        let firstList: Array<Object> = [new Map<string, int>(), new Map<int, int>()];
        let secondList: Array<Object> = [new Set<int>()];
        expect(countMapChecks(checker, firstList)).assertEqual(2);
        expect(countMapChecks(checker, secondList)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1800
     * @tc.name testTypesConstructor018
     * @tc.desc Merged batch (5 tests): Function and closure transport: an Object typed array element narrowed by instanceof is usable as a checker receiver; isMap and isSet combine with logical and, a negated isInt8Array holds and an isDate result drives an if branch; a conditional expression, a logical or and a ternary on a checker verdict each select or combine receivers correctly; a verdict captured before a batch of unrelated classifications matches the one captured after; three closures built in a loop each capture their own checker and all report true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Object typed array element narrowed by instanceof is usable as a checker receiver ---
      {
        let mixed: Array<Object> = [new util.types(), 'text'];
        let target: Object = mixed[0];
        expect(target instanceof util.types).assertTrue();
        let checker: util.types = target as util.types;
        expect(checker.isSet(new Set<int>())).assertTrue();
      }

      // --- [2] Verify isMap and isSet combine with logical and, a negated isInt8Array holds and an isDate result drives an if branch ---
      {
        let checker: util.types = new util.types();
        let mapProbe: Map<string, int> = new Map<string, int>();
        let setProbe: Set<int> = new Set<int>();
        let both: boolean = checker.isMap(mapProbe) && checker.isSet(setProbe);
        expect(both).assertTrue();
        let eightProbe: Uint8Array = new Uint8Array(2);
        let notInt8: boolean = !checker.isInt8Array(eightProbe);
        expect(notInt8).assertTrue();
        let dateProbe: Date = new Date();
        let tag: string = '';
        if (checker.isDate(dateProbe)) {
          tag = 'date';
        }
        expect(tag).assertEqual('date');
      }

      // --- [3] Verify a conditional expression, a logical or and a ternary on a checker verdict each select or combine receivers correctly ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let chooseFirst: boolean = true;
        let selected: util.types = chooseFirst ? first : second;
        expect(selected).assertEqual(first);
        expect(selected.isMap(new Map<string, int>())).assertTrue();
        let setProbe: Set<int> = new Set<int>();
        let combined: boolean = first.isMap(setProbe) || second.isSet(setProbe);
        expect(first.isMap(setProbe)).assertFalse();
        expect(combined).assertTrue();
        let chooser: util.types = new util.types();
        let dateChecker: util.types = new util.types();
        let mapChecker: util.types = new util.types();
        let dateProbe: Date = new Date(0);
        let receiver: util.types = chooser.isDate(dateProbe) ? dateChecker : mapChecker;
        expect(receiver).assertEqual(dateChecker);
        expect(receiver.isDate(dateProbe)).assertTrue();
      }

      // --- [4] Verify a verdict captured before a batch of unrelated classifications matches the one captured after ---
      {
        let checker: util.types = new util.types();
        let probe: Set<int> = new Set<int>();
        let before: boolean = checker.isSet(probe);
        checker.isMap(new Map<string, int>());
        checker.isDate(new Date(0));
        checker.isRegExp(new RegExp('z'));
        let after: boolean = checker.isSet(probe);
        expect(before).assertEqual(after);
        expect(after).assertTrue();
      }

      // --- [5] Verify three closures built in a loop each capture their own checker and all report true ---
      {
        let closures: Array<() => boolean> = [];
        for (let index: int = 0; index < 3; index++) {
          let instance: util.types = new util.types();
          closures.push(makeMapClosure(instance));
        }
        let total: int = 0;
        for (const item of closures) {
          if (item()) {
            total = total + 1;
          }
        }
        expect(total).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_1900
     * @tc.name testTypesConstructor019
     * @tc.desc Merged batch (1 test): Function and closure transport: a checker captured by an interface typed callable field classifies through that field.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker captured by an interface typed callable field classifies through that field ---
      {
        let checker: util.types = new util.types();
        let api: CheckerApi = { classify: (probe: Object): boolean => checker.isMap(probe) };
        expect(api.classify(new Map<string, int>())).assertTrue();
        expect(api.classify(new Set<int>())).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2000
     * @tc.name testTypesConstructor020
     * @tc.desc Merged batch (5 tests): Container and field storage: classifying a WeakMap still lets the original key read back its value; a Map entry stays readable by key and a Set still answers has for its member after the checker classified them; Map iterator still lets it be walked to completion; DataView still lets the byte written at offset zero be read back; a checker held in a nullable variable is not null after the no-argument construction.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify classifying a WeakMap still lets the original key read back its value ---
      {
        let checker: util.types = new util.types();
        let key: WeakKeyBox = new WeakKeyBox();
        let probe: WeakMap<WeakKeyBox, int> = new WeakMap<WeakKeyBox, int>();
        probe.set(key, 7);
        let result: boolean = checker.isWeakMap(probe);
        expect(result).assertTrue();
        expect(probe.get(key)).assertEqual(7);
      }

      // --- [2] Verify a Map entry stays readable by key and a Set still answers has for its member after the checker classified them ---
      {
        let checker: util.types = new util.types();
        let probe: Map<string, int> = new Map<string, int>();
        probe.set('a', 1);
        checker.isMap(probe);
        expect(probe.get('a')).assertEqual(1);
        let probe_2: Set<string> = new Set<string>();
        probe_2.add('z');
        checker.isSet(probe_2);
        expect(probe_2.has('z')).assertTrue();
      }

      // --- [3] Verify classifying a Map iterator still lets it be walked to completion ---
      {
        let checker: util.types = new util.types();
        let source: Map<string, int> = new Map<string, int>();
        source.set('k', 1);
        let iterator: IterableIterator<string> = source.keys();
        let result: boolean = checker.isMapIterator(iterator);
        let matched: int = 0;
        for (const item of iterator) {
          if (item === 'k') {
            matched++;
          }
        }
        expect(result).assertTrue();
        expect(matched).assertEqual(1);
      }

      // --- [4] Verify classifying a DataView still lets the byte written at offset zero be read back ---
      {
        let checker: util.types = new util.types();
        let probe: DataView = new DataView(new ArrayBuffer(4));
        probe.setUint8(0, 9);
        let result: boolean = checker.isDataView(probe);
        expect(result).assertTrue();
        expect(probe.getUint8(0)).assertEqual(9);
      }

      // --- [5] Verify a checker held in a nullable variable is not null after the no-argument construction ---
      {
        let nullable: util.types | null = new util.types();
        expect(nullable !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2100
     * @tc.name testTypesConstructor021
     * @tc.desc Merged batch (5 tests): Container and field storage: a pair class stored as a Map value is returned with both of its checkers usable; overwriting a Map value with a subclass instance makes the new subclass visible with its field; a subclass instance used as a Map key is found again and still classifies a Set; the checker classifies a Set holding one member as a Set; one checker filters two typed array kinds out of three samples and reports a Set as Set with a Uint8Array as typed array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a pair class stored as a Map value is returned with both of its checkers usable ---
      {
        let pair: CheckerPair = new CheckerPair();
        let store: Map<string, CheckerPair> = new Map<string, CheckerPair>();
        store.set('slot', pair);
        let fetched: CheckerPair = store.get('slot') as CheckerPair;
        expect(fetched).assertEqual(pair);
        expect(fetched.left.isMap(new Map<string, int>())).assertTrue();
        expect(fetched.right.isSet(new Set<int>())).assertTrue();
      }

      // --- [2] Verify overwriting a Map value with a subclass instance makes the new subclass visible with its field ---
      {
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('slot', new util.types());
        store.set('slot', new DerivedChecker());
        let held: util.types = store.get('slot') as util.types;
        expect(held instanceof DerivedChecker).assertTrue();
        let typed: DerivedChecker = held as DerivedChecker;
        expect(typed.label).assertEqual('derived');
        expect(store.size).assertEqual(1);
      }

      // --- [3] Verify a subclass instance used as a Map key is found again and still classifies a Set ---
      {
        let derived: util.types = new DerivedChecker();
        let store: Map<util.types, string> = new Map<util.types, string>();
        store.set(derived, 'derived');
        let value: string = store.get(derived) as string;
        expect(value).assertEqual('derived');
        expect(store.size).assertEqual(1);
        expect(derived.isSet(new Set<int>())).assertTrue();
      }

      // --- [4] Verify the checker classifies a Set holding one member as a Set ---
      {
        let checker: util.types = new util.types();
        let probe: Set<string> = new Set<string>();
        probe.add('member');
        expect(checker.isSet(probe)).assertTrue();
      }

      // --- [5] Verify one checker filters two typed array kinds out of three samples and reports a Set as Set with a Uint8Array as typed array ---
      {
        let checker: util.types = new util.types();
        let samples: Array<Object> = [new Uint8Array([1, 2]), new Float64Array([1.5]), new ArrayBuffer(4)];
        let typed: Array<Object> = samples.filter((sample: Object): boolean => checker.isTypedArray(sample));
        expect(typed.length).assertEqual(2);
        expect(checker.isTypedArray(typed[0])).assertTrue();
        expect(checker.isTypedArray(typed[1])).assertTrue();
        let probe: Object = new Uint8Array([0]);
        let kind: string = 'other';
        if (checker.isSet(new Set<int>())) {
          kind = 'set';
        }
        if (checker.isTypedArray(probe)) {
          kind = kind + ' and typed';
        }
        expect(kind).assertEqual('set and typed');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2200
     * @tc.name testTypesConstructor022
     * @tc.desc Merged batch (5 tests): Container and field storage: a Uint8Array built from a value produced by the checker is still a Uint8Array; the checker reports a Float64Array holding NaN and positive infinity as a typed array; isUint8Array reports a three element Uint8Array as a Uint8Array; zero length Int32Array and Uint8Array are still reported as typed arrays; a Float64Array holding negative infinity is reported as a Float64Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Uint8Array built from a value produced by the checker is still a Uint8Array ---
      {
        let checker: util.types = new util.types();
        let encoded: int = checker.isMap(new Map<string, int>()) ? 1 : 0;
        let probe: Uint8Array = new Uint8Array([encoded]);
        expect(probe.$_get(0)).assertEqual(1);
        expect(checker.isUint8Array(probe)).assertTrue();
      }

      // --- [2] Verify the checker reports a Float64Array holding NaN and positive infinity as a typed array ---
      {
        let checker: util.types = new util.types();
        let probe: Float64Array = new Float64Array([Double.NaN, Double.POSITIVE_INFINITY]);
        expect(checker.isTypedArray(probe)).assertTrue();
      }

      // --- [3] Verify isUint8Array reports a three element Uint8Array as a Uint8Array ---
      {
        let checker: util.types = new util.types();
        let probe: Uint8Array = new Uint8Array([1, 2, 3]);
        expect(probe.length).assertEqual(3);
        expect(checker.isUint8Array(probe)).assertTrue();
      }

      // --- [4] Verify zero length Int32Array and Uint8Array are still reported as typed arrays ---
      {
        let checker: util.types = new util.types();
        let int32: Int32Array = new Int32Array(0);
        let eight: Uint8Array = new Uint8Array(0);
        expect(int32.length).assertEqual(0);
        expect(eight.byteLength).assertEqual(0);
        let probes: Array<Object> = [int32, eight];
        for (const probe of probes) {
          expect(checker.isTypedArray(probe)).assertTrue();
        }
      }

      // --- [5] Verify a Float64Array holding negative infinity is reported as a Float64Array ---
      {
        let checker: util.types = new util.types();
        let probe: Float64Array = new Float64Array([Double.NEGATIVE_INFINITY]);
        expect(checker.isFloat64Array(probe)).assertTrue();
        expect(probe.$_get(0) < 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2300
     * @tc.name testTypesConstructor023
     * @tc.desc Merged batch (5 tests): Container and field storage: a four byte window at byte offset 4 and a zero length window at the buffer end are both array buffer views; counting Map verdicts over a mixed probe list of two Maps and one Set returns two; one checker reports a Map as a Map and then a Set as a Set without either result changing; two checkers return the same answer for one shared ArrayBuffer and Set; a full range and a sub range Uint16Array view over one buffer are both typed arrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a four byte window at byte offset 4 and a zero length window at the buffer end are both array buffer views ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let mid: Uint8Array = new Uint8Array(buffer, 4, 4);
        let tail: Uint8Array = new Uint8Array(buffer, 16, 0);
        expect(mid.byteOffset).assertEqual(4);
        expect(checker.isArrayBufferView(mid)).assertTrue();
        expect(tail.length).assertEqual(0);
        expect(checker.isArrayBufferView(tail)).assertTrue();
      }

      // --- [2] Verify counting Map verdicts over a mixed probe list of two Maps and one Set returns two ---
      {
        let checker: util.types = new util.types();
        let probes: Array<Object> = [new Map<string, int>(), new Set<int>(), new Map<int, int>()];
        expect(countMapChecks(checker, probes)).assertEqual(2);
        expect(checker.isSet(new Set<int>())).assertTrue();
      }

      // --- [3] Verify one checker reports a Map as a Map and then a Set as a Set without either result changing ---
      {
        let checker: util.types = new util.types();
        let mapResult: boolean = checker.isMap(new Map<string, int>());
        let setResult: boolean = checker.isSet(new Set<string>());
        expect(mapResult).assertTrue();
        expect(setResult).assertTrue();
      }

      // --- [4] Verify two checkers return the same answer for one shared ArrayBuffer and Set ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        expect(first.isArrayBuffer(buffer)).assertEqual(second.isArrayBuffer(buffer));
        expect(first.isArrayBuffer(buffer)).assertTrue();
        let first_2: util.types = new util.types();
        let second_2: util.types = new util.types();
        let probe: Set<string> = new Set<string>();
        first_2.isSet(probe);
        expect(first_2.isSet(probe)).assertEqual(second_2.isSet(probe));
        expect(second_2.isSet(probe)).assertTrue();
      }

      // --- [5] Verify a full range and a sub range Uint16Array view over one buffer are both typed arrays ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let full: Uint16Array = new Uint16Array(buffer);
        let sub: Uint16Array = new Uint16Array(buffer, 4, 2);
        expect(checker.isTypedArray(full)).assertTrue();
        expect(checker.isTypedArray(sub)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2400
     * @tc.name testTypesConstructor024
     * @tc.desc Merged batch (5 tests): Container and field storage: five successive isMap calls made on one checker all return true; and the checker classifies a WeakSet holding one class member as a WeakSet; the checker classifies both the keys and the values iterator of a Map as a map iterator; counting Map verdicts over an empty probe array yields zero; two checkers agree that a string probe is not a Map; one record holds both true Date and RegExp verdicts.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify five successive isMap calls made on one checker all return true; and the checker classifies a WeakSet holding one class member as a WeakSet ---
      {
        let checker: util.types = new util.types();
        let probe: Map<string, int> = new Map<string, int>();
        let accepted: int = 0;
        for (let index: int = 0; index < 5; index++) {
          if (checker.isMap(probe)) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(5);
        let key: WeakKeyBox = new WeakKeyBox();
        let probe_2: WeakSet<WeakKeyBox> = new WeakSet<WeakKeyBox>();
        probe_2.add(key);
        expect(checker.isWeakSet(probe_2)).assertTrue();
      }

      // --- [2] Verify the checker classifies both the keys and the values iterator of a Map as a map iterator ---
      {
        let checker: util.types = new util.types();
        let probe: Map<string, int> = new Map<string, int>();
        probe.set('a', 1);
        let keysIterator: IterableIterator<string> = probe.keys();
        let valuesIterator: IterableIterator<int> = probe.values();
        expect(checker.isMapIterator(keysIterator)).assertTrue();
        expect(checker.isMapIterator(valuesIterator)).assertTrue();
      }

      // --- [3] Verify counting Map verdicts over an empty probe array yields zero while two util.types instances agree on a Map ---
      {
        let checker: util.types = new util.types();
        let probes: Array<Object> = [];
        expect(countMapChecks(checker, probes)).assertEqual(0);
        let peer: util.types = new util.types();
        expect(agreeOnMap(checker, peer, new Map<string, int>())).assertTrue();
      }

      // --- [4] Verify two checkers agree that a string probe is not a Map ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        expect(agreeOnMap(first, second, 'probe')).assertTrue();
        expect(first.isMap('probe')).assertFalse();
      }

      // --- [5] Verify one record holds both true Date and RegExp verdicts while a WeakMap and then a WeakSet report their own predicates ---
      {
        let checker: util.types = new util.types();
        let verdicts: Record<string, boolean> = {
          'date': checker.isDate(new Date(0)),
          'regexp': checker.isRegExp(new RegExp('a'))
        };
        expect(verdicts['date']!).assertTrue();
        expect(verdicts['regexp']!).assertTrue();
        let key: WeakKeyBox = new WeakKeyBox();
        let weakMapProbe: WeakMap<WeakKeyBox, int> = new WeakMap<WeakKeyBox, int>();
        weakMapProbe.set(key, 1);
        let weakSetProbe: WeakSet<WeakKeyBox> = new WeakSet<WeakKeyBox>();
        weakSetProbe.add(key);
        let first: boolean = checker.isWeakMap(weakMapProbe);
        let second: boolean = checker.isWeakSet(weakSetProbe);
        expect(first).assertTrue();
        expect(second).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2500
     * @tc.name testTypesConstructor025
     * @tc.desc Merged batch (5 tests): Container and field storage: a checker pushed into an array can be read back and still classifies a Date; an explicitly typed array holding two checkers lets both of them classify a value; the checker classifies both the values and the keys iterator of a Set as a set iterator; can serve as the key of a WeakMap and be read back with its value and Map and be read back with its value; stored in a class field classifies an ArrayBuffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker pushed into an array can be read back and still classifies a Date ---
      {
        let store: util.types[] = [];
        store.push(new util.types());
        let checker: util.types = store[0];
        expect(checker.isDate(new Date())).assertTrue();
      }

      // --- [2] Verify an explicitly typed array holding two checkers lets both of them classify a value ---
      {
        let boxed: Array<util.types> = [new util.types(), new util.types()];
        expect(boxed[0].isMap(new Map<string, int>())).assertTrue();
        expect(boxed[1].isSet(new Set<int>())).assertTrue();
      }

      // --- [3] Verify the checker classifies both the values and the keys iterator of a Set as a set iterator ---
      {
        let checker: util.types = new util.types();
        let probe: Set<int> = new Set<int>();
        probe.add(1);
        let valuesIterator: IterableIterator<int> = probe.values();
        let keysIterator: IterableIterator<int> = probe.keys();
        expect(checker.isSetIterator(valuesIterator)).assertTrue();
        expect(checker.isSetIterator(keysIterator)).assertTrue();
      }

      // --- [4] Verify a checker can serve as the key of a WeakMap and be read back with its value and Map and be read back with its value ---
      {
        let checker: util.types = new util.types();
        let weakStore: WeakMap<util.types, int> = new WeakMap<util.types, int>();
        weakStore.set(checker, 5);
        expect(weakStore.get(checker)).assertEqual(5);
        let store: Map<util.types, string> = new Map<util.types, string>();
        store.set(checker, 'v');
        expect(store.get(checker)).assertEqual('v');
      }

      // --- [5] Verify a checker stored in a class field classifies an ArrayBuffer ---
      {
        let holder: CheckerHolder = new CheckerHolder();
        expect(holder.checker.isArrayBuffer(new ArrayBuffer(8))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2600
     * @tc.name testTypesConstructor026
     * @tc.desc Merged batch (5 tests): Container and field storage: a checker read from a holder field differs from a locally constructed one yet still classifies; the only member yielded by a Set traversal is the stored checker and it classifies a Date; a checker reached through two array layers is the original instance and classifies a buffer and holder layers classifies a DataView; a verdict produced by one checker indexes a two element label array and picks the Map label; walking the key iterator of a checker keyed Map yields both instances usable as receivers.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker read from a holder field differs from a locally constructed one yet still classifies ---
      {
        let holder: CheckerHolder = new CheckerHolder();
        let local: util.types = new util.types();
        expect(holder.checker === local).assertFalse();
        expect(holder.checker.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [2] Verify the only member yielded by a Set traversal is the stored checker and it classifies a Date ---
      {
        let checker: util.types = new util.types();
        let pool: Set<object> = new Set<object>();
        pool.add(checker);
        let visited: int = 0;
        for (const member of pool) {
          let instance: util.types = member as util.types;
          expect(instance).assertEqual(checker);
          expect(instance.isDate(new Date(1))).assertTrue();
          visited = visited + 1;
        }
        expect(visited).assertEqual(1);
      }

      // --- [3] Verify a checker reached through two array layers is the original instance and classifies a buffer and holder layers classifies a DataView ---
      {
        let checker: util.types = new util.types();
        let layers: Array<Array<util.types>> = [[checker]];
        let inner: Array<util.types> = layers[0];
        expect(inner[0]).assertEqual(checker);
        expect(inner[0].isArrayBuffer(new ArrayBuffer(4))).assertTrue();
        let frame: CheckerFrame = new CheckerFrame();
        expect(frame.holder.checker.isDataView(new DataView(new ArrayBuffer(2)))).assertTrue();
        expect(frame.holder.checker === new CheckerHolder().checker).assertFalse();
      }

      // --- [4] Verify a verdict produced by one checker indexes a two element label array and picks the Map label ---
      {
        let checker: util.types = new util.types();
        let labels: Array<string> = ['plain', 'container'];
        let index: int = checker.isMap(new Map<string, int>()) ? 1 : 0;
        expect(labels[index]).assertEqual('container');
      }

      // --- [5] Verify walking the key iterator of a checker keyed Map yields both instances usable as receivers ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let store: Map<util.types, string> = new Map<util.types, string>();
        store.set(first, 'a');
        store.set(second, 'b');
        let iterator: IterableIterator<util.types> = store.keys();
        let seen: int = 0;
        for (const key of iterator) {
          expect(key.isRegExp(new RegExp('k'))).assertTrue();
          seen = seen + 1;
        }
        expect(seen).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2700
     * @tc.name testTypesConstructor027
     * @tc.desc Merged batch (5 tests): Container and field storage: every element of a three element checker array classifies a Set during traversal; a checker read out of a Map before the clear still classifies after the Map was emptied; a checker that is the only member of a Set reports that Set as a Set; one checker stored under two Map keys is visited twice by value traversal; a checker stored under another checker's verdict key is returned by that key and one inside the array it probes still rejects it.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every element of a three element checker array classifies a Set during traversal ---
      {
        let instances: Array<util.types> = [new util.types(), new util.types(), new util.types()];
        let accepted: int = 0;
        for (const instance of instances) {
          if (instance.isSet(new Set<string>())) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(3);
      }

      // --- [2] Verify a checker read out of a Map before the clear still classifies after the Map was emptied ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('slot', checker);
        let held: util.types = store.get('slot') as util.types;
        store.clear();
        expect(store.size).assertEqual(0);
        expect(held.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [3] Verify a checker that is the only member of a Set reports that Set as a Set ---
      {
        let checker: util.types = new util.types();
        let pool: Set<object> = new Set<object>();
        pool.add(checker);
        expect(checker.isSet(pool)).assertTrue();
        expect(pool.size).assertEqual(1);
      }

      // --- [4] Verify one checker stored under two Map keys is visited twice by value traversal ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('first', checker);
        store.set('second', checker);
        let hits: int = 0;
        for (const item of store.values()) {
          if (item.isSet(new Set<int>())) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(2);
        expect(store.size).assertEqual(2);
      }

      // --- [5] Verify a checker stored under another checker's verdict key is returned by that key and one inside the array it probes still rejects it ---
      {
        let recorder: util.types = new util.types();
        let stored: util.types = new util.types();
        let store: Map<boolean, util.types> = new Map<boolean, util.types>();
        store.set(recorder.isMap(new Map<string, int>()), stored);
        let held: util.types = store.get(true) as util.types;
        expect(held).assertEqual(stored);
        expect(held.isSet(new Set<int>())).assertTrue();
        let checker: util.types = new util.types();
        let list: Array<Object> = [checker];
        expect(checker.isMap(list)).assertFalse();
        expect(list.length).assertEqual(1);
        let stored_2: util.types = list[0] as util.types;
        expect(stored_2).assertEqual(checker);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2800
     * @tc.name testTypesConstructor028
     * @tc.desc Merged batch (5 tests): Container and field storage: counting Map verdicts over a list containing the checker itself accepts only the Map entry; a checker reached through a Map value and then a holder field still classifies; holders traversed from an array each expose a checker that classifies a Set; a checker reached through two nested Map layers is the original instance and classifies; two verdicts of one checker recorded in an array hold exactly one true value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify counting Map verdicts over a list containing the checker itself accepts only the Map entry ---
      {
        let checker: util.types = new util.types();
        let probes: Array<Object> = [checker, new Map<string, int>()];
        expect(countMapChecks(checker, probes)).assertEqual(1);
        expect(checker.isSet(new Set<int>())).assertTrue();
      }

      // --- [2] Verify a checker reached through a Map value and then a holder field still classifies ---
      {
        let holder: CheckerHolder = new CheckerHolder();
        let registry: Map<string, CheckerHolder> = new Map<string, CheckerHolder>();
        registry.set('slot', holder);
        let fetched: CheckerHolder = registry.get('slot') as CheckerHolder;
        expect(fetched).assertEqual(holder);
        expect(fetched.checker.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [3] Verify holders traversed from an array each expose a checker that classifies a Set ---
      {
        let holders: Array<CheckerHolder> = [new CheckerHolder(), new CheckerHolder()];
        let accepted: int = 0;
        for (const holder of holders) {
          if (holder.checker.isSet(new Set<int>())) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(2);
      }

      // --- [4] Verify a checker reached through two nested Map layers is the original instance and classifies ---
      {
        let checker: util.types = new util.types();
        let inner: Map<string, util.types> = new Map<string, util.types>();
        inner.set('slot', checker);
        let outer: Map<string, Map<string, util.types>> = new Map<string, Map<string, util.types>>();
        outer.set('layer', inner);
        let fetched: Map<string, util.types> = outer.get('layer') as Map<string, util.types>;
        let held: util.types = fetched.get('slot') as util.types;
        expect(held).assertEqual(checker);
        expect(held.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [5] Verify two verdicts of one checker recorded in an array hold exactly one true value ---
      {
        let checker: util.types = new util.types();
        let verdicts: Array<boolean> = [checker.isMap(new Map<string, int>()), checker.isMap(new Set<int>())];
        let accepted: int = 0;
        for (const verdict of verdicts) {
          if (verdict) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(1);
        expect(verdicts.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_2900
     * @tc.name testTypesConstructor029
     * @tc.desc Merged batch (5 tests): Container and field storage: a checker held by a Map inside an array element is recovered through both layers; stored in a Record that is itself a Map value is recovered and classifies a Date; stored as a Map value reports the Map that holds it as a Map; reports the values iterator of the Set that contains it as a set iterator; taken from a holder field is itself usable as a Map key.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker held by a Map inside an array element is recovered through both layers ---
      {
        let checker: util.types = new util.types();
        let cell: Map<string, util.types> = new Map<string, util.types>();
        cell.set('slot', checker);
        let row: Array<Map<string, util.types>> = [cell];
        let held: util.types = row[0].get('slot') as util.types;
        expect(held).assertEqual(checker);
        expect(held.isTypedArray(new Int16Array(2))).assertTrue();
      }

      // --- [2] Verify a checker stored in a Record that is itself a Map value is recovered and classifies a Date ---
      {
        let checker: util.types = new util.types();
        let table: Record<string, util.types> = { 'slot': checker };
        let store: Map<string, Record<string, util.types>> = new Map<string, Record<string, util.types>>();
        store.set('table', table);
        let fetched: Record<string, util.types> = store.get('table') as Record<string, util.types>;
        let held: util.types = fetched['slot']!;
        expect(held).assertEqual(checker);
        expect(held.isDate(new Date(0))).assertTrue();
      }

      // --- [3] Verify a checker stored as a Map value reports the Map that holds it as a Map ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('slot', checker);
        expect(checker.isMap(store)).assertTrue();
        let held: util.types = store.get('slot') as util.types;
        expect(held).assertEqual(checker);
      }

      // --- [4] Verify a checker reports the values iterator of the Set that contains it as a set iterator ---
      {
        let checker: util.types = new util.types();
        let pool: Set<object> = new Set<object>();
        pool.add(checker);
        let iterator: IterableIterator<object> = pool.values();
        expect(checker.isSetIterator(iterator)).assertTrue();
        expect(checker.isSet(pool)).assertTrue();
      }

      // --- [5] Verify a checker taken from a holder field is itself usable as a Map key ---
      {
        let holder: CheckerHolder = new CheckerHolder();
        let registry: Map<util.types, string> = new Map<util.types, string>();
        registry.set(holder.checker, 'held');
        let value: string = registry.get(holder.checker) as string;
        expect(value).assertEqual('held');
        expect(holder.checker.isSet(new Set<int>())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_3000
     * @tc.name testTypesConstructor030
     * @tc.desc Merged batch (2 tests): Container and field storage: the value iterator of a checker valued Map yields the checker and is a map iterator; a checker held in an array that is a Map value is recovered through both layers.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the value iterator of a checker valued Map yields the checker and is a map iterator ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, util.types> = new Map<string, util.types>();
        store.set('slot', checker);
        let iterator: IterableIterator<util.types> = store.values();
        let held: util.types = iterator.next().value as util.types;
        expect(held).assertEqual(checker);
        expect(checker.isMapIterator(iterator)).assertTrue();
      }

      // --- [2] Verify a checker held in an array that is a Map value is recovered through both layers ---
      {
        let checker: util.types = new util.types();
        let grouped: Map<int, Array<util.types>> = new Map<int, Array<util.types>>();
        grouped.set(1, [checker]);
        let list: Array<util.types> = grouped.get(1) as Array<util.types>;
        expect(list[0]).assertEqual(checker);
        expect(list[0].isMap(new Map<string, int>())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_3100
     * @tc.name testTypesConstructor031
     * @tc.desc Merged batch (4 tests): Classification paths and subclass probes: verifies checker verdicts, covering subclass instances, ECMA timestamp limits and branch selection.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an instance of a class extending util.types passes both instanceof checks and classifies a Map ---
      {
        let built: Object = new DerivedChecker();
        expect(built instanceof util.types).assertTrue();
        expect(built instanceof DerivedChecker).assertTrue();
        let derived: util.types = built as util.types;
        expect(derived.isMap(new Map<string, int>())).assertTrue();
      }

      // --- [2] Verify the checker reports the ECMA timestamp limit 8.64e15 and one millisecond past it as Dates while a Map check rejects the latter ---
      {
        let checker: util.types = new util.types();
        let limit: Date = new Date(8640000000000000);
        let beyond: Date = new Date(8640000000000001);
        expect(checker.isDate(limit)).assertTrue();
        expect(checker.isDate(beyond)).assertTrue();
        expect(checker.isMap(beyond)).assertFalse();
      }

      // --- [3] Verify a subclass instance is rejected as Map, Set and Date while an array fails as Map and a quoted key Record still reports Map ---
      {
        let receiver: util.types = new util.types();
        let derived: util.types = new DerivedChecker();
        expect(receiver.isMap(derived)).assertFalse();
        expect(receiver.isSet(derived)).assertFalse();
        expect(receiver.isDate(derived)).assertFalse();
        let checker: util.types = new util.types();
        let list: Array<int> = [1, 2];
        let table: Record<string, int> = { 'k': 3 };
        expect(checker.isMap(list)).assertFalse();
        expect(checker.isMap(table)).assertTrue();
        expect(list.length).assertEqual(2);
        expect(table['k']).assertEqual(3);
      }

      // --- [4] Verify one checker takes the Set branch for a Set and rejects the very same probe as a Map ---
      {
        let checker: util.types = new util.types();
        let probe: Set<int> = new Set<int>();
        let verdict: string = 'none';
        switch (checker.isSet(probe)) {
          case true:
            verdict = checker.isMap(probe) ? 'both' : 'set only';
            break;
          default:
            verdict = 'rejected';
            break;
        }
        expect(verdict).assertEqual('set only');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_3200
     * @tc.name testTypesConstructor032
     * @tc.desc Merged batch (4 tests): Typed array recognition: verifies verdicts for the full typed array family, covering bigint keyed Maps, signed and unsigned limits and single precision values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the checker reports a Map declared with bigint keys as a Map ---
      {
        let checker: util.types = new util.types();
        let probe: Map<bigint, int> = new Map<bigint, int>();
        expect(checker.isMap(probe)).assertTrue();
      }

      // --- [2] Verify the checker reports all eleven typed array kinds as typed arrays ---
      {
        let checker: util.types = new util.types();
        let all: boolean = checker.isTypedArray(new Uint8Array(2)) && checker.isTypedArray(new Int8Array(2)) &&
          checker.isTypedArray(new Uint16Array(2)) && checker.isTypedArray(new Int16Array(2)) &&
          checker.isTypedArray(new Uint32Array(2)) && checker.isTypedArray(new Int32Array(2)) &&
          checker.isTypedArray(new Float32Array(2)) && checker.isTypedArray(new Float64Array(2)) &&
          checker.isTypedArray(new Uint8ClampedArray(2)) &&
          checker.isTypedArray(new BigInt64Array(new ArrayBuffer(16))) &&
          checker.isTypedArray(new BigUint64Array(new ArrayBuffer(16)));
        expect(all).assertTrue();
      }

      // --- [3] Verify a Float32Array holding the exact single precision value 3.5 is reported as a Float32Array ---
      {
        let checker: util.types = new util.types();
        let probe: Float32Array = new Float32Array([3.5]);
        let recognized: boolean = checker.isFloat32Array(probe);
        expect(recognized).assertTrue();
        expect(probe.length).assertEqual(1);
        expect(probe.byteLength).assertEqual(4);
      }

      // --- [4] Verify typed array boundaries -128, -32768, 65535, 255 and 2147483647 and zero element bigint arrays report their own predicates ---
      {
        let checker: util.types = new util.types();
        let int8: Int8Array = new Int8Array([-128]);
        let int16: Int16Array = new Int16Array([-32768]);
        let uint16: Uint16Array = new Uint16Array([65535]);
        let int32: Int32Array = new Int32Array([2147483647]);
        let uint32: Uint32Array = new Uint32Array([2147483647]);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray([255]);
        let values: double[] = [int8.$_get(0), int16.$_get(0), uint16.$_get(0), int32.$_get(0), uint32.$_get(0), clamped.$_get(0)];
        let expected: double[] = [-128.0, -32768.0, 65535.0, 2147483647.0, 2147483647.0, 255.0];
        for (let k: int = 0; k < values.length; k++) {
          expect(values[k]).assertEqual(expected[k]);
        }
        let verdicts: boolean[] = [
          checker.isInt8Array(int8) && checker.isInt8Array(new Int8Array(2)),
          checker.isInt16Array(int16) && checker.isInt16Array(new Int16Array(2)),
          checker.isUint16Array(uint16) && checker.isUint16Array(new Uint16Array(2)),
          checker.isInt32Array(int32) && checker.isInt32Array(new Int32Array(2)),
          checker.isUint32Array(uint32) && checker.isUint32Array(new Uint32Array(2)),
          checker.isUint8ClampedArray(clamped) && checker.isUint8ClampedArray(new Uint8ClampedArray(4))
        ];
        let allReported: boolean = true;
        for (const verdict of verdicts) {
          allReported = allReported && verdict;
        }
        expect(allReported).assertTrue();
        let big: BigInt64Array = new BigInt64Array(new ArrayBuffer(0));
        let ubig: BigUint64Array = new BigUint64Array(new ArrayBuffer(0));
        expect(big.length).assertEqual(0);
        expect(big.byteLength).assertEqual(0);
        expect(checker.isBigInt64Array(big)).assertTrue();
        expect(ubig.length).assertEqual(0);
        expect(ubig.byteLength).assertEqual(0);
        expect(checker.isBigUint64Array(ubig)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_3300
     * @tc.name testTypesConstructor033
     * @tc.desc Merged batch (4 tests): Mixed classification batches: verifies mixed batches of candidate values, covering conversion and subclass paths.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker widened to object and cast back to util.types still classifies an Error ---
      {
        let base: object = new util.types();
        let checker: util.types = base as util.types;
        expect(checker.isNativeError(new Error('e'))).assertTrue();
      }

      // --- [2] Verify one checker matches exactly eleven values: Map, Set, Date, RegExp, Promise, typed array, ArrayBuffer, DataView, Error, WeakMap and WeakSet ---
      {
        let checker: util.types = new util.types();
        let matched: int = 0;
        if (checker.isMap(new Map<string, int>())) {
          matched = matched + 1;
        }
        if (checker.isSet(new Set<int>())) {
          matched = matched + 1;
        }
        if (checker.isDate(new Date(0))) {
          matched = matched + 1;
        }
        if (checker.isRegExp(new RegExp('a'))) {
          matched = matched + 1;
        }
        if (checker.isPromise(Promise.resolve<int>(0))) {
          matched = matched + 1;
        }
        if (checker.isTypedArray(new Uint8Array(1))) {
          matched = matched + 1;
        }
        if (checker.isArrayBuffer(new ArrayBuffer(1))) {
          matched = matched + 1;
        }
        if (checker.isDataView(new DataView(new ArrayBuffer(1)))) {
          matched = matched + 1;
        }
        if (checker.isNativeError(new Error('e'))) {
          matched = matched + 1;
        }
        if (checker.isWeakMap(new WeakMap<WeakKeyBox, int>())) {
          matched = matched + 1;
        }
        if (checker.isWeakSet(new WeakSet<WeakKeyBox>())) {
          matched = matched + 1;
        }
        expect(matched).assertEqual(11);
      }

      // --- [3] Verify a checker reached through two nested interface literals classifies a Promise ---
      {
        let envelope: CheckerEnvelope = { inner: { checker: new util.types(), label: 'deep' }, tag: 'top' };
        expect(envelope.inner.label).assertEqual('deep');
        expect(envelope.inner.checker.isPromise(Promise.resolve<int>(1))).assertTrue();
      }

      // --- [4] Verify the checker classifies an empty pattern, a global flag and an ignore case pattern RegExp as RegExp ---
      {
        let checker: util.types = new util.types();
        let emptyPattern: RegExp = new RegExp('');
        let globalFlag: RegExp = new RegExp('a', 'g');
        let ignoreCase: RegExp = new RegExp('abc', 'i');
        expect(checker.isRegExp(emptyPattern)).assertTrue();
        expect(checker.isRegExp(globalFlag)).assertTrue();
        expect(checker.isRegExp(ignoreCase)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_CONSTRUCTOR_3400
     * @tc.name testTypesConstructor034
     * @tc.desc Merged batch (4 tests): Miscellaneous checks: verifies remaining edge cases, covering RegExp patterns and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify two isRegExp calls on the same RegExp by one checker return the same result ---
      {
        let checker: util.types = new util.types();
        let probe: RegExp = new RegExp('x');
        let first: boolean = checker.isRegExp(probe);
        let second: boolean = checker.isRegExp(probe);
        expect(first).assertEqual(second);
        expect(first).assertTrue();
      }

      // --- [2] Verify classifying a Promise still lets it resolve to the value five ---
      {
        let checker: util.types = new util.types();
        let probe: Promise<int> = Promise.resolve<int>(5);
        let result: boolean = checker.isPromise(probe);
        let settled: int = await probe;
        expect(result).assertTrue();
        expect(settled).assertEqual(5);
      }

      // --- [3] Verify an instance built by the no-argument constructor is recognised as an instance of util.types ---
      {
        let checker: util.types = new util.types();
        let asObject: Object = checker;
        expect(asObject instanceof util.types).assertTrue();
      }

      // --- [4] Verify a byte written through one view of a shared buffer is visible in the sibling view ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let writer: Uint8Array = new Uint8Array(buffer);
        let reader: Uint8Array = new Uint8Array(buffer);
        writer.$_set(0, 42);
        expect(reader.$_get(0)).assertEqual(42);
        expect(checker.isUint8Array(reader)).assertTrue();
      }
    });

  });
}
