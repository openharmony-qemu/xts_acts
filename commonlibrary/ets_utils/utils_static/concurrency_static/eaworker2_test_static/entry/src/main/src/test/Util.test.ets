'use static'


export default class Utils{
  static msSleep(count: number): Promise<void> {
    return new Promise<void>((res, rej) => {
      setTimeout(res, count.toInt(), undefined)
    })
  }

  static syncSleep(ms: number): void {
    let start: number = Date.now()
    while (Date.now() - start < ms) {}
  }
}