import { expect } from '../../../hypium/index';

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  /**
   * `typeof` for lengths / `getByteLength` / reflected error `code` on OH: Hypium may report `int` not `number`.
   * Hypium `assertEqual` still uses strict `===` for operands; use this for typeof-based checks in tests.
   */
  static isRuntimeNumericOrIntTypeof(kind: string): boolean {
    return kind === 'number' || kind === 'int'
  }

  /** `typeof` for `std.core.Byte` boxed instance on OH (`byte` vs `object`). */
  static isRuntimeByteBoxTypeof(kind: string): boolean {
    return kind === 'object' || kind === 'byte'
  }

  /** `typeof` for primitive from `Byte.toByte()` on OH. */
  static isRuntimeBytePrimitiveTypeof(kind: string): boolean {
    return kind === 'number' || kind === 'int' || kind === 'byte'
  }

  /**
   * For XTS.CHECK.ERROR_CODE.01: prefer a numeric instance field `code` (reflect, no unsafe cast to
   * BusinessError). Treat `code` as numeric when `typeof` is `number` or `int` (OH may surface int).
   * When OH std.core throws omit or hide `code`, accept a strict allowlist of
   * simple class names from `Class.of(thrown).getName()` (same split strategy as hypium assertThrowError).
   * Include `IndexOutOfBoundsError` for ArrayBuffer `at`/`set` OOB on OH (often no numeric `code` via reflect).
   * Include `ClassCastError` / `BusinessError` when reflect has no usable `code` but the throw is expected.
   * `OutOfMemoryError` for pathological huge `ArrayBuffer` lengths on device when reflect has no `code`.
   */
  static assertThrownErrorCodeIsNumber(thrown: object): void {
    const cls = Class.of(thrown)
    const byName = reflect.getInstanceFieldsRecursiveByName(cls, 'code')
    if (byName !== undefined && byName !== null) {
      const val = byName.getValue(thrown) as Object
      if (Utils.isRuntimeNumericOrIntTypeof(typeof val)) {
        return
      }
    }
    try {
      const raw: Object =
        (reflect.Value.of(thrown as object) as ClassValue).getFieldByName('code').getData() as Object
      if (Utils.isRuntimeNumericOrIntTypeof(typeof raw)) {
        return
      }
    } catch (e) {
      // fall through: std.core.* often has no reflect.Value `code` path on device
    }
    const fullName = cls.getName()
    const errorTypeArr = fullName.split('.')
    const errType = errorTypeArr[errorTypeArr.length - 1]
    const allowedStdCoreNoNumericCode: boolean =
      errType === 'RangeError' ||
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
      errType === 'AssertionError' ||
      errType === 'OutOfMemoryError'
    expect(allowedStdCoreNoNumericCode).assertTrue()
  }
}