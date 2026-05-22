class PlainObject {
}

class PlainRecord {
  a: Int = 1;
}

function utilVoidFn(): void {
}

function utilIntReturningFn(): Int {
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

  static async msSleep(count: Int): Promise<void> {
    return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void): void => {
      setTimeout((): void => {
        resolve(Promise.resolve());
      }, count);
    });
  }

  static fromObjectWithBuffer(src: ArrayBuffer, byteOffset: Int, length: Int): ArrayBuffer {
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

  static nullAsInt(): Int {
    return Utils.castToInt(Utils.nullAsObject());
  }

  static undefinedAsInt(): Int {
    return Utils.castToInt(Utils.undefinedAsObject());
  }

  static booleanAsInt(v: boolean): Int {
    return Utils.castToInt(Utils.booleanAsObject(v));
  }

  static stringAsInt(s: string): Int {
    return Utils.castToInt(s as Object);
  }

  static fnReturningIntAsObject(fn: () => Int): Object {
    return fn as Object;
  }

  static fromObjectClassArg(v: Object): Object {
    return v;
  }

  static repeatString(unit: string, count: Int): string {
    let out: string = '';
    for (let i: Int = 0; i < count; i++) {
      out = out + unit;
    }
    return out;
  }

  static buildLongString(unit: string, totalLen: Int): string {
    const chunkSize: Int = 100;
    const chunk: string = Utils.repeatString(unit, chunkSize);
    let out: string = '';
    const reps: Int = totalLen / chunkSize;
    for (let i: Int = 0; i < reps; i++) {
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

  static castToInt(v: Object): Int {
    return v as Int;
  }

  static castToUint8Array(v: Object): Uint8Array {
    return v as Uint8Array;
  }

  static castToValueArrayByte(v: Object): ValueArray<Byte> {
    return v as ValueArray<Byte>;
  }

  static castToByte(v: Object): Byte {
    return v as Byte;
  }

  static numberAsString(n: number): string {
    return Utils.castToString(n as Object);
  }

  static numberAsArrayBuffer(n: number): ArrayBuffer {
    return Utils.castToArrayBuffer(n as Object);
  }
  
  static fromArrayBufferWithOffset(src: ArrayBuffer, byteOffset: Int, length?: Int): ArrayBuffer {
    if (length !== undefined) {
      return ArrayBuffer.from(src, byteOffset, length);
    }
    const tail: Int = src.byteLength - byteOffset;
    return ArrayBuffer.from(src, byteOffset, tail);
  }
}
