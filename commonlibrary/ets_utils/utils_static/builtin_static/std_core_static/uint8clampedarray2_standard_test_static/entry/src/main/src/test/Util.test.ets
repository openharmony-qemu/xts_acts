'use static';

export default class Utils{
  static msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve: (value: int) => undefined, reject: (error: Error) => undefined): undefined => {
      setTimeout((): undefined => {
        resolve(0);
        return undefined;
      }, count);
      return undefined;
    });
  }
}

