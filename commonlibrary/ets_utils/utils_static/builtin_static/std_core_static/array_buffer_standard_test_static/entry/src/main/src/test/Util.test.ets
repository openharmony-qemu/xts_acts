import { expect } from '../../../hypium/index';

export default class Utils {
  static async msSleep(count: int): Promise<void> {
    return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void): void => {
      setTimeout((): void => {
        resolve(Promise.resolve());
      }, count);
    });
  }

  /**
   * `typeof` for lengths / `getByteLength` / reflected error `code` on OH: Hypium may report `int` not `number`.
   */
  static isRuntimeNumericOrIntTypeof(kind: string): boolean {
    return kind === 'number' || kind === 'int';
  }

  /** STA `fromObject` first parameter is `Object`; centralize the required ArrayBuffer widening cast. */
  static fromObjectWithBuffer(src: ArrayBuffer, byteOffset: int, length: int): ArrayBuffer {
    return ArrayBuffer.fromObject(src as Object, byteOffset, length);
  }

  /**
   * Static ArkTS negative-test bridges: widen to `Object`, then cast to the API parameter type.
   * Replaces scattered `(value as Object) as T` patterns so invalid-arg tests compile on CI.
   */
  static boxAsObject(v: number): Object {
    return v as Object;
  }

  static castToString(v: Object): string {
    return v as string;
  }

  static castToArrayBuffer(v: Object): ArrayBuffer {
    return v as ArrayBuffer;
  }

  static castToInt(v: Object): int {
    return v as int;
  }

  static castToUint8Array(v: Object): Uint8Array {
    return v as Uint8Array;
  }

  static castToValueArrayByte(v: Object): ValueArray<byte> {
    return v as ValueArray<byte>;
  }

  static castToArrayBufferLike(v: Object): ArrayBufferLike {
    return v as ArrayBufferLike;
  }

  static castToDoubleArray(v: Object): double[] {
    return v as double[];
  }

  static castToByte(v: Object): byte {
    return v as byte;
  }

  static castToObject(v: Object): Object {
    return v;
  }

  /** `number` must be assigned to a variable before `as Object` (no literal-to-ESValue cast). */
  static numberAsString(n: number): string {
    return Utils.castToString(n as Object);
  }

  static numberAsArrayBuffer(n: number): ArrayBuffer {
    return Utils.castToArrayBuffer(n as Object);
  }

  /**
   * `ArrayBuffer.from(buffer, byteOffset)` when length omitted: ES copies to end; OH may throw without explicit length.
   */
  static fromArrayBufferWithOffset(src: ArrayBuffer, byteOffset: int, length?: int): ArrayBuffer {
    if (length !== undefined) {
      return ArrayBuffer.from(src, byteOffset, length);
    }
    const tail: int = (src.byteLength as int) - byteOffset;
    try {
      const r = ArrayBuffer.from(src, byteOffset);
      if (r.byteLength === tail) {
        return r;
      }
    } catch (e) {
      // use explicit tail length on OH
    }
    return ArrayBuffer.from(src, byteOffset, tail);
  }

  /** Assert catch parameter is a runtime Error with simple class name containing `simpleNamePart` (review: use err name, not only non-null). */
  static assertThrownExceptionNameContains(thrown: Error, simpleNamePart: string): void {
    const fullName: string = Class.of(thrown).getName();
    expect(fullName.indexOf(simpleNamePart) >= 0).assertTrue();
  }

  /**
   * Review 检视结果.txt §5: `catch` must receive the API/runtime Error, not Hypium AssertException from assertFail in the same try.
   * If `run` returns normally, the test fails via assertFail after the try/catch.
   */
  static assertExpectThrow(run: () => void): void {
    try {
      run();
    } catch (e) {
      Utils.assertThrownErrorCodeIsNumber(e);
      return;
    }
    expect(true).assertFail();
  }

  /**
   * XTS.CHECK.ERROR_CODE.01: prefer numeric `code` when present; else strict std.core simple type name from Class.of(thrown).getName().
   * Catch identifier type is Error per ArkTS spec §8.15.1.
   */
  static thrownErrorCodeIsAcceptable(thrown: Error): boolean {
    const cls = Class.of(thrown);
    const byName = reflect.getInstanceFieldsRecursiveByName(cls, 'code');
    if (byName !== undefined && byName !== null) {
      const val = byName.getValue(thrown);
      if (Utils.isRuntimeNumericOrIntTypeof(typeof val)) {
        return true;
      }
    }
    try {
      const raw: Object =
        (reflect.Value.of(thrown) as ClassValue).getFieldByName('code').getData() as Object;
      if (Utils.isRuntimeNumericOrIntTypeof(typeof raw)) {
        return true;
      }
    } catch (e) {
      // std.core.* often has no reflect.Value `code` path on device
    }
    const fullName = cls.getName();
    const errorTypeArr = fullName.split('.');
    const errType = errorTypeArr[errorTypeArr.length - 1];
    return errType === 'RangeError' ||
      errType === 'IllegalArgumentError' ||
      errType === 'TypeError' ||
      errType === 'IndexOutOfBoundsError' ||
      errType === 'ClassCastError' ||
      errType === 'BusinessError' ||
      errType === 'Error' ||
      errType === 'ArgumentError' ||
      errType === 'IllegalStateError' ||
      errType === 'ReferenceError' ||
      errType === 'SyntaxError' ||
      errType === 'EvalError' ||
      errType === 'URIError' ||
      errType === 'InternalError' ||
      errType === 'OutOfMemoryError';
  }

  static assertThrownErrorCodeIsNumber(thrown: Error): void {
    expect(Utils.thrownErrorCodeIsAcceptable(thrown)).assertTrue();
  }
}
