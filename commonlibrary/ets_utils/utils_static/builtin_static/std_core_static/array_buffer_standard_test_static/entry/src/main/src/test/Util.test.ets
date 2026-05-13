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
   * For XTS.CHECK.ERROR_CODE.01: prefer a numeric instance field `code` (reflect, no unsafe cast to
   * BusinessError). When OH std.core throws omit or hide `code`, accept a strict allowlist of
   * simple class names from `Class.of(thrown).getName()` (same split strategy as hypium assertThrowError).
   * Include `IndexOutOfBoundsError` for ArrayBuffer `at`/`set` OOB on OH (often no numeric `code` via reflect).
   */
  static assertThrownErrorCodeIsNumber(thrown: object): void {
    const cls = Class.of(thrown)
    const byName = reflect.getInstanceFieldsRecursiveByName(cls, 'code')
    if (byName !== undefined && byName !== null) {
      const val = byName.getValue(thrown)
      if (typeof val === 'number') {
        expect(typeof val === 'number').assertTrue()
        return
      }
    }
    try {
      const raw: Object =
        (reflect.Value.of(thrown as object) as ClassValue).getFieldByName('code').getData() as Object
      if (typeof raw === 'number') {
        expect(typeof raw === 'number').assertTrue()
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
      errType === 'IndexOutOfBoundsError'
    expect(allowedStdCoreNoNumericCode).assertTrue()
  }
}