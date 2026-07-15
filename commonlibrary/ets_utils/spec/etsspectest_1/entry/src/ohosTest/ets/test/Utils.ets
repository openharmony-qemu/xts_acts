export default class Utils {
  static async msSleep(time: number): Promise<void> {
    return new Promise<void>(
      (resolve: (value: void) => void): void => {
        setTimeout((): void => {
          resolve();
        }, time);
      }
    )
  }
}