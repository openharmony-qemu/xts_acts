

export default class Utils {
  static mindMapItSuffix(seq: int): string {
    if (seq < 10) {
      return `00${seq}`;
    }
    if (seq < 100) {
      return `0${seq}`;
    }
    return `${seq}`;
  }

  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve: (value: int | PromiseLike<int>) => void, reject: (value: Error) => void) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }
}
