'use static';

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve: (v: int) => void, reject: (e: Error) => void): void => {
      setTimeout((): void => {
        resolve(0);
      }, count);
    });
  }
}
