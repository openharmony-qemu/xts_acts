class PlainObject {
}

function utilVoidFn(): void {
}

export default class Utils {
  static plainObject(): Object {
    return new PlainObject() as Object;
  }

  static voidFnAsObject(): Object {
    return utilVoidFn as Object;
  }

  static async msSleep(count: Int): Promise<void> {
    return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void): void => {
      setTimeout((): void => {
        resolve(Promise.resolve());
      }, count);
    });
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

  static castToArrayBuffer(v: Object): ArrayBuffer {
    return v as ArrayBuffer;
  }

  static castToUint8Array(v: Object): Uint8Array {
    return v as Uint8Array;
  }

  static castToValueArrayByte(v: Object): ValueArray<byte> {
    return v as ValueArray<byte>;
  }

  static castToFixedArrayByte(v: Object): FixedArray<byte> {
    return v as FixedArray<byte>;
  }

  static castToByte(v: Object): Byte {
    return v as Byte;
  }
}
