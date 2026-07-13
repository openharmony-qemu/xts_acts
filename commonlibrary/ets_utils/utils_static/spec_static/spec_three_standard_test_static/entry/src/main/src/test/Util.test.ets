'use static'

export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}

export function checkTypeIdentity(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}

export function checkTypeIdentityOfAny(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
