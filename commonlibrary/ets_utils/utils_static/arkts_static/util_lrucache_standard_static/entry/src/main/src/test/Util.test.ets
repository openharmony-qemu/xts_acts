'use static';

export type PrimitiveType = int | byte | short | long | float | number | string | undefined | null | boolean | BigInt;
export type AnyType = PrimitiveType | Date | RegExp | object | never | (() => void);

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }
}
