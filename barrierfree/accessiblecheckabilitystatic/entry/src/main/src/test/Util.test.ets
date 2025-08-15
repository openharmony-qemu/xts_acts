// Copyright 2023 YourCompany. All rights reserved.

export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}