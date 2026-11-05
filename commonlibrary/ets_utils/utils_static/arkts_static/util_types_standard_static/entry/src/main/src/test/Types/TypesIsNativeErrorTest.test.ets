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

class PlainBox {
  tag: int = 7;
}

interface TagLike {
  tag: int;
}

interface ErrorCarrier {
  payload: Object;
}

class ShapeAlikeName {
  name: string = 'Error';
}

class ShapeAlikeMessage {
  message: string = 'fake-message';
}

class ShapeAlikeFull {
  name: string = 'Error';
  message: string = 'fake';
  stack: string = 'at probe line 1';
}

class TaggedError extends Error {
  tagCode: int = 100;
  constructor(message: string) {
    super(message);
  }
}

class DescribingError extends Error {
  constructor(message: string) {
    super(message);
  }
  describe(): string {
    return 'custom-desc';
  }
}

class TextError extends Error {
  constructor(message: string) {
    super(message);
  }
  toString(): string {
    return 'custom-to-string';
  }
}

class NestedError extends Error {
  inner: Error = new TypeError('nested');
  constructor(message: string) {
    super(message);
  }
}

class DeepRangeError extends RangeError {
  note: string = 'deep';
  constructor(message: string) {
    super(message);
  }
}

class TypeSubError extends TypeError {
  constructor(message: string) {
    super(message);
  }
}

class SecondLevelError extends TaggedError {
  extra: string = 'second';
  constructor(message: string) {
    super(message);
  }
}

class SilentError extends TaggedError {
  constructor(message: string) {
    super(message);
  }
  toString(): string {
    return 'silent';
  }
}

class ErrorHolder {
  err: Object = new Error('held-field');
}

class ErrorShelf {
  items: Object[] = [new Error('shelf-elem')];
}

class FunctionHolder {
  fn: Function = (): int => 2;
}

class NullFieldBox {
  value: Object | null = null;
}

class UndefinedFieldBox {
  value: Object | undefined = undefined;
}

function raiseNative(error: Error): void {
  throw error;
}

function probeNativeError(value: Object): boolean {
  let checker: util.types = new util.types();
  return checker.isNativeError(value);
}

function wrapError(): Object {
  return new Error('wrapped-return');
}

function wrapTypeError(): Object {
  return new TypeError('wrapped-type-return');
}

function countProbe(): int {
  return 3;
}

function raiseGeneric(): void {
  throw new Error('thrown-generic');
}

function raiseTypeSub(): void {
  throw new TypeSubError('thrown-type-sub');
}

function captureGenericError(): Object {
  let caught: Object = new Error('unset');
  try {
    raiseGeneric();
  } catch (err) {
    caught = err as Object;
  }
  return caught;
}

class ThirdLevelError extends SecondLevelError {
  depth: int = 3;
  constructor(message: string) {
    super(message);
  }
}

class FourthLevelError extends ThirdLevelError {
  depth4: int = 4;
  constructor(message: string) {
    super(message);
  }
}

class NamedOverrideError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'NamedOverrideError';
  }
}

class BaseNamedOverrideError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'BaseNamedOverride';
  }
}

class LeafInheritsNameError extends BaseNamedOverrideError {
  leafTag: string = 'leaf';
  constructor(message: string) {
    super(message);
  }
}

class RefSubError extends ReferenceError {
  constructor(message: string) {
    super(message);
  }
}

class SyntaxSubError extends SyntaxError {
  refTag: string = 'syntax-sub';
  constructor(message: string) {
    super(message);
  }
}

class EvalSubError extends EvalError {
  constructor(message: string) {
    super(message);
  }
}

class UriSubError extends URIError {
  constructor(message: string) {
    super(message);
  }
}

class CauseCarrierError extends Error {
  causeRef: Object;
  constructor(message: string, cause: Object) {
    super(message);
    this.causeRef = cause;
  }
}

class SlotHolder {
  slot: Error;
  constructor(slot: Error) {
    this.slot = slot;
  }
}

class NativeErrorInspector {
  inspect(value: Object): boolean {
    let checker: util.types = new util.types();
    return checker.isNativeError(value);
  }

  label(value: Object): string {
    let checker: util.types = new util.types();
    if (checker.isNativeError(value)) {
      return 'native';
    }
    return 'foreign';
  }
}

function buildEvalSub(): Object {
  return new EvalSubError('built-eval-sub');
}

function raiseThirdLevel(): void {
  throw new ThirdLevelError('thrown-third');
}

function captureThirdLevelError(): Object {
  let caught: Object = new Error('unset');
  try {
    raiseThirdLevel();
  } catch (err) {
    caught = err as Object;
  }
  return caught;
}

function captureThrownRangeError(): Object {
  let caught: Object = new Error('unset');
  try {
    throw new RangeError('thrown-range');
  } catch (err) {
    caught = err as Object;
  }
  return caught;
}

function captureThrownTaggedError(): Object {
  let caught: Object = new Error('unset');
  try {
    throw new TaggedError('thrown-tagged');
  } catch (err) {
    caught = err as Object;
  }
  return caught;
}

async function captureRejectionReason(reason: Error): Promise<Object> {
  let arrived: Object = new Error('unset');
  try {
    await Promise.reject<Error>(reason);
  } catch (err) {
    arrived = err as Object;
  }
  return arrived;
}

function raiseThroughOuter(): void {
  raiseThirdLevel();
}

function captureRelayedError(): Object {
  let caught: Object = new Error('unset');
  try {
    raiseThroughOuter();
  } catch (err) {
    caught = err as Object;
  }
  return caught;
}

function rethrowThirdLevel(): void {
  try {
    raiseThirdLevel();
  } catch (err) {
    let rethrown: Error = err as Error;
    throw rethrown;
  }
}

function captureRethrownError(): Object {
  let caught: Object = new Error('unset');
  try {
    rethrowThirdLevel();
  } catch (err) {
    caught = err as Object;
  }
  return caught;
}

function classifyByHelper(value: Object): string {
  let checker: util.types = new util.types();
  if (checker.isNativeError(value)) {
    return 'native';
  } else {
    return 'foreign';
  }
}

function filterNativeErrors(values: Object[]): Object[] {
  let checker: util.types = new util.types();
  return values.filter((entry: Object): boolean => checker.isNativeError(entry));
}

function firstNativeOrDefault(values: Object[], fallback: Object): Object {
  let checker: util.types = new util.types();
  for (const entry of values) {
    if (checker.isNativeError(entry)) {
      return entry;
    }
  }
  return fallback;
}

export default function typesIsNativeErrorTest(): void {
  describe('TypesIsNativeErrorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0100
     * @tc.name testTypesIsNativeError001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts an Error built without any message argument; accepts a user class that extends the built-in TypeError; two isNativeError calls on one Error instance produce the same true result; an Error and a shape alike object sharing the same name text get opposite isNativeError verdicts; a two link cause chain of Error objects reports true at every link.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns true for an Error built without any message argument ---
      {
        let checker: util.types = new util.types();
        let bare: Error = new Error();
        expect(checker.isNativeError(bare)).assertTrue();
        expect(bare.message).assertEqual('');
      }

      // --- [2] Verify isNativeError returns true for a user class that extends the built-in TypeError ---
      {
        let checker: util.types = new util.types();
        let subclass: TypeSubError = new TypeSubError('sub');
        let hits: int = 0;
        if (checker.isNativeError(subclass)) {
          hits += 1;
        }
        expect(hits).assertEqual(1);
      }

      // --- [3] Verify two isNativeError calls on one Error instance produce the same true result ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('repeat');
        let first: boolean = checker.isNativeError(error);
        let second: boolean = checker.isNativeError(error);
        expect(first).assertEqual(second);
        expect(first).assertTrue();
      }

      // --- [4] Verify an Error and a shape alike object sharing the same name text get opposite isNativeError verdicts ---
      {
        let checker: util.types = new util.types();
        let real: Error = new Error('same-shape');
        let fake: ShapeAlikeFull = new ShapeAlikeFull();
        expect(real.name).assertEqual(fake.name);
        expect(checker.isNativeError(real)).assertTrue();
        expect(checker.isNativeError(fake)).assertFalse();
      }

      // --- [5] Verify a two link cause chain of Error objects reports true at every link ---
      {
        let checker: util.types = new util.types();
        let root: Error = new RangeError('cause-root');
        let middle: CauseCarrierError = new CauseCarrierError('cause-middle', root);
        let top: CauseCarrierError = new CauseCarrierError('cause-top', middle);
        let middleBack: CauseCarrierError = top.causeRef as CauseCarrierError;
        expect(checker.isNativeError(top)).assertTrue();
        expect(checker.isNativeError(middleBack)).assertTrue();
        expect(checker.isNativeError(middleBack.causeRef)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0200
     * @tc.name testTypesIsNativeError002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: the stack of a TypeError is untouched by a message reassignment and an isNativeError call; three isNativeError verdicts collected into a boolean array add up to exactly two true entries; an Error with a reassigned message is still native and reports the new text, and constructor code and message arguments are stored; the cause reference of an Error still points to the same object after isNativeError inspected both; a string, a number array and a boolean array keep their values after isNativeError inspected them.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the stack of a TypeError is untouched by a message reassignment and an isNativeError call ---
      {
        let checker: util.types = new util.types();
        let typed: TypeError = new TypeError('boot');
        let stack: string | undefined = typed.stack;
        typed.message = 'reboot';
        expect(checker.isNativeError(typed)).assertTrue();
        expect(typed.stack).assertEqual(stack);
        expect(typed.message).assertEqual('reboot');
      }

      // --- [2] Verify three isNativeError verdicts collected into a boolean array add up to exactly two true entries ---
      {
        let checker: util.types = new util.types();
        let verdicts: boolean[] = [];
        verdicts.push(checker.isNativeError(new Error('ctx-c')));
        verdicts.push(checker.isNativeError(new SyntaxError('ctx-d')));
        verdicts.push(checker.isNativeError('ctx-e'));
        let nativeTotal: int = 0;
        for (const flag of verdicts) {
          if (flag) {
            nativeTotal++;
          }
        }
        expect(nativeTotal).assertEqual(2);
        expect(verdicts.length).assertEqual(3);
      }

      // --- [3] Verify an Error with a reassigned message is still native and reports the new text, and constructor code and message arguments are stored ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('before');
        error.message = 'after';
        expect(checker.isNativeError(error)).assertTrue();
        expect(error.message).assertEqual('after');
        let err: Error = new Error(410, 'gone');
        expect(err.code).assertEqual(410);
        expect(err.message).assertEqual('gone');
        expect(checker.isNativeError(err)).assertTrue();
      }

      // --- [4] Verify the cause reference of an Error still points to the same object after isNativeError inspected both ---
      {
        let checker: util.types = new util.types();
        let inner: Error = new Error('cause-ref');
        let outer: CauseCarrierError = new CauseCarrierError('cause-ref-outer', inner);
        checker.isNativeError(outer);
        checker.isNativeError(outer.causeRef);
        expect(outer.causeRef).assertEqual(inner);
      }

      // --- [5] Verify a string, a number array and a boolean array keep their values after isNativeError inspected them ---
      {
        let checker: util.types = new util.types();
        let text: string = 'plain-content';
        let numbers: int[] = [5, 6, 7];
        let flags: boolean[] = [true, false];
        checker.isNativeError(text);
        checker.isNativeError(numbers);
        checker.isNativeError(flags);
        expect(text.valueOf()).assertEqual('plain-content');
        expect(numbers[1]).assertEqual(6);
        expect(flags[0]).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0300
     * @tc.name testTypesIsNativeError003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: both Uint8Array views over one buffer are not native errors and keep their byte offsets; both Error keys of one Map are reported as native errors and keep their own values; an Error inspected by isNativeError can still be thrown and caught afterwards; accepts two distinct Error instances sharing the same message text; a checker that classified a Date, a Map and a typed array still reports a TypeError as native.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify both Uint8Array views over one buffer are not native errors and keep their byte offsets ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let first: Uint8Array = new Uint8Array(buffer, 0, 4);
        let second: Uint8Array = new Uint8Array(buffer, 4, 4);
        expect(checker.isNativeError(first)).assertFalse();
        expect(checker.isNativeError(second)).assertFalse();
        expect(first.byteOffset).assertEqual(0);
        expect(second.byteOffset).assertEqual(4);
      }

      // --- [2] Verify both Error keys of one Map are reported as native errors and keep their own values ---
      {
        let checker: util.types = new util.types();
        let firstKey: Error = new Error('key-a');
        let secondKey: Error = new SyntaxError('key-b');
        let store: Map<Error, string> = new Map<Error, string>();
        store.set(firstKey, 'a');
        store.set(secondKey, 'b');
        expect(checker.isNativeError(firstKey)).assertTrue();
        expect(checker.isNativeError(secondKey)).assertTrue();
        expect(store.size).assertEqual(2);
      }

      // --- [3] Verify an Error inspected by isNativeError can still be thrown and caught afterwards ---
      {
        let checker: util.types = new util.types();
        let error: Error = new TaggedError('throw-after');
        expect(checker.isNativeError(error)).assertTrue();
        try {
          raiseNative(error);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('Error');
        }
      }

      // --- [4] Verify isNativeError returns true for two distinct Error instances sharing the same message text ---
      {
        let checker: util.types = new util.types();
        let first: Error = new Error('dup-msg');
        let second: Error = new Error('dup-msg');
        let sameInstance: boolean = first === second;
        let firstHit: boolean = checker.isNativeError(first);
        let secondHit: boolean = checker.isNativeError(second);
        expect(sameInstance).assertFalse();
        expect(firstHit).assertTrue();
        expect(secondHit).assertTrue();
      }

      // --- [5] Verify a checker that classified a Date, a Map and a typed array still reports a TypeError as native ---
      {
        let checker: util.types = new util.types();
        checker.isDate(new Date(1));
        checker.isMap(new Map<string, int>());
        checker.isTypedArray(new Int32Array(2));
        expect(checker.isNativeError(new TypeError('after'))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0400
     * @tc.name testTypesIsNativeError004
     * @tc.desc Merged batch (1 test): Basic construction and recognition: accepts a Date and for a Promise.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a checker that reported a native error returns true for a Date and for a Promise ---
      {
        let checker: util.types = new util.types();
        checker.isNativeError(new Error('cross-a'));
        expect(checker.isDate(new Date(0))).assertTrue();
        expect(checker.isPromise(Promise.resolve<int>(2))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0500
     * @tc.name testTypesIsNativeError005
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: accepts an Object widened Error plus TypeError, RangeError and SyntaxError values; accepts a ReferenceError instance, a built-in subclass of Error; accepts an EvalError instance, a built-in subclass of Error; accepts a URIError instance, a built-in subclass of Error; user Error subclasses carrying an extra field and method, or overriding toString, are still native errors.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns true for an Object widened Error plus TypeError, RangeError and SyntaxError values ---
      {
        let checker: util.types = new util.types();
        let widened: Object = new Error('widened');
        expect(checker.isNativeError(widened)).assertTrue();
        let typed: TypeError = new TypeError('tne');
        expect(checker.isNativeError(typed)).assertTrue();
        let ranged: RangeError = new RangeError('rne');
        expect(checker.isNativeError(ranged)).assertTrue();
        let syntax: SyntaxError = new SyntaxError('sne');
        expect(checker.isNativeError(syntax)).assertTrue();
      }

      // --- [2] Verify isNativeError returns true for a ReferenceError instance, a built-in subclass of Error ---
      {
        let checker: util.types = new util.types();
        let reference: ReferenceError = new ReferenceError('rfe');
        expect(reference.message).assertEqual('rfe');
        expect(checker.isNativeError(reference)).assertTrue();
      }

      // --- [3] Verify isNativeError returns true for an EvalError instance, a built-in subclass of Error ---
      {
        let checker: util.types = new util.types();
        let evaluated: EvalError = new EvalError('eve');
        let verdict: boolean = checker.isNativeError(evaluated);
        expect(verdict).assertTrue();
      }

      // --- [4] Verify isNativeError returns true for a URIError instance, a built-in subclass of Error ---
      {
        let checker: util.types = new util.types();
        let uri: URIError = new URIError('uie');
        let flags: boolean[] = [checker.isNativeError(uri)];
        expect(flags[0]).assertTrue();
      }

      // --- [5] Verify user Error subclasses carrying an extra field and method, or overriding toString, are still native errors ---
      {
        let checker: util.types = new util.types();
        let describing: DescribingError = new DescribingError('desc-msg');
        expect(checker.isNativeError(describing)).assertTrue();
        expect(describing.describe()).assertEqual('custom-desc');
        expect(describing.name).assertEqual('Error');
        let text: TextError = new TextError('text-msg');
        expect(checker.isNativeError(text)).assertTrue();
        expect(text.toString()).assertEqual('custom-to-string');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0600
     * @tc.name testTypesIsNativeError006
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: accepts a user Error subclass holding the message c-msg and again when it is empty; a class two levels below Error and a subclass assigning its own name inside the constructor are both native errors; a leaf subclass inherits the name set by its intermediate base class while isNativeError stays true; accepts a user subclass of ReferenceError and the built-in name is inherited; isNativeError agrees with the identity verdicts of a user Error subclass, a plain box, a TypeError and a RangeError.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns true for a user Error subclass holding the message c-msg and again when it is empty ---
      {
        let checker: util.types = new util.types();
        let msg: string = 'c-msg';
        let tagged: TaggedError = new TaggedError(msg);
        expect(checker.isNativeError(tagged)).assertTrue();
        expect(tagged.message).assertEqual(msg);

        msg = '';
        let empty: TaggedError = new TaggedError(msg);
        expect(checker.isNativeError(empty)).assertTrue();
        expect(empty.message).assertEqual(msg);
      }

      // --- [2] Verify a class two levels below Error and a subclass assigning its own name inside the constructor are both native errors ---
      {
        let checker: util.types = new util.types();
        let second: SecondLevelError = new SecondLevelError('second-level');
        expect(checker.isNativeError(second)).assertTrue();
        expect(second.extra).assertEqual('second');
        expect(second.tagCode).assertEqual(100);
        let renamed: NamedOverrideError = new NamedOverrideError('renamed-msg');
        expect(checker.isNativeError(renamed)).assertTrue();
        expect(renamed.name).assertEqual('NamedOverrideError');
        expect(renamed.message).assertEqual('renamed-msg');
      }

      // --- [3] Verify a leaf subclass inherits the name set by its intermediate base class while isNativeError stays true ---
      {
        let checker: util.types = new util.types();
        let leaf: LeafInheritsNameError = new LeafInheritsNameError('leaf-msg');
        expect(leaf.name).assertEqual('BaseNamedOverride');
        expect(leaf.leafTag).assertEqual('leaf');
        let verdict: boolean = checker.isNativeError(leaf);
        expect(verdict).assertTrue();
      }

      // --- [4] Verify isNativeError returns true for a user subclass of ReferenceError and the built-in name is inherited ---
      {
        let checker: util.types = new util.types();
        let reference: RefSubError = new RefSubError('ref-sub-msg');
        expect(checker.isNativeError(reference)).assertTrue();
        let observed: string = reference.name;
        expect(observed).assertEqual('ReferenceError');
      }

      // --- [5] Verify isNativeError agrees with the identity verdicts of a user Error subclass, a plain box, a TypeError and a RangeError ---
      {
        let checker: util.types = new util.types();
        let tagged: Object = new TaggedError('wide-tagged');
        let plain: Object = new PlainBox();
        let typed: Object = new TypeError('identity-t');
        let ranged: Object = new RangeError('identity-r');
        let taggedIdentity: boolean = tagged instanceof TaggedError;
        let plainIdentity: boolean = plain instanceof PlainBox;
        let typedIdentity: boolean = typed instanceof TypeError;
        let rangedIdentity: boolean = ranged instanceof RangeError;
        expect(checker.isNativeError(tagged)).assertEqual(taggedIdentity);
        expect(checker.isNativeError(plain)).assertEqual(!plainIdentity);
        expect(checker.isNativeError(typed)).assertEqual(typedIdentity);
        expect(checker.isNativeError(ranged)).assertEqual(rangedIdentity);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0700
     * @tc.name testTypesIsNativeError007
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: accepts a user subclass of SyntaxError carrying its own marker field; the name read from a caught three level subclass is the inherited Error name; an Error subclass thrown one frame deeper or rethrown from a catch block is still native at the outer catcher; an Error subclass caught after its finally block ran is a native error and the finally step executed; a user Error subclass whose extra field was reassigned after construction is still a native error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns true for a user subclass of SyntaxError carrying its own marker field ---
      {
        let checker: util.types = new util.types();
        let syntax: SyntaxSubError = new SyntaxSubError('syntax-sub-msg');
        expect(syntax.refTag).assertEqual('syntax-sub');
        expect(checker.isNativeError(syntax)).assertTrue();
        expect(syntax.name).assertEqual('SyntaxError');
      }

      // --- [2] Verify the name read from a caught three level subclass is the inherited Error name while the verdict is true ---
      {
        let checker: util.types = new util.types();
        let caught: Object = captureThirdLevelError();
        let asError: Error = caught as Error;
        expect(checker.isNativeError(asError)).assertTrue();
        expect(asError.name).assertEqual('Error');
      }

      // --- [3] Verify an Error subclass thrown one frame deeper or rethrown from a catch block is still native at the outer catcher ---
      {
        let checker: util.types = new util.types();
        let relayed: Object = captureRelayedError();
        expect(checker.isNativeError(relayed)).assertTrue();
        expect((relayed as Error).message).assertEqual('thrown-third');
        let rethrown: Object = captureRethrownError();
        let verdict: boolean = checker.isNativeError(rethrown);
        expect(verdict).assertTrue();
        expect((rethrown as Error).message).assertEqual('thrown-third');
      }

      // --- [4] Verify an Error subclass caught after its finally block ran is a native error and the finally step executed ---
      {
        let checker: util.types = new util.types();
        let captured: Object = new Error('unset');
        let finalized: boolean = false;
        try {
          raiseThirdLevel();
          expect().assertFail();
        } catch (err) {
          captured = err as Object;
          expect(err.name).assertEqual('Error');
        } finally {
          finalized = true;
        }
        expect(checker.isNativeError(captured)).assertTrue();
        expect(finalized).assertTrue();
      }

      // --- [5] Verify a user Error subclass whose extra field was reassigned after construction is still a native error ---
      {
        let checker: util.types = new util.types();
        let tagged: TaggedError = new TaggedError('field-msg');
        tagged.tagCode = 250;
        expect(checker.isNativeError(tagged)).assertTrue();
        expect(tagged.tagCode).assertEqual(250);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0800
     * @tc.name testTypesIsNativeError008
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: a caught user Error subclass stays native after its message is reassigned outside the catch block; an Error subclass taken out of a Set by iteration is native and can still be removed from that Set; an Error subclass in a WeakSet keeps membership and one reinserted after a Map clear leaves exactly one entry; a helper labels an Error subclass native and a Date foreign and another returns the first native error, skipping leading text; isNativeError called inside the catch block that received a user Error subclass reports it as native.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a caught user Error subclass stays native after its message is reassigned outside the catch block ---
      {
        let checker: util.types = new util.types();
        let caught: Object = captureThrownTaggedError();
        let tagged: TaggedError = caught as TaggedError;
        tagged.message = 'mutated-after-catch';
        expect(checker.isNativeError(tagged)).assertTrue();
        expect(tagged.message).assertEqual('mutated-after-catch');
      }

      // --- [2] Verify an Error subclass taken out of a Set by iteration is native and can still be removed from that Set ---
      {
        let checker: util.types = new util.types();
        let pool: Set<Object> = new Set<Object>();
        let member: Error = new TaggedError('set-member');
        pool.add(member);
        let found: Object = new Error('unset');
        for (const entry of pool) {
          found = entry;
        }
        expect(checker.isNativeError(found)).assertTrue();
        expect(checker.isNativeError(member)).assertTrue();
        let removed: boolean = pool.delete(member);
        expect(removed).assertTrue();
        expect(pool.size).assertEqual(0);
      }

      // --- [3] Verify an Error subclass in a WeakSet keeps membership and one reinserted after a Map clear leaves exactly one entry ---
      {
        let checker: util.types = new util.types();
        let member: Error = new EvalSubError('weak-set-member');
        let pool: WeakSet<Error> = new WeakSet<Error>();
        pool.add(member);
        expect(pool.has(member)).assertTrue();
        expect(checker.isNativeError(member)).assertTrue();
        let store: Map<string, Object> = new Map<string, Object>();
        store.set('k', new Error('before-clear'));
        store.clear();
        store.set('k', new RefSubError('after-clear'));
        let value: Object | undefined = store.get('k');
        expect(checker.isNativeError(value!)).assertTrue();
        expect((value as Error).name).assertEqual('ReferenceError');
        expect(store.size).assertEqual(1);
      }

      // --- [4] Verify a helper labels an Error subclass native and a Date foreign and another returns the first native error, skipping leading text ---
      {
        let nativeLabel: string = classifyByHelper(new RefSubError('ctx-a'));
        let foreignLabel: string = classifyByHelper(new Date(0));
        expect(nativeLabel).assertEqual('native');
        expect(foreignLabel).assertEqual('foreign');
        let mixed: Object[] = ['text', new UriSubError('first-native')];
        let fallback: Object = new Error('fallback');
        let found: Object = firstNativeOrDefault(mixed, fallback);
        expect(found).assertEqual(mixed[1]);
      }

      // --- [5] Verify isNativeError called inside the catch block that received a user Error subclass reports it as native ---
      {
        let checker: util.types = new util.types();
        let inCatch: boolean = false;
        try {
          raiseThirdLevel();
          expect().assertFail();
        } catch (err) {
          inCatch = checker.isNativeError(err as Object);
          expect(err.name).assertEqual('Error');
        }
        expect(inCatch).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_0900
     * @tc.name testTypesIsNativeError009
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: the isNativeError verdict for one Error subclass agrees whether computed inline or through a forwarding helper; renaming an Error subclass after it joined a Set keeps both the membership and the native verdict; iterating a Set of two distinct Error subclasses finds no non native entry and the size stays two; an Error subclass stored under a quoted Record key is a native error when read back; a user Error subclass pushed into an Object array is a native error at its index and the length stays one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the isNativeError verdict for one Error subclass agrees whether computed inline or through a forwarding helper ---
      {
        let checker: util.types = new util.types();
        let error: Error = new EvalSubError('agree-ctx');
        let outside: boolean = checker.isNativeError(error);
        let inside: boolean = probeNativeError(error);
        expect(outside).assertEqual(inside);
        expect(outside).assertTrue();
      }

      // --- [2] Verify renaming an Error subclass after it joined a Set keeps both the membership and the native verdict ---
      {
        let checker: util.types = new util.types();
        let member: Error = new NamedOverrideError('set-mutate');
        let pool: Set<Error> = new Set<Error>();
        pool.add(member);
        checker.isNativeError(member);
        member.name = 'LaterName';
        expect(pool.has(member)).assertTrue();
        expect(checker.isNativeError(member)).assertTrue();
      }

      // --- [3] Verify iterating a Set of two distinct Error subclasses finds no non native entry and the size stays two ---
      {
        let checker: util.types = new util.types();
        let pool: Set<Error> = new Set<Error>();
        pool.add(new EvalSubError('set-a'));
        pool.add(new RefSubError('set-b'));
        let foreignCount: int = 0;
        for (const entry of pool) {
          if (!checker.isNativeError(entry)) {
            foreignCount++;
          }
        }
        expect(foreignCount).assertEqual(0);
        expect(pool.size).assertEqual(2);
      }

      // --- [4] Verify an Error subclass stored under a quoted Record key is a native error when read back ---
      {
        let checker: util.types = new util.types();
        let record: Record<string, Object> = { 'slot': new TaggedError('record-slot') };
        let picked: Object = record['slot']!;
        expect(checker.isNativeError(picked)).assertTrue();
        expect((picked as Error).message).assertEqual('record-slot');
      }

      // --- [5] Verify a user Error subclass pushed into an Object array is a native error at its index and the length stays one ---
      {
        let checker: util.types = new util.types();
        let items: Object[] = [];
        items.push(new UriSubError('array-elem'));
        expect(checker.isNativeError(items[0])).assertTrue();
        expect(items.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1000
     * @tc.name testTypesIsNativeError010
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: an Error subclass reached through two Map levels and a holder field before and after it is swapped are all native; an Error used as a Map key groups an array of Error subclasses that are all native errors; holding an array of Errors is native and each held member is reported native as well; removed from a Map is still reported as native after its key entry was deleted; a holder label method separates an Error subclass from a Date and a WeakMap value is unchanged by the check.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Error subclass reached through two Map levels and a holder field before and after it is swapped are all native ---
      {
        let checker: util.types = new util.types();
        let innerStore: Map<string, Object> = new Map<string, Object>();
        innerStore.set('deep', new SyntaxSubError('nested-container'));
        let outerStore: Map<string, Map<string, Object>> = new Map<string, Map<string, Object>>();
        outerStore.set('outer', innerStore);
        let reached: Object | undefined = outerStore.get('outer')!.get('deep');
        expect(checker.isNativeError(reached!)).assertTrue();
        let held: SlotHolder = new SlotHolder(new UriSubError('slot-msg'));
        expect(checker.isNativeError(held.slot)).assertTrue();
        held.slot = new EvalSubError('slot-swapped');
        expect(checker.isNativeError(held.slot)).assertTrue();
        expect(held.slot.name).assertEqual('EvalError');
      }

      // --- [2] Verify an Error used as a Map key groups an array of Error subclasses that are all native errors ---
      {
        let checker: util.types = new util.types();
        let key: Error = new SyntaxSubError('group-key');
        let group: Map<Error, Object[]> = new Map<Error, Object[]>();
        group.set(key, [new Error('group-a'), new RefSubError('group-b')]);
        let members: Object[] | undefined = group.get(key);
        expect(checker.isNativeError(key)).assertTrue();
        expect(checker.isNativeError(members![0])).assertTrue();
        expect(members!.length).assertEqual(2);
      }

      // --- [3] Verify an Error subclass holding an array of Errors is native and each held member is reported native as well ---
      {
        let checker: util.types = new util.types();
        let group: CauseCarrierError = new CauseCarrierError('composite', [new Error('member-one')]);
        let members: Object[] = group.causeRef as Object[];
        expect(checker.isNativeError(group)).assertTrue();
        expect(checker.isNativeError(members[0])).assertTrue();
        expect(members.length).assertEqual(1);
      }

      // --- [4] Verify an Error subclass removed from a Map is still reported as native after its key entry was deleted ---
      {
        let checker: util.types = new util.types();
        let key: Error = new SyntaxSubError('deleted-key');
        let store: Map<Error, int> = new Map<Error, int>();
        store.set(key, 1);
        store.delete(key);
        expect(store.size).assertEqual(0);
        expect(checker.isNativeError(key)).assertTrue();
      }

      // --- [5] Verify a holder label method separates an Error subclass from a Date and a WeakMap value is unchanged by the check ---
      {
        let inspector: NativeErrorInspector = new NativeErrorInspector();
        let inner: string = inspector.label(new EvalSubError('label-ctx'));
        let outer: string = inspector.label(new Date(0));
        expect(inner).assertEqual('native');
        expect(outer).assertEqual('foreign');
        let checker: util.types = new util.types();
        let key: PlainBox = new PlainBox();
        let store: WeakMap<PlainBox, TaggedError> = new WeakMap<PlainBox, TaggedError>();
        store.set(key, new TaggedError('weak-kept'));
        let before: TaggedError | undefined = store.get(key);
        checker.isNativeError(before!);
        let after: TaggedError | undefined = store.get(key);
        expect(after).assertEqual(before);
        expect(after!.tagCode).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1100
     * @tc.name testTypesIsNativeError011
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: three Error subclasses held in a Map, a Set and an array are each reported native for a total of three; the stack of a TypeError and the extra field of a user subclass survive an isNativeError call; accepts a user subclass of URIError and its message survives the class chain; the nested inner TypeError of a user subclass stays native and a two level subclass keeps its inherited field while overriding toString; an Error widened to Object and narrowed back to Error is still reported as a native error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three Error subclasses held in a Map, a Set and an array are each reported native for a total of three ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, Object> = new Map<string, Object>();
        store.set('e', new TaggedError('final-map'));
        let pool: Set<Object> = new Set<Object>();
        pool.add(new TaggedError('final-set'));
        let items: Object[] = [new TaggedError('final-array')];
        let total: int = 0;
        if (checker.isNativeError(store.get('e')!)) {
          total++;
        }
        for (const entry of pool) {
          if (checker.isNativeError(entry)) {
            total++;
          }
        }
        if (checker.isNativeError(items[0])) {
          total++;
        }
        expect(total).assertEqual(3);
      }

      // --- [2] Verify the stack of a TypeError and the extra field of a user subclass survive an isNativeError call ---
      {
        let checker: util.types = new util.types();
        let typed: TypeError = new TypeError('boot');
        let stack: string | undefined = typed.stack;
        let tagged: TaggedError = new TaggedError('kept');
        checker.isNativeError(typed);
        checker.isNativeError(tagged);
        expect(typed.stack).assertEqual(stack);
        expect(tagged.tagCode).assertEqual(100);
      }

      // --- [3] Verify isNativeError returns true for a user subclass of URIError and its message survives the class chain ---
      {
        let checker: util.types = new util.types();
        let uri: UriSubError = new UriSubError('uri-sub-msg');
        let verdict: boolean = checker.isNativeError(uri);
        let message: string = uri.message;
        expect(verdict).assertTrue();
        expect(message).assertEqual('uri-sub-msg');
      }

      // --- [4] Verify the nested inner TypeError of a user subclass stays native and a two level subclass keeps its inherited field while overriding toString ---
      {
        let checker: util.types = new util.types();
        let nested: NestedError = new NestedError('outer');
        checker.isNativeError(nested);
        expect(nested.inner.message).assertEqual('nested');
        expect(checker.isNativeError(nested.inner)).assertTrue();
        let silent: SilentError = new SilentError('silent-msg');
        expect(checker.isNativeError(silent)).assertTrue();
        expect(silent.toString()).assertEqual('silent');
        expect(silent.tagCode).assertEqual(100);
      }

      // --- [5] Verify an Error widened to Object and narrowed back to Error is still reported as a native error ---
      {
        let checker: util.types = new util.types();
        let widened: Object = new TaggedError('narrow');
        let narrowed: Error = widened as Error;
        expect(checker.isNativeError(narrowed)).assertTrue();
        expect(narrowed.message).assertEqual('narrow');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1200
     * @tc.name testTypesIsNativeError012
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: a thrown user Error subclass keeps its extra field when captured and is reported as a native error; a user Error subclass keeps its inherited name; the stack of a user Error subclass is preserved as a string or undefined across an isNativeError call; accepts a user subclass of EvalError produced by a factory function; five isNativeError calls interleaved with extra field writes all report one Error subclass as native.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a thrown user Error subclass keeps its extra field when captured and is reported as a native error ---
      {
        let checker: util.types = new util.types();
        let thrown: Object = captureThrownTaggedError();
        let tagged: TaggedError = thrown as TaggedError;
        expect(checker.isNativeError(tagged)).assertTrue();
        expect(tagged.tagCode).assertEqual(100);
      }

      // --- [2] Verify a user Error subclass keeps its inherited name while a reassigned message is reported as a native error ---
      {
        let checker: util.types = new util.types();
        let tagged: TaggedError = new TaggedError('sub-before');
        tagged.message = 'sub-after';
        expect(checker.isNativeError(tagged)).assertTrue();
        expect(tagged.name).assertEqual('Error');
        expect(tagged.message).assertEqual('sub-after');
      }

      // --- [3] Verify the stack of a user Error subclass is preserved as a string or undefined across an isNativeError call ---
      {
        let checker: util.types = new util.types();
        let error: Error = new TaggedError('stack-msg');
        let stack: string | undefined = error.stack;
        expect(checker.isNativeError(error)).assertTrue();
        expect(error.stack).assertEqual(stack);
      }

      // --- [4] Verify isNativeError returns true for a user subclass of EvalError produced by a factory function ---
      {
        let checker: util.types = new util.types();
        expect(checker.isNativeError(buildEvalSub())).assertTrue();
        expect(checker.isNativeError(new EvalError('plain-eval'))).assertEqual(checker.isNativeError(buildEvalSub()));
      }

      // --- [5] Verify five isNativeError calls interleaved with extra field writes all report one Error subclass as native ---
      {
        let checker: util.types = new util.types();
        let error: TaggedError = new TaggedError('loop-msg');
        let stable: boolean = true;
        for (let round: int = 0; round < 5; round++) {
          error.tagCode = round;
          if (!checker.isNativeError(error)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(error.tagCode).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1300
     * @tc.name testTypesIsNativeError013
     * @tc.desc Merged batch (2 tests): Type conversion and subclassing: an isNativeError verdict gates a second isTypedArray probe on the same Error subclass and both results differ; isNativeError and isDate give opposite verdicts on both an Error subclass and a Date and the error keeps its message.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an isNativeError verdict gates a second isTypedArray probe on the same Error subclass and both results differ ---
      {
        let checker: util.types = new util.types();
        let error: Error = new DeepRangeError('ctx-pair');
        let isNative: boolean = checker.isNativeError(error);
        let isTyped: boolean = false;
        if (isNative) {
          isTyped = checker.isTypedArray(error);
        }
        expect(isNative).assertTrue();
        expect(isTyped).assertFalse();
      }

      // --- [2] Verify isNativeError and isDate give opposite verdicts on both an Error subclass and a Date and the error keeps its message ---
      {
        let checker: util.types = new util.types();
        let error: Error = new SyntaxSubError('opp-a');
        let stamp: Date = new Date(1000);
        expect(checker.isNativeError(error)).assertEqual(!checker.isDate(error));
        expect(checker.isNativeError(stamp)).assertEqual(!checker.isDate(stamp));
        expect(error.message).assertEqual('opp-a');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1400
     * @tc.name testTypesIsNativeError014
     * @tc.desc Merged batch (3 tests): Boundary values: verifies boundary handling, covering empty inputs including Error and related boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns true for an Error with a message and for one whose message is the empty string ---
      {
        let checker: util.types = new util.types();
        let withText: Error = new Error('e-m');
        let emptyText: Error = new Error('');
        expect(checker.isNativeError(withText)).assertTrue();
        expect(checker.isNativeError(emptyText)).assertTrue();
      }

      // --- [2] Verify a user Error subclass whose message was cleared to the empty string is still a native error ---
      {
        let checker: util.types = new util.types();
        let error: Error = new TaggedError('to-be-cleared');
        error.message = '';
        let verdict: boolean = checker.isNativeError(error);
        expect(verdict).assertTrue();
        expect(error.message).assertEqual('');
      }

      // --- [3] Verify isNativeError returns false for an empty number array and an Object array holding one element ---
      {
        let checker: util.types = new util.types();
        let empty: int[] = [];
        let boxed: Object[] = [new PlainBox()];
        expect(checker.isNativeError(empty)).assertFalse();
        expect(checker.isNativeError(boxed[0])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1500
     * @tc.name testTypesIsNativeError015
     * @tc.desc Merged batch (3 tests): Boundary overflow: verifies numeric limit and wrapping behavior, covering numeric scalars and related extreme values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns false for the int boundary values 2147483647 and -2147483648 ---
      {
        let checker: util.types = new util.types();
        let upper: int = 2147483647;
        let lower: int = -2147483648;
        expect(checker.isNativeError(upper)).assertFalse();
        expect(checker.isNativeError(lower)).assertFalse();
      }

      // --- [2] Verify isNativeError returns false for the double extremes MAX_VALUE, MIN_VALUE and EPSILON ---
      {
        let checker: util.types = new util.types();
        let largest: double = Double.MAX_VALUE;
        let smallest: double = Double.MIN_VALUE;
        let epsilon: double = Double.EPSILON;
        let results: boolean[] = [checker.isNativeError(largest), checker.isNativeError(smallest), checker.isNativeError(epsilon)];
        expect(results[0]).assertFalse();
        expect(results[1]).assertFalse();
        expect(results[2]).assertFalse();
      }

      // --- [3] Verify isNativeError returns false for the large magnitudes 1e21 and -1e21 ---
      {
        let checker: util.types = new util.types();
        let positive: double = 1e21;
        let negative: double = -1e21;
        let verdicts: boolean[] = [checker.isNativeError(positive), checker.isNativeError(negative)];
        expect(verdicts).assertDeepEquals([false, false]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1600
     * @tc.name testTypesIsNativeError016
     * @tc.desc Merged batch (5 tests): Primitive value rejection: the isNativeError result assigns to a boolean as true for an Error and as false for text; rejects the bigint scalars BigInt(0) and the maximum uint64 value built from its decimal text; rejects the integers zero, one and minus one passed as Object and fractional doubles 0.5 and -0.5; rejects Double.NaN, which is not equal to any value including itself; TypeError.toString renders the name and message.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the isNativeError result assigns to a boolean as true for an Error and as false for text ---
      {
        let checker: util.types = new util.types();
        let nativeFlag: boolean = checker.isNativeError(new Error('assign'));
        let textFlag: boolean = checker.isNativeError('assign');
        expect(nativeFlag).assertTrue();
        expect(textFlag).assertFalse();
      }

      // --- [2] Verify isNativeError returns false for the bigint scalars BigInt(0) and the maximum uint64 value built from its decimal text ---
      {
        let checker: util.types = new util.types();
        let zeroBig: bigint = BigInt(0);
        let limitBig: bigint = BigInt('18446744073709551615');
        expect(checker.isNativeError(zeroBig)).assertFalse();
        expect(checker.isNativeError(limitBig)).assertFalse();
      }

      // --- [3] Verify isNativeError returns false for the integers zero, one and minus one passed as Object and fractional doubles 0.5 and -0.5 ---
      {
        let checker: util.types = new util.types();
        expect(checker.isNativeError(0)).assertFalse();
        expect(checker.isNativeError(1)).assertFalse();
        expect(checker.isNativeError(-1)).assertFalse();
        let positive: double = 0.5;
        let negative: double = -0.5;
        let positiveVerdict: boolean = checker.isNativeError(positive);
        let negativeVerdict: boolean = checker.isNativeError(negative);
        expect(positiveVerdict).assertFalse();
        expect(negativeVerdict).assertFalse();
      }

      // --- [4] Verify isNativeError returns false for Double.NaN, which is not equal to any value including itself ---
      {
        let checker: util.types = new util.types();
        let notANumber: double = Double.NaN;
        expect(checker.isNativeError(notANumber)).assertFalse();
        expect(isNaN(notANumber)).assertTrue();
      }

      // --- [5] Verify TypeError.toString renders the name and message while the rendered string is not itself a native error ---
      {
        let checker: util.types = new util.types();
        let err: TypeError = new TypeError('boom');
        let text: string = err.toString();
        expect(text).assertEqual('TypeError: boom');
        expect(checker.isNativeError(text)).assertFalse();
        expect(checker.isNativeError(err)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1700
     * @tc.name testTypesIsNativeError017
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects Double.POSITIVE_INFINITY and Double.NEGATIVE_INFINITY; rejects the boolean values true and false; rejects a 10000 character concatenated string and one shaped by tab, newline and carriage return escapes; the negated isNativeError result is false for an Error and true for plain text; the Error.code setter round trips through the getter and the numeric code is not a native error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns false for Double.POSITIVE_INFINITY and Double.NEGATIVE_INFINITY ---
      {
        let checker: util.types = new util.types();
        let positive: double = Double.POSITIVE_INFINITY;
        let negative: double = Double.NEGATIVE_INFINITY;
        expect(checker.isNativeError(positive)).assertFalse();
        expect(checker.isNativeError(negative)).assertFalse();
      }

      // --- [2] Verify isNativeError returns false for the boolean values true and false ---
      {
        let checker: util.types = new util.types();
        let yes: boolean = true;
        let no: boolean = false;
        expect(checker.isNativeError(yes)).assertFalse();
        expect(checker.isNativeError(no)).assertFalse();
      }

      // --- [3] Verify a 10000 character concatenated string and one shaped by tab, newline and carriage return escapes are both rejected ---
      {
        let checker: util.types = new util.types();
        let longText: string = '';
        for (let index: int = 0; index < 10000; index++) {
          longText = longText + 'x';
        }
        expect(longText.length).assertEqual(10000);
        expect(checker.isNativeError(longText)).assertFalse();
        let control: string = 'a\tb\nc\rd';
        expect(checker.isNativeError(control)).assertFalse();
      }

      // --- [4] Verify the negated isNativeError result is false for an Error and true for plain text ---
      {
        let checker: util.types = new util.types();
        let negatedNative: boolean = !checker.isNativeError(new Error('neg'));
        let negatedText: boolean = !checker.isNativeError('neg');
        expect(negatedNative).assertFalse();
        expect(negatedText).assertTrue();
      }

      // --- [5] Verify the Error.code setter round trips through the getter and the numeric code is not a native error ---
      {
        let checker: util.types = new util.types();
        let err: Error = new Error('missing');
        err.code = 404;
        let status: int = err.code;
        expect(status).assertEqual(404);
        expect(checker.isNativeError(err)).assertTrue();
        expect(checker.isNativeError(status)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1800
     * @tc.name testTypesIsNativeError018
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects BigInt64Array and BigUint64Array built over a byte buffer; rejects four strings of differing content, empty, text, the name Error and blank spaces; rejects a six character string and a four element array whose length is unchanged; isNativeError rejects Number and Boolean wrappers and leaves their primitives intact; an isNativeError result drives a branch to the native path for an Error and rejects plain text.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns false for BigInt64Array and BigUint64Array built over a byte buffer ---
      {
        let checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(new ArrayBuffer(16));
        let bigUint64View: BigUint64Array = new BigUint64Array(new ArrayBuffer(16));
        expect(checker.isNativeError(bigInt64View)).assertFalse();
        expect(checker.isNativeError(bigUint64View)).assertFalse();
      }

      // --- [2] Verify isNativeError returns false for four strings of differing content, empty, text, the name Error and blank spaces ---
      {
        let checker: util.types = new util.types();
        let samples: string[] = ['', 'abc', 'Error', '  '];
        let falseCount: int = 0;
        for (let sample of samples) {
          if (!checker.isNativeError(sample)) {
            falseCount += 1;
          }
        }
        expect(falseCount).assertEqual(4);
      }

      // --- [3] Verify isNativeError returns false for a six character string and a four element array whose length is unchanged ---
      {
        let checker: util.types = new util.types();
        let text: string = 'abcdef';
        let items: int[] = [1, 2, 3, 4];
        expect(checker.isNativeError(text)).assertFalse();
        expect(checker.isNativeError(items)).assertFalse();
        expect(items.length).assertEqual(4);
      }

      // --- [4] Verify isNativeError rejects Number and Boolean wrappers and leaves their primitives intact ---
      {
        let checker: util.types = new util.types();
        let numeric: Number = new Number(2023);
        let flag: Boolean = new Boolean(true);
        expect(checker.isNativeError(numeric)).assertFalse();
        expect(checker.isNativeError(flag)).assertFalse();
        expect(numeric.valueOf()).assertEqual(2023);
        expect(flag.valueOf()).assertTrue();
      }

      // --- [5] Verify an isNativeError result drives a branch to the native path for an Error and rejects plain text ---
      {
        let checker: util.types = new util.types();
        let tag: string = '';
        if (checker.isNativeError(new Error('drive'))) {
          tag = 'native';
        } else {
          tag = 'other';
        }
        expect(tag).assertEqual('native');
        expect(checker.isNativeError('drive')).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_1900
     * @tc.name testTypesIsNativeError019
     * @tc.desc Merged batch (1 test): Primitive value rejection: an Error passes an isNativeError guard while the message text taken from that same Error fails the nested guard.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Error passes an isNativeError guard while the message text taken from that same Error fails the nested guard ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('ctx-h');
        let record: string = '';
        if (checker.isNativeError(error)) {
          if (!checker.isNativeError(error.message)) {
            record = 'native-only';
          }
        }
        expect(record).assertEqual('native-only');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2000
     * @tc.name testTypesIsNativeError020
     * @tc.desc Merged batch (5 tests): Non-target object rejection: the RangeError raised by a Uint16Array window past its buffer is a native error named RangeError and is not a promise; rejects a plain class instance and for an interface object literal; rejects an object with only a name field or only a message field; a plain arrow argument, a named function reference and a function held in a class field are all rejected; rejects an async arrow function value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the RangeError raised by a Uint16Array window past its buffer is a native error named RangeError and is not a promise ---
      {
        let checker: util.types = new util.types();
        let raised: Object = new Error('seed-error');
        try {
          new Uint16Array(new ArrayBuffer(2), 4, 1);
          expect().assertFail();
        } catch (err) {
          raised = err as Object;
          expect(err.name).assertEqual('RangeError');
        }
        expect(checker.isNativeError(raised)).assertTrue();
        expect(checker.isPromise(raised)).assertFalse();
      }

      // --- [2] Verify isNativeError returns false for a plain class instance and for an interface object literal ---
      {
        let checker: util.types = new util.types();
        let plain: PlainBox = new PlainBox();
        let literal: TagLike = { tag: 3 };
        expect(checker.isNativeError(plain)).assertFalse();
        expect(checker.isNativeError(literal)).assertFalse();
      }

      // --- [3] Verify isNativeError returns false for an object with only a name field or only a message field ---
      {
        let checker: util.types = new util.types();
        let named: ShapeAlikeName = new ShapeAlikeName();
        let messaged: ShapeAlikeMessage = new ShapeAlikeMessage();
        expect(named.name).assertEqual('Error');
        expect(checker.isNativeError(named)).assertFalse();
        expect(checker.isNativeError(messaged)).assertFalse();
      }

      // --- [4] Verify a plain arrow argument, a named function reference and a function held in a class field are all rejected ---
      {
        let checker: util.types = new util.types();
        let arrow: Function = (value: int): int => value;
        expect(checker.isNativeError(arrow)).assertFalse();
        let holder: FunctionHolder = new FunctionHolder();
        expect(checker.isNativeError(countProbe)).assertFalse();
        expect(checker.isNativeError(holder.fn)).assertFalse();
      }

      // --- [5] Verify isNativeError returns false for an async arrow function value ---
      {
        let checker: util.types = new util.types();
        let asyncArrow: Function = async (): Promise<void> => {
        };
        expect(checker.isNativeError(asyncArrow)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2100
     * @tc.name testTypesIsNativeError021
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Date instance; Maps and WeakMaps with one entry and Sets and WeakSets with one member are all rejected; rejects an ArrayBuffer of eight bytes; rejects a DataView built over a four byte buffer; rejects Uint8Array, Uint8ClampedArray, Uint32Array, Int32Array, Float32Array and Float64Array views.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns false for a Date instance ---
      {
        let checker: util.types = new util.types();
        let stamp: Date = new Date(1704067200000);
        expect(checker.isNativeError(stamp)).assertFalse();
      }

      // --- [2] Verify Maps and WeakMaps with one entry and Sets and WeakSets with one member are all rejected ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, int> = new Map<string, int>();
        store.set('k', 1);
        let key: PlainBox = new PlainBox();
        let weakStore: WeakMap<PlainBox, int> = new WeakMap<PlainBox, int>();
        weakStore.set(key, 1);
        expect(checker.isNativeError(store)).assertFalse();
        expect(checker.isNativeError(weakStore)).assertFalse();
        let pool: Set<int> = new Set<int>();
        pool.add(1);
        let key_2: PlainBox = new PlainBox();
        let weakPool: WeakSet<PlainBox> = new WeakSet<PlainBox>();
        weakPool.add(key_2);
        expect(checker.isNativeError(pool)).assertFalse();
        expect(checker.isNativeError(weakPool)).assertFalse();
      }

      // --- [3] Verify isNativeError returns false for an ArrayBuffer of eight bytes ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        expect(buffer.byteLength).assertEqual(8);
        expect(checker.isNativeError(buffer)).assertFalse();
      }

      // --- [4] Verify isNativeError returns false for a DataView built over a four byte buffer ---
      {
        let checker: util.types = new util.types();
        let view: DataView = new DataView(new ArrayBuffer(4));
        expect(checker.isNativeError(view)).assertFalse();
      }

      // --- [5] Verify isNativeError returns false for Uint8Array, Uint8ClampedArray, Uint32Array, Int32Array, Float32Array and Float64Array views ---
      {
        let checker: util.types = new util.types();
        let unsigned: Uint8Array = new Uint8Array(4);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(4);
        expect(checker.isNativeError(unsigned)).assertFalse();
        expect(checker.isNativeError(clamped)).assertFalse();
        let unsigned32: Uint32Array = new Uint32Array(4);
        let signed32: Int32Array = new Int32Array(4);
        expect(checker.isNativeError(unsigned32)).assertFalse();
        expect(checker.isNativeError(signed32)).assertFalse();
        let float32: Float32Array = new Float32Array(4);
        let float64: Float64Array = new Float64Array(4);
        expect(checker.isNativeError(float32)).assertFalse();
        expect(checker.isNativeError(float64)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2200
     * @tc.name testTypesIsNativeError022
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects Int8Array, Uint16Array and Int16Array instances; sibling views of one buffer share written data and two view kinds give the same false verdict; a renamed user Error subclass is reported as a native error; an isNativeError check made before a throw does not disturb the thrown TypeError subclass whose name stays TypeError; rejects a Map used as an Error cause is untouched and not native and the checker instance itself.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns false for Int8Array, Uint16Array and Int16Array instances ---
      {
        let checker: util.types = new util.types();
        let octetView: Int8Array = new Int8Array(4);
        let unsigned16: Uint16Array = new Uint16Array(4);
        let signed16: Int16Array = new Int16Array(4);
        expect(checker.isNativeError(octetView)).assertFalse();
        expect(checker.isNativeError(unsigned16)).assertFalse();
        expect(checker.isNativeError(signed16)).assertFalse();
      }

      // --- [2] Verify sibling views of one buffer share written data and two view kinds give the same false verdict ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let writer: Uint8Array = new Uint8Array(buffer);
        let int32View: Int32Array = new Int32Array(buffer);
        let float32View: Float32Array = new Float32Array(buffer);
        let view: DataView = new DataView(buffer, 0, 2);
        writer.$_set(0, 7);
        checker.isNativeError(int32View);
        expect(view.getUint8(0)).assertEqual(7);
        expect(checker.isNativeError(int32View)).assertEqual(checker.isNativeError(float32View));
        expect(view.byteLength).assertEqual(2);
      }

      // --- [3] Verify a renamed user Error subclass is reported as a native error while its message is kept and the RegExp verdict stays false ---
      {
        let checker: util.types = new util.types();
        let renamed: NamedOverrideError = new NamedOverrideError('agree');
        expect(checker.isNativeError(renamed)).assertTrue();
        expect(renamed.message).assertEqual('agree');
        expect(checker.isRegExp(renamed)).assertFalse();
      }

      // --- [4] Verify an isNativeError check made before a throw does not disturb the thrown TypeError subclass whose name stays TypeError ---
      {
        let checker: util.types = new util.types();
        let firstNative: boolean = checker.isNativeError(new Error('before-catch'));
        try {
          raiseTypeSub();
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('TypeError');
        }
        expect(firstNative).assertTrue();
      }

      // --- [5] Verify a Map used as an Error cause is untouched and not native and the checker instance itself is rejected ---
      {
        let checker: util.types = new util.types();
        let group: CauseCarrierError = new CauseCarrierError('field-map', new Map<string, int>());
        let backMap: Map<string, int> = group.causeRef as Map<string, int>;
        backMap.set('n', 1);
        checker.isNativeError(group);
        expect(backMap.size).assertEqual(1);
        expect(checker.isNativeError(group.causeRef)).assertFalse();
        expect(checker.isNativeError(checker)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2300
     * @tc.name testTypesIsNativeError023
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a base Error is reported native while the Set, WeakMap and WeakSet probes on it are all false; an Error subclass is reported native while every ArrayBuffer probe on that same object is false; an Error subclass is reported native while the Promise and typed array probes on that same object are false; an Error subclass is native while isMap, isDate and isRegExp all reject that same object; a Map and a WeakMap are each confirmed by their own probe while isNativeError reports false for both.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a base Error is reported native while the Set, WeakMap and WeakSet probes on it are all false ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('cross-collection');
        expect(checker.isNativeError(error)).assertTrue();
        expect(checker.isSet(error)).assertFalse();
        expect(checker.isWeakMap(error)).assertFalse();
        expect(checker.isWeakSet(error)).assertFalse();
      }

      // --- [2] Verify an Error subclass is reported native while every ArrayBuffer probe on that same object is false ---
      {
        let checker: util.types = new util.types();
        let error: Error = new RefSubError('cross-buffer');
        expect(checker.isNativeError(error)).assertTrue();
        expect(checker.isArrayBuffer(error)).assertFalse();
        expect(checker.isAnyArrayBuffer(error)).assertFalse();
        expect(checker.isArrayBufferView(error)).assertFalse();
      }

      // --- [3] Verify an Error subclass is reported native while the Promise and typed array probes on that same object are false ---
      {
        let checker: util.types = new util.types();
        let error: Error = new EvalSubError('cross-promise');
        expect(checker.isNativeError(error)).assertTrue();
        expect(checker.isPromise(error)).assertFalse();
        expect(checker.isTypedArray(error)).assertFalse();
      }

      // --- [4] Verify an Error subclass is native while isMap, isDate and isRegExp all reject that same object ---
      {
        let checker: util.types = new util.types();
        let error: Error = new TaggedError('cross-map');
        expect(checker.isNativeError(error)).assertTrue();
        expect(checker.isMap(error)).assertFalse();
        let error_2: Error = new UriSubError('cross-date');
        expect(checker.isNativeError(error_2)).assertTrue();
        expect(checker.isDate(error_2)).assertFalse();
        expect(checker.isRegExp(error_2)).assertFalse();
      }

      // --- [5] Verify a Map and a WeakMap are each confirmed by their own probe while isNativeError reports false for both ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, int> = new Map<string, int>();
        let weak: WeakMap<PlainBox, int> = new WeakMap<PlainBox, int>();
        expect(checker.isNativeError(store)).assertFalse();
        expect(checker.isMap(store)).assertTrue();
        expect(checker.isWeakMap(weak)).assertTrue();
        expect(checker.isNativeError(weak)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2400
     * @tc.name testTypesIsNativeError024
     * @tc.desc Merged batch (3 tests): Non-target object rejection: a Uint8Array is a typed array view while isNativeError reports false for the same typed array; a Date and a RegExp each report their own predicate while isNativeError rejects that same object; a plain class instance is rejected by the native error, Map, Date and RegExp probes alike.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Uint8Array is a typed array view while isNativeError reports false for the same typed array ---
      {
        let checker: util.types = new util.types();
        let bytes: Uint8Array = new Uint8Array(4);
        expect(checker.isNativeError(bytes)).assertFalse();
        expect(checker.isTypedArray(bytes)).assertTrue();
        expect(checker.isArrayBufferView(bytes)).assertTrue();
      }

      // --- [2] Verify a Date and a RegExp each report their own predicate while isNativeError rejects that same object ---
      {
        let checker: util.types = new util.types();
        let stamp: Date = new Date(0);
        expect(checker.isNativeError(stamp)).assertFalse();
        expect(checker.isDate(stamp)).assertTrue();
        let pattern: RegExp = new RegExp('cross');
        expect(checker.isNativeError(pattern)).assertFalse();
        expect(checker.isRegExp(pattern)).assertTrue();
      }

      // --- [3] Verify a plain class instance is rejected by the native error, Map, Date and RegExp probes alike ---
      {
        let checker: util.types = new util.types();
        let plain: PlainBox = new PlainBox();
        expect(checker.isNativeError(plain)).assertFalse();
        expect(checker.isMap(plain)).assertFalse();
        expect(checker.isDate(plain)).assertFalse();
        expect(checker.isRegExp(plain)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2500
     * @tc.name testTypesIsNativeError025
     * @tc.desc Merged batch (4 tests): Non-target object rejection: verifies rejection of unrelated objects, covering loop and iterator traversal including Promise, Map and Set.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify a plain Error renamed to TypeError is still a native error while its TypeError identity remains false ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('misnamed');
        error.name = 'TypeError';
        expect(checker.isNativeError(error)).assertTrue();
        expect(error instanceof TypeError).assertFalse();
      }

      // --- [2] Verify isNativeError returns false for a Promise that already resolved to the value one ---
      {
        let checker: util.types = new util.types();
        let promise: Promise<int> = Promise.resolve<int>(1);
        expect(checker.isNativeError(promise)).assertFalse();
      }

      // --- [3] Verify isNativeError returns false for the keys, values and entries iterators of a Map and values, keys and entries iterators of a Set ---
      {
        let checker: util.types = new util.types();
        let source: Map<string, int> = new Map<string, int>();
        source.set('k', 1);
        let keys: IterableIterator<string> = source.keys();
        let values: IterableIterator<int> = source.values();
        let entries: Object = source.entries();
        expect(checker.isNativeError(keys)).assertFalse();
        expect(checker.isNativeError(values)).assertFalse();
        expect(checker.isNativeError(entries)).assertFalse();
        let source_2: Set<int> = new Set<int>();
        source_2.add(1);
        let values_2: IterableIterator<int> = source_2.values();
        let keys_2: IterableIterator<int> = source_2.keys();
        let entries_2: Object = source_2.entries();
        expect(checker.isNativeError(values_2)).assertFalse();
        expect(checker.isNativeError(keys_2)).assertFalse();
        expect(checker.isNativeError(entries_2)).assertFalse();
      }

      // --- [4] Verify Errors that arrive as the rejection reasons of rejected promises stay native and the TypeError name survives ---
      {
        let checker: util.types = new util.types();
        let plainArrived: Object = await captureRejectionReason(new Error('rejected-plain'));
        let typedArrived: Object = await captureRejectionReason(new TypeError('rejected-type'));
        let typedCaught: Error = typedArrived as Error;
        expect(checker.isNativeError(plainArrived)).assertTrue();
        expect(checker.isNativeError(typedArrived)).assertTrue();
        expect(typedCaught.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2600
     * @tc.name testTypesIsNativeError026
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: an Error whose name was reassigned after construction stays a native error and reports the new name; a plain object stays foreign after its field was changed following an isNativeError call; toString reflects a reassigned message while the verdict stays true and moving one message into the other keeps both verdicts true; an Error kept in a Map value and in a Set member stays readable after isNativeError ran on both; one Error aliased into two Maps is native through both lookup paths and its message reads as the text that built it.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Error whose name was reassigned after construction stays a native error and reports the new name ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('named');
        error.name = 'RenamedError';
        expect(error.name).assertEqual('RenamedError');
        expect(checker.isNativeError(error)).assertTrue();
      }

      // --- [2] Verify a plain object stays foreign after its field was changed following an isNativeError call ---
      {
        let checker: util.types = new util.types();
        let plain: PlainBox = new PlainBox();
        let isNative: boolean = checker.isNativeError(plain);
        plain.tag = 99;
        expect(isNative).assertFalse();
        expect(plain.tag).assertEqual(99);
        expect(checker.isNativeError(plain)).assertFalse();
      }

      // --- [3] Verify toString reflects a reassigned message while the verdict stays true and moving one message into the other keeps both verdicts true ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('original');
        error.message = 'changed';
        expect(checker.isNativeError(error)).assertTrue();
        expect(error.toString()).assertEqual('Error: changed');
        let first: Error = new Error('m-one');
        let second: Error = new Error('m-two');
        first.message = 'm-two';
        expect(checker.isNativeError(first)).assertEqual(checker.isNativeError(second));
        expect(first.message).assertEqual(second.message);
      }

      // --- [4] Verify an Error kept in a Map value and in a Set member stays readable after isNativeError ran on both ---
      {
        let checker: util.types = new util.types();
        let member: Error = new Error('member-msg');
        let store: Map<string, Error> = new Map<string, Error>();
        store.set('k', member);
        let pool: Set<Error> = new Set<Error>();
        pool.add(member);
        checker.isNativeError(store);
        checker.isNativeError(pool);
        expect(store.get('k')!.message).assertEqual('member-msg');
        expect(pool.has(member)).assertTrue();
      }

      // --- [5] Verify one Error aliased into two Maps is native through both lookup paths and its message reads as the text that built it ---
      {
        let checker: util.types = new util.types();
        let shared: Error = new TaggedError('shared-instance');
        let firstStore: Map<string, Error> = new Map<string, Error>();
        firstStore.set('s', shared);
        let secondStore: Map<string, Error> = new Map<string, Error>();
        secondStore.set('t', shared);
        let firstBack: Error = firstStore.get('s')!;
        let secondBack: Error = secondStore.get('t')!;
        expect(checker.isNativeError(firstBack)).assertTrue();
        expect(checker.isNativeError(secondBack)).assertTrue();
        expect(firstBack).assertEqual(secondBack);
        let error: Error = new Error('state-probe');
        let flag: boolean = checker.isNativeError(error);
        expect(flag).assertTrue();
        expect(error.message).assertEqual('state-probe');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2700
     * @tc.name testTypesIsNativeError027
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: an Error as a Map key and a subclass Error as a WeakMap key both report as native errors and resolve their values; both payloads of an array of two interface literals are native errors and the second keeps its built-in name; a TypeError keeps its name and a SyntaxError keeps its message while both are native errors; a byte written through a DataView survives an isNativeError call on the view and its buffer; a user class extending RangeError keeps its message while isNativeError reports true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an Error as a Map key and a subclass Error as a WeakMap key both report as native errors and resolve their values ---
      {
        let checker: util.types = new util.types();
        let key: Error = new TypeError('map-key');
        let mapStore: Map<Error, string> = new Map<Error, string>();
        mapStore.set(key, 'value');
        let weakKey: Error = new RefSubError('weak-key');
        let weakStore: WeakMap<Error, string> = new WeakMap<Error, string>();
        weakStore.set(weakKey, 'weak-key-value');
        expect(checker.isNativeError(key)).assertTrue();
        expect(mapStore.get(key)).assertEqual('value');
        expect(checker.isNativeError(weakKey)).assertTrue();
        expect(weakStore.get(weakKey)).assertEqual('weak-key-value');
      }

      // --- [2] Verify both payloads of an array of two interface literals are native errors and the second keeps its built-in name ---
      {
        let checker: util.types = new util.types();
        let carriers: ErrorCarrier[] = [
          { payload: new Error('carrier-a') },
          { payload: new RangeError('carrier-b') }
        ];
        expect(checker.isNativeError(carriers[0].payload)).assertTrue();
        expect((carriers[1].payload as Error).name).assertEqual('RangeError');
        expect(checker.isNativeError(carriers[1].payload)).assertTrue();
      }

      // --- [3] Verify a TypeError keeps its name and a SyntaxError keeps its message while both are native errors ---
      {
        let checker: util.types = new util.types();
        let typed: TypeError = new TypeError('t');
        let syntax: SyntaxError = new SyntaxError('syntax');
        expect(checker.isNativeError(typed)).assertTrue();
        expect(typed.name).assertEqual('TypeError');
        expect(checker.isNativeError(syntax)).assertTrue();
        expect(syntax.message).assertEqual('syntax');
      }

      // --- [4] Verify a byte written through a DataView survives an isNativeError call on the view and its buffer ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let view: DataView = new DataView(buffer);
        view.setUint8(0, 99);
        checker.isNativeError(view);
        checker.isNativeError(buffer);
        expect(view.getUint8(0)).assertEqual(99);
        expect(buffer.byteLength).assertEqual(4);
      }

      // --- [5] Verify a user class extending RangeError keeps its message while isNativeError reports true ---
      {
        let checker: util.types = new util.types();
        let deep: DeepRangeError = new DeepRangeError('deep-msg');
        let flag: boolean = checker.isNativeError(deep);
        expect(flag).assertTrue();
        expect(deep.message).assertEqual('deep-msg');
        expect(deep.note).assertEqual('deep');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2800
     * @tc.name testTypesIsNativeError028
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: the name, message and stack of an Error are unchanged after isNativeError inspected it; the two bytes stored in a Uint8Array and the lastIndex and source of a RegExp are unchanged after isNativeError inspected it; the size of a Map, the size of a Set and the byte length of a Uint8Array survive an isNativeError call; accepts a four level user Error chain and every field inherited along that chain stays readable; the field of an interface literal and of a class instance is unchanged after an isNativeError call.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the name, message and stack of an Error are unchanged after isNativeError inspected it ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('immutable');
        let name: string = error.name;
        let message: string = error.message;
        let stack: string | undefined = error.stack;
        checker.isNativeError(error);
        expect(error.name).assertEqual(name);
        expect(error.message).assertEqual(message);
        expect(error.stack).assertEqual(stack);
      }

      // --- [2] Verify the two bytes stored in a Uint8Array and the lastIndex and source of a RegExp are unchanged after isNativeError inspected it ---
      {
        let checker: util.types = new util.types();
        let bytes: Uint8Array = new Uint8Array(3);
        bytes.$_set(0, 10);
        bytes.$_set(1, 20);
        checker.isNativeError(bytes);
        expect(bytes.$_get(0)).assertEqual(10);
        expect(bytes.$_get(1)).assertEqual(20);
        let pattern: RegExp = new RegExp('ab', 'g');
        pattern.lastIndex = 3;
        let source: string = pattern.source;
        checker.isNativeError(pattern);
        expect(pattern.lastIndex).assertEqual(3);
        expect(pattern.source).assertEqual(source);
      }

      // --- [3] Verify the size of a Map, the size of a Set and the byte length of a Uint8Array survive an isNativeError call ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, int> = new Map<string, int>();
        store.set('a', 1);
        store.set('b', 2);
        let pool: Set<string> = new Set<string>();
        pool.add('x');
        pool.add('y');
        let bytes: Uint8Array = new Uint8Array(16);
        checker.isNativeError(store);
        checker.isNativeError(pool);
        checker.isNativeError(bytes);
        expect(store.size).assertEqual(2);
        expect(pool.size).assertEqual(2);
        expect(bytes.byteLength).assertEqual(16);
      }

      // --- [4] Verify isNativeError returns true for a four level user Error chain and every field inherited along that chain stays readable ---
      {
        let checker: util.types = new util.types();
        let deeper: FourthLevelError = new FourthLevelError('lvl4-msg');
        expect(checker.isNativeError(deeper)).assertTrue();
        expect(deeper.depth).assertEqual(3);
        expect(deeper.depth4).assertEqual(4);
        expect(deeper.extra).assertEqual('second');
        expect(deeper.tagCode).assertEqual(100);
      }

      // --- [5] Verify the field of an interface literal and of a class instance is unchanged after an isNativeError call ---
      {
        let checker: util.types = new util.types();
        let literal: TagLike = { tag: 9 };
        let plain: PlainBox = new PlainBox();
        checker.isNativeError(literal);
        checker.isNativeError(plain);
        expect(literal.tag).assertEqual(9);
        expect(plain.tag).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_2900
     * @tc.name testTypesIsNativeError029
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: a RangeError captured from a throw keeps its thrown message and is a native error; inspecting both the key and the value of a Map entry leaves the entry count and the stored Error intact; swapping the Error in a single slot array keeps the native verdict true and the length unchanged; a filter over an ArrayBuffer and a TypeError keeps only the error; filtering a mixed Object array with an isNativeError predicate keeps exactly the two Error entries.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a RangeError captured from a throw keeps its thrown message and is a native error ---
      {
        let checker: util.types = new util.types();
        let ranged: Object = captureThrownRangeError();
        expect((ranged as Error).message).assertEqual('thrown-range');
        expect(checker.isNativeError(ranged)).assertTrue();
      }

      // --- [2] Verify inspecting both the key and the value of a Map entry leaves the entry count and the stored Error intact ---
      {
        let checker: util.types = new util.types();
        let key: Error = new RefSubError('map-intact');
        let store: Map<Error, Error> = new Map<Error, Error>();
        store.set(key, new UriSubError('map-intact-value'));
        let sizeBefore: int = store.size;
        checker.isNativeError(key);
        checker.isNativeError(store.get(key)!);
        expect(store.size).assertEqual(sizeBefore);
        expect((store.get(key) as Error).name).assertEqual('URIError');
      }

      // --- [3] Verify swapping the Error in a single slot array keeps the native verdict true and the length unchanged ---
      {
        let checker: util.types = new util.types();
        let items: Object[] = [new Error('swap-old')];
        let before: boolean = checker.isNativeError(items[0]);
        items[0] = new UriSubError('swap-new');
        let after: boolean = checker.isNativeError(items[0]);
        expect(before).assertEqual(after);
        expect(after).assertTrue();
        expect(items.length).assertEqual(1);
      }

      // --- [4] Verify a filter over an ArrayBuffer and a TypeError keeps only the error while the buffer stays an ArrayBuffer ---
      {
        let checker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let suspects: Object[] = [buffer, new TypeError('tagged')];
        let errors: Object[] = suspects.filter((suspect: Object): boolean => checker.isNativeError(suspect));
        expect(errors.length).assertEqual(1);
        expect(checker.isArrayBuffer(buffer)).assertTrue();
      }

      // --- [5] Verify filtering a mixed Object array with an isNativeError predicate keeps exactly the two Error entries ---
      {
        let checker: util.types = new util.types();
        let mixed: Object[] = [new Error('f-a'), 'text', new RefSubError('f-b'), new PlainBox()];
        let natives: Object[] = filterNativeErrors(mixed);
        expect(natives.length).assertEqual(2);
        expect(checker.isNativeError(natives[1])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_3000
     * @tc.name testTypesIsNativeError030
     * @tc.desc Merged batch (5 tests): Container and field storage: two nullable holders carrying an Error and a Date respectively are judged by what their fields actually hold; an Error field whose own cause reference is another Error is native through both levels of the holder; accepts Error values read from an array field, a class field and a Map entry; an Error stored in the field of an interface object literal is reported as a native error; an Error held as the cause reference of another Error is itself a native error and both verdicts are true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two nullable holders carrying an Error and a Date respectively are judged by what their fields actually hold ---
      {
        let checker: util.types = new util.types();
        let nullBox: NullFieldBox = new NullFieldBox();
        let undefinedBox: UndefinedFieldBox = new UndefinedFieldBox();
        nullBox.value = new Error('assigned');
        undefinedBox.value = new Date(0);
        expect(checker.isNativeError(nullBox.value as Object)).assertTrue();
        expect(checker.isNativeError(undefinedBox.value as Object)).assertFalse();
      }

      // --- [2] Verify an Error field whose own cause reference is another Error is native through both levels of the holder ---
      {
        let checker: util.types = new util.types();
        let holder: SlotHolder = new SlotHolder(new CauseCarrierError('outer-holder', new Error('inner-holder')));
        let inner: Object = (holder.slot as CauseCarrierError).causeRef;
        expect(checker.isNativeError(holder.slot)).assertTrue();
        expect(checker.isNativeError(inner)).assertTrue();
      }

      // --- [3] Verify isNativeError returns true for Error values read from an array field, a class field and a Map entry ---
      {
        let checker: util.types = new util.types();
        let shelf: ErrorShelf = new ErrorShelf();
        let holder: ErrorHolder = new ErrorHolder();
        let store: Map<string, Object> = new Map<string, Object>();
        store.set('err', new Error('map-value'));
        let fromMap: Object | undefined = store.get('err');
        expect(checker.isNativeError(shelf.items[0])).assertTrue();
        expect(checker.isNativeError(holder.err)).assertTrue();
        expect(checker.isNativeError(fromMap!)).assertTrue();
      }

      // --- [4] Verify an Error stored in the field of an interface object literal is reported as a native error ---
      {
        let checker: util.types = new util.types();
        let carrier: ErrorCarrier = { payload: new Error('in-literal') };
        expect(checker.isNativeError(carrier.payload)).assertTrue();
      }

      // --- [5] Verify an Error held as the cause reference of another Error is itself a native error and both verdicts are true ---
      {
        let checker: util.types = new util.types();
        let inner: Error = new TaggedError('cause-inner');
        let outer: CauseCarrierError = new CauseCarrierError('cause-outer', inner);
        expect(checker.isNativeError(outer)).assertTrue();
        expect(checker.isNativeError(outer.causeRef)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_3100
     * @tc.name testTypesIsNativeError031
     * @tc.desc Merged batch (5 tests): Container and field storage: accepts an instance three classes below Error and the message reaches the deepest class field; a SyntaxError kept as a WeakMap value is reported as a native error after being read back; repeated isNativeError calls on a Map key add no duplicate entry and the value can still be swapped; all one hundred Error instances pushed into an array are reported as native errors; a Record holding an Error under one key and plain text under another yields opposite verdicts.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError returns true for an instance three classes below Error and the message reaches the deepest class field ---
      {
        let checker: util.types = new util.types();
        let deep: ThirdLevelError = new ThirdLevelError('lvl3-msg');
        let verdict: boolean = checker.isNativeError(deep);
        expect(verdict).assertTrue();
        expect(deep.message).assertEqual('lvl3-msg');
        expect(deep.depth).assertEqual(3);
      }

      // --- [2] Verify a SyntaxError kept as a WeakMap value is reported as a native error after being read back ---
      {
        let checker: util.types = new util.types();
        let key: PlainBox = new PlainBox();
        let store: WeakMap<PlainBox, Error> = new WeakMap<PlainBox, Error>();
        store.set(key, new SyntaxError('weak-value'));
        let value: Error | undefined = store.get(key);
        expect(checker.isNativeError(value!)).assertTrue();
      }

      // --- [3] Verify repeated isNativeError calls on a Map key add no duplicate entry and the value can still be swapped ---
      {
        let checker: util.types = new util.types();
        let key: Error = new Error('dup-guard');
        let store: Map<Error, string> = new Map<Error, string>();
        store.set(key, 'first');
        checker.isNativeError(key);
        store.set(key, 'second');
        expect(store.size).assertEqual(1);
        expect(store.get(key)).assertEqual('second');
      }

      // --- [4] Verify all one hundred Error instances pushed into an array are reported as native errors ---
      {
        let checker: util.types = new util.types();
        let bulk: Object[] = [];
        for (let index: int = 0; index < 100; index++) {
          bulk.push(new Error('bulk'));
        }
        let allNative: boolean = true;
        for (const entry of bulk) {
          if (!checker.isNativeError(entry)) {
            allNative = false;
          }
        }
        expect(bulk.length).assertEqual(100);
        expect(allNative).assertTrue();
      }

      // --- [5] Verify a Record holding an Error under one key and plain text under another yields opposite verdicts ---
      {
        let checker: util.types = new util.types();
        let record: Record<string, Object> = { 'err': new Error('record-err'), 'text': 'plain' };
        expect(checker.isNativeError(record['err']!)).assertTrue();
        expect(checker.isNativeError(record['text']!)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_3200
     * @tc.name testTypesIsNativeError032
     * @tc.desc Merged batch (1 test): Container and field storage: isNativeError reports an AggregateError and every nested error it carries as native.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError reports an AggregateError and every nested error it carries as native ---
      {
        let checker: util.types = new util.types();
        let first: Error = new Error('agg-a');
        let second: TypeError = new TypeError('agg-b');
        let grouped: AggregateError = new AggregateError([first, second], 'many-failed');
        let nested: int = 0;
        let payload: Error[] = grouped.errors;
        for (const item of payload) {
          if (checker.isNativeError(item)) {
            nested++;
          }
        }
        expect(checker.isNativeError(grouped)).assertTrue();
        expect(nested).assertEqual(payload.length);
        expect(grouped.message).assertEqual('many-failed');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_3300
     * @tc.name testTypesIsNativeError033
     * @tc.desc Merged batch (5 tests): API call consistency: three calls on one TypeError agree and a repeated call on one text value stays false; isNativeError reports true for an Error and false for the very message text stored in it; accepts an Error while a Date stays rejected and a RangeError while a Map stays rejected; the verdict follows values drained from an Object array: the int is rejected and the RangeError accepted; two separate checker instances give the same true verdict for one shared RangeError object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three calls on one TypeError agree and a repeated call on one text value stays false ---
      {
        let checker: util.types = new util.types();
        let typed: TypeError = new TypeError('three');
        let r1: boolean = checker.isNativeError(typed);
        let r2: boolean = checker.isNativeError(typed);
        let r3: boolean = checker.isNativeError(typed);
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(checker.isNativeError('three')).assertFalse();
      }

      // --- [2] Verify isNativeError reports true for an Error and false for the very message text stored in it ---
      {
        let checker: util.types = new util.types();
        let error: Error = new Error('message-text');
        expect(checker.isNativeError(error)).assertTrue();
        expect(checker.isNativeError(error.message)).assertFalse();
      }

      // --- [3] Verify isNativeError returns true for an Error while a Date stays rejected and a RangeError while a Map stays rejected ---
      {
        let checker: util.types = new util.types();
        expect(checker.isNativeError(new Error('fallback'))).assertTrue();
        expect(checker.isNativeError(new Date(0))).assertFalse();
        expect(checker.isNativeError(new RangeError('range'))).assertTrue();
        expect(checker.isNativeError(new Map<string, int>())).assertFalse();
      }

      // --- [4] Verify the verdict follows values drained from an Object array: the int is rejected and the RangeError accepted ---
      {
        let checker: util.types = new util.types();
        let stack: Object[] = [new RangeError('stacked-first'), 42];
        let drained: Object = stack.pop()!;
        let kept: Object = stack.pop()!;
        expect(checker.isNativeError(drained)).assertFalse();
        expect(checker.isNativeError(kept)).assertTrue();
      }

      // --- [5] Verify two separate checker instances give the same true verdict for one shared RangeError object ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let error: Error = new RangeError('shared');
        expect(first.isNativeError(error)).assertEqual(second.isNativeError(error));
        expect(first.isNativeError(error)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_3400
     * @tc.name testTypesIsNativeError034
     * @tc.desc Merged batch (3 tests): API call consistency: the isNativeError verdict produced inside a holder class method is true for an Error subclass and false for text; isNativeError is false for a Map keys iterator that isMapIterator reports true and true for an Error; two checker instances interleaved on one Error and one text value never mix up their verdicts.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the isNativeError verdict produced inside a holder class method is true for an Error subclass and false for text ---
      {
        let inspector: NativeErrorInspector = new NativeErrorInspector();
        expect(inspector.inspect(new UriSubError('ctx-b'))).assertTrue();
        expect(inspector.inspect('text-ctx')).assertFalse();
      }

      // --- [2] Verify isNativeError is false for a Map keys iterator that isMapIterator reports true and true for an Error ---
      {
        let checker: util.types = new util.types();
        let store: Map<string, int> = new Map<string, int>();
        store.set('k', 1);
        let keys: IterableIterator<string> = store.keys();
        let error: Error = new Error('cross-iter');
        expect(checker.isNativeError(error)).assertTrue();
        expect(checker.isMapIterator(keys)).assertTrue();
        expect(checker.isNativeError(keys)).assertFalse();
      }

      // --- [3] Verify two checker instances interleaved on one Error and one text value never mix up their verdicts ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let error: Error = new TaggedError('leak-a');
        let text: string = 'leak-b';
        let r1: boolean = first.isNativeError(error);
        let r2: boolean = second.isNativeError(text);
        let r3: boolean = first.isNativeError(text);
        let r4: boolean = second.isNativeError(error);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        expect(r3).assertFalse();
        expect(r4).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_3500
     * @tc.name testTypesIsNativeError035
     * @tc.desc Merged batch (4 tests): Program integration: checks use through program paths, covering Object widening and related program paths.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify isNativeError returns true for an Error captured from a thrown generic Error by a helper ---
      {
        let checker: util.types = new util.types();
        let caught: Object = captureGenericError();
        expect(checker.isNativeError(caught)).assertTrue();
      }

      // --- [2] Verify a TypeError returned from a helper as Object is reported as a native error ---
      {
        let checker: util.types = new util.types();
        expect(checker.isNativeError(wrapTypeError())).assertTrue();
      }

      // --- [3] Verify an Error routed through a resolved Promise is still reported as a native error ---
      {
        let checker: util.types = new util.types();
        let settled: Object = await Promise.resolve<Object>(new TaggedError('resolved'));
        expect(checker.isNativeError(settled)).assertTrue();
      }

      // --- [4] Verify the first native error helper falls back to its Error argument when every list element is foreign ---
      {
        let checker: util.types = new util.types();
        let mixed: Object[] = ['a', 42, new PlainBox()];
        let fallback: Object = new Error('fallback-all');
        let found: Object = firstNativeOrDefault(mixed, fallback);
        expect(found).assertEqual(fallback);
        expect(checker.isNativeError(found)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_3600
     * @tc.name testTypesIsNativeError036
     * @tc.desc Merged batch (5 tests): Program integration: isNativeError results combine with logical and into true and with logical or into true; accepts an Error relayed through a helper that forwards its argument; accepts an Error picked by a conditional expression and one returned by a helper; isNativeError inside a loop counts exactly the two errors of a mixed four element Object array; a ternary driven directly by an isNativeError call on a RangeError selects the native label.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isNativeError results combine with logical and into true and with logical or into true ---
      {
        let checker: util.types = new util.types();
        let both: boolean = checker.isNativeError(new Error('a')) && checker.isNativeError(new TypeError('b'));
        let either: boolean = checker.isNativeError(new Error('a')) || checker.isNativeError('text');
        expect(both).assertTrue();
        expect(either).assertTrue();
      }

      // --- [2] Verify isNativeError returns true for an Error relayed through a helper that forwards its argument ---
      {
        expect(probeNativeError(new Error('relayed'))).assertTrue();
      }

      // --- [3] Verify isNativeError returns true for an Error picked by a conditional expression and one returned by a helper ---
      {
        let checker: util.types = new util.types();
        let flag: boolean = false;
        let first: Error = new Error('branch-a');
        let second: TypeError = new TypeError('branch-b');
        let target: Object = flag ? first : second;
        expect(checker.isNativeError(target)).assertTrue();
        expect(checker.isNativeError(wrapError())).assertTrue();
      }

      // --- [4] Verify isNativeError inside a loop counts exactly the two errors of a mixed four element Object array ---
      {
        let checker: util.types = new util.types();
        let mixed: Object[] = [new Error('m1'), new TypeError('m2'), 'plain-text', new PlainBox()];
        let nativeCount: int = 0;
        for (const entry of mixed) {
          if (checker.isNativeError(entry)) {
            nativeCount++;
          }
        }
        expect(nativeCount).assertEqual(2);
        expect(checker.isNativeError(mixed[2])).assertFalse();
      }

      // --- [5] Verify a ternary driven directly by an isNativeError call on a RangeError selects the native label ---
      {
        let checker: util.types = new util.types();
        let label: string = checker.isNativeError(new RangeError('ctx-f')) ? 'native' : 'foreign';
        expect(label).assertEqual('native');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_NATIVE_ERROR_3700
     * @tc.name testTypesIsNativeError037
     * @tc.desc Merged batch (2 tests): Program integration: an isNativeError verdict steers an if branch whose result is then consumed by a switch statement; a while loop whose condition calls isNativeError stops at the first non error element after counting two.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsNativeError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an isNativeError verdict steers an if branch whose result is then consumed by a switch statement ---
      {
        let checker: util.types = new util.types();
        let code: int = 0;
        if (checker.isNativeError(new TaggedError('ctx-g'))) {
          code = 7;
        }
        switch (code) {
          case 7:
            code = 8;
            break;
          default:
            break;
        }
        expect(code).assertEqual(8);
      }

      // --- [2] Verify a while loop whose condition calls isNativeError stops at the first non error element after counting two ---
      {
        let checker: util.types = new util.types();
        let items: Object[] = [new Error('w-a'), new RefSubError('w-b'), 'plain-stop', new Error('w-c')];
        let index: int = 0;
        let nativeRun: int = 0;
        while (index < items.length && checker.isNativeError(items[index])) {
          nativeRun++;
          index++;
        }
        expect(nativeRun).assertEqual(2);
        expect(index).assertEqual(2);
      }
    });

  });
}
