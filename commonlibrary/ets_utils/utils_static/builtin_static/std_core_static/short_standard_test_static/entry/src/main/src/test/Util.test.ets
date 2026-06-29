'use static';


export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }

  static async releaseAfterEachTest(): Promise<void> {
    await Utils.msSleep(25);
  }
}