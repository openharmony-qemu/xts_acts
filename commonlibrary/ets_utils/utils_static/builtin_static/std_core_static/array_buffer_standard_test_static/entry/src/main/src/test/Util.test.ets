class PlainObject {
}

class PlainRecord {
  a: int = 1;
}

function utilVoidFn(): void {
}

function utilIntReturningFn(): int {
  return 1;
}

export default class Utils {
  static plainObject(): Object {
    return new PlainObject() as Object;
  }

  static plainRecordAsObject(): Object {
    return new PlainRecord() as Object;
  }

  static voidFnAsObject(): Object {
    return utilVoidFn as Object;
  }

  static intReturningFnAsObject(): Object {
    return Utils.fnReturningIntAsObject(utilIntReturningFn);
  }

  static async msSleep(count: int): Promise<void> {
    return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void): void => {
      setTimeout((): void => {
        resolve(Promise.resolve());
      }, count);
    });
  }

  static isRuntimeNumericOrIntTypeof(kind: string): boolean {
    return kind === 'int';
  }

  static fromObjectWithBuffer(src: ArrayBuffer, byteOffset: int, length: int): ArrayBuffer {
    return ArrayBuffer.fromObject(src as Object, byteOffset, length);
  }

  static boxAsObject(v: number): Object {
    return v as Object;
  }

  static booleanAsObject(v: boolean): Object {
    return v as Object;
  }

  static nullAsObject(): Object {
    return (null as Object);
  }

  static undefinedAsObject(): Object {
    return (undefined as Object);
  }

  static arrayNumberAsObject(arr: Array<number>): Object {
    return arr as Object;
  }

  static uint8ArrayAsObject(arr: Uint8Array): Object {
    return arr as Object;
  }

  static dataViewAsObject(dv: DataView): Object {
    return dv as Object;
  }

  static nullAsString(): string {
    return Utils.castToString(Utils.nullAsObject());
  }

  static undefinedAsString(): string {
    return Utils.castToString(Utils.undefinedAsObject());
  }

  static booleanAsString(v: boolean): string {
    return Utils.castToString(Utils.booleanAsObject(v));
  }

  static nullAsInt(): int {
    return Utils.castToInt(Utils.nullAsObject());
  }

  static undefinedAsInt(): int {
    return Utils.castToInt(Utils.undefinedAsObject());
  }

  static booleanAsInt(v: boolean): int {
    return Utils.castToInt(Utils.booleanAsObject(v));
  }

  static stringAsInt(s: string): int {
    return Utils.castToInt(s as Object);
  }

  static fnReturningIntAsObject(fn: () => int): Object {
    return fn as Object;
  }

  static fromObjectClassArg(v: Object): Object {
    return v;
  }

  static repeatString(unit: string, count: int): string {
    let out: string = '';
    for (let i: int = 0; i < count; i++) {
      out = out + unit;
    }
    return out;
  }

  static buildLongString(unit: string, totalLen: int): string {
    const chunkSize: int = 100;
    const chunk: string = Utils.repeatString(unit, chunkSize);
    let out: string = '';
    const reps: int = totalLen / chunkSize;
    for (let i: int = 0; i < reps; i++) {
      out = out + chunk;
    }
    return out;
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

  static castToByte(v: Object): byte {
    return v as byte;
  }

  static numberAsString(n: number): string {
    return Utils.castToString(n as Object);
  }

  static numberAsArrayBuffer(n: number): ArrayBuffer {
    return Utils.castToArrayBuffer(n as Object);
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
    }
    return ArrayBuffer.from(src, byteOffset, tail);
  }
}
