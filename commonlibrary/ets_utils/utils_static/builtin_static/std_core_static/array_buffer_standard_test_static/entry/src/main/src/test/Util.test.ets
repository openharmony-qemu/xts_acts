import { expect } from '../../../hypium/index';

export default class Utils {
  static async msSleep(count: int): Promise<void> {
    return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void): void => {
      setTimeout((): void => {
        resolve(Promise.resolve());
      }, count);
    });
  }

  static isRuntimeNumericOrIntTypeof(kind: string): boolean {
    return kind === 'number' || kind === 'int';
  }

  static fromObjectWithBuffer(src: ArrayBuffer, byteOffset: int, length: int): ArrayBuffer {
    return ArrayBuffer.fromObject(src as Object, byteOffset, length);
  }

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


  static assertThrownExceptionNameContains(thrown: Error, simpleNamePart: string): void {
    const fullName: string = Class.of(thrown).getName();
    expect(fullName.indexOf(simpleNamePart) >= 0).assertTrue();
  }

  static assertExpectThrow(run: () => void): void {
    try {
      run();
    } catch (e) {
      Utils.assertThrownErrorCodeIsNumber(e);
      return;
    }
    expect(true).assertFail();
  }


  static assertThrownErrorCodeIsNumber(thrown: Error): void {
    const cls = Class.of(thrown);
    const byName = reflect.getInstanceFieldsRecursiveByName(cls, 'code');
    if (byName !== undefined && byName !== null) {
      const val = byName.getValue(thrown);
      if (Utils.isRuntimeNumericOrIntTypeof(typeof val)) {
        return;
      }
    }
    try {
      const raw: Object =
        (reflect.Value.of(thrown) as ClassValue).getFieldByName('code').getData() as Object;
      if (Utils.isRuntimeNumericOrIntTypeof(typeof raw)) {
        return;
      }
    } catch (e) {
    }
    const fullName = cls.getName();
    const errorTypeArr = fullName.split('.');
    const errType = errorTypeArr[errorTypeArr.length - 1];
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
      errType === 'OutOfMemoryError';
    expect(allowedStdCoreNoNumericCode).assertTrue();
  }
}
