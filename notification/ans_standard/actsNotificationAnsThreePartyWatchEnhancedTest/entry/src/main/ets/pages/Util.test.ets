'use static';

export default class Utils{
  static async msSleep(count:int) : Promise {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}